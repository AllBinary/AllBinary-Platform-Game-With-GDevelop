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
import org.allbinary.logic.basic.io.file.AbFile;
import org.allbinary.logic.basic.io.file.FileListFetcher;
import org.allbinary.logic.basic.string.CommonStrings;
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
        final BasicArrayList exclusionList0 = new BasicArrayList();

        final Vector files0 = FileListFetcher.getInstance().getFiles(
              gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java", "xml");
        
        this.process(files0, exclusionList0);
        
        final BasicArrayList exclusionList = new BasicArrayList();
        
        exclusionList.add("TouchButtonAndroidResources.java");
        exclusionList.add("StartRunnable.java");
        exclusionList.add("GDGameInputProcessor.java");
        exclusionList.add("GDGameResourceInitialization.java");
        exclusionList.add("GDGlobals.java");

        final Vector files = FileListFetcher.getInstance().getFiles(
              gdToolStrings.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java", "java");

        this.process(files, exclusionList);

        final BasicArrayList exclusionList2 = new BasicArrayList();
        
        exclusionList2.add("GDGameGameCanvas.java");
        exclusionList2.add("GDGameSoftwareInfo.java");
        exclusionList2.add("GDGameSoftwareInfo.java");
        exclusionList2.add("GDGameStartCanvas.java");
        
        final Vector files2 = FileListFetcher.getInstance().getFiles(
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
        
        final Vector files3 = FileListFetcher.getInstance().getFiles(
              gdToolStrings.ROOT_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java", "java");
        
        this.process(files3, exclusionList3);

        final BasicArrayList exclusionList4 = new BasicArrayList();
        
        exclusionList3.add("GDGameThreedLevelBuilder.java");
        exclusionList3.add("GDGameThreedLevelBuilderFactory.java");
        
        final Vector files4 = FileListFetcher.getInstance().getFiles(
              gdToolStrings.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java", "java");

        this.process(files4, exclusionList4);

        final BasicArrayList exclusionList5 = new BasicArrayList();
        
        //exclusionList3.add("GDGameAllBinarySceneControllerFactory.java");
        
        final Vector files5 = FileListFetcher.getInstance().getFiles(
              gdToolStrings.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java", "java");
        
        this.process(files5, exclusionList5);

        final BasicArrayList exclusionList6 = new BasicArrayList();
        
        exclusionList6.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList6.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        
        final Vector files6 = FileListFetcher.getInstance().getFiles(
              gdToolStrings.ROOT_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", "java");
        
        this.process(files6, exclusionList6);

        final BasicArrayList exclusionList7 = new BasicArrayList();
        
        exclusionList7.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList7.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        
        final Vector files7 = FileListFetcher.getInstance().getFiles(
              gdToolStrings.ROOT_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", "java");
        
        this.process(files7, exclusionList7);

        final BasicArrayList exclusionList8 = new BasicArrayList();
        
        exclusionList8.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList8.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        
        final Vector files8 = FileListFetcher.getInstance().getFiles(
              gdToolStrings.ROOT_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", "java");
        
        this.process(files8, exclusionList8);

        final BasicArrayList exclusionList9 = new BasicArrayList();
        
        exclusionList9.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList9.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java");
        
        final Vector files9 = FileListFetcher.getInstance().getFiles(
              gdToolStrings.ROOT_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", "java");
        
        this.process(files9, exclusionList9);

        final BasicArrayList exclusionList10 = new BasicArrayList();
        
        exclusionList10.add("GDGameEarlyResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList10.add("GDGameGameResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList10.add("GDGameOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory.java");
        exclusionList10.add("GDGameThreedTitleAnimation.java");
        exclusionList10.add("GDGameThreedTitleAnimationFactory.java");
        
        final Vector files10 = FileListFetcher.getInstance().getFiles(
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