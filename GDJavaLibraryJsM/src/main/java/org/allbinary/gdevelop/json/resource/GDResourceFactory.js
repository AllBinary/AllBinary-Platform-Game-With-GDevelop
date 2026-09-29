/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../../java/lang/Object.js';
import { RuntimeException } from '../../../../../java/lang/RuntimeException.js';
//not GWT import const GDProjectStrings
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDBitmapFontResource } from './GDBitmapFontResource.js';
//not GWT import - same folder const GDBitmapFontResource
import { GDJsonResource } from './GDJsonResource.js';
//not GWT import - same folder const GDJsonResource
import { GDVideoResource } from './GDVideoResource.js';
//not GWT import - same folder const GDVideoResource
import { GDFontResource } from './GDFontResource.js';
//not GWT import - same folder const GDFontResource
import { GDAudioResource } from './GDAudioResource.js';
//not GWT import - same folder const GDAudioResource
import { GDImageResource } from './GDImageResource.js';
//not GWT import - same folder const GDResource
export class GDResourceFactory extends Object {
    constructor() {
        super(...arguments);
        this.logUtil = LogUtil.getInstance();
        this.KIND = "kind";
        this.IMAGE = "image";
        this.AUDIO = "audio";
        this.FONT = "font";
        this.VIDEO = "video";
        this.JSON = "json";
        this.BITMAP_FONT = "bitmapFont";
        this.TILE_MAP = "tilemap";
        this.TILE_SET = "tileset";
    }
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDResourceFactory.instance;
    }
    get(kind) {
        if (kind.compareTo(this.IMAGE) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.IMAGE;
        }
        else if (kind.compareTo(this.AUDIO) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.AUDIO;
        }
        else if (kind.compareTo(this.FONT) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.FONT;
        }
        else if (kind.compareTo(this.VIDEO) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.VIDEO;
        }
        else if (kind.compareTo(this.JSON) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.JSON;
        }
        else if (kind.compareTo(this.TILE_MAP) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.TILE_MAP;
        }
        else if (kind.compareTo(this.TILE_SET) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.TILE_SET;
        }
        else if (kind.compareTo(this.BITMAP_FONT) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return this.BITMAP_FONT;
        }
        else {
            var commonStrings = CommonStrings.getInstance();
            ;
            this.logUtil.putF(kind, this, commonStrings.CONSTRUCTOR);
            throw new RuntimeException(kind);
        }
    }
    create(jsonObject) {
        var kind = this.get(jsonObject.getString(this.KIND));
        ;
        if (kind == this.IMAGE) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDImageResource(kind, jsonObject);
        }
        else if (kind == this.AUDIO) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDAudioResource(kind, jsonObject);
        }
        else if (kind == this.FONT) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDFontResource(kind, jsonObject);
        }
        else if (kind == this.VIDEO) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDVideoResource(kind, jsonObject);
        }
        else if (kind == this.JSON) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDJsonResource(kind, jsonObject);
        }
        else if (kind == this.TILE_MAP) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDJsonResource(kind, jsonObject);
        }
        else if (kind == this.TILE_SET) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDJsonResource(kind, jsonObject);
        }
        else if (kind == this.BITMAP_FONT) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDBitmapFontResource(kind, jsonObject);
        }
        else {
            throw new RuntimeException(kind);
        }
    }
}
GDResourceFactory.instance = new GDResourceFactory();
