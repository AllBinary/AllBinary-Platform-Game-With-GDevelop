
        /*
                *  
                * Copyright (c) 2006 All Binary 
                * All Rights Reserved. 
                * Don't Duplicate or Distributed. 
                * Trade Secret Information 
                * For Internal Use Only 
                * Confidential 
                * Unpublished 
                *  
                * Created By: Travis Berthelot 
                * Date: August 6, 2006 
                *  
                *  
                * Modified By         When       ?   
        */
        
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { Image } from '../../../../javax/microedition/lcdui/Image.js';
//not GWT import const Image

import { TiledLayer } from '../../../../javax/microedition/lcdui/game/TiledLayer.js';
//not GWT import const TiledLayer

import { Features } from '../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const Features

import { AllBinaryJ2METiledLayer } from '../../../../org/allbinary/game/layer/AllBinaryJ2METiledLayer.js';
//not GWT import const AllBinaryJ2METiledLayer

import { AllBinaryTiledLayer } from '../../../../org/allbinary/game/layer/AllBinaryTiledLayer.js';
//not GWT import const AllBinaryTiledLayer

import { BasicColor } from '../../../../org/allbinary/graphics/color/BasicColor.js';
//not GWT import const BasicColor

import { GameTickDisplayInfoSingleton } from '../../../../org/allbinary/graphics/displayable/GameTickDisplayInfoSingleton.js';
//not GWT import const GameTickDisplayInfoSingleton

import { OpenGLFeatureFactory } from '../../../../org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { SmallIntegerSingletonFactory } from '../../../../org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const SmallIntegerSingletonFactory

import { GeographicMapCellPosition } from '../../../../org/allbinary/media/graphics/geography/map/GeographicMapCellPosition.js';
//not GWT import const GeographicMapCellPosition

import { GeographicMapCellPositionBaseFactory } from '../../../../org/allbinary/media/graphics/geography/map/GeographicMapCellPositionBaseFactory.js';
//not GWT import const GeographicMapCellPositionBaseFactory

import { GeographicMapCellTypeFactory } from '../../../../org/allbinary/media/graphics/geography/map/GeographicMapCellTypeFactory.js';
//not GWT import const GeographicMapCellTypeFactory

import { SimpleGeographicMapCellPositionFactory } from '../../../../org/allbinary/media/graphics/geography/map/SimpleGeographicMapCellPositionFactory.js';
//not GWT import const SimpleGeographicMapCellPositionFactory

import { AllBinaryTiledLayerFactoryInterface } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/AllBinaryTiledLayerFactoryInterface.js';
//not GWT import const AllBinaryTiledLayerFactoryInterface

import { CustomMapGeneratorBaseFactory } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/CustomMapGeneratorBaseFactory.js';
//not GWT import const CustomMapGeneratorBaseFactory

import { RaceTrackData } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/RaceTrackData.js';
//not GWT import const RaceTrackData

import { RaceTrackFrictionProperties } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/RaceTrackFrictionProperties.js';
//not GWT import const RaceTrackFrictionProperties

import { RaceTrackGeographicMap } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/RaceTrackGeographicMap.js';
//not GWT import const RaceTrackGeographicMap

import { RaceTrackInfo } from '../../../../org/allbinary/media/graphics/geography/map/racetrack/RaceTrackInfo.js';
//not GWT import const RaceTrackInfo

import { GameTickTimeDelayHelperFactory } from '../../../../org/allbinary/time/GameTickTimeDelayHelperFactory.js';
//not GWT import const GameTickTimeDelayHelperFactory

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

import { Animation } from '../../../../org/mapeditor/core/Animation.js';
//not GWT import const Animation

import { Frame } from '../../../../org/mapeditor/core/Frame.js';
//not GWT import const Frame

import { Tile } from '../../../../org/mapeditor/core/Tile.js';
//not GWT import const Tile

import { TileLayer } from '../../../../org/mapeditor/core/TileLayer.js';
//not GWT import const TileLayer

import { TileSet } from '../../../../org/mapeditor/core/TileSet.js';
//not GWT import const TileSet

