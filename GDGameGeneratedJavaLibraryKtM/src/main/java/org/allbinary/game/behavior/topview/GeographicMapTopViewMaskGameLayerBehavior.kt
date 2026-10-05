
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
        package org.allbinary.game.behavior.topview




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.media.graphics.geography.map.MultiGeographicMapBehavior
import org.allbinary.game.layer.AllBinaryTiledLayer
import org.allbinary.game.layer.GDCustomGameLayer
import org.allbinary.game.physics.acceleration.GravityUtil
import org.allbinary.game.physics.velocity.VelocityProperties
import org.allbinary.graphics.GPoint
import org.allbinary.graphics.Rectangle
import org.allbinary.layer.AllBinaryLayer
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.media.graphics.geography.map.BasicGeographicMap
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
import org.allbinary.media.graphics.geography.map.GeographicMapCellType
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.allbinary.view.ViewPositionBase

open public class GeographicMapTopViewMaskGameLayerBehavior : GeographicMapTopViewLayerBehavior {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val gravityUtil: GravityUtil = GravityUtil.getInstance()!!

    private val geographicMapBehavior: MultiGeographicMapBehavior = MultiGeographicMapBehavior()

    val unsafeGeographicMapCellPositionList: BasicArrayList = BasicArrayListD()

    val unsafePossibleGeographicMapCellPositionList: BasicArrayList = BasicArrayListD()

    private val autoStepBlocks: Boolean
public constructor ()                        

                            : super(16){


                            //For kotlin this is before the body of the constructor.
                    
this.autoStepBlocks= true
}

public constructor (maxGravityActionIndex: Int, autoStepBlocks: Boolean, offsetY: Int)                        

                            : super(maxGravityActionIndex){
    //var maxGravityActionIndex = maxGravityActionIndex
    //var autoStepBlocks = autoStepBlocks
    //var offsetY = offsetY


                            //For kotlin this is before the body of the constructor.
                    
this.autoStepBlocks= autoStepBlocks
}


                @Throws(Exception::class)
            
    override fun gravity(velocityProperties: VelocityProperties, geographicMapInterfaceArray: Array<BasicGeographicMap?>, geographicMapCellTypeArray: Array<GeographicMapCellType?>, geographicMapCellPosition: GeographicMapCellPosition)
        //nullable = true from not(false or (false and false)) = true
{
    //var velocityProperties = velocityProperties
    //var geographicMapInterfaceArray = geographicMapInterfaceArray
    //var geographicMapCellTypeArray = geographicMapCellTypeArray
    //var geographicMapCellPosition = geographicMapCellPosition

    
                        if(geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    this.geographicMapBehavior!!.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition)

    var hasSolidBlock: Boolean = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)!!


    
                        if(!hasSolidBlock)
                        
                                    {
                                    this.gravityUtil!!.process(velocityProperties, this.gravityUtil!!.GAME_GRAVITY_VELOCITY)
velocityProperties!!.limitXYToForwardAndReverseMaxVelocity()
this.gravity()

                                    }
                                
