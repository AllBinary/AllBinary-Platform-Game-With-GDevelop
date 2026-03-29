/*
 * AllBinary Open License Version 1
 * Copyright (c) 2025 AllBinary
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
package org.allbinary.gdevelop.loader.utils;

import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.io.file.FileListFetcher;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GLBProcessing {
    
    private final FileListFetcher fileListFetcher = FileListFetcher.getInstance();
    //private final StringUtil stringUtil = StringUtil.getInstance();
    private final StringMaker stringMaker = new StringMaker();
    
    public void process(GLBVisitor glbVisitor) {
        //final String _GLB = ".glb";

        final BasicArrayList fileList = fileListFetcher.getFiles(
            GDGame0.getInstance().PATH,
            new String[] {"glb"});

        final int size = fileList.size();
        System.out.println("size: " + size);
        AbFile file;
        for (int index = 0; index < size; index++)
        {
            file = (AbFile) fileList.get(index);

            if (file.isDirectory()) {
                //System.out.println("Now in Directory: " + file.getPath());

                String path = file.getAbsolutePath();
            } else
            {
                String path = file.getAbsolutePath();
                
                if(path.indexOf(glbVisitor.STARTS_WITH) >= 0) {
                    //final int lastIndex = path.lastIndexOf('\\') + 1;
                    //final String fileNameAsString = path.substring(lastIndex).replace(_GLB, stringUtil.EMPTY_STRING);
                    final int lastIndex = path.lastIndexOf('\\') + 1;
                    final int endIndex = path.lastIndexOf('.');
                    final String fileNameAsString = path.substring(lastIndex);
                    final String name = path.substring(lastIndex, endIndex);
                    

                    glbVisitor.append(fileNameAsString, name, stringMaker);
                }
            }
        }
        
        System.out.println(stringMaker.toString());        
    }
}
