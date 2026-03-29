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

import org.allbinary.logic.string.StringMaker;

/**
 *
 * @author User
 */
public class GDMakeResources {
        
    public static void main(String[] args) throws Exception {
    
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

        final GLBVisitor glbVisitor = new GLBVisitor() {

            public void append(final String fileNameAsString, final String name, final StringMaker stringMaker) {
                stringMaker.append(RESOURCE_0);
                stringMaker.append(fileNameAsString);
                stringMaker.append(RESOURCE_2);
                stringMaker.append(fileNameAsString);
                stringMaker.append(RESOURCE_4);
            }

        };
        
        new GLBProcessing().process(glbVisitor);
    }
    
    
}
