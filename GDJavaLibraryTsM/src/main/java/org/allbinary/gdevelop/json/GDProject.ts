
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
import { PointFactory } from '../../../../org/allbinary/graphics/PointFactory.js';
//not GWT import const PointFactory

import { Rectangle } from '../../../../org/allbinary/graphics/Rectangle.js';
//not GWT import const Rectangle

import { RectangleFactory } from '../../../../org/allbinary/graphics/RectangleFactory.js';
//not GWT import const RectangleFactory

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
type StringUtil<T = any, U = any> = typeof StringUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

import { JSONArray } from '../../../../org/json/JSONArray.js';
//not GWT import const JSONArray

import { JSONException } from '../../../../org/json/JSONException.js';
//not GWT import const JSONException

import { JSONObject } from '../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDIde } from './GDIde.js';
//not GWT import - same folder const GDIde
import { GDResourcesManager } from './GDResourcesManager.js';
//not GWT import - same folder const GDResourcesManager
import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
import { GDObjectFactory } from './GDObjectFactory.js';
//not GWT import - same folder const GDObjectFactory
import { GDVariable } from './GDVariable.js';
//not GWT import - same folder const GDVariable
import { GDLayout } from './GDLayout.js';
//not GWT import - same folder const GDLayout
import { GDExternalLayout } from './GDExternalLayout.js';
//not GWT import - same folder const GDExternalLayout

export class GDProject
            extends Object
         {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly LOAD: string = "load";

    private readonly OBJECTS: string = "GDObjects: ";

    private readonly VARIABLES: string = "GDVariables: ";

    private readonly LAYOUTS: string = "GDLayouts: ";

    private readonly EXTERNAL_LAYOUT: string = "GDExternalLayouts: ";

    public readonly gdIde: GDIde = new GDIde();

    public packageName: string = StringUtil.getInstance()!.EMPTY_STRING;

    public name: string = StringUtil.getInstance()!.EMPTY_STRING;

    public version: string = StringUtil.getInstance()!.EMPTY_STRING;

    public gameResolutionSize: Rectangle = RectangleFactory.SINGLETON;

    public maxFPS: number= 0;

    public minFPS: number= 0;

    public verticalSyncActivatedByDefault: boolean= false;

    public scaleMode: string = StringUtil.getInstance()!.EMPTY_STRING;

    public adaptGameResolutionAtRuntime: boolean= false;

    public sizeOnStartupMode: string = StringUtil.getInstance()!.EMPTY_STRING;

    public projectUuid: string = StringUtil.getInstance()!.EMPTY_STRING;

    public resourcesManager: GDResourcesManager = GDResourcesManager.NULL_GDRESOURCEMANAGER;

    public readonly objectList: BasicArrayList = new BasicArrayListD();

    public readonly variableList: BasicArrayList = new BasicArrayListD();

    public readonly layoutList: BasicArrayList = new BasicArrayListD();

    public readonly externalLayoutList: BasicArrayList = new BasicArrayListD();

                //@Throws(JSONException.constructor)
            
    public load(gameAsConfiguration: JSONObject){

    let gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!;;
    
this.gdIde!.load(gameAsConfiguration);
    

    let properties: JSONObject = gameAsConfiguration!.getJSONObject(gdProjectStrings!.PROPERTIES)!;;
    
this.packageName= properties.getString(gdProjectStrings!.PACKAGE_NAME);
    
this.name= properties.getString(gdProjectStrings!.NAME);
    
this.version= properties.getString(gdProjectStrings!.VERSION);
    

    let width: number = properties.getInt(gdProjectStrings!.WINDOW_WIDTH)!;;
    

    let height: number = properties.getInt(gdProjectStrings!.WINDOW_HEIGHT)!;;
    
this.gameResolutionSize= new Rectangle(PointFactory.getInstance()!.ZERO_ZERO, width, height);
    
this.maxFPS= properties.getInt(gdProjectStrings!.MAX_FPS);
    
this.minFPS= properties.getInt(gdProjectStrings!.MIN_FPS);
    
this.verticalSyncActivatedByDefault= properties.getBoolean(gdProjectStrings!.VERTICAL_SYNC);
    
this.scaleMode= properties.getString(gdProjectStrings!.SCALE_MODE);
    
this.adaptGameResolutionAtRuntime= properties.getBoolean(gdProjectStrings!.ADAPT_GAME_RESOLUTION_AT_RUNTIME);
    
this.sizeOnStartupMode= properties.getString(gdProjectStrings!.SIZE_ON_STARTUP_MODE);
    
this.projectUuid= properties.getString(gdProjectStrings!.PROJECT_UUID);
    

    let resourceJSONObject: JSONObject = gameAsConfiguration!.getJSONObject(gdProjectStrings!.RESOURCES)!;;
    
this.resourcesManager= new GDResourcesManager(resourceJSONObject);
    

    let objectFactory: GDObjectFactory = GDObjectFactory.getInstance()!;;
    

    let objectJSONArray: JSONArray = gameAsConfiguration!.getJSONArray(gdProjectStrings!.OBJECTS)!;;
    

    let size: number = objectJSONArray!.length()!;;
    

    let objectJSONObject: JSONObject;;
    




                        for (
    let index: number = 0;index < size; index++)
        {
objectJSONObject= objectJSONArray!.getJSONObject(index);
    
this.objectList!.add(objectFactory!.create(objectJSONObject));
    
}

this.logUtil!.putF(this.OBJECTS +this.objectList!.size(), this, this.LOAD);
    

    let variableJSONArray: JSONArray = gameAsConfiguration!.getJSONArray(gdProjectStrings!.VARIABLES)!;;
    
size= variableJSONArray!.length();
    




                        for (
    let index: number = 0;index < size; index++)
        {
this.variableList!.add(new GDVariable(variableJSONArray!.getJSONObject(index)));
    
}

this.logUtil!.putF(this.VARIABLES +this.variableList!.size(), this, this.LOAD);
    

    let layoutsJSONArray: JSONArray = gameAsConfiguration!.getJSONArray(gdProjectStrings!.LAYOUTS)!;;
    
size= layoutsJSONArray!.length();
    




                        for (
    let index: number = 0;index < size; index++)
        {
objectJSONObject= layoutsJSONArray!.getJSONObject(index);
    
this.layoutList!.add(new GDLayout(objectJSONObject));
    
}

this.logUtil!.putF(this.LAYOUTS +this.layoutList!.size(), this, this.LOAD);
    

    let externalLayoutsJSONArray: JSONArray = gameAsConfiguration!.getJSONArray(gdProjectStrings!.EXTERNAL_LAYOUTS)!;;
    
size= externalLayoutsJSONArray!.length();
    




                        for (
    let index: number = 0;index < size; index++)
        {
objectJSONObject= externalLayoutsJSONArray!.getJSONObject(index);
    
this.externalLayoutList!.add(new GDExternalLayout(objectJSONObject));
    
}

this.logUtil!.putF(this.EXTERNAL_LAYOUT +this.externalLayoutList!.size(), this, this.LOAD);
    
}


}

