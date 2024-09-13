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

import java.awt.image.BufferedImage;

import java.io.IOException;

import javax.imageio.ImageIO;

import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.AbFileNativeUtil;
import org.allbinary.logic.io.file.FileListFetcher;
import org.allbinary.logic.string.CommonSeps;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDImageSizeGenerator {

    public BasicArrayList process() throws IOException {
        
        final BasicArrayList list = new BasicArrayList();
        
        final StringMaker stringMaker = new StringMaker();
        final FileListFetcher fileListFetcher = FileListFetcher.getInstance();
        final BasicArrayList files = fileListFetcher.getFiles("G:\\mnt\\bc\\mydev\\GDGamesP\\platform\\j2se\\GDGameJ2SEWithSWTApplicationM\\src\\main\\resources\\", "png");
        AbFile abFile;
        BufferedImage bufferedImage;
        final int size = files.size();
        int arrayIndex = 0;
        for(int index = 0; index < size; index++) {
            abFile = (AbFile) files.get(index);
            if(abFile.isDirectory()) {
                
            } else {
                bufferedImage = ImageIO.read(AbFileNativeUtil.get(abFile));
                final String name = abFile.getName().substring(0, abFile.getName().length() - 4).toUpperCase();
                stringMaker.append(arrayIndex).append(name).append(CommonSeps.getInstance().SPACE).append(bufferedImage.getWidth()).append(", ").append(bufferedImage.getHeight()).append('\n');
                final GDResource gdResource = new GDResource(name, bufferedImage.getWidth(), bufferedImage.getHeight());
                list.add(gdResource);
                arrayIndex++;
            }
        }
        
        System.out.println(stringMaker.toString());
        
        return list;
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        final GDImageSizeGenerator gdImageSizeGenerator = new GDImageSizeGenerator();
        
        gdImageSizeGenerator.process();
    }
    
}
