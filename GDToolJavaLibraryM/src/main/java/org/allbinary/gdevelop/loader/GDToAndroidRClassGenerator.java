/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonSeps;

/**
 *
 * @author User
 */
public class GDToAndroidRClassGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    private final StringMaker androidRFileStringMaker = new StringMaker();

    final String GD_KEY = "//GD";
    //xsl template parameter for GD_KEY
    final String GD_PARAMETER = "GD";
    
    private final String PUBLIC_STATIC_FINAL_INT = "        public static final int ";
    private final String VALUE = " = 0x7f060007;\n";
    
    private final String RESOURCE = "        //Resource\n";
    private final String EXPRESSION_PARAM = "        //Expression Param\n";
    
    private final String BLANK = "blank";
    private final String SKIPPING = "Skipping: ";
    
    public GDToAndroidRClassGenerator() {
        this.androidRFileStringMaker.append(this.GD_KEY);
        this.androidRFileStringMaker.append(this.commonSeps.NEW_LINE);
    }
    
    public void processResource(final String fileAsString) {
        
        if(fileAsString.compareTo(this.BLANK) == 0) {
            this.logUtil.putF(this.SKIPPING + fileAsString, this, this.commonStrings.PROCESS);
            return;
        }
        
        this.androidRFileStringMaker.append(this.RESOURCE);
        this.androidRFileStringMaker.append(this.PUBLIC_STATIC_FINAL_INT);
        this.androidRFileStringMaker.append(fileAsString);
        this.androidRFileStringMaker.append(this.VALUE);
        this.androidRFileStringMaker.append(this.commonSeps.NEW_LINE);
    }
    
    private final String SELECT = "select";
    
    public void processExpressionParam(final String param) {
        if(param.compareTo(this.SELECT) != 0) {
        this.androidRFileStringMaker.append(this.EXPRESSION_PARAM);
        this.androidRFileStringMaker.append(this.PUBLIC_STATIC_FINAL_INT);
        this.androidRFileStringMaker.append(param);
        this.androidRFileStringMaker.append(this.VALUE);
        }
    }

    public void process() throws Exception {
        
        final String R_ORIGINAL = this.gdPaths.getTemplatePath(this.gdPaths.ROOT_PATH + "platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.xsl");
        final String R = this.gdPaths.getOutputPath(this.gdPaths.GEN_PATH + "platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java");
        
        final String newFileAsString = GDTemplateUtil.getInstance().process(R_ORIGINAL, this.GD_KEY, this.GD_PARAMETER, this.androidRFileStringMaker.toString());

        this.logUtil.putF(this.gdToolStrings.FILENAME + R, this, this.commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(R, newFileAsString);        
    }
}
