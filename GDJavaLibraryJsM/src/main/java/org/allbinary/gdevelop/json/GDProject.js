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
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
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
export class GDProject extends Object {
    constructor() {
        super(...arguments);
        this.logUtil = LogUtil.getInstance();
        this.LOAD = "load";
        this.OBJECTS = "GDObjects: ";
        this.VARIABLES = "GDVariables: ";
        this.LAYOUTS = "GDLayouts: ";
        this.EXTERNAL_LAYOUT = "GDExternalLayouts: ";
        this.gdIde = new GDIde();
        this.maxFPS = 0;
        this.minFPS = 0;
        this.verticalSyncActivatedByDefault = false;
        this.adaptGameResolutionAtRuntime = false;
        this.objectList = new BasicArrayListD();
        this.variableList = new BasicArrayListD();
        this.layoutList = new BasicArrayListD();
        this.externalLayoutList = new BasicArrayListD();
    }
    //@Throws(JSONException.constructor)
    load(gameAsConfiguration) {
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        this.gdIde.load(gameAsConfiguration);
        var properties = gameAsConfiguration.getJSONObject(gdProjectStrings.PROPERTIES);
        ;
        this.packageName = properties.getString(gdProjectStrings.PACKAGE_NAME);
        this.name = properties.getString(gdProjectStrings.NAME);
        this.version = properties.getString(gdProjectStrings.VERSION);
        var width = properties.getInt(gdProjectStrings.WINDOW_WIDTH);
        ;
        var height = properties.getInt(gdProjectStrings.WINDOW_HEIGHT);
        ;
        this.gameResolutionSize = new Rectangle(PointFactory.getInstance().ZERO_ZERO, width, height);
        this.maxFPS = properties.getInt(gdProjectStrings.MAX_FPS);
        this.minFPS = properties.getInt(gdProjectStrings.MIN_FPS);
        this.verticalSyncActivatedByDefault = properties.getBoolean(gdProjectStrings.VERTICAL_SYNC);
        this.scaleMode = properties.getString(gdProjectStrings.SCALE_MODE);
        this.adaptGameResolutionAtRuntime = properties.getBoolean(gdProjectStrings.ADAPT_GAME_RESOLUTION_AT_RUNTIME);
        this.sizeOnStartupMode = properties.getString(gdProjectStrings.SIZE_ON_STARTUP_MODE);
        this.projectUuid = properties.getString(gdProjectStrings.PROJECT_UUID);
        var resourceJSONObject = gameAsConfiguration.getJSONObject(gdProjectStrings.RESOURCES);
        ;
        this.resourcesManager = new GDResourcesManager(resourceJSONObject);
        var objectFactory = GDObjectFactory.getInstance();
        ;
        var objectJSONArray = gameAsConfiguration.getJSONArray(gdProjectStrings.OBJECTS);
        ;
        var size = objectJSONArray.length();
        ;
        var objectJSONObject;
        ;
        for (var index = 0; index < size; index++) {
            objectJSONObject = objectJSONArray.getJSONObject(index);
            this.objectList.add(objectFactory.create(objectJSONObject));
        }
        this.logUtil.putF(this.OBJECTS + this.objectList.size(), this, this.LOAD);
        var variableJSONArray = gameAsConfiguration.getJSONArray(gdProjectStrings.VARIABLES);
        ;
        size = variableJSONArray.length();
        for (var index = 0; index < size; index++) {
            this.variableList.add(new GDVariable(variableJSONArray.getJSONObject(index)));
        }
        this.logUtil.putF(this.VARIABLES + this.variableList.size(), this, this.LOAD);
        var layoutsJSONArray = gameAsConfiguration.getJSONArray(gdProjectStrings.LAYOUTS);
        ;
        size = layoutsJSONArray.length();
        for (var index = 0; index < size; index++) {
            objectJSONObject = layoutsJSONArray.getJSONObject(index);
            this.layoutList.add(new GDLayout(objectJSONObject));
        }
        this.logUtil.putF(this.LAYOUTS + this.layoutList.size(), this, this.LOAD);
        var externalLayoutsJSONArray = gameAsConfiguration.getJSONArray(gdProjectStrings.EXTERNAL_LAYOUTS);
        ;
        size = externalLayoutsJSONArray.length();
        for (var index = 0; index < size; index++) {
            objectJSONObject = externalLayoutsJSONArray.getJSONObject(index);
            this.externalLayoutList.add(new GDExternalLayout(objectJSONObject));
        }
        this.logUtil.putF(this.EXTERNAL_LAYOUT + this.externalLayoutList.size(), this, this.LOAD);
    }
}
