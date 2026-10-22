/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import org.allbinary.data.CamelCaseUtil;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDToAndroidGameActivityGenerator extends GDNameGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    public GDToAndroidGameActivityGenerator() {
    }
    
    @Override
    public void process() throws Exception {
        
        final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
        final StringMaker stringMaker = new StringMaker();
        final String name = camelCaseUtil.getAsCamelCase(this.packageName, stringMaker).toLowerCase();
        
        final String R_ORIGINAL = this.gdPaths.getTemplatePath(this.gdPaths.ROOT_PATH + "platform\\android\\GDGameAndroidActivityJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\GDGameAndroidActivity.xsl");
        stringMaker.delete(0, stringMaker.length());
        stringMaker.append(this.gdPaths.GEN_PATH + "platform\\android\\GDGameAndroidActivityJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\").append(name);
        final String R = this.gdPaths.getOutputPath(stringMaker.append("\\GDGameAndroidActivity.java").toString());
        
        final String newFileAsString = GDTemplateUtil.getInstance().process(R_ORIGINAL, this.GD_KEY, this.NAME, name);

        this.logUtil.putF(this.gdToolStrings.FILENAME + R, this, this.commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(R, newFileAsString);        
    }
}
