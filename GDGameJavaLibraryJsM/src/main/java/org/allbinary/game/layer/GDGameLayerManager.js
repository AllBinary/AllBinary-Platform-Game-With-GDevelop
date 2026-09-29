/*
        *
        *  AllBinary Open License Version 1
        *  Copyright (c) 2011 AllBinary
        *
        *  By agreeing to this license you and any business entity you represent are
        *  legally bound to the AllBinary Open License Version 1 legal agreement.
        *
        *  You may obtain the AllBinary Open License Version 1 legal agreement from
        *  AllBinary or the root directory of AllBinary's AllBinary Platform repository.
        *
        *  Created By: Travis Berthelot
*/
//not GWT import const AllBinaryLayer
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
import { BasicGeographicMap } from '../../../../org/allbinary/media/graphics/geography/map/BasicGeographicMap.js';
//not GWT import const BasicGeographicMap
import { GeographicMapCellType } from '../../../../org/allbinary/media/graphics/geography/map/GeographicMapCellType.js';
//not GWT import const GeographicMapCompositeInterface
import { GeographicMapEventHandler } from '../../../../org/allbinary/media/graphics/geography/map/GeographicMapEventHandler.js';
//not GWT import const GeographicMapEventHandler
//Current folder imports from return types, extended types, and scope (deduplicated)
import { AllBinaryGameLayerManager } from './AllBinaryGameLayerManager.js';
//not GWT import - same folder const AllBinaryGameLayerManager
export class GDGameLayerManager extends AllBinaryGameLayerManager {
    constructor(backgroundBasicColor, foregroundBasicColor, gameInfo) {
        super(backgroundBasicColor, foregroundBasicColor, gameInfo);
        this.logUtil = LogUtil.getInstance();
        this.geographicMapInterfaceArray = BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY;
        this.geographicMapCellTypeArray = GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE_ARRAY;
        this.layout = 0;
        //For kotlin this is before the body of the constructor.
    }
    //@Throws(Exception.constructor)
    remove(layerInterface) {
        if (layerInterface ==
            null) {
            this.logUtil.putF("Remove: null", this, "remove");
            //if statement needs to be on the same line and ternary does not work the same way.
            return;
        }
        super.remove(layerInterface);
    }
    getGeographicMapInterface() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.geographicMapInterfaceArray;
    }
    setGeographicMapInterface(geographicMapInterfaceArray) {
        var commonStrings = CommonStrings.getInstance();
        ;
        this.logUtil.putF(commonStrings.START + this, this, commonStrings.PROCESS);
        this.geographicMapInterfaceArray = geographicMapInterfaceArray;
        this.geographicMapCellTypeArray = new Array(this.geographicMapInterfaceArray.length);
        var geographicMapEventHandler = GeographicMapEventHandler.getInstance();
        ;
        geographicMapEventHandler.fireEvent();
        geographicMapEventHandler.removeAllListeners();
    }
    geographicMapCellTypeArray() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.geographicMapCellTypeArray;
    }
}
GDGameLayerManager.MAX_LEVEL = 7;
