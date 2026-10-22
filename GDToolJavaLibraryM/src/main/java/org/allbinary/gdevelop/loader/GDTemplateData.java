/*
 * GDevelop to AllBinary Core
 * Copyright 2026 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 * The data for a file generation xsl template (see GDTemplateUtil).
 * Each item is an element of the template root with the generated values as attributes, for example
 * &lt;template&gt;&lt;resource name="BLANK" prefix="//" /&gt;&lt;/template&gt;
 * The generator decides the values and the xsl template for each language writes the code for them.
 */
public class GDTemplateData
{
    private final String TEMPLATE = "template";

    private final Document document;
    private final Element rootElement;

    public GDTemplateData() {
        try {
            this.document = DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument();
        } catch (final Exception e) {
            throw new RuntimeException(e);
        }
        this.rootElement = this.document.createElement(this.TEMPLATE);
        this.document.appendChild(this.rootElement);
    }

    public Element add(final String name, final String[] attributeNameArray, final String[] valueArray) {
        return this.add(this.rootElement, name, attributeNameArray, valueArray);
    }

    public Element add(final Element parentElement, final String name, final String[] attributeNameArray, final String[] valueArray) {
        final Element element = this.document.createElement(name);
        final int size = attributeNameArray.length;
        for (int index = 0; index < size; index++) {
            element.setAttribute(attributeNameArray[index], valueArray[index]);
        }
        parentElement.appendChild(element);
        return element;
    }

    public Document getDocument() {
        return this.document;
    }

}
