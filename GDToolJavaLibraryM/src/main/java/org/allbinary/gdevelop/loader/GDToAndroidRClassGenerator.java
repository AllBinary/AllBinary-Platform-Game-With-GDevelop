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
        
        final String R_ORIGINAL = this.gdPaths.ROOT_PATH + "platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.original";
        final String R = this.gdPaths.ROOT_PATH + "platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java";
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();

        final FileInputStream fileInputStream = new FileInputStream(R_ORIGINAL);        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
        final Replace replace = new Replace(this.GD_KEY, this.androidRFileStringMaker.toString());
        final String newFileAsString = replace.all(androidRFileAsString);

        this.logUtil.putF(this.gdToolStrings.FILENAME + R, this, this.commonStrings.PROCESS);
        
        this.bufferedWriterUtil.overwrite(R, newFileAsString);        
    }
}
