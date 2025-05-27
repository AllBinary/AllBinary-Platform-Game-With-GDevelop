/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.loader;

import java.io.FileInputStream;

import org.allbinary.data.CamelCaseUtil;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.media.audio.AllBinaryMediaManager;
import org.allbinary.media.audio.PCClipWavPlayer;
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
    private final String GD_DURATION = "<GD_DURATION>";
    
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

        ResourceUtil.getInstance().setLoadingPaths("G:\\mnt\\bc\\mydev\\GDGamesP\\Resources\\sounds\\release\\wav\\", ".wav");
        Features.getInstance().add(GameFeatureFactory.getInstance().SOUND);

        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();

        final StringMaker stringMaker = new StringMaker();
        
        final FileInputStream fileInputStream = new FileInputStream(SOUND_ORIGINAL);
        final String androidRFileAsString = new String(streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
        
        final int size = this.gdResources.playSoundAndroidResourceNameList.size();
        
        stringMaker.delete(0, stringMaker.length());
        LogUtil.put(LogFactory.getInstance(stringMaker.append("Sound Total: ").append(size).toString(), this, commonStrings.PROCESS));
        
        String resource;
        for(int index = 0; index < size; index++) {
            resource = (String) this.gdResources.playSoundAndroidResourceNameList.get(index);
            
            LogUtil.put(LogFactory.getInstance(resource, this, commonStrings.PROCESS));
            
            //final Player player = AllBinaryMediaManager.createPlayer(resource);
            final PCClipWavPlayer player = (PCClipWavPlayer) AllBinaryMediaManager.createPlayer(resource);
            final long duration = player.getDuration();
            
            final String name = this.camelCaseUtil.getAsCamelCase(resource, stringMaker);
            final Replace replace = new Replace(GD_NAME, name);
            String newFileAsString = replace.all(androidRFileAsString);
            final Replace replace2 = new Replace(GD_FILE_NAME, resource);
            newFileAsString = replace2.all(newFileAsString);
            final Replace replace3 = new Replace(GD_DURATION, Long.toString(duration));
            newFileAsString = replace3.all(newFileAsString);
            
            stringMaker.delete(0, stringMaker.length());
            stringMaker.append(GD).append(name).append(SOUND);
            
            playSoundResourceClassNameList.add(stringMaker.toString());
            
            stringMaker.append(_JAVA);
            
            final String fileName = stringMaker.toString();
            //LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + fileName, this, commonStrings.PROCESS));
            
            stringMaker.delete(0, stringMaker.length());
            
            final String fileName2 = stringMaker.append(SOUND_PATH).append(fileName).toString();
                        
            LogUtil.put(LogFactory.getInstance(this.gdToolStrings.FILENAME + fileName2, this, commonStrings.PROCESS));
            
            this.bufferedWriterUtil.overwrite(fileName2, newFileAsString);
        }
                
    }

}
