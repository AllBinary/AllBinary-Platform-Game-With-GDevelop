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
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDToAllBinarySoundsGenerator
{
    private final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();

    public final BasicArrayList playSoundAndroidResourceNameList = new BasicArrayList();
    private final BasicArrayList playSoundResourcePathList = new BasicArrayList();
    
    public final BasicArrayList playSoundResourceClassNameList = new BasicArrayList();
    
    private final String GD_NAME = "<GDNAME>";
    
    private final String SOUND_ORIGINAL = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDSound.origin";
    private final String SOUND_PATH = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\";
    
    private final String GD = "GD";
    private final String SOUND = "Sound";
    private final String _JAVA = ".java";
    
    public void processExpressionParam(final String param, final String resourceString) {
        this.playSoundAndroidResourceNameList.add(param);
        this.playSoundResourcePathList.add(resourceString);
    }

    public void process() throws Exception {
                
        final StreamUtil streamUtil = StreamUtil.getInstance();

        final FileInputStream fileInputStream = new FileInputStream(SOUND_ORIGINAL);
        final String androidRFileAsString = streamUtil.getAsString(fileInputStream);
        
        final int size = playSoundAndroidResourceNameList.size();
        
        final StringBuilder stringBuilder = new StringBuilder();
        
        for(int index = 0; index < size; index++) {
            final String name = this.camelCaseUtil.getAsCamelCase((String) playSoundAndroidResourceNameList.get(index), stringBuilder);
            final Replace replace = new Replace(GD_NAME, name);
            final String newFileAsString = replace.all(androidRFileAsString);

            stringBuilder.delete(0, stringBuilder.length());
            stringBuilder.append(GD).append(name).append(SOUND);
            
            playSoundResourceClassNameList.add(stringBuilder.toString());
            
            stringBuilder.append(_JAVA);
            
            final String fileName = stringBuilder.toString();
            
            stringBuilder.delete(0, stringBuilder.length());
            final AbFile abFile = new AbFile(stringBuilder.append(SOUND_PATH).append(fileName).toString());
            if (abFile.exists())
            {
                abFile.delete();
            }
            BufferedWriterUtil.write(abFile, newFileAsString);
        }
                
    }

}
