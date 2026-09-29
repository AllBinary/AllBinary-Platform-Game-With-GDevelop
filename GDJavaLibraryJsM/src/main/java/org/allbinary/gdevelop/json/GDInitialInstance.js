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
import { GDVariable } from './GDVariable.js';
//not GWT import - same folder const GDVariable
export class GDInitialInstance extends Object {
    constructor(jsonObject) {
        super();
        this.numberPropertiesMap = new ABHashMap();
        this.stringPropertiesMap = new ABHashMap();
        this.initialVariableList = new BasicArrayListD();
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        this.name = jsonObject.getString(gdProjectStrings.NAME);
        this.x = jsonObject.getDouble(gdProjectStrings.X);
        this.y = jsonObject.getDouble(gdProjectStrings.Y);
        this.angle = jsonObject.getDouble(gdProjectStrings.ANGLE);
        this.zOrder = jsonObject.getInt(gdProjectStrings.Z_ORDER);
        this.personalizedSize = jsonObject.getBoolean(gdProjectStrings.CUSTOM_SIZE);
        this.layer = jsonObject.getString(gdProjectStrings.LAYER);
        this.width = jsonObject.getDouble(gdProjectStrings.WIDTH);
        this.height = jsonObject.getDouble(gdProjectStrings.HEIGHT);
        this.persistentUuid = jsonObject.getString(gdProjectStrings.PERSISTED_UUID);
        var numberPropertiesJSONArray = jsonObject.getJSONArray(gdProjectStrings.NUMBER_PROPERTIES);
        ;
        var size = numberPropertiesJSONArray.length();
        ;
        var nextJSONObject;
        ;
        var name;
        ;
        var valueAsDouble;
        ;
        for (var index = 0; index < size; index++) {
            nextJSONObject = numberPropertiesJSONArray.getJSONObject(index);
            name = nextJSONObject.getString(gdProjectStrings.NAME);
            valueAsDouble = nextJSONObject.getDouble(gdProjectStrings.VALUE);
            this.numberPropertiesMap.put(name, valueAsDouble);
        }
        var stringPropertiesJSONArray = jsonObject.getJSONArray(gdProjectStrings.STRING_PROPERTIES);
        ;
        size = stringPropertiesJSONArray.length();
        var value;
        ;
        for (var index = 0; index < size; index++) {
            nextJSONObject = stringPropertiesJSONArray.getJSONObject(index);
            name = nextJSONObject.getString(gdProjectStrings.NAME);
            value = nextJSONObject.getString(gdProjectStrings.VALUE);
            this.stringPropertiesMap.put(name, value);
        }
        var variableJSONArray = jsonObject.getJSONArray(gdProjectStrings.INITIAL_VARIABLE);
        ;
        size = variableJSONArray.length();
        for (var index = 0; index < size; index++) {
            this.initialVariableList.add(new GDVariable(variableJSONArray.getJSONObject(index)));
        }
    }
}
