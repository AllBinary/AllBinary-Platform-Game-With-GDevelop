/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
* 
* By agreeing to this license you and any business entity you represent are
* legally bound to the AllBinary Open License Version 1 legal agreement.
* 
* You may obtain the AllBinary Open License Version 1 legal agreement from
* AllBinary or the root directory of AllBinary's AllBinary Platform repository.
* 
* Created By: Travis Berthelot
* 
 */
package org.allbinary.gdevelop.json;

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
        
        final String R_ORIGINAL = "G:\\mnt\\bc\\mydev\\GDGamesP\\platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.original";
        final String R = "G:\\mnt\\bc\\mydev\\GDGamesP\\platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java";
        
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
