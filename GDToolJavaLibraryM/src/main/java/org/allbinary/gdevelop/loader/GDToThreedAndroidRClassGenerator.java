/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.FileInputStream;

import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;

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
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    private final String GD_KEY = "//GD";
    
    private final String PUBLIC_STATIC_FINAL_INT = "        public static final int ";
    private final String VALUE = " = 0x7f060007;\n";
    
    private final String RESOURCE = "        //Resource\n";
    private final String EXPRESSION_PARAM = "        //Expression Param\n";
    
    private final String SKIPPING = "Skipping: ";
    
    private final String SELECT = "select";
    
    private final BasicArrayList fileAsStringList = new BasicArrayList();
    private final BasicArrayList paramList = new BasicArrayList();
    
    public GDToThreedAndroidRClassGenerator() {
    }

    public void processResource(final String fileAsString) {
        
        if(fileAsString.compareTo(this.gdToolStrings.BLANK) == 0) {
            logUtil.put(SKIPPING + fileAsString, this, commonStrings.PROCESS);
            return;
        }
        
        this.fileAsStringList.add(fileAsString);
    }

    public void processExpressionParam(final String param) {
        if(param.compareTo(SELECT) != 0) {
            this.paramList.add(param);
        }
    }
    
    public void processResource(final BasicArrayList threedFileList, final StringMaker stringMaker) {
        
        final int size = this.fileAsStringList.size();
        String fileAsString;
        for(int index = 0; index < size; index++) {

            fileAsString = (String ) fileAsStringList.get(index);
            
            final String extension = this.gdToolStrings.getExtension(threedFileList, fileAsString);
            
            stringMaker.append(RESOURCE);
            
            if(extension == StringUtil.getInstance().NULL_STRING) {
                stringMaker.append(this.commonSeps.COMMENT);
            }            
            
            stringMaker.append(PUBLIC_STATIC_FINAL_INT);
            stringMaker.append(fileAsString);
            stringMaker.append(VALUE);
            stringMaker.append(this.commonSeps.NEW_LINE);
            
            if(!(extension == StringUtil.getInstance().EMPTY_STRING || extension == StringUtil.getInstance().NULL_STRING)) {
                stringMaker.append(PUBLIC_STATIC_FINAL_INT);
                stringMaker.append(fileAsString);
                stringMaker.append(extension);
                stringMaker.append(VALUE);
            }

        }
    }
    
    public void processExpressionParam(final BasicArrayList threedFileList, final StringMaker stringMaker) {
        final int size = this.paramList.size();
        String param;
        for(int index = 0; index < size; index++) {
            param = (String) this.paramList.get(index);
            stringMaker.append(EXPRESSION_PARAM);
            stringMaker.append(PUBLIC_STATIC_FINAL_INT);
            stringMaker.append(param);
            stringMaker.append(VALUE);
        }
    }

    public void process(final BasicArrayList threedFileList) throws Exception {
        
        final StringMaker stringMaker = new StringMaker();

        stringMaker.append(GD_KEY);
        stringMaker.append(this.commonSeps.NEW_LINE);

        this.processResource(threedFileList, stringMaker);
        
        this.processExpressionParam(threedFileList, stringMaker);

        final String R_ORIGINAL = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameThreedAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.original";
        final String R = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameThreedAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java";
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();

        final FileInputStream fileInputStream = new FileInputStream(R_ORIGINAL);        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
        final Replace replace = new Replace(GD_KEY, stringMaker.toString());
        final String newFileAsString = replace.all(androidRFileAsString);

        logUtil.put(this.gdToolStrings.FILENAME + R, this, commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(R, newFileAsString);        
    }
}
