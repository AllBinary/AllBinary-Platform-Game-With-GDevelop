/*
 * GDevelop to AllBinary Core
 * Copyright 2026 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.File;
import java.io.FileInputStream;
import java.io.StringReader;
import java.util.Hashtable;
import javax.xml.transform.Templates;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import org.xml.sax.helpers.DefaultHandler;

import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.regex.replace.Replace;

/**
 * Fills a file generation template.
 * A .xsl template (see GDTemplateToXslConverter) gets each value as the xsl parameter with the given name.
 * Any other template is text where each key is replaced with the value.
 */
public class GDTemplateUtil
{
    private static final GDTemplateUtil instance = new GDTemplateUtil();

    public static GDTemplateUtil getInstance() {
        return instance;
    }

    private final String XSL_EXTENSION = ".xsl";
    private final String EMPTY_DOCUMENT = "<template/>";

    private final Hashtable templatesHashtable = new Hashtable();

    private GDTemplateUtil() {
    }

    /**
     * @param templatePath template file path (.xsl or text)
     * @param keyArray text template keys (for example //GD or &lt;name&gt;)
     * @param parameterNameArray xsl template parameter names in the same order as the keys (for example GD or name)
     * @param valueArray the generated values in the same order as the keys
     */
    public String process(final String templatePath, final String[] keyArray, final String[] parameterNameArray, final String[] valueArray) throws Exception {

        if (templatePath.endsWith(this.XSL_EXTENSION)) {
            final Transformer transformer = this.getTemplates(templatePath).newTransformer();
            final int size = parameterNameArray.length;
            for (int index = 0; index < size; index++) {
                transformer.setParameter(parameterNameArray[index], valueArray[index]);
            }

            //The text is collected from the character events since the stream serializer changes the line endings to the system line separator
            final StringBuilder stringBuilder = new StringBuilder();
            final DefaultHandler textHandler = new DefaultHandler() {

                @Override
                public void characters(final char[] charArray, final int start, final int length) {
                    stringBuilder.append(charArray, start, length);
                }

                @Override
                public void ignorableWhitespace(final char[] charArray, final int start, final int length) {
                    stringBuilder.append(charArray, start, length);
                }
            };
            transformer.transform(new StreamSource(new StringReader(this.EMPTY_DOCUMENT)), new SAXResult(textHandler));
            return stringBuilder.toString();
        }

        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();

        final FileInputStream fileInputStream = new FileInputStream(templatePath);
        String result = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
        final int size = keyArray.length;
        for (int index = 0; index < size; index++) {
            result = new Replace(keyArray[index], valueArray[index]).all(result);
        }
        return result;
    }

    public String process(final String templatePath, final String key, final String parameterName, final String value) throws Exception {
        return this.process(templatePath, new String[] {key}, new String[] {parameterName}, new String[] {value});
    }

    private synchronized Templates getTemplates(final String templatePath) throws Exception {
        Templates templates = (Templates) this.templatesHashtable.get(templatePath);
        if (templates == null) {
            templates = TransformerFactory.newInstance().newTemplates(new StreamSource(new File(templatePath)));
            this.templatesHashtable.put(templatePath, templates);
        }
        return templates;
    }

}
