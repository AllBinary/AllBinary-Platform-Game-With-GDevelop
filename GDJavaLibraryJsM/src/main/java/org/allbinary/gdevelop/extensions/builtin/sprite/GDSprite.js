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
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDPoint } from './GDPoint.js';
//not GWT import - same folder const GDPoint
import { GDPolygon2d } from './GDPolygon2d.js';
//not GWT import - same folder const GDPolygon2d
export class GDSprite extends Object {
    constructor(jsonObject) {
        super();
        this.pointList = new BasicArrayListD();
        this.polygon2dList = new BasicArrayListD();
        var projectStrings = GDProjectStrings.getInstance();
        ;
        this.hasCustomCollisionMask = jsonObject.getBoolean(projectStrings.HAS_CUSTOM_COLLISION_MASK);
        this.imageAsString = jsonObject.getString(projectStrings.IMAGE);
        var jsonArray = jsonObject.getJSONArray(projectStrings.POINTS);
        ;
        var size = jsonArray.length();
        ;
        for (var index = 0; index < size; index++) {
            this.pointList.add(new GDPoint(jsonArray.getJSONObject(index)));
        }
        this.originPoint = new GDPoint(jsonObject.getJSONObject(projectStrings.ORIGIN_POINTS));
        this.centerPoint = new GDPoint(jsonObject.getJSONObject(projectStrings.CENTER_POINTS));
        var polygon2dJSONArray = jsonObject.getJSONArray(projectStrings.CUSTOM_COLLISION_MASK);
        ;
        var size2 = polygon2dJSONArray.length();
        ;
        for (var index = 0; index < size2; index++) {
            this.polygon2dList.add(new GDPolygon2d(polygon2dJSONArray.getJSONArray(index)));
        }
    }
}
