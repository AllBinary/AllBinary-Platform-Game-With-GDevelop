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

import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringUtil;

/**
 *
 * @author User
 */
public class GDPaths {

    public static final String DEFAULT_PATH = "..\\";
    
    private static Object instance = NullUtil.getInstance().NULL_OBJECT;

    /**
     * @return the instance
     */
    public static GDPaths getInstance() {
        return (GDPaths) GDPaths.instance;
    }

    public static void init() {
        GDPaths.instance = new GDPaths(GDPaths.DEFAULT_PATH, GDPaths.DEFAULT_PATH, GDPaths.DEFAULT_PATH, "Resources\\", "Resources\\", "2d\\res\\raw\\", "3d\\res\\raw\\");
    }
    
    public static void init(final String xslPath, final String genPath, final String projectPath) {
        GDPaths.instance = new GDPaths(xslPath, genPath, projectPath, "sounds\\", StringUtil.getInstance().EMPTY_STRING, "2d\\Resources\\2d\\res\\raw\\", "3d\\Resources\\3d\\res\\raw\\");
    }

    public String ROOT_PATH;
    public String GEN_PATH;
    public String PROJECT_PATH;

    public final String GAME_XML_PATH;

    public final String GAME_JSON_PATH;

    public final String TWOD_RESOURCES_PATH;
    public final String THREED_RESOURCES_PATH;
    public final String ASSETS_PATH;

    public final String ROTATION_ANIMATION_FILE_PATH;

    public final String SOUND_RESOURCES_ROOT_PATH;
    
    public GDPaths(final String xslPath, final String genPath, final String projectPath, final String soundResourcesDirectory, final String assetsDirectory, final String twodPath, final String threedPath) {

        this.ROOT_PATH = xslPath;
        this.GEN_PATH = genPath;
        this.PROJECT_PATH = projectPath;

        this.GAME_XML_PATH = this.PROJECT_PATH + "game.xml";

        this.GAME_JSON_PATH = this.PROJECT_PATH + "game.json";

        this.SOUND_RESOURCES_ROOT_PATH = this.PROJECT_PATH + soundResourcesDirectory;
        this.TWOD_RESOURCES_PATH = this.PROJECT_PATH + assetsDirectory + twodPath;
        this.THREED_RESOURCES_PATH = this.PROJECT_PATH + assetsDirectory + threedPath;
        this.ASSETS_PATH = this.PROJECT_PATH + assetsDirectory + "assets\\";

        this.ROTATION_ANIMATION_FILE_PATH = this.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\animation\\GDRotationAnimation.txt";
    }

}