                        else {
                            
                        }
                            

                                    }
                                
}


                @Throws(Exception::class)
            
    open fun get(geographicMapInterfaceArray: Array<BasicGeographicMap?>, geographicMapCellPositionList: BasicArrayList, layer: AllBinaryLayer, x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
: BasicArrayList{
    //var geographicMapInterfaceArray = geographicMapInterfaceArray
    //var geographicMapCellPositionList = geographicMapCellPositionList
    //var layer = layer
    //var x = x
    //var y = y

    var customGameLayer: GDCustomGameLayer = layer as GDCustomGameLayer


    var frame: Int = customGameLayer!!.getIndexedAnimationInterface()!!.getFrame()!!


    var maskRectangle: Rectangle = customGameLayer!!.rectangleArrayOfArrays[customGameLayer!!.gdObject!!.animation]!![frame]!!


    var maskPoint: GPoint = maskRectangle!!.getPoint()!!


    var viewPosition: ViewPositionBase = customGameLayer!!.getViewPosition()!!


    var viewX: Int = viewPosition!!.getX()!!


    var viewY: Int = viewPosition!!.getY()!!


    var xCellPosition: Int = viewX +maskPoint!!.getX() + -x


    var yCellPosition: Int = viewY +maskPoint!!.getY() + -y


    var x2CellPosition: Int = viewX +maskPoint!!.getX() + -x +maskRectangle!!.getWidth()


    var y2CellPosition: Int = viewY +maskPoint!!.getY() + -y +maskRectangle!!.getHeight()




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return geographicMapInterfaceArray[0]!!.getCellPositionAtNoThrow(xCellPosition, yCellPosition, x2CellPosition, y2CellPosition, geographicMapCellPositionList)
}


                @Throws(Exception::class)
            
    open fun getLeftPosition(geographicMapInterfaceArray: Array<BasicGeographicMap?>, layer: AllBinaryLayer)
        //nullable = true from not(false or (false and false)) = true
: GeographicMapCellPosition{
    //var geographicMapInterfaceArray = geographicMapInterfaceArray
    //var layer = layer

    var customGameLayer: GDCustomGameLayer = layer as GDCustomGameLayer


    var frame: Int = customGameLayer!!.getIndexedAnimationInterface()!!.getFrame()!!


    var maskRectangle: Rectangle = customGameLayer!!.rectangleArrayOfArrays[customGameLayer!!.gdObject!!.animation]!![frame]!!


    var maskPoint: GPoint = maskRectangle!!.getPoint()!!


    var viewPosition: ViewPositionBase = customGameLayer!!.getViewPosition()!!


    var viewX: Int = viewPosition!!.getX()!!


    var viewY: Int = viewPosition!!.getY()!!


    var xCellPosition: Int = viewX +maskPoint!!.getX()


    var yCellPosition: Int = viewY +maskPoint!!.getY() +maskRectangle!!.getHeight()




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return geographicMapInterfaceArray[0]!!.getCellPositionAtXYNoThrow(xCellPosition, yCellPosition)
}


                @Throws(Exception::class)
            
    open fun getRightPosition(geographicMapInterfaceArray: Array<BasicGeographicMap?>, layer: AllBinaryLayer)
        //nullable = true from not(false or (false and false)) = true
: GeographicMapCellPosition{
    //var geographicMapInterfaceArray = geographicMapInterfaceArray
    //var layer = layer

    var customGameLayer: GDCustomGameLayer = layer as GDCustomGameLayer


    var frame: Int = customGameLayer!!.getIndexedAnimationInterface()!!.getFrame()!!


    var maskRectangle: Rectangle = customGameLayer!!.rectangleArrayOfArrays[customGameLayer!!.gdObject!!.animation]!![frame]!!


    var maskPoint: GPoint = maskRectangle!!.getPoint()!!


    var viewPosition: ViewPositionBase = customGameLayer!!.getViewPosition()!!


    var viewX: Int = viewPosition!!.getX()!!


    var viewY: Int = viewPosition!!.getY()!!


    var xCellPosition: Int = viewX +maskPoint!!.getX() +maskRectangle!!.getWidth()


    var yCellPosition: Int = viewY +maskPoint!!.getY() +maskRectangle!!.getHeight()




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return geographicMapInterfaceArray[0]!!.getCellPositionAtXYNoThrow(xCellPosition, yCellPosition)
}


                @Throws(Exception::class)
            
    override fun getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray: Array<BasicGeographicMap?>, geographicMapCellTypeArray: Array<GeographicMapCellType?>, velocityProperties: VelocityProperties, layer: AllBinaryLayer, x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
: GeographicMapCellPosition{
    //var geographicMapInterfaceArray = geographicMapInterfaceArray
    //var geographicMapCellTypeArray = geographicMapCellTypeArray
    //var velocityProperties = velocityProperties
    //var layer = layer
    //var x = x
var y = y

    var geographicMapCellPositionList: BasicArrayList = this.unsafeGeographicMapCellPositionList

this.get(geographicMapInterfaceArray, geographicMapCellPositionList, layer, x, y)

    var geographicMapCellPosition: GeographicMapCellPosition = this.getGeographicMapCellPositionFromListIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPositionList, velocityProperties, layer)!!


    
                        if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION

                                    }
                                
                        else {
                            
                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return geographicMapCellPosition
}


                @Throws(Exception::class)
            
    override fun getGeographicMapCellPositionFromListIfNotSolidBlockOrOffMap(geographicMapInterfaceArray: Array<BasicGeographicMap?>, geographicMapCellTypeArray: Array<GeographicMapCellType?>, geographicMapCellPositionList: BasicArrayList, velocityProperties: VelocityProperties, layer: AllBinaryLayer)
        //nullable = true from not(false or (false and false)) = true
