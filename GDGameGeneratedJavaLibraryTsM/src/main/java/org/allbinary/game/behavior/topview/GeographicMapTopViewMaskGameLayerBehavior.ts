
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2022 AllBinary 
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

        


            import { Exception } from '../../../../../java/lang/Exception.js';
        
import { MultiGeographicMapBehavior } from '../../../../../org/allbinary/media/graphics/geography/map/MultiGeographicMapBehavior.js';
//not GWT import const MultiGeographicMapBehavior

import { AllBinaryTiledLayer } from '../../../../../org/allbinary/game/layer/AllBinaryTiledLayer.js';
//not GWT import const AllBinaryTiledLayer

import { GDCustomGameLayer } from '../../../../../org/allbinary/game/layer/GDCustomGameLayer.js';
//not GWT import const GDCustomGameLayer

import { GravityUtil } from '../../../../../org/allbinary/game/physics/acceleration/GravityUtil.js';
//not GWT import const GravityUtil

import { VelocityProperties } from '../../../../../org/allbinary/game/physics/velocity/VelocityProperties.js';
//not GWT import const VelocityProperties

import { GPoint } from '../../../../../org/allbinary/graphics/GPoint.js';
//not GWT import const GPoint

import { Rectangle } from '../../../../../org/allbinary/graphics/Rectangle.js';
//not GWT import const Rectangle

import { AllBinaryLayer } from '../../../../../org/allbinary/layer/AllBinaryLayer.js';
//not GWT import const AllBinaryLayer

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { BasicGeographicMap } from '../../../../../org/allbinary/media/graphics/geography/map/BasicGeographicMap.js';
//not GWT import const BasicGeographicMap

import { GeographicMapCellPosition } from '../../../../../org/allbinary/media/graphics/geography/map/GeographicMapCellPosition.js';
//not GWT import const GeographicMapCellPosition

import { GeographicMapCellType } from '../../../../../org/allbinary/media/graphics/geography/map/GeographicMapCellType.js';
//not GWT import const GeographicMapCellType

import { SimpleGeographicMapCellPositionFactory } from '../../../../../org/allbinary/media/graphics/geography/map/SimpleGeographicMapCellPositionFactory.js';
//not GWT import const SimpleGeographicMapCellPositionFactory

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

import { ViewPositionBase } from '../../../../../org/allbinary/view/ViewPositionBase.js';
//not GWT import const ViewPositionBase

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GeographicMapTopViewLayerBehavior } from './GeographicMapTopViewLayerBehavior.js';
//not GWT import - same folder const GeographicMapTopViewLayerBehavior
import { TopViewCharacterInterface } from './TopViewCharacterInterface.js';
//not GWT import - same folder const TopViewCharacterInterface

export class GeographicMapTopViewMaskGameLayerBehavior extends GeographicMapTopViewLayerBehavior {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly gravityUtil: GravityUtil = GravityUtil.getInstance()!;

    private readonly geographicMapBehavior: MultiGeographicMapBehavior = new MultiGeographicMapBehavior();

    public readonly unsafeGeographicMapCellPositionList: BasicArrayList = new BasicArrayListD();

    public readonly unsafePossibleGeographicMapCellPositionList: BasicArrayList = new BasicArrayListD();

    private readonly autoStepBlocks: boolean;

public constructor (){
            super(16);
                    

                            //For kotlin this is before the body of the constructor.
                    
this.autoStepBlocks= true;
    
}


public constructor (maxGravityActionIndex: number, autoStepBlocks: boolean, offsetY: number){
            super(maxGravityActionIndex);
                    

                            //For kotlin this is before the body of the constructor.
                    
this.autoStepBlocks= autoStepBlocks;
    
}


                //@Throws(Exception.constructor)
            
    public gravity(velocityProperties: VelocityProperties, geographicMapInterfaceArray: BasicGeographicMap[], geographicMapCellTypeArray: GeographicMapCellType[], geographicMapCellPosition: GeographicMapCellPosition){

                        if(geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    this.geographicMapBehavior!.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition);
    

    var hasSolidBlock: boolean = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)!;;
    

                        if(!hasSolidBlock)
                        
                                    {
                                    this.gravityUtil!.process(velocityProperties, this.gravityUtil!.GAME_GRAVITY_VELOCITY);
    
velocityProperties!.limitXYToForwardAndReverseMaxVelocity();
    
this.gravity();
    

                                    }
                                
