/*
 * GDevelop to AllBinary Core
 * Copyright 2026 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.StringBufferInputStream;
import java.util.Hashtable;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.string.CommonStrings;

/**
 * Compiles each generation xsl once and reuses it for every layout, external layout, create instance and node id list.
 * The xsl index placeholders (for example &lt;GD_CURRENT_INDEX&gt;) used to be replaced in the xsl text and the xsl compiled again for each value.
 * Now each placeholder becomes a top level xsl:param with the same name (GD_CURRENT_INDEX) that is set on the transformer:
 * in a test or select attribute &lt;GD_CURRENT_INDEX&gt; becomes number($GD_CURRENT_INDEX) and in text it becomes &lt;xsl:value-of select="$GD_CURRENT_INDEX" /&gt;.
 * An xsl with a placeholder anywhere else is processed the old way (replace and compile each time).
 */
public class GDXslTemplates
{
    private static final GDXslTemplates instance = new GDXslTemplates();

    public static GDXslTemplates getInstance() {
        return instance;
    }

    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final XslHelper xslHelper = XslHelper.getInstance();
    private final GDXslTemplatesCache gdXslTemplatesCache = GDXslTemplatesCache.getInstance();

    private final String[] PLACEHOLDER_ARRAY = {
        this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX,
        this.gdToolStrings.GD_EXTERNAL_LAYOUT_INDEX,
        this.gdToolStrings.GD_CREATE_INSTANCE_INDEX,
        this.gdToolStrings.GD_NODE_IDS,
    };

    //The node id list is text so it is not a number in an expression
    private final boolean[] NUMBER_ARRAY = {true, true, true, false};

    private final String XSL_PREFIX = "xsl:";
    private final String XSL_TEXT_START = "<xsl:text";
    private final String XSL_TEXT_END = "</xsl:text>";
    private final String XSL_TEXT_START_TAG = "<xsl:text>";
    private final String COMMENT_START = "<!--";
    private final String COMMENT_END = "-->";
    private final String CDATA_START = "<![CDATA[";
    private final String CDATA_END = "]]>";
    private final String[] STYLESHEET_END_ARRAY = {"</xsl:stylesheet>", "</xsl:transform>"};
    private final String TEST = "test";
    private final String SELECT = "select";
    private final String VALUE_OF_START = "<xsl:value-of select=\"$";
    private final String VALUE_OF_END = "\" />";
    private final String NUMBER_START = "number($";
    private final String NUMBER_END = ")";
    private final String VARIABLE = "$";
    private final String PARAM_START = "<xsl:param name=\"";
    private final String PARAM_END = "\" />";
    private final String COMPILED = "Compiled once: ";
    private final String NOT_PARAMETERIZED = "Placeholder can not be an xsl:param so the xsl is compiled for each value: ";

    private final Hashtable xslPathToTemplatesHolderHashtable = new Hashtable();

    private GDXslTemplates() {
    }

    private class TemplatesHolder {

        private String xslDocumentAsString;
        //null when the xsl is compiled for each value
        private Templates templates;
    }

    /**
     * Same result as replacing each placeholder in the xsl with the value and XslHelper.translate with the xml.
     * @param xslPath the xsl the xslDocumentAsString was loaded from used to reuse the compiled xsl
     * @param placeholderArray placeholders from GDToolStrings for example GD_CURRENT_LAYOUT_INDEX
     * @param valueArray the values in the same order as the placeholders
     */
    public String translate(final String xslPath, final String xslDocumentAsString, final String[] placeholderArray, final String[] valueArray, final String xmlDocumentAsString) throws Exception {

        final Templates templates = this.getTemplates(xslPath, xslDocumentAsString);

        if (templates == null) {
            String updatedXslDocumentAsString = xslDocumentAsString;
            final int size = placeholderArray.length;
            for (int index = 0; index < size; index++) {
                updatedXslDocumentAsString = new Replace(placeholderArray[index], valueArray[index]).all(updatedXslDocumentAsString);
            }
            return this.xslHelper.translate(new BasicUriResolver(),
                new StreamSource(new StringBufferInputStream(updatedXslDocumentAsString)),
                new StreamSource(new StringBufferInputStream(xmlDocumentAsString)));
        }

        final Transformer transformer = templates.newTransformer();
        final int size = placeholderArray.length;
        for (int index = 0; index < size; index++) {
            transformer.setParameter(this.getParameterName(placeholderArray[index]), valueArray[index]);
        }

        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        transformer.transform(new StreamSource(new StringBufferInputStream(xmlDocumentAsString)), new StreamResult(outputStream));
        return outputStream.toString();
    }

