/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import org.allbinary.data.CamelCaseUtil;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDToAllBinarySoundsGenerator
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDResources gdResources = GDResources.getInstance();
    
    public final BasicArrayList playSoundResourceClassNameList = new BasicArrayList();
    
    private final String GD_NAME = "<GDNAME>";
    private final String GD_FILE_NAME = "<GD_FILE_NAME>";
    
    private final String SOUND_ORIGINAL = gdToolStrings.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\GDSound.origin";
    private final String SOUND_PATH = gdToolStrings.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource\\";
    
    private final String GD = "GD";
    private final String SOUND = "Sound";
    private final String _JAVA = ".java";
    
    private final String SKIPPING_SOUND = "Skpping Sound: ";
    private final String SELECT = "select";
    private final String ERROR = "error";
    
    public void processExpressionParam(final String param, final String resourceString) {
        LogUtil.put(LogFactory.getInstance(SOUND + param, this, commonStrings.PROCESS));
        
        int startIndex = param.lastIndexOf('/');
        if (startIndex < 0) {
            startIndex = param.lastIndexOf('\\');
        }
        
        if (startIndex < 0) {
            startIndex = 0;
        } else {
            startIndex++;
        }

        //int endIndex = param.lastIndexOf('.');
        final String fileAsString = param.substring(startIndex);
        
        if(fileAsString.compareTo(SELECT) == 0) {
            LogUtil.put(LogFactory.getInstance(SKIPPING_SOUND + fileAsString, this, commonStrings.PROCESS));
            return;
        }

        if(fileAsString.compareTo(ERROR) == 0) {
            LogUtil.put(LogFactory.getInstance(SKIPPING_SOUND + fileAsString, this, commonStrings.PROCESS));
            return;
        }

        LogUtil.put(LogFactory.getInstance(SOUND + fileAsString, this, commonStrings.PROCESS));
        
        this.gdResources.playSoundAndroidResourceNameList.add(fileAsString);
        this.gdResources.playSoundResourcePathList.add(resourceString);
    }

    public void process() throws Exception {
                
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(16384);
        final byte[] byteArray = new byte[16384];        

        final FileInputStream fileInputStream = new FileInputStream(SOUND_ORIGINAL);
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, outputStream, byteArray));
        
        final int size = this.gdResources.playSoundAndroidResourceNameList.size();
        
        LogUtil.put(LogFactory.getInstance("Sound Total: " + size, this, commonStrings.PROCESS));
        
        final StringMaker stringBuilder = new StringMaker();
        
        for(int index = 0; index < size; index++) {
            final String name = this.camelCaseUtil.getAsCamelCase((String) this.gdResources.playSoundAndroidResourceNameList.get(index), stringBuilder);
            final Replace replace = new Replace(GD_NAME, name);
            String newFileAsString = replace.all(androidRFileAsString);
            final Replace replace2 = new Replace(GD_FILE_NAME, (String) this.gdResources.playSoundAndroidResourceNameList.get(index));
            newFileAsString = replace2.all(newFileAsString);

            stringBuilder.delete(0, stringBuilder.length());
            stringBuilder.append(GD).append(name).append(SOUND);
            
            playSoundResourceClassNameList.add(stringBuilder.toString());
            
            stringBuilder.append(_JAVA);
            
            final String fileName = stringBuilder.toString();
            //LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + fileName, this, commonStrings.PROCESS));
            
            stringBuilder.delete(0, stringBuilder.length());
            
            final String fileName2 = stringBuilder.append(SOUND_PATH).append(fileName).toString();
            LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + fileName2, this, commonStrings.PROCESS));
            
            this.bufferedWriterUtil.overwrite(fileName2, newFileAsString);
        }
                
    }

}
