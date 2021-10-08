/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.FileInputStream;
import org.allbinary.logic.basic.io.BufferedWriterUtil;
import org.allbinary.logic.basic.io.StreamUtil;
import org.allbinary.logic.basic.io.file.AbFile;
import org.allbinary.logic.basic.string.regex.replace.Replace;

/**
 *
 * @author User
 */
public class GDToAndroidRClassGenerator
{
    private final StringBuilder androidRFileStringBuilder = new StringBuilder();

    final String GD_KEY = "//GD";
    
    private final String PUBLIC_STATIC_FINAL_INT = "        public static final int ";
    private final String VALUE = " = 0x7f060007;\n";
    
    public GDToAndroidRClassGenerator() {
        androidRFileStringBuilder.append(GD_KEY);
        androidRFileStringBuilder.append('\n');
    }
    
    public void processResource(final String fileAsString) {
        androidRFileStringBuilder.append(PUBLIC_STATIC_FINAL_INT);
        androidRFileStringBuilder.append(fileAsString);
        androidRFileStringBuilder.append(VALUE);
    }
    
    public void processExpressionParam(final String param) {
        androidRFileStringBuilder.append(PUBLIC_STATIC_FINAL_INT);
        androidRFileStringBuilder.append(param);
        androidRFileStringBuilder.append(VALUE);
    }

    public void process() throws Exception {
        
        final String R_ORIGINAL = "G:\\mnt\\bc\\mydev\\GDGamesP\\platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\R.original";
        final String R = "G:\\mnt\\bc\\mydev\\GDGamesP\\platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\R.java";
        
        final StreamUtil streamUtil = StreamUtil.getInstance();

        final FileInputStream fileInputStream = new FileInputStream(R_ORIGINAL);
        final String androidRFileAsString = streamUtil.getAsString(fileInputStream);
        final Replace replace = new Replace(GD_KEY, androidRFileStringBuilder.toString());
        final String newFileAsString = replace.all(androidRFileAsString);

        final AbFile abFile = new AbFile(R);
        if(abFile.exists()) {
            abFile.delete();
        }
        BufferedWriterUtil.write(abFile, newFileAsString);        
    }
}
