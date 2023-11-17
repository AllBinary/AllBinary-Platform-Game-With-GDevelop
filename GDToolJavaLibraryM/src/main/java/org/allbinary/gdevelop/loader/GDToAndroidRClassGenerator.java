/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDToAndroidRClassGenerator
{
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    private final StringMaker androidRFileStringBuilder = new StringMaker();

    final String GD_KEY = "//GD";
    
    private final String PUBLIC_STATIC_FINAL_INT = "        public static final int ";
    private final String VALUE = " = 0x7f060007;\n";
    
    private final String RESOURCE = "        //Resource\n";
    private final String EXPRESSION_PARAM = "        //Expression Param\n";
    private final String _OBJ = "_obj";
    
    public GDToAndroidRClassGenerator() {
        androidRFileStringBuilder.append(GD_KEY);
        androidRFileStringBuilder.append('\n');
    }
    
    public void processResource(final String fileAsString) {
        androidRFileStringBuilder.append(RESOURCE);
        androidRFileStringBuilder.append(PUBLIC_STATIC_FINAL_INT);
        androidRFileStringBuilder.append(fileAsString);
        androidRFileStringBuilder.append(VALUE);
        androidRFileStringBuilder.append('\n');
        androidRFileStringBuilder.append(PUBLIC_STATIC_FINAL_INT);
        androidRFileStringBuilder.append(fileAsString);
        androidRFileStringBuilder.append(_OBJ);
        androidRFileStringBuilder.append(VALUE);
    }
    
    public void processExpressionParam(final String param) {
        androidRFileStringBuilder.append(EXPRESSION_PARAM);
        androidRFileStringBuilder.append(PUBLIC_STATIC_FINAL_INT);
        androidRFileStringBuilder.append(param);
        androidRFileStringBuilder.append(VALUE);
    }

    public void process() throws Exception {
        
        final String R_ORIGINAL = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.original";
        final String R = gdToolStrings.ROOT_PATH + "platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java";
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
        final byte[] byteArray = new byte[16384];

        final FileInputStream fileInputStream = new FileInputStream(R_ORIGINAL);        
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, outputStream, byteArray));
        final Replace replace = new Replace(GD_KEY, androidRFileStringBuilder.toString());
        final String newFileAsString = replace.all(androidRFileAsString);

        LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + R, this, CommonStrings.getInstance().CONSTRUCTOR));
        
        this.bufferedWriterUtil.overwrite(R, newFileAsString);        
    }
}