import { TiledMap } from '../../../../org/mapeditor/core/TiledMap.js';
//not GWT import const TiledMap

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGeographicMap extends RaceTrackGeographicMap {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    readonly commonStrings: CommonStrings = CommonStrings.getInstance()!;

    private readonly map: TiledMap;

    private readonly animationTileIndexArray: number[];

    private readonly startTimeFrameArray: number[];

    private readonly currentFrameArray: number[];

    private readonly animationArray: Animation[];

public constructor (tiledLayerFactoryInterface: AllBinaryTiledLayerFactoryInterface, tileLayer: TileLayer, cellTypeIdToGeographicMapCellType: number[], map: TiledMap, tileSetImage: Image, geographicMapCellTypeFactory: GeographicMapCellTypeFactory, foregroundColor: BasicColor, backgroundColor: BasicColor, debugColor: BasicColor, customMapGeneratorBaseFactory: CustomMapGeneratorBaseFactory){
            super(new RaceTrackInfo(SmallIntegerSingletonFactory.getInstance()!.getAt(tileLayer!.getId()), SmallIntegerSingletonFactory.getInstance()!.getAt(tileLayer!.getId())!.toString(), new RaceTrackFrictionProperties(0, 0), foregroundColor, backgroundColor, 0, 0, 0), new RaceTrackData(SmallIntegerSingletonFactory.getInstance()!.getAt(0), map.getTileWidth(), map.getTileHeight(), map.getTileWidth() /4, map.getTileHeight() /4, cellTypeIdToGeographicMapCellType, tileLayer!.getMapArray()), tiledLayerFactoryInterface, new SimpleGeographicMapCellPositionFactory(), new GeographicMapCellPositionBaseFactory(), geographicMapCellTypeFactory, customMapGeneratorBaseFactory);
                    

                            //For kotlin this is before the body of the constructor.
                    
this.map= map;
    

    var tileList: BasicArrayList = new BasicArrayListD();;
    
this.createAnimationTiles(tileList);
    

    var size: number = tileList!.size()!;;
    
this.animationTileIndexArray= new Array(size);
    
this.startTimeFrameArray= new Array(size);
    
this.currentFrameArray= new Array(size);
    
this.animationArray= new Array(size);
    
this.setAnimations(tileList);
    
}


    public getMap(): TiledMap{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.map;
    
}


    public createAnimationTiles(tileList: BasicArrayList){

    var tileSetList: BasicArrayList = this.map.getTileSets()!;;
    

    var size: number = tileSetList!.size()!;;
    

                        if(size > 0)
                        
                                    {
                                    
    var tileSet: TileSet;;
    

    var tile: Tile;;
    

    var animation: Animation;;
    

    var tileCount: number= 0;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
tileSet= tileSetList!.get(index) as TileSet;
    
tileCount= tileSet!.getTilecount();
    




                        for (
    var index2: number = 0;index2 < tileCount; index2++)
        {
tile= tileSet!.getTile(index2);
    
animation= tile.getAnimation();
    

                        if(animation != Animation.NULL_ANIMATION)
                        
                                    {
                                    tileList!.add(tile);
    

                                    }
                                
}

}


                                    }
                                
}


    public setAnimations(tileList: BasicArrayList){

    var features: Features = Features.getInstance()!;;
    

    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!;;
    

                        if(features.isFeature(openGLFeatureFactory!.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory!.OPENGL_3D))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

    var size: number = tileList!.size()!;;
    

    var animationTileIndex: number= 0;;
    

    var CREATING_ANIMATION_TILE: string = "Creating AnimationTile: ";;
    

    var tile: Tile;;
    

    var animation: Animation;;
    

    var allBinaryJ2METiledLayer: AllBinaryJ2METiledLayer = this.getAllBinaryTiledLayer() as AllBinaryJ2METiledLayer;;
    

    var tiledLayer: TiledLayer = allBinaryJ2METiledLayer!.getTiledLayer()!;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
tile= tileList!.get(index) as Tile;
    
animationTileIndex= tiledLayer!.createAnimatedTile(tile.getId());
    
this.logUtil!.putF(CREATING_ANIMATION_TILE +animationTileIndex, this, this.commonStrings!.PROCESS);
    
this.animationArray[index]= animation= tile.getAnimation();
    
this.animationTileIndexArray[index]= animationTileIndex;
    
allBinaryJ2METiledLayer!.updateCells((getLayer as TileLayer).getMapArray(), (get as Frame).getTileid(), animationTileIndex);
    
}

}


    public update(){

    var features: Features = Features.getInstance()!;;
    

    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!;;
    

                        if(features.isFeature(openGLFeatureFactory!.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory!.OPENGL_3D))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

    var startTime: number = GameTickTimeDelayHelperFactory.getInstance()!.startTime;;
    

    var size: number = this.animationArray!.length
                ;;
    

                    //Otherwise - statement - EmptyStmt


    var animation: Animation;;
    

    var frame: Frame;;
    

    var tiledLayer: TiledLayer = (getAllBinaryTiledLayer as AllBinaryJ2METiledLayer).getTiledLayer()!;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
animation= this.animationArray[index]! as Animation;
    
frame= animation.getFrame()!.get(this.currentFrameArray[index]!) as Frame;
    

                        if(startTime -this.startTimeFrameArray[index] > frame.getDuration())
                        
                                    {
                                    this.startTimeFrameArray[index]= startTime;
    
tiledLayer!.setAnimatedTile(this.animationTileIndexArray[index]!, frame.getTileid());
    

                        if(this.currentFrameArray[index] +1 < animation.getFrame()!.size())
                        
                                    {
                                    this.currentFrameArray[index]++;
    

                                    }
                                
                        else {
                            this.currentFrameArray[index]= 0;
    

                        }
                            

                                    }
                                
}

}


    public reset(){

    var allBinaryTiledLayer: AllBinaryTiledLayer = this.getAllBinaryTiledLayer()!;;
    

    var lastHeight: number = GameTickDisplayInfoSingleton.getInstance()!.getLastHeight()!;;
    

    var y: number =  -lastHeight +allBinaryTiledLayer!.getHeight();;
    
allBinaryTiledLayer!.setPosition(0,  -y, allBinaryTiledLayer!.getZP());
    
}


                //@Throws(Exception.constructor)
            
    public getCellPositionAtXY(x: number, y: number): GeographicMapCellPosition{

    var allBinaryTiledLayer: AllBinaryTiledLayer = this.getAllBinaryTiledLayer()!;;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return super.getCellPositionAtXY(x +allBinaryTiledLayer!.getXP(), y +allBinaryTiledLayer!.getYP());;
    
}


    public getCellPositionAtXYNoThrow(x: number, y: number): GeographicMapCellPosition{

    var allBinaryTiledLayer: AllBinaryTiledLayer = this.getAllBinaryTiledLayer()!;;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return super.getCellPositionAtXYNoThrow(x +allBinaryTiledLayer!.getXP(), y +allBinaryTiledLayer!.getYP());;
    
}


}



