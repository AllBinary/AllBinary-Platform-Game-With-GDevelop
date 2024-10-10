/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.allbinary.gdevelop.loader;

/**
 *
 * @author User
 */
public class GDToolStrings {
    
    private static final GDToolStrings instance = new GDToolStrings();

    /**
     * @return the instance
     */
    public static GDToolStrings getInstance() {
        return instance;
    }
    
    public final String FILENAME = "fileName: ";
    
    public final String ROOT_PATH = "..\\";

    public final String GAME_XML_PATH = this.ROOT_PATH + "game.xml";
    
    public final String GAME_JSON_PATH = this.ROOT_PATH + "game.json";
    
    public final String RESOURCES_PATH = "..\\Resources\\2d\\images\\raw\\";
    public final String ASSETS_PATH = "..\\Resources\\assets\\";
    
    public final String ASSET_PREFIX = "assets\\";
    
    public final String JSON = "json";
    public final String JAVA = "java";
    public final String PNG = "png";
    public final String XML = "xml";
    
}
