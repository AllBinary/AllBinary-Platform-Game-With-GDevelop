/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import org.allbinary.data.CamelCaseUtil;
import java.io.FileInputStream;
import org.allbinary.gdevelop.json.GDLayout;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;

/**
 *
 * @author User
 */
public class GDToAllBinaryCanvasGenerator extends GDTransformGenerator
{

    private final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
    
    private final StringMaker stringMaker = new StringMaker();

    private final String xslPath;
    private final String path;
    
    private int index;
    private String name;
    private String className;
    private String orig;

    public GDToAllBinaryCanvasGenerator(final String xslPath, final String path) {
        this.xslPath = xslPath;
        this.path = path;
    }
    
    public void loadLayout(final GDLayout layout, final int index, final int size) throws Exception
    {
        this.index = index;
        name = this.camelCaseUtil.getAsCamelCase(layout.name, stringMaker);
        stringMaker.delete(0, stringMaker.length());
//        if (index == 1 || size == 1)
//        {
            className = stringMaker.append("GDGame").append(name).append("Canvas").toString();
            this.orig = gdToolStrings.ROOT_PATH + this.xslPath;
//        } else
//        {
//            className = stringMaker.append("GDGameStart").append(name).append("Canvas").toString();
//            this.orig = gdToolStrings.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameStartGDLayoutCanvas.xsl";
//        }
    }

    @Override
    public void process() throws Exception
    {
        
        stringMaker.delete(0, stringMaker.length());
        final String canvasJavaFile = stringMaker.append(gdToolStrings.ROOT_PATH + this.path).append(this.className).append(".java").toString();

        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();
        
        final FileInputStream fileInputStream = new FileInputStream(this.orig);        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
        
        final Replace replace = new Replace(this.gdToolStrings.GD_LAYOUT, this.name);
        final Replace replace2 = new Replace(this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, Integer.toString(this.index));

        String updatedXslDocumentStr = replace.all(androidRFileAsString);
        updatedXslDocumentStr = replace2.all(updatedXslDocumentStr);

        this.process(updatedXslDocumentStr, canvasJavaFile, sharedBytes);
        
    }

}