    public String translate(final String xslPath, final String xslDocumentAsString, final String placeholder, final String value, final String xmlDocumentAsString) throws Exception {
        return this.translate(xslPath, xslDocumentAsString, new String[] {placeholder}, new String[] {value}, xmlDocumentAsString);
    }

    public String translate(final String xslPath, final String xslDocumentAsString, final String xmlDocumentAsString) throws Exception {
        return this.translate(xslPath, xslDocumentAsString, new String[0], new String[0], xmlDocumentAsString);
    }

    /**
     * Compiles the xsl in parallel before they are processed one at a time.
     */
    public void compile(final String[] xslPathArray, final String[] xslDocumentAsStringArray) throws Exception {

        final int size = xslPathArray.length;
        final ExecutorService executorService = Executors.newFixedThreadPool(Math.min(size, Runtime.getRuntime().availableProcessors()));
        try {
            final Future[] futureArray = new Future[size];
            for (int index = 0; index < size; index++) {
                final String xslPath = xslPathArray[index];
                final String xslDocumentAsString = xslDocumentAsStringArray[index];
                futureArray[index] = executorService.submit(new Callable() {
                    public Object call() throws Exception {
                        return getTemplates(xslPath, xslDocumentAsString);
                    }
                });
            }
            for (int index = 0; index < size; index++) {
                try {
                    futureArray[index].get();
                } catch (ExecutionException e) {
                    throw (Exception) e.getCause();
                }
            }
        } finally {
            executorService.shutdown();
        }
    }

    private Templates getTemplates(final String xslPath, final String xslDocumentAsString) throws Exception {

        TemplatesHolder templatesHolder;
        synchronized (this.xslPathToTemplatesHolderHashtable) {
            templatesHolder = (TemplatesHolder) this.xslPathToTemplatesHolderHashtable.get(xslPath);
            if (templatesHolder == null) {
                templatesHolder = new TemplatesHolder();
                this.xslPathToTemplatesHolderHashtable.put(xslPath, templatesHolder);
            }
        }

        //Each xsl is compiled by the first thread that needs it while other xsl compile in parallel
        synchronized (templatesHolder) {
            if (!xslDocumentAsString.equals(templatesHolder.xslDocumentAsString)) {
                final String parameterizedXslDocumentAsString = this.getParameterized(xslDocumentAsString);
                if (parameterizedXslDocumentAsString == null) {
                    this.logUtil.putF(new StringMaker().append(this.NOT_PARAMETERIZED).append(xslPath).toString(), this, this.commonStrings.PROCESS);
                    templatesHolder.templates = null;
                } else {
                    try {
                        templatesHolder.templates = this.gdXslTemplatesCache.newTemplates(parameterizedXslDocumentAsString);
                        this.logUtil.putF(new StringMaker().append(this.COMPILED).append(xslPath).toString(), this, this.commonStrings.PROCESS);
                    } catch (Exception e) {
                        this.logUtil.put(new StringMaker().append(this.NOT_PARAMETERIZED).append(xslPath).toString(), this, this.commonStrings.PROCESS, e);
                        templatesHolder.templates = null;
                    }
                }
                templatesHolder.xslDocumentAsString = xslDocumentAsString;
            }
            return templatesHolder.templates;
        }
    }

    private String getParameterName(final String placeholder) {
        return placeholder.substring(1, placeholder.length() - 1);
    }

    private int getPlaceholderIndex(final String xslDocumentAsString, final int index) {
        final int size = this.PLACEHOLDER_ARRAY.length;
        for (int placeholderIndex = 0; placeholderIndex < size; placeholderIndex++) {
            if (xslDocumentAsString.startsWith(this.PLACEHOLDER_ARRAY[placeholderIndex], index)) {
                return placeholderIndex;
            }
        }
        return -1;
    }

