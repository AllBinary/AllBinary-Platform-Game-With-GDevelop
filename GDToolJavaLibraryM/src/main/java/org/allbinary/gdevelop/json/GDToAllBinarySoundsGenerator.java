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
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDToAllBinarySoundsGenerator
{
    public final BasicArrayList playSoundAndroidResourceNameList = new BasicArrayList();
    private final BasicArrayList playSoundResourcePathList = new BasicArrayList();
    
    public final BasicArrayList playSoundResourceClassNameList = new BasicArrayList();
    
    private final String GD_NAME = "<GDNAME>";
    
    private final String SOUND_ORIGINAL = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDSound.origin";
    private final String SOUND_PATH = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\";
    
    private final String GD = "GD";
    private final String SOUND = "Sound";
    private final String _JAVA = ".java";

    private final String FORMAT = "[\\W_]+";
    
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
            final String name = this.getAsCamelCase((String) playSoundAndroidResourceNameList.get(index), stringBuilder);
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

    public String getAsCamelCase(final String string, final StringBuilder stringBuilder) {

        stringBuilder.delete(0, stringBuilder.length());
        
        final String[] words = string.split(FORMAT);
        
        for (int i = 0; i < words.length; i++)
        {
            String word = words[i];
            //if (i == 0)
            //{
                //word = word.isEmpty() ? word : word.toLowerCase();
            //} else
            //{
                word = word.isEmpty() ? word : Character.toUpperCase(word.charAt(0)) + word.substring(1).toLowerCase();
            //}
            stringBuilder.append(word);
        }
        return stringBuilder.toString();
    }
}
