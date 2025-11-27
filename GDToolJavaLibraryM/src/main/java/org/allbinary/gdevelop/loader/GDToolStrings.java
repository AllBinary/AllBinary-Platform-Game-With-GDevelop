/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.allbinary.gdevelop.loader;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.AbFile;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

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

    //protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    
    public final String FILENAME = "fileName: ";
    
    public final String ROOT_PATH = "..\\";

    public final String ROTATION_ANIMATION_FILE_PATH = this.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\animation\\GDRotationAnimation.txt";
    
    public final String GAME_XML_PATH = this.ROOT_PATH + "game.xml";
    
    public final String GAME_JSON_PATH = this.ROOT_PATH + "game.json";
    
    public final String TWOD_RESOURCES_PATH = "..\\Resources\\2d\\images\\raw\\";
    public final String THREED_RESOURCES_PATH = "..\\Resources\\3d\\images\\raw\\";
    public final String ASSETS_PATH = "..\\Resources\\assets\\";
    
    public final String ASSET_PREFIX = "assets\\";
    
    public final String JSON = "json";
    public final String JAVA = "java";
    public final String PNG = "png";
    public final String DAT = "dat";
    public final String OGG = "ogg";
    public final String TXT = "txt";
    public final String HTML = "html";
    public final String GLSL = "glsl";
    
    public final String XML = "xml";
    public final String _JSON = ".json";
    public final String _T = ".t";
    
    public final String _BLANK_ = "BLANK";
    public final String _TOUCH_ = "TOUCH";

    public final String BUTTON = "button";
    
    public final String _OBJ = "_obj";
    public final String _MD2 = "_md2";
    public final String BLANK = "blank";
    
    public final String UNDERSCORE_0 = CommonSeps.getInstance().UNDERSCORE + "0";
    
    public final String RESOURCE_0 = "        resourceUtil.addResource(";
    
    public final String GD_RESOURCE = "gdResources.";
    public final String _RESOURCE = ", ";
    
    public final String RESOURCE_1 = "Integer.valueOf(androidResources.raw.";
    public final String RESOURCE_2 = "));";

    public final String SOUND_RESOURCE = ".getInstance().getResource(), ";
    
    public final String GD_LAYOUT = "<GDLayout>";
    public final String GD_CURRENT_LAYOUT_INDEX = "<GD_CURRENT_INDEX>";
    public final String GD_NODE_IDS = "<GD_NODE_IDS>";

    public final String NOT_USED_FOR_THREED_GAMES = "Not Used For Threed Games ";
    
    private final StringUtil stringUtil = StringUtil.getInstance();
    
    public String getExtension(final BasicArrayList threedFileList, final String resource) {
        final int size = threedFileList.size();
        AbFile file;
        int startIndex;
        String path;
        for(int index = 0; index < size; index++) {
            file = (AbFile) threedFileList.get(index);
            path = file.getPath();
            startIndex = path.indexOf(resource);
            if(startIndex >= 0) {
                //logUtil.put(path, this, commonStrings.PROCESS);
                if(path.indexOf(this._OBJ) >= 0) {
                    return this._OBJ;
                } else if(path.indexOf(this._MD2) >= 0) {
                    return this._MD2;
                } else if(path.endsWith(this.PNG)) {
                    return this.stringUtil.EMPTY_STRING;
                } else if(resource.indexOf(this._T) >= 0) {
                    return this.stringUtil.EMPTY_STRING;
                } else if(path.endsWith(this.DAT)) {
                    return this.stringUtil.EMPTY_STRING;
                } else if(path.endsWith(this.OGG)) {
                    return this.stringUtil.EMPTY_STRING;
                } else if(path.endsWith(this.TXT)) {
                    return this.stringUtil.EMPTY_STRING;
                } else if(path.endsWith(this.HTML)) {
                    return this.stringUtil.EMPTY_STRING;
                } else if(path.endsWith(this.GLSL)) {
                    return this.stringUtil.EMPTY_STRING;
                }
            }
        }

        return this.stringUtil.NULL_STRING;
    }
    
}
