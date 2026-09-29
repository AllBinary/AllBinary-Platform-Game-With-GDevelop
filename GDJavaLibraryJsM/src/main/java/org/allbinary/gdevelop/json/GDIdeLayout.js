/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDEditorSettings } from './GDEditorSettings.js';
//not GWT import - same folder const GDEditorSettings
import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
export class GDIdeLayout extends Object {
    constructor(jsonObject) {
        super();
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        this.editorSettings = new GDEditorSettings(jsonObject.getJSONObject(gdProjectStrings.EDITOR_SETTINGS));
        this.objectsGroups = jsonObject.getJSONArray(gdProjectStrings.OBJECT_GROUPS);
    }
}
