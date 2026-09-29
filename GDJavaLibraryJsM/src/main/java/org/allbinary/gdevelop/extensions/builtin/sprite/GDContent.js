/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../../../java/lang/Object.js';
import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import - same folder const Number
export class GDContent extends Object {
    constructor(jsonObject) {
        super();
        this.levelIndex = 0;
        this.directionList = new BasicArrayListD();
        var projectStrings = GDProjectStrings.getInstance();
        ;
        this.tilemapJsonFile = jsonObject.getString(projectStrings.TILEMAP_JSON_FILE);
        this.tilesetJsonFile = jsonObject.getString(projectStrings.TILESET_JSON_FILE);
        this.tilemapAtlasImage = jsonObject.getString(projectStrings.TILEMAP_ATLAS_IMAGE);
        this.displayMode = jsonObject.getString(projectStrings.DISPLAY_MODE);
        this.layerIndex = jsonObject.getInt(projectStrings.LAYER_INDEX);
        if (jsonObject.has(projectStrings.LEVEL_INDEX)) {
            this.levelIndex = jsonObject.getInt(projectStrings.LEVEL_INDEX);
        }
        else {
            this.levelIndex = 0;
        }
        this.animationSpeedScale = jsonObject.getNumber(projectStrings.ANIMATION_SPEED_SCALE);
        this.animationFps = jsonObject.getNumber(projectStrings.ANIMATION_FPS);
    }
}
