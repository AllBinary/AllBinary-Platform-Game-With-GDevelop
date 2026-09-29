/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
import { Integer } from '../../../../java/lang/Integer.js';
//not GWT import const BasicColor
import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory
import { BasicColorUtil } from '../../../../org/allbinary/graphics/color/BasicColorUtil.js';
//not GWT import const BasicColorUtil
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
export class GDLayer extends Object {
    constructor(jsonObject) {
        super();
        this.isVisible = false;
        this.isLightingLayer = false;
        this.followBaseLayerCamera = false;
        this.cameraList = new BasicArrayListD();
        this.effectsList = new BasicArrayListD();
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        if (jsonObject.has(gdProjectStrings.NAME)) {
            this.name = jsonObject.getString(gdProjectStrings.NAME);
        }
        else {
            this.name = Integer.toHexString(this.hashCode());
        }
        if (jsonObject.has(gdProjectStrings.VISIBILITY)) {
            this.isVisible = jsonObject.getBoolean(gdProjectStrings.VISIBILITY);
        }
        else {
            this.isVisible = false;
        }
        if (jsonObject.has(gdProjectStrings.VISIBILITY)) {
            this.isLightingLayer = jsonObject.getBoolean(gdProjectStrings.IS_LIGHTING_LAYER);
        }
        else {
            this.isLightingLayer = false;
        }
        if (jsonObject.has(gdProjectStrings.FOLLOW_BASE_LAYER_CAMERA)) {
            this.followBaseLayerCamera = jsonObject.getBoolean(gdProjectStrings.FOLLOW_BASE_LAYER_CAMERA);
        }
        else {
            this.followBaseLayerCamera = false;
        }
        if (jsonObject.has(gdProjectStrings.AMBIENT_LIGHT_COLOR_R)) {
            this.ambientLightBasicColor = BasicColorFactory.getInstance().createInstanceARGB(BasicColorUtil.getInstance().ALPHA, jsonObject.getInt(gdProjectStrings.AMBIENT_LIGHT_COLOR_R), jsonObject.getInt(gdProjectStrings.AMBIENT_LIGHT_COLOR_G), jsonObject.getInt(gdProjectStrings.AMBIENT_LIGHT_COLOR_B), this.name);
        }
        else {
            this.ambientLightBasicColor =
                null;
        }
        if (jsonObject.has(gdProjectStrings.CAMERAS)) {
            var camerasJSONArray = jsonObject.getJSONArray(gdProjectStrings.CAMERAS);
            ;
            var size = camerasJSONArray.length();
            ;
            var nextJSONObject;
            ;
            for (var index = 0; index < size; index++) {
                nextJSONObject = camerasJSONArray.getJSONObject(index);
                this.cameraList.add(new GDLayer(nextJSONObject));
            }
        }
    }
}
