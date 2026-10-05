
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
        package org.allbinary.game.map




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Image
import javax.microedition.lcdui.game.TiledLayer
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.layer.AllBinaryJ2METiledLayer
import org.allbinary.game.layer.AllBinaryTiledLayer
import org.allbinary.graphics.color.BasicColor
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
import org.allbinary.graphics.opengles.OpenGLFeatureFactory
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.math.SmallIntegerSingletonFactory
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
import org.allbinary.media.graphics.geography.map.GeographicMapCellPositionBaseFactory
import org.allbinary.media.graphics.geography.map.GeographicMapCellTypeFactory
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface
import org.allbinary.media.graphics.geography.map.racetrack.CustomMapGeneratorBaseFactory
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackFrictionProperties
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMap
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo
import org.allbinary.time.GameTickTimeDelayHelperFactory
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.mapeditor.core.Animation
import org.mapeditor.core.Frame
import org.mapeditor.core.Tile
import org.mapeditor.core.TileLayer
import org.mapeditor.core.TileSet
import org.mapeditor.core.TiledMap

open public class GDGeographicMap : RaceTrackGeographicMap {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val map: TiledMap

    private val animationTileIndexArray: IntArray

    private val startTimeFrameArray: LongArray

    private val currentFrameArray: IntArray

    private val animationArray: Array<Animation?>
public constructor (tiledLayerFactoryInterface: AllBinaryTiledLayerFactoryInterface, tileLayer: TileLayer, cellTypeIdToGeographicMapCellType: IntArray, map: TiledMap, tileSetImage: Image, geographicMapCellTypeFactory: GeographicMapCellTypeFactory, foregroundColor: BasicColor, backgroundColor: BasicColor, debugColor: BasicColor, customMapGeneratorBaseFactory: CustomMapGeneratorBaseFactory)                        

                            : super(RaceTrackInfo(SmallIntegerSingletonFactory.getInstance()!!.getAt(tileLayer!!.getId()), SmallIntegerSingletonFactory.getInstance()!!.getAt(tileLayer!!.getId())!!.toString(), RaceTrackFrictionProperties(0, 0), foregroundColor, backgroundColor, 0, 0, 0), RaceTrackData(SmallIntegerSingletonFactory.getInstance()!!.getAt(0), map.getTileWidth(), map.getTileHeight(), map.getTileWidth() /4, map.getTileHeight() /4, cellTypeIdToGeographicMapCellType, tileLayer!!.getMapArray()), tiledLayerFactoryInterface, SimpleGeographicMapCellPositionFactory(), GeographicMapCellPositionBaseFactory(), geographicMapCellTypeFactory, customMapGeneratorBaseFactory){
    //var tiledLayerFactoryInterface = tiledLayerFactoryInterface
    //var tileLayer = tileLayer
    //var cellTypeIdToGeographicMapCellType = cellTypeIdToGeographicMapCellType
    //var map = map
    //var tileSetImage = tileSetImage
    //var geographicMapCellTypeFactory = geographicMapCellTypeFactory
    //var foregroundColor = foregroundColor
    //var backgroundColor = backgroundColor
    //var debugColor = debugColor
    //var customMapGeneratorBaseFactory = customMapGeneratorBaseFactory


                            //For kotlin this is before the body of the constructor.
                    
this.map= map

    var tileList: BasicArrayList = BasicArrayListD()

this.createAnimationTiles(tileList)

    var size: Int = tileList!!.size()!!

this.animationTileIndexArray= IntArray(size)
this.startTimeFrameArray= LongArray(size)
this.currentFrameArray= IntArray(size)
this.animationArray= arrayOfNulls(size)
this.setAnimations(tileList)
}


    open fun getMap()
        //nullable = true from not(false or (false and true)) = true
: TiledMap{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.map
}


    open fun createAnimationTiles(tileList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var tileList = tileList

    var tileSetList: BasicArrayList = this.map.getTileSets()!!


    var size: Int = tileSetList!!.size()!!


    
                        if(size > 0)
                        
                                    {
                                    
    var tileSet: TileSet


    var tile: Tile


    var animation: Animation


    var tileCount: Int= 0





                        for (index in 0 until size)

        {
tileSet= tileSetList!!.get(index) as TileSet
tileCount= tileSet!!.getTilecount()




                        for (index2 in 0 until tileCount)

        {
tile= tileSet!!.getTile(index2)
animation= tile.getAnimation()

    
                        if(animation != Animation.NULL_ANIMATION)
                        
                                    {
                                    tileList!!.add(tile)

                                    }
                                
}

}


                                    }
                                
}


