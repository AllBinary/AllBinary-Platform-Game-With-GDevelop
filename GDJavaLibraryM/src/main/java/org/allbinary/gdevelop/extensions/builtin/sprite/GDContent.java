/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.extensions.builtin.sprite;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.util.BasicArrayList;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDContent
{
    public final String tilemapJsonFile;
    public final String tilesetJsonFile;
    public final String tilemapAtlasImage;
    public final String displayMode;
    public final int layerIndex;
    public final int levelIndex;
    public final Number animationSpeedScale;
    public final Number animationFps;
    
    public final BasicArrayList directionList = new BasicArrayList();
    
    public GDContent(final JSONObject jsonObject) {
     
        final GDProjectStrings projectStrings = GDProjectStrings.getInstance();
        
        this.tilemapJsonFile = jsonObject.getString(projectStrings.TILEMAP_JSON_FILE);
        this.tilesetJsonFile = jsonObject.getString(projectStrings.TILESET_JSON_FILE);
        this.tilemapAtlasImage = jsonObject.getString(projectStrings.TILEMAP_ATLAS_IMAGE);
        this.displayMode = jsonObject.getString(projectStrings.DISPLAY_MODE);
        this.layerIndex = jsonObject.getInt(projectStrings.LAYER_INDEX);
        
        if(jsonObject.has(projectStrings.LEVEL_INDEX)) {
            this.levelIndex = jsonObject.getInt(projectStrings.LEVEL_INDEX);
        } else {
            this.levelIndex = 0;
        }

        this.animationSpeedScale = jsonObject.getNumber(projectStrings.ANIMATION_SPEED_SCALE);
        this.animationFps = jsonObject.getNumber(projectStrings.ANIMATION_FPS);
        
    }

}
