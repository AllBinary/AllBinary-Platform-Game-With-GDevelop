
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
        package org.allbinary.game.map




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Image
import javax.microedition.lcdui.game.TiledLayer
import org.allbinary.game.layer.AllBinaryTiledLayer
import org.allbinary.game.layer.PlacementAllBinaryJ2METiledLayer
import org.allbinary.graphics.color.BasicColor
import org.allbinary.logic.math.SmallIntegerSingletonFactory
import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo
import org.mapeditor.core.TileLayer
import org.mapeditor.core.TiledMap

open public class GDTiledLayerFactory
            : Object
        
                , AllBinaryTiledLayerFactoryInterface {
        

    private val tileLayer: TileLayer

    private val map: TiledMap

    private val tileSetImage: Image

    private val debugColor: BasicColor

    private var useAsMiniAllBinaryTiledLayer: AllBinaryTiledLayer
public constructor (tileLayer: TileLayer, cellTypeIdToGeographicMapCellType: IntArray, map: TiledMap, tileSetImage: Image, debugColor: BasicColor)
            : super()
        {
    //var tileLayer = tileLayer
    //var cellTypeIdToGeographicMapCellType = cellTypeIdToGeographicMapCellType
    //var map = map
    //var tileSetImage = tileSetImage
    //var debugColor = debugColor
this.tileLayer= tileLayer
this.map= map
this.tileSetImage= tileSetImage
this.debugColor= debugColor
}


                @Throws(Exception::class)
            
    open fun getInstance(raceTrackInfo: RaceTrackInfo, raceTrackData: RaceTrackData)
        //nullable =  from not(true or (false and false)) = 
: AllBinaryTiledLayer{
    //var raceTrackInfo = raceTrackInfo
    //var raceTrackData = raceTrackData
this.useAsMiniAllBinaryTiledLayer= PlacementAllBinaryJ2METiledLayer(SmallIntegerSingletonFactory.getInstance()!!.getAt( -1), TiledLayer(this.map.getWidth(), this.map.getHeight(), this.tileSetImage, (this.map.getTileWidth()).toInt(), (this.map.getTileHeight()).toInt()), this.tileLayer!!.getMapArray(), this.debugColor!!.toInt())



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.useAsMiniAllBinaryTiledLayer
}


                @Throws(Exception::class)
            
    open fun getMiniInstance(raceTrackData: RaceTrackData)
        //nullable = true from not(false or (false and false)) = true
: AllBinaryTiledLayer{
    //var raceTrackData = raceTrackData



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.useAsMiniAllBinaryTiledLayer
}


}
                
            

