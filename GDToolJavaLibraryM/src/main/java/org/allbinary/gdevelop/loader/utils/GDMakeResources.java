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
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDMakeResources {
        
    public static void main(String[] args) throws Exception {
        final FileListFetcher fileListFetcher = FileListFetcher.getInstance();
        final CommonSeps commonSeps = CommonSeps.getInstance();
        final StringMaker stringMaker = new StringMaker();

        final String SM_ENV = "sm_env_";
    
        final String RESOURCE_0 = ",\n" +
"      {\n" +
"        \"file\": \"assets/";
        final String RESOURCE_2 = "\",\n" +
"        \"kind\": \"model3D\",\n" +
"        \"metadata\": \"\",\n" +
"        \"name\": \"";
        final String RESOURCE_4 = "\",\n" +
"        \"userAdded\": false\n" +
"      }";
        
        final BasicArrayList fileList = fileListFetcher.getFiles(
            "G:\\mnt\\bc\\mydev\\abngdgames\\fps\\assets\\",
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
                
                if(path.indexOf(SM_ENV) >= 0) {
                    final int lastIndex = path.lastIndexOf('\\') + 1;
                    final String fileNameAsString = path.substring(lastIndex);

                    stringMaker.append(RESOURCE_0);
                    stringMaker.append(fileNameAsString);
                    stringMaker.append(RESOURCE_2);
                    stringMaker.append(fileNameAsString);
                    stringMaker.append(RESOURCE_4);
                }
            }
        }
        
        System.out.println(stringMaker.toString());
    }
    
    
}
