/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
import { GDVariable } from './GDVariable.js';
//not GWT import - same folder const GDVariable
import { GDEffect } from './GDEffect.js';
//not GWT import - same folder const GDEffect
import { GDBehavior } from './GDBehavior.js';
//not GWT import - same folder const GDBehavior
export class GDObject extends Object {
    constructor(type, jsonObject) {
        super();
        this.variableList = new BasicArrayListD();
        this.effectsList = new BasicArrayListD();
        this.behaviorContentList = new BasicArrayListD();
        this.jsonObject = jsonObject;
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        this.type = type;
        this.name = jsonObject.getString(gdProjectStrings.NAME);
        if (jsonObject.has(gdProjectStrings.TAGS)) {
            this.tags = jsonObject.getString(gdProjectStrings.TAGS);
        }
        else {
            this.tags = StringUtil.getInstance().EMPTY_STRING;
        }
        var variableJSONArray = jsonObject.getJSONArray(gdProjectStrings.VARIABLES);
        ;
        var size = variableJSONArray.length();
        ;
        for (var index = 0; index < size; index++) {
            this.variableList.add(new GDVariable(variableJSONArray.getJSONObject(index)));
        }
        if (jsonObject.has(gdProjectStrings.EFFECTS)) {
            var effectsJSONArray = jsonObject.getJSONArray(gdProjectStrings.EFFECTS);
            ;
            size = effectsJSONArray.length();
            for (var index = 0; index < size; index++) {
                this.effectsList.add(new GDEffect(effectsJSONArray.getJSONObject(index)));
            }
        }
        var behaviorsJSONArray = jsonObject.getJSONArray(gdProjectStrings.BEHAVIORS);
        ;
        size = behaviorsJSONArray.length();
        for (var index = 0; index < size; index++) {
            this.behaviorContentList.add(new GDBehavior(behaviorsJSONArray.getJSONObject(index)));
        }
    }
}
