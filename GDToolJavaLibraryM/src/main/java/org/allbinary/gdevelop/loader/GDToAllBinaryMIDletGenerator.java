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
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.logic.basic.io.BufferedWriterUtil;
import org.allbinary.logic.basic.io.StreamUtil;
import org.allbinary.logic.basic.io.file.AbFile;
import org.allbinary.logic.basic.string.regex.replace.Replace;

/**
 *
 * @author User
 */
public class GDToAllBinaryMIDletGenerator
{
    private final CamelCaseUtil camelCaseUtil = CamelCaseUtil.getInstance();
    
    private final String GD_LAYOUT = "<GDLayout>";
    private final String R = "<r>";
    private final String G = "<g>";
    private final String B = "<b>";

    private final StringBuilder stringBuilder = new StringBuilder();
    
    private boolean firstTime = true;
    
    private String name;
    private String className;
    private BasicColor layoutBasicColor;
    
    public void loadLayout(GDLayout layout) {
        if(this.firstTime) {
            this.firstTime = false;
            name = this.camelCaseUtil.getAsCamelCase(layout.name, stringBuilder);
            stringBuilder.delete(0, stringBuilder.length());
            className = stringBuilder.append("GDGameStart").append(name).append("Canvas").toString();
            layoutBasicColor = layout.basicColor;
        }
    }

    public void processMIDlet() throws Exception {
        final String MIDLET_ORIGINAL = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\GDGameMIDlet.orig";
        final String MIDLET = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\GDGameMIDlet.java";
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
                        
        final FileInputStream fileInputStream = new FileInputStream(MIDLET_ORIGINAL);
        final String androidRFileAsString = streamUtil.getAsString(fileInputStream);
        final Replace replace = new Replace(GD_LAYOUT, this.className);
        final String newFileAsString = replace.all(androidRFileAsString);

        final AbFile abFile = new AbFile(MIDLET);
        if(abFile.exists()) {
            abFile.delete();
        }
        BufferedWriterUtil.write(abFile, newFileAsString);      
    }
    
    public void process() throws Exception {

        this.processMIDlet();

        final String START_CANVAS_ORIGINAL = "G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\canvas\\GDGameStartGDLayoutCanvas.orig";
        stringBuilder.delete(0, stringBuilder.length());
        final String START_CANVAS = stringBuilder.append("G:\\mnt\\bc\\mydev\\GDGamesP\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\canvas\\").append(this.className).append(".java").toString();
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
                        
        final FileInputStream fileInputStream = new FileInputStream(START_CANVAS_ORIGINAL);
        final String androidRFileAsString = streamUtil.getAsString(fileInputStream);
        final Replace replace = new Replace(GD_LAYOUT, this.className);
        final Replace rReplace = new Replace(R, Integer.toString(layoutBasicColor.red));
        final Replace gReplace = new Replace(G, Integer.toString(layoutBasicColor.green));
        final Replace bReplace = new Replace(B, Integer.toString(layoutBasicColor.blue));
        
        String newFileAsString = replace.all(androidRFileAsString);
        newFileAsString = rReplace.all(newFileAsString);
        newFileAsString = gReplace.all(newFileAsString);
        newFileAsString = bReplace.all(newFileAsString);

        final AbFile abFile = new AbFile(START_CANVAS);
        if(abFile.exists()) {
            abFile.delete();
        }
        BufferedWriterUtil.write(abFile, newFileAsString);      
    }
    
}
