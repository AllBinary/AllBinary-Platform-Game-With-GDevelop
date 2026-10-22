/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
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
package org.allbinary.gdevelop.loader;

import java.io.File;

import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileListFetcher;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

/**
 *
 * @author User
 */
public class GDDelete {
    protected final LogUtil logUtil = LogUtil.getInstance();


    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();

    private final String JAVA_EXTENSION = ".java";

    /**
     * Gets the files of the selected language module directory.
     * When the extension is java all the source extensions of the selected language are used such as cpp and h for C++.
     */
    private BasicArrayList getFiles(final String javaPath, final String extension) throws Exception {
        final String path = this.gdPaths.getLanguagePath(javaPath);
        if (!new File(path).exists()) {
            this.logUtil.putF(new StringMaker().append("Skipping missing: ").append(path).toString(), this, this.commonStrings.PROCESS);
            return new BasicArrayListD();
        }
        if (!extension.equals(this.gdToolStrings.JAVA)) {
            return FileListFetcher.getInstance().getFiles(path, extension);
        }
        final String[] languageExtensionArray = this.gdPaths.language.extensionArray;
        final int size = languageExtensionArray.length;
        final String[] extensionArray = new String[size];
        for (int index = 0; index < size; index++) {
            extensionArray[index] = languageExtensionArray[index].substring(1);
        }
        return FileListFetcher.getInstance().getFiles(path, extensionArray);
    }

    /**
     * Converts the exclusions to the selected language. A .java exclusion excludes every source extension of the language
     * so GDGlobals.java excludes GDGlobals.cpp and GDGlobals.h for C++.
     */
    private BasicArrayList getLanguageExclusionList(final BasicArrayList exclusionList) {
        final BasicArrayList languageExclusionList = new BasicArrayListD();
        final String[] languageExtensionArray = this.gdPaths.language.extensionArray;
        final int size = exclusionList.size();
        final int size2 = languageExtensionArray.length;
        String exclusion;
        for (int index = 0; index < size; index++) {
            exclusion = (String) exclusionList.get(index);
            if (exclusion.endsWith(this.JAVA_EXTENSION)) {
                final String base = exclusion.substring(0, exclusion.length() - this.JAVA_EXTENSION.length());
                for (int index2 = 0; index2 < size2; index2++) {
                    languageExclusionList.add(new StringMaker().append(base).append(languageExtensionArray[index2]).toString());
                }
            } else {
                languageExclusionList.add(this.gdPaths.getLanguagePath(exclusion));
            }
        }
        return languageExclusionList;
    }