    /**
     * @return the xsl with the placeholders as xsl:param or null when a placeholder is somewhere that can not use an xsl:param
     */
    String getParameterized(final String xslDocumentAsString) {

        //The placeholders are masked so the < and > of a placeholder are not taken as markup
        final char[] maskedCharArray = xslDocumentAsString.toCharArray();
        final int length = maskedCharArray.length;
        final int placeholderTotal = this.PLACEHOLDER_ARRAY.length;
        final boolean[] usedArray = new boolean[placeholderTotal];
        boolean found = false;
        for (int index = xslDocumentAsString.indexOf('<'); index >= 0 && index < length; index = xslDocumentAsString.indexOf('<', index + 1)) {
            final int placeholderIndex = this.getPlaceholderIndex(xslDocumentAsString, index);
            if (placeholderIndex >= 0) {
                maskedCharArray[index] = ' ';
                maskedCharArray[index + this.PLACEHOLDER_ARRAY[placeholderIndex].length() - 1] = ' ';
                usedArray[placeholderIndex] = true;
                found = true;
            }
        }

        if (!found) {
            return xslDocumentAsString;
        }

        final String masked = new String(maskedCharArray);
        final StringBuilder stringBuilder = new StringBuilder(length + 1024);

        int copiedIndex = 0;
        for (int index = xslDocumentAsString.indexOf('<'); index >= 0; index = xslDocumentAsString.indexOf('<', index)) {
            final int placeholderIndex = this.getPlaceholderIndex(xslDocumentAsString, index);
            if (placeholderIndex < 0) {
                index++;
                continue;
            }

            final String placeholder = this.PLACEHOLDER_ARRAY[placeholderIndex];
            final String parameterName = this.getParameterName(placeholder);
            final int endIndex = index + placeholder.length();

            stringBuilder.append(xslDocumentAsString, copiedIndex, index);
            copiedIndex = endIndex;

            if (this.isInside(masked, this.COMMENT_START, this.COMMENT_END, index)) {
                //The value does not change the output inside a comment
                stringBuilder.append(parameterName);
            } else if (this.isInside(masked, this.CDATA_START, this.CDATA_END, index)) {
                return null;
            } else if (masked.lastIndexOf('<', index) > masked.lastIndexOf('>', index)) {
                //Inside a start tag
                final int tagIndex = masked.lastIndexOf('<', index);
                final String attributeName = this.getAttributeName(masked, tagIndex, index);
                if (!masked.startsWith(this.XSL_PREFIX, tagIndex + 1) || attributeName == null || (!attributeName.equals(this.TEST) && !attributeName.equals(this.SELECT))) {
                    return null;
                }

                if (this.NUMBER_ARRAY[placeholderIndex]) {
                    stringBuilder.append(this.NUMBER_START).append(parameterName).append(this.NUMBER_END);
                } else {
                    stringBuilder.append(this.VARIABLE).append(parameterName);
                }
            } else {
                //Text
                if (this.isInside(masked, this.XSL_TEXT_START, this.XSL_TEXT_END, index)) {
                    return null;
                }

                //Whitespace only text next to the value would be removed from the xsl so it is kept with xsl:text
                final int textStartIndex = masked.lastIndexOf('>', index) + 1;
                final int previousEndIndex = this.getPreviousPlaceholderEnd(xslDocumentAsString, textStartIndex, index);
                final int beforeStartIndex = previousEndIndex > textStartIndex ? previousEndIndex : textStartIndex;
                if (this.isWhitespace(xslDocumentAsString, beforeStartIndex, index)) {
                    stringBuilder.setLength(stringBuilder.length() - (index - beforeStartIndex));
                    stringBuilder.append(this.XSL_TEXT_START_TAG).append(xslDocumentAsString, beforeStartIndex, index).append(this.XSL_TEXT_END);
                }

                stringBuilder.append(this.VALUE_OF_START).append(parameterName).append(this.VALUE_OF_END);

                //The next markup or placeholder
                int afterEndIndex = xslDocumentAsString.indexOf('<', endIndex);
                if (afterEndIndex < 0) {
                    afterEndIndex = length;
                }
                if (this.getPlaceholderIndex(xslDocumentAsString, afterEndIndex) < 0 && this.isWhitespace(xslDocumentAsString, endIndex, afterEndIndex)) {
                    stringBuilder.append(this.XSL_TEXT_START_TAG).append(xslDocumentAsString, endIndex, afterEndIndex).append(this.XSL_TEXT_END);
                    copiedIndex = afterEndIndex;
                }
            }

            index = endIndex;
        }
        stringBuilder.append(xslDocumentAsString, copiedIndex, length);

        int stylesheetEndIndex = -1;
        final int size = this.STYLESHEET_END_ARRAY.length;
        for (int index = 0; index < size; index++) {
            final int endIndex = stringBuilder.lastIndexOf(this.STYLESHEET_END_ARRAY[index]);
            if (endIndex > stylesheetEndIndex) {
                stylesheetEndIndex = endIndex;
            }
        }
        if (stylesheetEndIndex < 0) {
            return null;
        }

        final StringBuilder paramStringBuilder = new StringBuilder();
        for (int index = 0; index < placeholderTotal; index++) {
            if (usedArray[index]) {
                paramStringBuilder.append(this.PARAM_START).append(this.getParameterName(this.PLACEHOLDER_ARRAY[index])).append(this.PARAM_END);
            }
        }
        stringBuilder.insert(stylesheetEndIndex, paramStringBuilder);

        return stringBuilder.toString();
    }

