/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
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

import java.io.FileInputStream;
import org.allbinary.gdevelop.json.GDLayout;
import org.allbinary.logic.basic.io.BufferedWriterUtil;
import org.allbinary.logic.basic.io.StreamUtil;
import org.allbinary.logic.basic.io.file.AbFile;
import org.allbinary.logic.basic.string.regex.replace.Replace;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDToAllBinaryMIDletGenerator
{
    
    private final String GD_LAYOUT = "<GDLayout";
    private final String END = ">";

    private final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();

    private final StringBuilder stringBuilder = new StringBuilder();
    
    private BasicArrayList nameList = new BasicArrayList();
    private BasicArrayList classNameList = new BasicArrayList();
    
    public void loadLayout(final GDLayout layout, final int index) {
        final String name = this.camelCaseUtil.getAsCamelCase(layout.name, stringBuilder);
        stringBuilder.delete(0, stringBuilder.length());
        
        String className;
        if(index == 1) {
            className = stringBuilder.append("GDGame").append(name).append("Canvas").toString();
        } else {
            className = stringBuilder.append("GDGameStart").append(name).append("Canvas").toString();
        }
        
        this.nameList.add(name);
        this.classNameList.add(className);
    }

    public void process() throws Exception {
        final String MIDLET_ORIGINAL = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\GDGameMIDlet.orig";
        final String MIDLET = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\GDGameMIDlet.java";
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
                        
        final FileInputStream fileInputStream = new FileInputStream(MIDLET_ORIGINAL);
        final String androidRFileAsString = streamUtil.getAsString(fileInputStream);
        
        String newFileAsString = androidRFileAsString;

        final int size = this.classNameList.size();
        for(int index = 0; index < size; index++) { 
            Replace replace = new Replace(GD_LAYOUT + index + END, (String) this.classNameList.get(index));
            newFileAsString = replace.all(newFileAsString);
        }

        final AbFile abFile = new AbFile(MIDLET);
        if(abFile.exists()) {
            abFile.delete();
        }
        BufferedWriterUtil.write(abFile, newFileAsString);      
    }
    
}