    public void process(final BasicArrayList fileBasicArrayList, final BasicArrayList exclusionList) throws Exception {

        final StringMaker stringMaker = new StringMaker();

        final BasicArrayList languageExclusionList = this.getLanguageExclusionList(exclusionList);
        final int size = fileBasicArrayList.size();
        final int size2 = languageExclusionList.size();
        String exclusion;
        AbFile abFile;
        for(int index = 0; index < size; index++) {
            abFile = ((AbFile) fileBasicArrayList.get(index));
            if(!abFile.isDirectory()) {
                boolean exclude = false;
                for (int index2 = 0; index2 < size2; index2++) {
                    exclusion = (String) languageExclusionList.get(index2);
                    if (abFile.getAbsolutePath().indexOf(exclusion) >= 0) {
                        exclude = true;
                        break;
                    }
                }
                if (!exclude) {
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append("Deleting: ").append(abFile.getAbsolutePath()).toString(), this, this.commonStrings.PROCESS);
                    abFile.delete();
                }
            }
        }
    }

    public void process() throws Exception {

        final GDPaths gdPaths = GDPaths.getInstance();
        final FileListFetcher fileListFetcher = FileListFetcher.getInstance();
        final BasicArrayList exclusionList0 = new BasicArrayListD();

        final BasicArrayList files0 = this.getFiles(
              gdPaths.GEN_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java", this.gdToolStrings.XML);
        
        this.process(files0, exclusionList0);

        final BasicArrayList exclusionList0b = new BasicArrayListD();

        final BasicArrayList files0b = this.getFiles(
              gdPaths.GEN_PATH + "GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\res\\", this.gdToolStrings.JSON);
        
        this.process(files0b, exclusionList0b);
        
        final BasicArrayList exclusionList = new BasicArrayListD();
        
        exclusionList.add("TouchButtonAndroidResources.java");
        exclusionList.add("StartRunnable.java");
        exclusionList.add("GeographicMapTopViewMaskGameLayerBehavior.java");
        exclusionList.add("GDGameInputProcessor.java");
        exclusionList.add("GDGameResourceInitialization.java");
        exclusionList.add("GDGlobals.java");
        exclusionList.add("TempMovementBehaviorFactory.java");
        exclusionList.add("TempNoMapMovementBehavior.java");
        exclusionList.add("TempMapMovementBehavior.java");
        exclusionList.add("TempMovementBehavior.java");

        final BasicArrayList files = this.getFiles(
              gdPaths.GEN_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java", this.gdToolStrings.JAVA);

        this.process(files, exclusionList);

        final BasicArrayList exclusionList2 = new BasicArrayListD();
        
        exclusionList2.add("GDGameGameCanvas.java");
        exclusionList2.add("GDGameStartCanvas.java");
        exclusionList2.add("GDGameSoftwareInfo.java");
        exclusionList2.add("GDTiledLayerFactory.java");
        exclusionList2.add("PlacementAllBinaryJ2METiledLayer.java");
        exclusionList2.add("GDTiledMapProperties");
        
        final BasicArrayList files2 = this.getFiles(
              gdPaths.GEN_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java", this.gdToolStrings.JAVA);
        
        this.process(files2, exclusionList2);

        final BasicArrayList exclusionList3 = new BasicArrayListD();
        
        exclusionList3.add("GDGameAllBinarySceneControllerFactory.java");
        exclusionList3.add("GDGameSoftwareInfo.java");
        exclusionList3.add("GDGameTitleAnimationFactory.java");
        exclusionList3.add("GDGameResourceInitialization.java");
        exclusionList3.add("GDThreedEarlyResourceInitializationFactory.java");
        exclusionList3.add("GDGameAllBinarySceneControllerFactory.java");
        exclusionList3.add("GDGameSceneController.java");
        exclusionList3.add("GDCameraInputProcessor.java");
        exclusionList3.add("RendererActivity.java");
        exclusionList3.add("TitleThreedResources.java");
        exclusionList3.add("TitleBasicArrayListData.java");
        exclusionList3.add("GDGameCameraSetup.java");
        exclusionList3.add("GDGameLevelBuilder.java");
        exclusionList3.add("GDTiledLayerFactory.java");
        exclusionList3.add("PlacementAllBinaryJ2METiledLayer.java");
        exclusionList3.add("GDTiledMapProperties");
        exclusionList3.add("TitleVectorData.java");
        
        final BasicArrayList files3 = this.getFiles(
              gdPaths.GEN_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java", this.gdToolStrings.JAVA);
        
        this.process(files3, exclusionList3);

        final BasicArrayList exclusionList3b = new BasicArrayListD();
        
        exclusionList3b.add("PlatformAssetManager.java");
        
        final BasicArrayList files3b = this.getFiles(
              gdPaths.GEN_PATH + "platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java", this.gdToolStrings.JAVA);
        
        this.process(files3b, exclusionList3b);
        
        final BasicArrayList exclusionList4 = new BasicArrayListD();
        
        exclusionList4.add("GDGameThreedLevelBuilder.java");
        exclusionList4.add("AppRendererShaderUpdaterFactory.java");
        
        final BasicArrayList files4 = this.getFiles(
              gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java", this.gdToolStrings.JAVA);

        this.process(files4, exclusionList4);

        final BasicArrayList exclusionList5 = new BasicArrayListD();
        
        //exclusionList3.add("GDGameAllBinarySceneControllerFactory.java");
        
        final BasicArrayList files5 = this.getFiles(
              gdPaths.GEN_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java", this.gdToolStrings.JAVA);
        
        this.process(files5, exclusionList5);

        final BasicArrayList exclusionList20 = new BasicArrayListD();
        
        exclusionList20.add("GDGameHelpPaintable.java");
        exclusionList20.add("GDGameInputMappingHelpPaintable.java");
        exclusionList20.add("GDGameGameInputMappingFactory.java");
        exclusionList20.add("AppShaderResources.java");
        exclusionList20.add("GDConfig.java");
        
        final BasicArrayList files20 = this.getFiles(
              gdPaths.GEN_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\", this.gdToolStrings.JAVA);
        
        this.process(files20, exclusionList20);

        final BasicArrayList exclusionList21 = new BasicArrayListD();
        
        //exclusionList21.add("GDGameSounds.java");
        //exclusionList21.add("GameSoundsFactory.java");
        
        final BasicArrayList files21 = this.getFiles(
              gdPaths.GEN_PATH + "\\GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio", this.gdToolStrings.JAVA);
        
        this.process(files21, exclusionList21);
                
        final BasicArrayList exclusionList6 = new BasicArrayListD();
        
        exclusionList6.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList6.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        
        final BasicArrayList files6 = this.getFiles(
              gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings.JAVA);
        
        this.process(files6, exclusionList6);

        final BasicArrayList files6b = this.getFiles(
              gdPaths.GEN_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings.JAVA);
        
        this.process(files6b, exclusionList6);
        
        final BasicArrayList exclusionList7 = new BasicArrayListD();
        
        exclusionList7.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList7.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        
        final BasicArrayList files7 = this.getFiles(
              gdPaths.GEN_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings.JAVA);
        
        this.process(files7, exclusionList7);

        final BasicArrayList files17 = this.getFiles(
              gdPaths.GEN_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings.JAVA);
        
        this.process(files17, exclusionList7);
        
        final BasicArrayList exclusionList8 = new BasicArrayListD();
        
        exclusionList8.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList8.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        
        final BasicArrayList files8 = this.getFiles(
              gdPaths.GEN_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings.JAVA);
        
        this.process(files8, exclusionList8);

        final BasicArrayList exclusionList9 = new BasicArrayListD();
        
        exclusionList9.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList9.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        
        final BasicArrayList files9 = this.getFiles(
              gdPaths.GEN_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings.JAVA);
        
        this.process(files9, exclusionList9);
        
        final BasicArrayList files19 = this.getFiles(
              gdPaths.GEN_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings.JAVA);

        this.process(files19, exclusionList9);

        final BasicArrayList files19b = this.getFiles(
              gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings.JAVA);

        this.process(files19b, exclusionList9);

        final BasicArrayList files19c = this.getFiles(
              gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings.JAVA);

        this.process(files19c, exclusionList9);
        
        final BasicArrayList files29 = this.getFiles(
              gdPaths.GEN_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings.JAVA);
        
        this.process(files29, exclusionList9);
        
        final BasicArrayList exclusionList10 = new BasicArrayListD();
        
        exclusionList10.add("GDGameEarlyResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList10.add("GDGameGameResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList10.add("GDGameOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList10.add("GDGameThreedTitleAnimation.java");
        exclusionList10.add("GDGameThreedTitleAnimationFactory.java");
        
        final BasicArrayList files10 = this.getFiles(
              gdPaths.GEN_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings.JAVA);
        
        this.process(files10, exclusionList10);
        
        final BasicArrayList exclusionList11 = new BasicArrayListD();

        //exclusionList11.add("GDGameAndroidMin3dView.java");
        //exclusionList11.add("GDGameAndroidOpenGLESView.java");
        //exclusionList11.add("GDGameAndroidView.java");
        exclusionList11.add("GDGameAndroidResourceInitialization.java");
        
        final BasicArrayList files11 = this.getFiles(
              gdPaths.GEN_PATH + "platform\\android\\GDGameThreedAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\", this.gdToolStrings.JAVA);

        this.process(files11, exclusionList11);
        
        final BasicArrayList exclusionList12 = new BasicArrayListD();

        exclusionList12.add("GDGameMIDletFactory.java");
        exclusionList12.add("GDGameAndroidActivityBase.java");
        
        final BasicArrayList files12 = this.getFiles(
              gdPaths.GEN_PATH + "platform\\android\\GDGameAndroidActivityJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\", this.gdToolStrings.JAVA);

        this.process(files12, exclusionList12);

    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args)  throws Exception {
        GDPaths.init(GDLanguageSelection.getInstance().select(args));
        new GDDelete().process();
    }
    
}