                        else {
                            
                        }
                            

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    get(geographicMapInterfaceArray: BasicGeographicMap[], geographicMapCellPositionList: BasicArrayList, layer: AllBinaryLayer, x: number, y: number): BasicArrayList{

    var customGameLayer: GDCustomGameLayer = layer as GDCustomGameLayer;;
    

    var frame: number = customGameLayer!.getIndexedAnimationInterface()!.getFrame()!;;
    

    var maskRectangle: Rectangle = customGameLayer!.rectangleArrayOfArrays[customGameLayer!.gdObject!.animation]![frame]!;;
    

    var maskPoint: GPoint = maskRectangle!.getPoint()!;;
    

    var viewPosition: ViewPositionBase = customGameLayer!.getViewPosition()!;;
    

    var viewX: number = viewPosition!.getX()!;;
    

    var viewY: number = viewPosition!.getY()!;;
    

    var xCellPosition: number = viewX +maskPoint!.getX() + -x;;
    

    var yCellPosition: number = viewY +maskPoint!.getY() + -y;;
    

    var x2CellPosition: number = viewX +maskPoint!.getX() + -x +maskRectangle!.getWidth();;
    

    var y2CellPosition: number = viewY +maskPoint!.getY() + -y +maskRectangle!.getHeight();;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return geographicMapInterfaceArray[0]!.getCellPositionAtNoThrow(xCellPosition, yCellPosition, x2CellPosition, y2CellPosition, geographicMapCellPositionList);;
    
}


                //@Throws(Exception.constructor)
            
    getLeftPosition(geographicMapInterfaceArray: BasicGeographicMap[], layer: AllBinaryLayer): GeographicMapCellPosition{

    var customGameLayer: GDCustomGameLayer = layer as GDCustomGameLayer;;
    

    var frame: number = customGameLayer!.getIndexedAnimationInterface()!.getFrame()!;;
    

    var maskRectangle: Rectangle = customGameLayer!.rectangleArrayOfArrays[customGameLayer!.gdObject!.animation]![frame]!;;
    

    var maskPoint: GPoint = maskRectangle!.getPoint()!;;
    

    var viewPosition: ViewPositionBase = customGameLayer!.getViewPosition()!;;
    

    var viewX: number = viewPosition!.getX()!;;
    

    var viewY: number = viewPosition!.getY()!;;
    

    var xCellPosition: number = viewX +maskPoint!.getX();;
    

    var yCellPosition: number = viewY +maskPoint!.getY() +maskRectangle!.getHeight();;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return geographicMapInterfaceArray[0]!.getCellPositionAtXYNoThrow(xCellPosition, yCellPosition);;
    
}


                //@Throws(Exception.constructor)
            
    getRightPosition(geographicMapInterfaceArray: BasicGeographicMap[], layer: AllBinaryLayer): GeographicMapCellPosition{

    var customGameLayer: GDCustomGameLayer = layer as GDCustomGameLayer;;
    

    var frame: number = customGameLayer!.getIndexedAnimationInterface()!.getFrame()!;;
    

    var maskRectangle: Rectangle = customGameLayer!.rectangleArrayOfArrays[customGameLayer!.gdObject!.animation]![frame]!;;
    

    var maskPoint: GPoint = maskRectangle!.getPoint()!;;
    

    var viewPosition: ViewPositionBase = customGameLayer!.getViewPosition()!;;
    

    var viewX: number = viewPosition!.getX()!;;
    

    var viewY: number = viewPosition!.getY()!;;
    

    var xCellPosition: number = viewX +maskPoint!.getX() +maskRectangle!.getWidth();;
    

    var yCellPosition: number = viewY +maskPoint!.getY() +maskRectangle!.getHeight();;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return geographicMapInterfaceArray[0]!.getCellPositionAtXYNoThrow(xCellPosition, yCellPosition);;
    
}


                //@Throws(Exception.constructor)
            
