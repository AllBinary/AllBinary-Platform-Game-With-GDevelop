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

import java.util.Vector;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileListFetcher;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDDelete {

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    
    public void process(final Vector fileVector, final BasicArrayList exclusionList) throws Exception {
        final int size = fileVector.size();
        final int size2 = exclusionList.size();
        String exclusion;
        AbFile abFile;
        for(int index = 0; index < size; index++) {
            abFile = ((AbFile) fileVector.get(index));
            if(!abFile.isDirectory()) {
                boolean exclude = false;
                for (int index2 = 0; index2 < size2; index2++) {
                    exclusion = (String) exclusionList.get(index2);
                    if (abFile.getAbsolutePath().indexOf(exclusion) >= 0) {
                        exclude = true;
                        break;
                    }
                }
                if (!exclude) {
                    LogUtil.put(LogFactory.getInstance("Deleting: " + abFile.getAbsolutePath(), this, commonStrings.PROCESS));
                    abFile.delete();
                }
            }
        }
    }

    public void process() throws Exception {

        final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
        final FileListFetcher fileListFetcher = FileListFetcher.getInstance();
        final BasicArrayList exclusionList0 = new BasicArrayList();

        final Vector files0 = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java", "xml");
        
        this.process(files0, exclusionList0);

        final BasicArrayList exclusionList0b = new BasicArrayList();

        final Vector files0b = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\res\\", "json");
        
        this.process(files0b, exclusionList0b);
        
        final BasicArrayList exclusionList = new BasicArrayList();
        
        exclusionList.add("TouchButtonAndroidResources.java");
        exclusionList.add("StartRunnable.java");
        exclusionList.add("GeographicMapTopViewMaskGameLayerBehavior.java");
        exclusionList.add("GDGameInputProcessor.java");
        exclusionList.add("GDGameResourceInitialization.java");
        exclusionList.add("GDGlobals.java");
        exclusionList.add("GDCustomCollidableBehavior.java");
        exclusionList.add("GDCustomMaskCollidableBehavior.java");
        exclusionList.add("TempMovementBehaviorFactory.java");
        exclusionList.add("TempNoMapMovementBehavior.java");
        exclusionList.add("TempMapMovementBehavior.java");
        exclusionList.add("TempMovementBehavior.java");

        final Vector files = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java", "java");

        this.process(files, exclusionList);

        final BasicArrayList exclusionList2 = new BasicArrayList();
        
        exclusionList2.add("GDGameGameCanvas.java");
        exclusionList2.add("GDGameStartCanvas.java");        
        exclusionList2.add("GDGameSoftwareInfo.java");
        exclusionList2.add("GDGeographicMap.java");
        exclusionList2.add("GDTiledMapProperties");
        
        final Vector files2 = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java", "java");
        
        this.process(files2, exclusionList2);

        final BasicArrayList exclusionList3 = new BasicArrayList();
        
        exclusionList3.add("GDGameAllBinarySceneControllerFactory.java");
        exclusionList3.add("GDGameAndroidMin3dView.java");
        exclusionList3.add("GDGameAndroidOpenGLESView.java");
        exclusionList3.add("GDGameAndroidView.java");
        exclusionList3.add("GDGameSoftwareInfo.java");
        exclusionList3.add("GDGameTitleAnimationFactory.java");
        exclusionList3.add("GDGameResourceInitialization.java");
        exclusionList3.add("GDThreedEarlyResourceInitializationFactory.java");
        exclusionList3.add("GDGameAllBinarySceneControllerFactory.java");
        exclusionList3.add("GDGameSceneController.java");
        exclusionList3.add("RendererActivity.java");
        exclusionList3.add("TitleThreedResources.java");
        exclusionList3.add("TitleVectorData.java");
        exclusionList3.add("GDGameThreedLevelBuilderFactory.java");
        exclusionList3.add("GDGameCameraSetup.java");
        exclusionList3.add("GDGameLevelBuilder.java");
        exclusionList3.add("GDGeographicMap.java");
        
        final Vector files3 = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java", "java");
        
        this.process(files3, exclusionList3);

        final BasicArrayList exclusionList3b = new BasicArrayList();
        
        exclusionList3b.add("PlatformAssetManager.java");
        
        final Vector files3b = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java", "java");
        
        this.process(files3b, exclusionList3b);
        
        final BasicArrayList exclusionList4 = new BasicArrayList();
        
        exclusionList4.add("GDGameThreedLevelBuilder.java");
        
        final Vector files4 = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java", "java");

        this.process(files4, exclusionList4);

        final BasicArrayList exclusionList5 = new BasicArrayList();
        
        //exclusionList3.add("GDGameAllBinarySceneControllerFactory.java");
        
        final Vector files5 = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java", "java");
        
        this.process(files5, exclusionList5);

        final BasicArrayList exclusionList20 = new BasicArrayList();
        
        exclusionList20.add("GDResources.java");
        
        final Vector files20 = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\resource", "java");
        
        this.process(files20, exclusionList20);

        final BasicArrayList exclusionList21 = new BasicArrayList();
        
        //exclusionList21.add("GDGameSounds.java");
        //exclusionList21.add("GameSoundsFactory.java");
        
        final Vector files21 = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "\\GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio", "java");
        
        this.process(files21, exclusionList21);
                
        final BasicArrayList exclusionList6 = new BasicArrayList();
        
        exclusionList6.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList6.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        
        final Vector files6 = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", "java");
        
        this.process(files6, exclusionList6);

        final BasicArrayList exclusionList7 = new BasicArrayList();
        
        exclusionList7.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList7.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        
        final Vector files7 = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", "java");
        
        this.process(files7, exclusionList7);

        final BasicArrayList exclusionList8 = new BasicArrayList();
        
        exclusionList8.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList8.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        
        final Vector files8 = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", "java");
        
        this.process(files8, exclusionList8);

        final BasicArrayList exclusionList9 = new BasicArrayList();
        
        exclusionList9.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList9.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        
        final Vector files9 = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", "java");
        
        this.process(files9, exclusionList9);

        final BasicArrayList exclusionList10 = new BasicArrayList();
        
        exclusionList10.add("GDGameEarlyResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList10.add("GDGameGameResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList10.add("GDGameOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList10.add("GDGameThreedTitleAnimation.java");
        exclusionList10.add("GDGameThreedTitleAnimationFactory.java");
        
        final Vector files10 = fileListFetcher.getFiles(
              gdToolStrings.ROOT_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", "java");
        
        this.process(files10, exclusionList10);
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args)  throws Exception {
        new GDDelete().process();
    }
    
}
