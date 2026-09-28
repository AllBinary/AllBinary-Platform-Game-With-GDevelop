
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
        
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { GameInfo } from '../../../../org/allbinary/game/GameInfo.js';
//not GWT import const GameInfo

import { BasicColor } from '../../../../org/allbinary/graphics/color/BasicColor.js';
//not GWT import const BasicColor

import { AllBinaryLayer } from '../../../../org/allbinary/layer/AllBinaryLayer.js';
//not GWT import const AllBinaryLayer

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

import { BasicGeographicMap } from '../../../../org/allbinary/media/graphics/geography/map/BasicGeographicMap.js';
//not GWT import const BasicGeographicMap

import { GeographicMapCellType } from '../../../../org/allbinary/media/graphics/geography/map/GeographicMapCellType.js';
//not GWT import const GeographicMapCellType

import { GeographicMapCompositeInterface } from '../../../../org/allbinary/media/graphics/geography/map/GeographicMapCompositeInterface.js';
//not GWT import const GeographicMapCompositeInterface

import { GeographicMapEventHandler } from '../../../../org/allbinary/media/graphics/geography/map/GeographicMapEventHandler.js';
//not GWT import const GeographicMapEventHandler

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { AllBinaryGameLayerManager } from './AllBinaryGameLayerManager.js';
//not GWT import - same folder const AllBinaryGameLayerManager

export class GDGameLayerManager extends AllBinaryGameLayerManager implements GeographicMapCompositeInterface {
        

    public static MAX_LEVEL: number = 7;

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private geographicMapInterfaceArray: BasicGeographicMap[] = BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY;

    private geographicMapCellTypeArray: GeographicMapCellType[] = GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE_ARRAY;

    public layout: number = 0;

public constructor (backgroundBasicColor: BasicColor, foregroundBasicColor: BasicColor, gameInfo: GameInfo){
            super(backgroundBasicColor, foregroundBasicColor, gameInfo);
                    

                            //For kotlin this is before the body of the constructor.
                    
}


                //@Throws(Exception.constructor)
            
    public remove(layerInterface: AllBinaryLayer){

                        if(layerInterface == 
                                    null
                                )
                        
                                    {
                                    this.logUtil!.putF("Remove: null", this, "remove");
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                
super.remove(layerInterface);
    
}


    public getGeographicMapInterface(): BasicGeographicMap[]{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.geographicMapInterfaceArray;
    
}


    public setGeographicMapInterface(geographicMapInterfaceArray: BasicGeographicMap[]){

    var commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    
this.logUtil!.putF(commonStrings!.START +this, this, commonStrings!.PROCESS);
    
this.geographicMapInterfaceArray= geographicMapInterfaceArray;
    
this.geographicMapCellTypeArray= new Array(this.geographicMapInterfaceArray!.length);
    

    var geographicMapEventHandler: GeographicMapEventHandler = GeographicMapEventHandler.getInstance()!;;
    
geographicMapEventHandler!.fireEvent();
    
geographicMapEventHandler!.removeAllListeners();
    
}


    public geographicMapCellTypeArray(): GeographicMapCellType[]{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.geographicMapCellTypeArray;
    
}


}