    private boolean isInside(final String masked, final String start, final String end, final int index) {
        final int startIndex = masked.lastIndexOf(start, index);
        return startIndex >= 0 && startIndex > masked.lastIndexOf(end, index);
    }

    private boolean isWhitespace(final String text, final int startIndex, final int endIndex) {
        if (startIndex >= endIndex) {
            return false;
        }
        char c;
        for (int index = startIndex; index < endIndex; index++) {
            c = text.charAt(index);
            if (c != ' ' && c != '\t' && c != '\r' && c != '\n') {
                return false;
            }
        }
        return true;
    }

    private int getPreviousPlaceholderEnd(final String xslDocumentAsString, final int startIndex, final int index) {
        int endIndex = -1;
        for (int previousIndex = xslDocumentAsString.indexOf('<', startIndex); previousIndex >= 0 && previousIndex < index; previousIndex = xslDocumentAsString.indexOf('<', previousIndex + 1)) {
            final int placeholderIndex = this.getPlaceholderIndex(xslDocumentAsString, previousIndex);
            if (placeholderIndex >= 0) {
                endIndex = previousIndex + this.PLACEHOLDER_ARRAY[placeholderIndex].length();
            }
        }
        return endIndex;
    }

    /**
     * @return the name of the attribute of the start tag at tagIndex with the value that contains index or null
     */
    private String getAttributeName(final String masked, final int tagIndex, final int index) {
        int position = tagIndex + 1;
        //tag name
        while (position < index && !Character.isWhitespace(masked.charAt(position))) {
            position++;
        }
        while (position < index) {
            while (position < index && Character.isWhitespace(masked.charAt(position))) {
                position++;
            }
            final int nameStartIndex = position;
            while (position < index && masked.charAt(position) != '=' && !Character.isWhitespace(masked.charAt(position))) {
                position++;
            }
            final String name = masked.substring(nameStartIndex, position);
            while (position < index && Character.isWhitespace(masked.charAt(position))) {
                position++;
            }
            if (position >= index || masked.charAt(position) != '=') {
                return null;
            }
            position++;
            while (position < index && Character.isWhitespace(masked.charAt(position))) {
                position++;
            }
            if (position >= index) {
                return null;
            }
            final char quote = masked.charAt(position);
            if (quote != '"' && quote != '\'') {
                return null;
            }
            final int valueEndIndex = masked.indexOf(quote, position + 1);
            if (valueEndIndex < 0 || valueEndIndex > index) {
                return name;
            }
            position = valueEndIndex + 1;
        }
        return null;
    }

}
