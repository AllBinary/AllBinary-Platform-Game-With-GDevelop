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
//Level
public class GDMakeArrayFromResources {
        
    public static void main(String[] args) throws Exception {

        //final String RESOURCE_START = "\\sm_env_";
        //final String RESOURCE_START = "\\sk_animal_dog_";
        final String RESOURCE_START = "\\character_";
    
        final String RESOURCE_0 = "            {\n" +
"              \"type\": \"string\",\n" +
"              \"value\": \"";
        final String RESOURCE_2 = "\"\n" +
"            },\n";
        
        final GLBVisitor glbVisitor = new GLBVisitor(RESOURCE_START) {

            public void append(final String fileNameAsString, final String name, final StringMaker stringMaker) {
                stringMaker.append(RESOURCE_0);
                stringMaker.append(fileNameAsString);
                stringMaker.append(RESOURCE_2);
            }

        };

        new GLBProcessing().process(glbVisitor);

    }
    
    
}