    open fun setAnimations(tileList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var tileList = tileList

    var features: Features = Features.getInstance()!!


    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!!


    
                        if(features.isFeature(openGLFeatureFactory!!.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory!!.OPENGL_3D))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    var size: Int = tileList!!.size()!!


    var animationTileIndex: Int= 0


    var CREATING_ANIMATION_TILE: String = "Creating AnimationTile: "


    var tile: Tile


    var animation: Animation


    var allBinaryJ2METiledLayer: AllBinaryJ2METiledLayer = this.getAllBinaryTiledLayer() as AllBinaryJ2METiledLayer


    var tiledLayer: TiledLayer = allBinaryJ2METiledLayer!!.getTiledLayer()!!





                        for (index in 0 until size)

        {
tile= tileList!!.get(index) as Tile
animationTileIndex= tiledLayer!!.createAnimatedTile(tile.getId())
this.logUtil!!.putF(CREATING_ANIMATION_TILE +animationTileIndex, this, this.commonStrings!!.PROCESS)
this.animationArray[index]= animation= tile.getAnimation()
this.animationTileIndexArray[index]= animationTileIndex
allBinaryJ2METiledLayer!!.updateCells(
                                    (getLayer as TileLayer).getMapArray(), 
                                    (get as Frame).getTileid(), animationTileIndex)
}

}


    open fun update()
        //nullable = true from not(false or (false and true)) = true
{

    var features: Features = Features.getInstance()!!


    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!!


    
                        if(features.isFeature(openGLFeatureFactory!!.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory!!.OPENGL_3D))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    var startTime: Long = GameTickTimeDelayHelperFactory.getInstance()!!.startTime


    var size: Int = this.animationArray!!.size
                


                    //Otherwise - statement - EmptyStmt


    var animation: Animation


    var frame: Frame


    var tiledLayer: TiledLayer = 
                                    (getAllBinaryTiledLayer as AllBinaryJ2METiledLayer).getTiledLayer()!!





                        for (index in 0 until size)

        {
animation= this.animationArray[index]!! as Animation
frame= animation.getFrame()!!.get(this.currentFrameArray[index]!!) as Frame

    
                        if(startTime -this.startTimeFrameArray[index] > frame.getDuration())
                        
                                    {
                                    this.startTimeFrameArray[index]= startTime
tiledLayer!!.setAnimatedTile(this.animationTileIndexArray[index]!!, frame.getTileid())

    
                        if(this.currentFrameArray[index] +1 < animation.getFrame()!!.size())
                        
                                    {
                                    this.currentFrameArray[index]++

                                    }
                                
                        else {
                            this.currentFrameArray[index]= 0

                        }
                            

                                    }
                                
}

}


    override fun reset()
        //nullable = true from not(false or (false and true)) = true
{

    var allBinaryTiledLayer: AllBinaryTiledLayer = this.getAllBinaryTiledLayer()!!


    var lastHeight: Int = GameTickDisplayInfoSingleton.getInstance()!!.getLastHeight()!!


    var y: Int =  -lastHeight +allBinaryTiledLayer!!.getHeight()

allBinaryTiledLayer!!.setPosition(0,  -y, allBinaryTiledLayer!!.getZP())
}


                @Throws(Exception::class)
            
    override fun getCellPositionAtXY(x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
: GeographicMapCellPosition{
    //var x = x
    //var y = y

    var allBinaryTiledLayer: AllBinaryTiledLayer = this.getAllBinaryTiledLayer()!!




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return super.getCellPositionAtXY(x +allBinaryTiledLayer!!.getXP(), y +allBinaryTiledLayer!!.getYP())
}


    override fun getCellPositionAtXYNoThrow(x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
: GeographicMapCellPosition{
    //var x = x
    //var y = y

    var allBinaryTiledLayer: AllBinaryTiledLayer = this.getAllBinaryTiledLayer()!!




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return super.getCellPositionAtXYNoThrow(x +allBinaryTiledLayer!!.getXP(), y +allBinaryTiledLayer!!.getYP())
}


}
                
            