    public getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray: BasicGeographicMap[], geographicMapCellTypeArray: GeographicMapCellType[], velocityProperties: VelocityProperties, layer: AllBinaryLayer, x: number, y: number): GeographicMapCellPosition{

    var geographicMapCellPositionList: BasicArrayList = this.unsafeGeographicMapCellPositionList;;
    
this.get(geographicMapInterfaceArray, geographicMapCellPositionList, layer, x, y);
    

    var geographicMapCellPosition: GeographicMapCellPosition = this.getGeographicMapCellPositionFromListIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPositionList, velocityProperties, layer)!;;
    

                        if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    

                                    }
                                
                        else {
                            
                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return geographicMapCellPosition;
    
}


                //@Throws(Exception.constructor)
            
    public getGeographicMapCellPositionFromListIfNotSolidBlockOrOffMap(geographicMapInterfaceArray: BasicGeographicMap[], geographicMapCellTypeArray: GeographicMapCellType[], geographicMapCellPositionList: BasicArrayList, velocityProperties: VelocityProperties, layer: AllBinaryLayer): GeographicMapCellPosition{
this.unsafePossibleGeographicMapCellPositionList!.clear();
    

                        if(geographicMapCellPositionList!.size() > 0)
                        
                                    {
                                    
    var size: number = geographicMapCellPositionList!.size()!;;
    




                        for (
    var index: number = 0;index < size; index++)
        {

    var possibleStepGeographicMapCellPosition: GeographicMapCellPosition = geographicMapCellPositionList!.get(index) as GeographicMapCellPosition;;
    

    var tiledLayer: AllBinaryTiledLayer = geographicMapInterfaceArray[0]!.getAllBinaryTiledLayer()!;;
    

                        if(possibleStepGeographicMapCellPosition!.getColumn() > 0 && possibleStepGeographicMapCellPosition!.getRow() > 0 && possibleStepGeographicMapCellPosition!.getColumn() < tiledLayer!.getColumns() && possibleStepGeographicMapCellPosition!.getRow() < tiledLayer!.getRows())
                        
                                    {
                                    this.geographicMapBehavior!.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition);
    

    var hasSolidBlock: boolean = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)!;;
    

    var hasOffMap: boolean = this.isOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray)!;;
    

                        if(hasSolidBlock || hasOffMap)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    

                                    }
                                
                        else {
                            this.unsafePossibleGeographicMapCellPositionList!.add(possibleStepGeographicMapCellPosition);
    

                        }
                            

                                    }
                                
}


                        if(this.unsafePossibleGeographicMapCellPositionList!.size() > 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.unsafePossibleGeographicMapCellPositionList!.get(0) as GeographicMapCellPosition;
    

                                    }
                                

                                    }
                                
                        else {
                            
                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION;
    
}


                //@Throws(Exception.constructor)
            
    public moveAndLand(geographicMapInterfaceArray: BasicGeographicMap[], geographicMapCellTypeArray: GeographicMapCellType[], geographicMapCellPosition: GeographicMapCellPosition, velocityProperties: VelocityProperties, layer: AllBinaryLayer, x: number, y: number){

                        if(geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    layer = layerlayer as TopViewCharacterInterface
layer.
                    terrainMove(geographicMapInterfaceArray, geographicMapCellTypeArray, x, y);
    

                                    }
                                
                        else {
                            
                        }
                            
}


                //@Throws(Exception.constructor)
            
    public move(geographicMapInterfaceArray: BasicGeographicMap[], geographicMapCellTypeArray: GeographicMapCellType[], velocityProperties: VelocityProperties, layer: AllBinaryLayer, x: number, y: number): boolean{

    var geographicMapCellPosition: GeographicMapCellPosition = this.getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y)!;;
    
this.moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y);
    

                        if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                        }
                            
}


                //@Throws(Exception.constructor)
            
    public left(geographicMapInterfaceArray: BasicGeographicMap[], geographicMapCellTypeArray: GeographicMapCellType[], velocityProperties: VelocityProperties, layer: AllBinaryLayer){

    var geographicMapCellPosition: GeographicMapCellPosition = this.getLeftPosition(geographicMapInterfaceArray, layer)!;;
    

                        if(geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    
    var possibleStepGeographicMapCellPosition: GeographicMapCellPosition = geographicMapInterfaceArray[0]!.getGeographicMapCellPositionFactory()!.getAt(geographicMapCellPosition!.getColumn(), geographicMapCellPosition!.getRow() -1)!;;
    
this.geographicMapBehavior!.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition);
    

    var hasSolidBlock: boolean = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)!;;
    

                        if(hasSolidBlock)
                        
                                    {
                                    
                        if(this.autoStepBlocks)
                        
                                    {
                                    layer = layerlayer as TopViewCharacterInterface
layer.
                    leftp();
    

                                    }
                                
                        else {
                            velocityProperties!.getVelocityXBasicDecimalP()!.setint(0);
    

                        }
                            

                                    }
                                
                        else {
                            layer = layerlayer as TopViewCharacterInterface
layer.
                    leftp();
    

                        }
                            

                                    }
                                
}


                //@Throws(Exception.constructor)
            
    public right(geographicMapInterfaceArray: BasicGeographicMap[], geographicMapCellTypeArray: GeographicMapCellType[], velocityProperties: VelocityProperties, layer: AllBinaryLayer){

    var geographicMapCellPosition: GeographicMapCellPosition = this.getRightPosition(geographicMapInterfaceArray, layer)!;;
    

                        if(geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    
    var possibleStepGeographicMapCellPosition: GeographicMapCellPosition = geographicMapInterfaceArray[0]!.getGeographicMapCellPositionFactory()!.getAt(geographicMapCellPosition!.getColumn(), geographicMapCellPosition!.getRow() -1)!;;
    
this.geographicMapBehavior!.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition);
    

    var hasSolidBlock: boolean = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)!;;
    

                        if(hasSolidBlock)
                        
                                    {
                                    
                        if(this.autoStepBlocks)
                        
                                    {
                                    layer = layerlayer as TopViewCharacterInterface
layer.
                    rightp();
    

                                    }
                                
                        else {
                            velocityProperties!.getVelocityXBasicDecimalP()!.setint(0);
    

                        }
                            

                                    }
                                
                        else {
                            layer = layerlayer as TopViewCharacterInterface
layer.
                    rightp();
    

                        }
                            

                                    }
                                
}


}