: GeographicMapCellPosition{
    //var geographicMapInterfaceArray = geographicMapInterfaceArray
    //var geographicMapCellTypeArray = geographicMapCellTypeArray
    //var geographicMapCellPositionList = geographicMapCellPositionList
    //var velocityProperties = velocityProperties
    //var layer = layer
this.unsafePossibleGeographicMapCellPositionList!!.clear()

    
                        if(geographicMapCellPositionList!!.size() > 0)
                        
                                    {
                                    
    var size: Int = geographicMapCellPositionList!!.size()!!





                        for (index in 0 until size)

        {

    var possibleStepGeographicMapCellPosition: GeographicMapCellPosition = geographicMapCellPositionList!!.get(index) as GeographicMapCellPosition


    var tiledLayer: AllBinaryTiledLayer = geographicMapInterfaceArray[0]!!.getAllBinaryTiledLayer()!!


    
                        if(possibleStepGeographicMapCellPosition!!.getColumn() > 0 && possibleStepGeographicMapCellPosition!!.getRow() > 0 && possibleStepGeographicMapCellPosition!!.getColumn() < tiledLayer!!.getColumns() && possibleStepGeographicMapCellPosition!!.getRow() < tiledLayer!!.getRows())
                        
                                    {
                                    this.geographicMapBehavior!!.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition)

    var hasSolidBlock: Boolean = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)!!


    var hasOffMap: Boolean = this.isOffMap(geographicMapInterfaceArray, geographicMapCellTypeArray)!!


    
                        if(hasSolidBlock || hasOffMap)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION

                                    }
                                
                        else {
                            this.unsafePossibleGeographicMapCellPositionList!!.add(possibleStepGeographicMapCellPosition)

                        }
                            

                                    }
                                
}


    
                        if(this.unsafePossibleGeographicMapCellPositionList!!.size() > 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.unsafePossibleGeographicMapCellPositionList!!.get(0) as GeographicMapCellPosition

                                    }
                                

                                    }
                                
                        else {
                            
                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION
}


                @Throws(Exception::class)
            
    override fun moveAndLand(geographicMapInterfaceArray: Array<BasicGeographicMap?>, geographicMapCellTypeArray: Array<GeographicMapCellType?>, geographicMapCellPosition: GeographicMapCellPosition, velocityProperties: VelocityProperties, layer: AllBinaryLayer, x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var geographicMapInterfaceArray = geographicMapInterfaceArray
    //var geographicMapCellTypeArray = geographicMapCellTypeArray
    //var geographicMapCellPosition = geographicMapCellPosition
    //var velocityProperties = velocityProperties
    //var layer = layer
    //var x = x
    //var y = y

    
                        if(geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    layer = layerlayer as TopViewCharacterInterface
layer.
                    terrainMove(geographicMapInterfaceArray, geographicMapCellTypeArray, x, y)

                                    }
                                
                        else {
                            
                        }
                            
}


                @Throws(Exception::class)
            
    override fun move(geographicMapInterfaceArray: Array<BasicGeographicMap?>, geographicMapCellTypeArray: Array<GeographicMapCellType?>, velocityProperties: VelocityProperties, layer: AllBinaryLayer, x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var geographicMapInterfaceArray = geographicMapInterfaceArray
    //var geographicMapCellTypeArray = geographicMapCellTypeArray
    //var velocityProperties = velocityProperties
    //var layer = layer
    //var x = x
    //var y = y

    var geographicMapCellPosition: GeographicMapCellPosition = this.getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(geographicMapInterfaceArray, geographicMapCellTypeArray, velocityProperties, layer, x, y)!!

this.moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y)

    
                        if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                        }
                            
}


                @Throws(Exception::class)
            
    override fun left(geographicMapInterfaceArray: Array<BasicGeographicMap?>, geographicMapCellTypeArray: Array<GeographicMapCellType?>, velocityProperties: VelocityProperties, layer: AllBinaryLayer)
        //nullable = true from not(false or (false and false)) = true
{
    //var geographicMapInterfaceArray = geographicMapInterfaceArray
    //var geographicMapCellTypeArray = geographicMapCellTypeArray
    //var velocityProperties = velocityProperties
    //var layer = layer

    var geographicMapCellPosition: GeographicMapCellPosition = this.getLeftPosition(geographicMapInterfaceArray, layer)!!


    
                        if(geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    
    var possibleStepGeographicMapCellPosition: GeographicMapCellPosition = geographicMapInterfaceArray[0]!!.getGeographicMapCellPositionFactory()!!.getAt(geographicMapCellPosition!!.getColumn(), geographicMapCellPosition!!.getRow() -1)!!

this.geographicMapBehavior!!.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition)

    var hasSolidBlock: Boolean = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)!!


    
                        if(hasSolidBlock)
                        
                                    {
                                    
    
                        if(this.autoStepBlocks)
                        
                                    {
                                    layer = layerlayer as TopViewCharacterInterface
layer.
                    leftp()

                                    }
                                
                        else {
                            velocityProperties!!.getVelocityXBasicDecimalP()!!.setint(0)

                        }
                            

                                    }
                                
                        else {
                            layer = layerlayer as TopViewCharacterInterface
layer.
                    leftp()

                        }
                            

                                    }
                                
}


                @Throws(Exception::class)
            
    override fun right(geographicMapInterfaceArray: Array<BasicGeographicMap?>, geographicMapCellTypeArray: Array<GeographicMapCellType?>, velocityProperties: VelocityProperties, layer: AllBinaryLayer)
        //nullable = true from not(false or (false and false)) = true
{
    //var geographicMapInterfaceArray = geographicMapInterfaceArray
    //var geographicMapCellTypeArray = geographicMapCellTypeArray
    //var velocityProperties = velocityProperties
    //var layer = layer

    var geographicMapCellPosition: GeographicMapCellPosition = this.getRightPosition(geographicMapInterfaceArray, layer)!!


    
                        if(geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION)
                        
                                    {
                                    
    var possibleStepGeographicMapCellPosition: GeographicMapCellPosition = geographicMapInterfaceArray[0]!!.getGeographicMapCellPositionFactory()!!.getAt(geographicMapCellPosition!!.getColumn(), geographicMapCellPosition!!.getRow() -1)!!

this.geographicMapBehavior!!.getCellTypeAt(geographicMapInterfaceArray, geographicMapCellTypeArray, possibleStepGeographicMapCellPosition)

    var hasSolidBlock: Boolean = this.hasSolidBlock(geographicMapInterfaceArray, geographicMapCellTypeArray)!!


    
                        if(hasSolidBlock)
                        
                                    {
                                    
    
                        if(this.autoStepBlocks)
                        
                                    {
                                    layer = layerlayer as TopViewCharacterInterface
layer.
                    rightp()

                                    }
                                
                        else {
                            velocityProperties!!.getVelocityXBasicDecimalP()!!.setint(0)

                        }
                            

                                    }
                                
                        else {
                            layer = layerlayer as TopViewCharacterInterface
layer.
                    rightp()

                        }
                            

                                    }
                                
}


}
                
            

