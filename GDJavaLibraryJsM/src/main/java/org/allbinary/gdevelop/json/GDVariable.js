/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
//not plain js import { ABHashMap } 
const ABHashMap = globalThis.org.allbinary.util.ABHashMap;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
import { GDTypeFactory } from './GDTypeFactory.js';
//not GWT import - same folder const GDTypeFactory
export class GDVariable extends Object {
    constructor(jsonObject) {
        super();
        this.childVariableMap = new ABHashMap();
        this.childVariableList = new BasicArrayListD();
        let gdProjectStrings = GDProjectStrings.getInstance();
        ;
        let typeFactory = GDTypeFactory.getInstance();
        ;
        this.type = typeFactory.get(jsonObject.getString(gdProjectStrings.TYPE));
        let string;
        ;
        let value;
        ;
        let boolValue;
        ;
        if (typeFactory.isPrimitive(this.type)) {
            if (this.type == typeFactory.STRING) {
                string = jsonObject.getString(gdProjectStrings.VALUE);
                value = 0;
                boolValue = false;
            }
            else if (this.type == typeFactory.NUMBER) {
                string = StringUtil.getInstance().EMPTY_STRING;
                value = jsonObject.getDouble(gdProjectStrings.VALUE);
                boolValue = false;
            }
            else if (this.type == typeFactory.BOOLEAN) {
                string = StringUtil.getInstance().EMPTY_STRING;
                value = 0;
                boolValue = jsonObject.getBoolean(gdProjectStrings.VALUE);
            }
            else {
                string = StringUtil.getInstance().EMPTY_STRING;
                value = 0;
                boolValue = false;
            }
        }
        else {
            string = StringUtil.getInstance().EMPTY_STRING;
            value = 0;
            boolValue = false;
            if (jsonObject.has(gdProjectStrings.CHILDREN)) {
                let variableJSONArray = jsonObject.getJSONArray(gdProjectStrings.CHILDREN);
                ;
                let size = variableJSONArray.length();
                ;
                let childJSONObject;
                ;
                for (let index = 0; index < size; index++) {
                    childJSONObject = variableJSONArray.getJSONObject(index);
                    if (this.type == typeFactory.STRUCTURE) {
                        this.childVariableMap.put(childJSONObject.getString(gdProjectStrings.NAME), new GDVariable(childJSONObject));
                    }
                    else if (this.type == typeFactory.ARRAY) {
                        this.childVariableList.add(new GDVariable(childJSONObject));
                    }
                }
            }
        }
        this.string = string;
        this.value = value;
        this.boolValue = boolValue;
    }
}
