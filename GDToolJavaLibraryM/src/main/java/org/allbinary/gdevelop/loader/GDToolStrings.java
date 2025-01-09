/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.allbinary.gdevelop.loader;

import org.allbinary.logic.string.CommonSeps;

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

    public final String ROTATION_ANIMATION_FILE_PATH = this.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\animation\\GDRotationAnimation.txt";
    
    public final String GAME_XML_PATH = this.ROOT_PATH + "game.xml";
    
    public final String GAME_JSON_PATH = this.ROOT_PATH + "game.json";
    
    public final String RESOURCES_PATH = "..\\Resources\\2d\\images\\raw\\";
    public final String ASSETS_PATH = "..\\Resources\\assets\\";
    
    public final String ASSET_PREFIX = "assets\\";
    
    public final String JSON = "json";
    public final String JAVA = "java";
    public final String PNG = "png";
    public final String XML = "xml";
    public final String _JSON = ".json";
    public final String _T = ".t";
    
    public final String _BLANK_ = "BLANK";
    public final String _TOUCH_ = "TOUCH";

    public final String UNDERSCORE_0 = CommonSeps.getInstance().UNDERSCORE + "0";
    
    public final String RESOURCE_0 = "        resourceUtil.addResource(";
    
    public final String GD_RESOURCE = "gdResources.";
    public final String _RESOURCE = ", ";
    
    public final String RESOURCE_1 = "Integer.valueOf(androidResources.raw.";
    public final String RESOURCE_2 = "));";
    
}
