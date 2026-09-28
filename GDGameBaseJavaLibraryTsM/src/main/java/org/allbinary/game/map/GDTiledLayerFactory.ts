
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
        
import { Image } from '../../../../javax/microedition/lcdui/Image.js';
//not GWT import const Image

import { TiledLayer } from '../../../../javax/microedition/lcdui/game/TiledLayer.js';
//not GWT import const TiledLayer

import { AllBinaryTiledLayer } from '../../../../org/allbinary/game/layer/AllBinaryTiledLayer.js';
//not GWT import const AllBinaryTiledLayer

import { PlacementAllBinaryJ2METiledLayer } from '../../../../org/allbinary/game/layer/PlacementAllBinaryJ2METiledLayer.js';
//not GWT import const PlacementAllBinaryJ2METiledLayer

import { BasicColor } from '../../../../org/allbinary/graphics/color/BasicColor.js';
//not GWT import const BasicColor

import { SmallIntegerSingletonFactory } from '../../../../org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const SmallIntegerSingletonFactory

import { AllBinaryTiledLayerFactoryInterface } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/AllBinaryTiledLayerFactoryInterface.js';
//not GWT import const AllBinaryTiledLayerFactoryInterface

import { RaceTrackData } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/RaceTrackData.js';
//not GWT import const RaceTrackData

import { RaceTrackInfo } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/RaceTrackInfo.js';
//not GWT import const RaceTrackInfo

import { TileLayer } from '../../../../org/mapeditor/core/TileLayer.js';
//not GWT import const TileLayer

import { TiledMap } from '../../../../org/mapeditor/core/TiledMap.js';
//not GWT import const TiledMap

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDTiledLayerFactory
            extends Object
         implements AllBinaryTiledLayerFactoryInterface {
        

    private readonly tileLayer: TileLayer;

    private readonly map: TiledMap;

    private readonly tileSetImage: Image;

    private readonly debugColor: BasicColor;

    private useAsMiniAllBinaryTiledLayer: AllBinaryTiledLayer;

public constructor (tileLayer: TileLayer, cellTypeIdToGeographicMapCellType: number[], map: TiledMap, tileSetImage: Image, debugColor: BasicColor){

            super();
        this.tileLayer= tileLayer;
    
this.map= map;
    
this.tileSetImage= tileSetImage;
    
this.debugColor= debugColor;
    
}


                //@Throws(Exception.constructor)
            
    public getInstance(raceTrackInfo: RaceTrackInfo, raceTrackData: RaceTrackData): AllBinaryTiledLayer{
this.useAsMiniAllBinaryTiledLayer= new PlacementAllBinaryJ2METiledLayer(SmallIntegerSingletonFactory.getInstance()!.getAt( -1), new TiledLayer(this.map.getWidth(), this.map.getHeight(), this.tileSetImage, Math.round((this.map.getTileWidth())), Math.round((this.map.getTileHeight()))), this.tileLayer!.getMapArray(), this.debugColor!.intValue());
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.useAsMiniAllBinaryTiledLayer;
    
}


                //@Throws(Exception.constructor)
            
    public getMiniInstance(raceTrackData: RaceTrackData): AllBinaryTiledLayer{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.useAsMiniAllBinaryTiledLayer;
    
}


}



