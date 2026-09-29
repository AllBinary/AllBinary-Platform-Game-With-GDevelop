/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
export class GDCamera extends Object {
    constructor(jsonObject) {
        super();
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        this.defaultSize = jsonObject.getBoolean(gdProjectStrings.DEFAULT_SIZE);
        this.defaultViewport = jsonObject.getBoolean(gdProjectStrings.DEFAULT_VIEWPORT);
        this.width = jsonObject.getDouble(gdProjectStrings.WIDTH);
        this.height = jsonObject.getDouble(gdProjectStrings.HEIGHT);
        this.x1 = jsonObject.getDouble(gdProjectStrings.VIEWPORT_LEFT);
        this.y1 = jsonObject.getDouble(gdProjectStrings.VIEWPORT_TOP);
        this.x2 = jsonObject.getDouble(gdProjectStrings.VIEWPORT_RIGHT);
        this.y2 = jsonObject.getDouble(gdProjectStrings.VIEWPORT_BOTTOM);
    }
}
