/*
 * AllBinary Open License Version 1
 * Copyright (c) 2026 AllBinary
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

/**
 *
 * @author User
 */
public class GDPaths {
    
    private static final GDPaths instance = new GDPaths();

    /**
     * @return the instance
     */
    public static GDPaths getInstance() {
        return instance;
    }
    
    public String ROOT_PATH = "..\\";
    
    public final String GAME_XML_PATH = this.ROOT_PATH + "game.xml";
    
    public final String GAME_JSON_PATH = this.ROOT_PATH + "game.json";
    
    public final String TWOD_RESOURCES_PATH = this.ROOT_PATH + "Resources\\2d\\res\\raw\\";
    public final String THREED_RESOURCES_PATH = this.ROOT_PATH + "Resources\\3d\\res\\raw\\";
    public final String ASSETS_PATH = this.ROOT_PATH + "Resources\\assets\\";

    public final String ROTATION_ANIMATION_FILE_PATH = this.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\animation\\GDRotationAnimation.txt";
    
}
