/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import java.io.StringBufferInputStream;
import javax.xml.transform.stream.StreamSource;

import org.allbinary.data.CamelCaseUtil;
import org.allbinary.data.tree.dom.BasicUriResolver;
import org.allbinary.data.tree.dom.XslHelper;
import org.allbinary.gdevelop.json.GDLayout;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonLabels;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

/**
 *
 * @author User
 */
public class GDToAllBinaryGlobalGenerator
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final XslHelper xslHelper = XslHelper.getInstance();
    private final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();
    private final GDData gdData = GDData.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    private final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);
    
    private final StringMaker stringMaker = new StringMaker();
    
    private BasicArrayList layoutNameList = new BasicArrayListD();
    private BasicArrayList nameList = new BasicArrayListD();
    private BasicArrayList classNameList = new BasicArrayListD();
    
    public void loadLayout(final GDLayout layout, final int index, final int size) throws Exception {
        final String name = this.camelCaseUtil.getAsCamelCase(layout.name, this.stringMaker);
        
        //logUtil.put(name, this, "loadLayout");
        
        this.stringMaker.delete(0, this.stringMaker.length());
        
        String className;
//        if(index == 1) {
            className = this.stringMaker.append("GDGame").append(name).append("Canvas").toString();
//        } else {
//            className = stringMaker.append("GDGameStart").append(name).append("Canvas").toString();
//        }
        
        this.logUtil.putF(className, this, "loadLayout");
        
        this.layoutNameList.add(layout.name.toUpperCase());
        this.nameList.add(name);
        this.classNameList.add(className);
    }

    public void process() throws Exception {
        
        this.timeDelayHelper.setStartTimeTNT();
        
        final SharedBytes sharedBytes = SharedBytes.getInstance();

        final String xmlDocumentStr = this.gdData.getAsString(this.gdPaths.GAME_XML_PATH, sharedBytes);
        
        final String[] xslPathInputArray = {
            this.gdData.GD_BASE_GAME_MIDLET,
            this.gdData.GD_THREED_GAME_MIDLET,
            this.gdData.GD_GAME_COMMAND_FACTORY,
            this.gdData.GD_THREED_LEVEL_BUILDER_FACTORY,
            this.gdData.GD_GAME_SOUNDS,
            this.gdData.GD_PLATFORM_ASSET_MANAGER,
            this.gdData.GD_CUSTOM_GAME_LAYER_FACTORY,
            this.gdData.GD_CUSTOM_GAME_LAYER,
            this.gdData.GD_CUSTOM_COLLIDABLE_BEHAVIOR,
            this.gdData.GD_CUSTOM_MASK_COLLIDABLE_BEHAVIOR,
            this.gdData.GD_PREBASE_GAME_SOFTWARE_INFO,
            this.gdData.GD_THREED_PREBASE_GAME_SOFTWARE_INFO,
            this.gdData.GD_THREED_ANIMATION_RESOURCES,
        };

        final String[] outputArray = {
            this.gdPaths.GEN_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java",
            this.gdPaths.GEN_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java",
            this.gdPaths.GEN_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameCommandFactory.java",
            this.gdPaths.GEN_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\graphics\\threed\\min3d\\GDGameThreedLevelBuilderFactory.java",
            this.gdPaths.GEN_PATH + "GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GDGameSounds.java",
            this.gdPaths.GEN_PATH + "platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\org\\allbinary\\logic\\system\\PlatformAssetManager.java",
            this.gdPaths.GEN_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\GDCustomGameLayerFactory.java",
            this.gdPaths.GEN_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\GDCustomGameLayer.java",
            this.gdPaths.GEN_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\special\\GDCustomCollidableBehavior.java",
            this.gdPaths.GEN_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\special\\GDCustomMaskCollidableBehavior.java",
            this.gdPaths.GEN_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameSoftwareInfo.java",
            this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameSoftwareInfo.java",
            this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameThreedAnimationResources.java",
        };
        
        final int size2 = xslPathInputArray.length;
        for (int index2 = 0; index2 < size2; index2++)
        {
            final String xslFileAsString = this.gdData.getAsString(xslPathInputArray[index2], sharedBytes);

            final String newFileAsString = xslFileAsString;
            final String updatedXslDocumentStr = newFileAsString;

            this.logUtil.putF(updatedXslDocumentStr, this, this.commonStrings.PROCESS);
            //this.bufferedWriterUtil.overwrite(MIDLET_REPLACED, updatedXslDocumentStr);

            //logUtil.put(xmlDocumentStr, this, commonStrings.PROCESS);
            //this.bufferedWriterUtil.overwrite(MIDLET_XML, xmlDocumentStr);
            String result = this.xslHelper.translate(new BasicUriResolver(),
                    new StreamSource(new StringBufferInputStream(updatedXslDocumentStr)),
                    new StreamSource(new StringBufferInputStream(xmlDocumentStr)));

            final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
            result = replaceLT.all(result);

            this.stringMaker.delete(0, this.stringMaker.length());
            this.logUtil.putF(this.stringMaker.append(this.gdToolStrings.FILENAME).append(outputArray[index2]).toString(), this, this.commonStrings.PROCESS);
            this.bufferedWriterUtil.overwrite(outputArray[index2], result);
        }
        
        this.stringMaker.delete(0, this.stringMaker.length());
        this.logUtil.putF(this.stringMaker.append(CommonLabels.getInstance().ELAPSED).appendlong(this.timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
        
    }
    
}
