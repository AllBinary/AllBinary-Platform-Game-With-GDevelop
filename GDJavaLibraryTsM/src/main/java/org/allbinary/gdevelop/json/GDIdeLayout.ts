
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
import { GDEvent } from '../../../../org/allbinary/gdevelop/json/event/GDEvent.js';
//not GWT import const GDEvent

import { GDEventFactory } from '../../../../org/allbinary/gdevelop/json/event/builtin/GDEventFactory.js';
//not GWT import const GDEventFactory

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

import { JSONArray } from '../../../../org/json/JSONArray.js';
//not GWT import const JSONArray

import { JSONObject } from '../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDEditorSettings } from './GDEditorSettings.js';
//not GWT import - same folder const GDEditorSettings
import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings

export class GDIdeLayout
            extends Object
         {
        

    public readonly editorSettings: GDEditorSettings;

    public readonly objectsGroups: JSONArray;

public constructor (jsonObject: JSONObject){

            super();
        
    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.editorSettings= new GDEditorSettings(jsonObject!.getJSONObject(gdProjectStrings!.EDITOR_SETTINGS));
    
this.objectsGroups= jsonObject!.getJSONArray(gdProjectStrings!.OBJECT_GROUPS);
    
}


}



