/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;


import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.string.CommonStrings;
import org.w3c.dom.Element;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

/**
 *
 * @author User
 */
public class GDToThreedAndroidRClassGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    //The template writes each file with its resources (one for each extension) and each expression parameter
    private final String FILE = "file";
    private final String RESOURCE = "resource";
    private final String EXPRESSION_PARAM = "expressionParam";
    private final String[] NAME_ARRAY = {"name"};
    private final String[] RESOURCE_ATTRIBUTE_NAME_ARRAY = {"extension", "prefix"};

    private final String SKIPPING = "Skipping: ";
    
    private final String SELECT = "select";
    
    private final BasicArrayList fileAsStringList = new BasicArrayListD();
    private final BasicArrayList paramList = new BasicArrayListD();
    
    public GDToThreedAndroidRClassGenerator() {
    }

    public void processResource(final String fileAsString) {
        
        if(fileAsString.compareTo(this.gdToolStrings.BLANK) == 0) {
            this.logUtil.putF(this.SKIPPING + fileAsString, this, this.commonStrings.PROCESS);
            return;
        }
        
        this.fileAsStringList.add(fileAsString);
    }

    public void processExpressionParam(final String param) {
        if(param.compareTo(this.SELECT) != 0) {
            this.paramList.add(param);
        }
    }
    
    public void processResource(final BasicArrayList threedFileList, final GDTemplateData templateData) {
        
        final StringUtil stringUtil = StringUtil.getInstance();
        
        final int size = this.fileAsStringList.size();
        String fileAsString;
        for(int index = 0; index < size; index++) {

            fileAsString = (String ) this.fileAsStringList.get(index);
            final Element fileElement = templateData.add(this.FILE, this.NAME_ARRAY, new String[] {fileAsString});
            
            final BasicArrayList extensionList = this.gdToolStrings.getExtensions(threedFileList, fileAsString);

            final int size3 = extensionList.size();
            String extension;
            
            final BasicArrayList list = new BasicArrayListD();
            for(int index3 = 0; index3 < size3; index3++) {
                extension = (String) extensionList.get(index3);
                
                if(!list.contains(extension)) {
                    list.add(extension);

                    final String prefix = extension == stringUtil.NULL_STRING ? this.commonSeps.COMMENT : stringUtil.EMPTY_STRING;
                    templateData.add(fileElement, this.RESOURCE, this.RESOURCE_ATTRIBUTE_NAME_ARRAY, new String[] {extension, prefix});
                }
            }

        }
    }
    
    public void processExpressionParam(final BasicArrayList threedFileList, final GDTemplateData templateData) {
        final int size = this.paramList.size();
        String param;
        for(int index = 0; index < size; index++) {
            param = (String) this.paramList.get(index);
            templateData.add(this.EXPRESSION_PARAM, this.NAME_ARRAY, new String[] {param});
        }
    }

    public void process(final BasicArrayList threedFileList) throws Exception {
        
        final GDTemplateData templateData = new GDTemplateData();

        this.processResource(threedFileList, templateData);
        
        this.processExpressionParam(threedFileList, templateData);

        final String R_ORIGINAL = this.gdPaths.getTemplatePath(this.gdPaths.ROOT_PATH + "platform\\android\\GDGameThreedAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.xsl");
        final String R = this.gdPaths.getOutputPath(this.gdPaths.GEN_PATH + "platform\\android\\GDGameThreedAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java");
        
        final String newFileAsString = GDTemplateUtil.getInstance().process(R_ORIGINAL, templateData);

        this.logUtil.putF(this.gdToolStrings.FILENAME + R, this, this.commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(R, newFileAsString);        
    }
}
