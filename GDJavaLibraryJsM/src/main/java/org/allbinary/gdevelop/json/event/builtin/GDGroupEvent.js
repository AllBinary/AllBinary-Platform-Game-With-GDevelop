/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { GDProjectStrings } from '../../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings
import { GDEvent } from '../../../../../../org/allbinary/gdevelop/json/event/GDEvent.js';
//not GWT import const GDEvent
import { GDExpression } from '../../../../../../org/allbinary/gdevelop/json/event/GDExpression.js';
//not GWT import const GDExpression
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDEventFactory } from './GDEventFactory.js';
//not GWT import - same folder const GDEventFactory
export class GDGroupEvent extends GDEvent {
    constructor(type, jsonObject) {
        super(type, jsonObject);
        this.parametersExpressionList = new BasicArrayListD();
        this.eventList = new BasicArrayListD();
        //For kotlin this is before the body of the constructor.
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        var eventFactory = GDEventFactory.getInstance();
        ;
        this.name = jsonObject.getString(gdProjectStrings.NAME);
        this.source = jsonObject.getString(gdProjectStrings.SOURCE);
        this.creationTime = jsonObject.getInt(gdProjectStrings.CREATION_TIME);
        this.colorR = jsonObject.getInt(gdProjectStrings.COLOR_R);
        this.colorG = jsonObject.getInt(gdProjectStrings.COLOR_G);
        this.colorB = jsonObject.getInt(gdProjectStrings.COLOR_B);
        var expressionJSONArray = jsonObject.getJSONArray(gdProjectStrings.PARAMETERS);
        ;
        var size = expressionJSONArray.length();
        ;
        var nextJSONObject;
        ;
        for (var index = 0; index < size; index++) {
            this.parametersExpressionList.add(new GDExpression(expressionJSONArray.getString(index)));
        }
        var eventJSONArray = jsonObject.getJSONArray(gdProjectStrings.EVENTS);
        ;
        size = eventJSONArray.length();
        for (var index = 0; index < size; index++) {
            nextJSONObject = eventJSONArray.getJSONObject(index);
            this.eventList.add(eventFactory.create(nextJSONObject));
        }
    }
}
