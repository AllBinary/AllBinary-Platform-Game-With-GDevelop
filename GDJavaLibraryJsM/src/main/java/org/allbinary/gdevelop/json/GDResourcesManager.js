/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
import { GDResourceFactory } from '../../../../org/allbinary/gdevelop/json/resource/GDResourceFactory.js';
//not GWT import const GDResourceFactory
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
export class GDResourcesManager extends Object {
    constructor(jsonObject) {
        super();
        this.logUtil = LogUtil.getInstance();
        this.RESOURCES = "GDResources: ";
        this.resourceList = new BasicArrayListD();
        var commonStrings = CommonStrings.getInstance();
        ;
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        var resourceFactory = GDResourceFactory.getInstance();
        ;
        var conditionJSONArray = jsonObject.getJSONArray(gdProjectStrings.RESOURCES);
        ;
        var size = conditionJSONArray.length();
        ;
        var nextJSONObject;
        ;
        for (var index = 0; index < size; index++) {
            nextJSONObject = conditionJSONArray.getJSONObject(index);
            this.resourceList.add(resourceFactory.create(nextJSONObject));
        }
        this.logUtil.putF(this.RESOURCES + this.resourceList.size(), this, commonStrings.CONSTRUCTOR);
    }
}
