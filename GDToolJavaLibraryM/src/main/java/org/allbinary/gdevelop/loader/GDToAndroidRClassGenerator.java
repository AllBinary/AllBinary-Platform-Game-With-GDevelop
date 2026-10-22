/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDToAndroidRClassGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    //The template writes each resource and expression parameter
    private final GDTemplateData templateData = new GDTemplateData();
    private final String RESOURCE = "resource";
    private final String EXPRESSION_PARAM = "expressionParam";
    private final String[] NAME_ARRAY = {"name"};
    
    private final String BLANK = "blank";
    private final String SKIPPING = "Skipping: ";
    
    public GDToAndroidRClassGenerator() {
    }
    
    public void processResource(final String fileAsString) {
        
        if(fileAsString.compareTo(this.BLANK) == 0) {
            this.logUtil.putF(this.SKIPPING + fileAsString, this, this.commonStrings.PROCESS);
            return;
        }
        
        this.templateData.add(this.RESOURCE, this.NAME_ARRAY, new String[] {fileAsString});
    }
    
    private final String SELECT = "select";
    
    public void processExpressionParam(final String param) {
        if(param.compareTo(this.SELECT) != 0) {
            this.templateData.add(this.EXPRESSION_PARAM, this.NAME_ARRAY, new String[] {param});
        }
    }

    public void process() throws Exception {
        
        final String R_ORIGINAL = this.gdPaths.getTemplatePath(this.gdPaths.ROOT_PATH + "platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.xsl");
        final String R = this.gdPaths.getOutputPath(this.gdPaths.GEN_PATH + "platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java");
        
        final String newFileAsString = GDTemplateUtil.getInstance().process(R_ORIGINAL, this.templateData);

        this.logUtil.putF(this.gdToolStrings.FILENAME + R, this, this.commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(R, newFileAsString);        
    }
}
