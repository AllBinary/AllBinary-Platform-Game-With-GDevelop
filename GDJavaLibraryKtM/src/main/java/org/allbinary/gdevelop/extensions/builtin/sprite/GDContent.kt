
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.extensions.builtin.sprite




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.json.GDProjectStrings
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONObject

open public class GDContent
            : Object
         {
        

    val tilemapJsonFile: String

    val tilesetJsonFile: String

    val tilemapAtlasImage: String

    val displayMode: String

    val layerIndex: Int

    val levelIndex: Int

    val animationSpeedScale: Number

    val animationFps: Number

    val directionList: BasicArrayList = BasicArrayListD()
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var projectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.tilemapJsonFile= jsonObject!!.getString(projectStrings!!.TILEMAP_JSON_FILE)
this.tilesetJsonFile= jsonObject!!.getString(projectStrings!!.TILESET_JSON_FILE)
this.tilemapAtlasImage= jsonObject!!.getString(projectStrings!!.TILEMAP_ATLAS_IMAGE)
this.displayMode= jsonObject!!.getString(projectStrings!!.DISPLAY_MODE)
this.layerIndex= jsonObject!!.getInt(projectStrings!!.LAYER_INDEX)

    var levelIndex: Int = 0


    
                        if(jsonObject!!.has(projectStrings!!.LEVEL_INDEX))
                        
                                    {
                                    jsonObject!!.getInt(projectStrings!!.LEVEL_INDEX)

                                    }
                                
this.levelIndex= levelIndex
this.animationSpeedScale= jsonObject!!.getNumber(projectStrings!!.ANIMATION_SPEED_SCALE)
this.animationFps= jsonObject!!.getNumber(projectStrings!!.ANIMATION_FPS)
}


}
                
            

