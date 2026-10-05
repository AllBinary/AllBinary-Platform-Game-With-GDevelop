
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
        
import org.allbinary.animation.Animation
import org.allbinary.game.layer.AllBinaryThreedVisibleTiledLayer
import org.allbinary.game.layer.AllBinaryTiledLayer
import org.allbinary.media.graphics.geography.map.racetrack.AllBinaryTiledLayerFactoryInterface
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackData
import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackInfo
import org.allbinary.media.graphics.geography.map.racetrack.threed.RaceTrackThreedData
import org.allbinary.media.graphics.geography.map.racetrack.threed.ThreedTiledLayerResourcesFactory

open public class GDTiledLayerFactory
            : Object
        
                , AllBinaryTiledLayerFactoryInterface {
        

    private var useAsMiniAllBinaryTiledLayer: AllBinaryTiledLayer
public constructor ()
            : super()
        {
}


                @Throws(Exception::class)
            
    open fun getInstance(raceTrackInfo: RaceTrackInfo, raceTrackData: RaceTrackData)
        //nullable =  from not(true or (false and false)) = 
: AllBinaryTiledLayer{
    //var raceTrackInfo = raceTrackInfo
    //var raceTrackData = raceTrackData

    var raceTrackThreedData: RaceTrackThreedData = ThreedTiledLayerResourcesFactory.getInstance()!!.getInstance(raceTrackInfo!!.getId())!!


    var animationInterfaceArray: Array<Animation?> = raceTrackThreedData!!.getAnimationArray()!!


    var columns: Int = raceTrackData!!.getMapArray()[0]!!.length


    var rows: Int = raceTrackData!!.getMapArray()!!.length


    var width: Int = columns *raceTrackData!!.getCellWidth()


    var height: Int = rows *raceTrackData!!.getCellHeight()

this.useAsMiniAllBinaryTiledLayer= AllBinaryThreedVisibleTiledLayer(raceTrackData!!.getId(), raceTrackData!!.getMapArray(), animationInterfaceArray, columns, rows, width, height, raceTrackData!!.getCellWidth(), raceTrackData!!.getCellHeight(), 9)



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
                
            

