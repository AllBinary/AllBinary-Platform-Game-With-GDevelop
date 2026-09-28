
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2025 AllBinary 
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

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
import { Animation } from '../../../../org/allbinary/animation/Animation.js';
//not GWT import const Animation

import { AllBinaryThreedVisibleTiledLayer } from '../../../../org/allbinary/game/layer/AllBinaryThreedVisibleTiledLayer.js';
//not GWT import const AllBinaryThreedVisibleTiledLayer

import { AllBinaryTiledLayer } from '../../../../org/allbinary/game/layer/AllBinaryTiledLayer.js';
//not GWT import const AllBinaryTiledLayer

import { AllBinaryTiledLayerFactoryInterface } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/AllBinaryTiledLayerFactoryInterface.js';
//not GWT import const AllBinaryTiledLayerFactoryInterface

import { RaceTrackData } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/RaceTrackData.js';
//not GWT import const RaceTrackData

import { RaceTrackInfo } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/RaceTrackInfo.js';
//not GWT import const RaceTrackInfo

import { RaceTrackThreedData } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/threed/RaceTrackThreedData.js';
//not GWT import const RaceTrackThreedData

import { ThreedTiledLayerResourcesFactory } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/threed/ThreedTiledLayerResourcesFactory.js';
//not GWT import const ThreedTiledLayerResourcesFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDTiledLayerFactory
            extends Object
         implements AllBinaryTiledLayerFactoryInterface {
        

    private useAsMiniAllBinaryTiledLayer: AllBinaryTiledLayer;

public constructor (){

            super();
        }


                //@Throws(Exception.constructor)
            
    public getInstance(raceTrackInfo: RaceTrackInfo, raceTrackData: RaceTrackData): AllBinaryTiledLayer{

    var raceTrackThreedData: RaceTrackThreedData = ThreedTiledLayerResourcesFactory.getInstance()!.getInstance(raceTrackInfo!.getId())!;;
    

    var animationInterfaceArray: Animation[] = raceTrackThreedData!.getAnimationArray()!;;
    

    var columns: number = raceTrackData!.getMapArray()[0]!.length;;
    

    var rows: number = raceTrackData!.getMapArray()!.length;;
    

    var width: number = columns *raceTrackData!.getCellWidth();;
    

    var height: number = rows *raceTrackData!.getCellHeight();;
    
this.useAsMiniAllBinaryTiledLayer= new AllBinaryThreedVisibleTiledLayer(raceTrackData!.getId(), raceTrackData!.getMapArray(), animationInterfaceArray, columns, rows, width, height, raceTrackData!.getCellWidth(), raceTrackData!.getCellHeight(), 9);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.useAsMiniAllBinaryTiledLayer;
    
}


                //@Throws(Exception.constructor)
            
    public getMiniInstance(raceTrackData: RaceTrackData): AllBinaryTiledLayer{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.useAsMiniAllBinaryTiledLayer;
    
}


}



