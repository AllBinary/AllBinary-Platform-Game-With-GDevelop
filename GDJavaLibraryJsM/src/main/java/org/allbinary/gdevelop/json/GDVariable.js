/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
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
        this.value = 0.0;
        this.boolValue = false;
        this.childVariableMap = new ABHashMap();
        this.childVariableList = new BasicArrayListD();
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        var typeFactory = GDTypeFactory.getInstance();
        ;
        this.type = typeFactory.get(jsonObject.getString(gdProjectStrings.TYPE));
        if (typeFactory.isPrimitive(this.type)) {
            if (this.type == typeFactory.STRING) {
                this.string = jsonObject.getString(gdProjectStrings.VALUE);
                this.value = 0;
                this.boolValue = false;
            }
            else if (this.type == typeFactory.NUMBER) {
                this.string =
                    null;
                this.value = jsonObject.getDouble(gdProjectStrings.VALUE);
                this.boolValue = false;
            }
            else if (this.type == typeFactory.BOOLEAN) {
                this.string =
                    null;
                this.value = 0;
                this.boolValue = jsonObject.getBoolean(gdProjectStrings.VALUE);
            }
            else {
                this.string =
                    null;
                this.value = 0;
                this.boolValue = false;
            }
        }
        else {
            this.string =
                null;
            this.value = 0;
            this.boolValue = false;
            if (jsonObject.has(gdProjectStrings.CHILDREN)) {
                var variableJSONArray = jsonObject.getJSONArray(gdProjectStrings.CHILDREN);
                ;
                var size = variableJSONArray.length();
                ;
                var childJSONObject;
                ;
                for (var index = 0; index < size; index++) {
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
    }
}
