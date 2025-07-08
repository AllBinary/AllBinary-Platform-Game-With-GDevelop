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
import org.allbinary.logic.communication.log.LogFactory;
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
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    private final StringMaker androidRFileStringMaker = new StringMaker();

    final String GD_KEY = "//GD";
    
    private final String PUBLIC_STATIC_FINAL_INT = "        public static final int ";
    private final String VALUE = " = 0x7f060007;\n";
    
    private final String RESOURCE = "        //Resource\n";
    private final String EXPRESSION_PARAM = "        //Expression Param\n";
    private final String _OBJ = "_obj";
    
    private final String BLANK = "blank";
    private final String SKIPPING = "Skipping: ";
    
    public GDToAndroidRClassGenerator() {
        androidRFileStringMaker.append(GD_KEY);
        androidRFileStringMaker.append(this.commonSeps.NEW_LINE);
    }
    
    public void processResource(final String fileAsString) {
        
        if(fileAsString.compareTo(BLANK) == 0) {
            LogUtil.put(LogFactory.getInstance(SKIPPING + fileAsString, this, commonStrings.PROCESS));
            return;
        }
        
        androidRFileStringMaker.append(RESOURCE);
        androidRFileStringMaker.append(PUBLIC_STATIC_FINAL_INT);
        androidRFileStringMaker.append(fileAsString);
        androidRFileStringMaker.append(VALUE);
        androidRFileStringMaker.append(this.commonSeps.NEW_LINE);
        androidRFileStringMaker.append(PUBLIC_STATIC_FINAL_INT);
        androidRFileStringMaker.append(fileAsString);
        androidRFileStringMaker.append(_OBJ);
        androidRFileStringMaker.append(VALUE);
    }
    
    private final String SELECT = "select";
    
    public void processExpressionParam(final String param) {
        
        if(param.compareTo(SELECT) != 0) {
        androidRFileStringMaker.append(EXPRESSION_PARAM);
        androidRFileStringMaker.append(PUBLIC_STATIC_FINAL_INT);
        androidRFileStringMaker.append(param);
        androidRFileStringMaker.append(VALUE);
        }
    }

    public void process() throws Exception {
        
        final String R_ORIGINAL = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.original";
        final String R = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java";
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();

        final FileInputStream fileInputStream = new FileInputStream(R_ORIGINAL);        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
        final Replace replace = new Replace(GD_KEY, androidRFileStringMaker.toString());
        final String newFileAsString = replace.all(androidRFileAsString);

        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + R, this, commonStrings.PROCESS));
        
        this.bufferedWriterUtil.overwrite(R, newFileAsString);        
    }
}
