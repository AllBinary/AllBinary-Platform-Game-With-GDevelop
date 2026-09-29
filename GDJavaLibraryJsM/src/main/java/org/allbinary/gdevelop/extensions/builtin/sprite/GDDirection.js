/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../../../java/lang/Object.js';
import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDSprite } from './GDSprite.js';
//not GWT import - same folder const GDSprite
export class GDDirection extends Object {
    constructor(jsonObject) {
        super();
        this.logUtil = LogUtil.getInstance();
        this.spriteList = new BasicArrayListD();
        var projectStrings = GDProjectStrings.getInstance();
        ;
        this.looping = jsonObject.getBoolean(projectStrings.LOOPING);
        this.timeBetweenFrames = jsonObject.getInt(projectStrings.TIME_BETWEEN_FRAMES);
        var jsonArray = jsonObject.getJSONArray(projectStrings.SPRITES);
        ;
        var size = jsonArray.length();
        ;
        for (var index = 0; index < size; index++) {
            this.spriteList.add(new GDSprite(jsonArray.getJSONObject(index)));
        }
    }
}
