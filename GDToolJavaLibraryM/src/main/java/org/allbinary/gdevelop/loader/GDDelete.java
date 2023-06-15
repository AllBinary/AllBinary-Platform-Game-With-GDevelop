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

        final BasicArrayList exclusionList0 = new BasicArrayList();
        
        final Vector files0 = FileListFetcher.getInstance().getFiles(
              "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameGeneratedJavaLibraryM\\src\\main\\java", "xml");
        
        this.process(files0, exclusionList0);
        
        final BasicArrayList exclusionList = new BasicArrayList();
        
        exclusionList.add("TouchButtonAndroidResources.java");
        exclusionList.add("StartRunnable.java");
        exclusionList.add("GDGameInputProcessor.java");
        exclusionList.add("GDGameResourceInitialization.java");

        final Vector files = FileListFetcher.getInstance().getFiles(
              "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameGeneratedJavaLibraryM\\src\\main\\java", "java");

        this.process(files, exclusionList);

        final BasicArrayList exclusionList2 = new BasicArrayList();
        
        exclusionList2.add("GDGameGameCanvas.java");
        exclusionList2.add("GDGameSoftwareInfo.java");
        exclusionList2.add("GDGameSoftwareInfo.java");
        exclusionList2.add("GDGameStartCanvas.java");
        
        final Vector files2 = FileListFetcher.getInstance().getFiles(
              "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java", "java");
        
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
              "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameThreedBaseJavaLibraryM\\src\\main\\java", "java");
        
        this.process(files3, exclusionList3);

        final BasicArrayList exclusionList4 = new BasicArrayList();
        
        //exclusionList3.add("GDGameAllBinarySceneControllerFactory.java");
        
        final Vector files4 = FileListFetcher.getInstance().getFiles(
              "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameThreedPreBaseJavaLibrary\\src\\main\\java", "java");
        
        this.process(files4, exclusionList4);

        final BasicArrayList exclusionList5 = new BasicArrayList();
        
        //exclusionList3.add("GDGameAllBinarySceneControllerFactory.java");
        
        final Vector files5 = FileListFetcher.getInstance().getFiles(
              "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGamePreBaseJavaLibrary\\src\\main\\java", "java");
        
        this.process(files5, exclusionList5);
        
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args)  throws Exception {
        new GDDelete().process();
    }
    
}
