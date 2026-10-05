
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.graphics.color.BasicColor
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.graphics.color.BasicColorUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDLayer
            : Object
         {
        

    val name: String

    val isVisible: Boolean= false

    val isLightingLayer: Boolean= false

    val followBaseLayerCamera: Boolean= false

    val ambientLightBasicColor: BasicColor

    val cameraList: BasicArrayList = BasicArrayListD()

    val effectsList: BasicArrayList = BasicArrayListD()
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!


    
                        if(jsonObject!!.has(gdProjectStrings!!.NAME))
                        
                                    {
                                    this.name= jsonObject!!.getString(gdProjectStrings!!.NAME)

                                    }
                                
                        else {
                            this.name= Integer.toHexString(this.hashCode())

                        }
                            

    
                        if(jsonObject!!.has(gdProjectStrings!!.VISIBILITY))
                        
                                    {
                                    this.isVisible= jsonObject!!.getBoolean(gdProjectStrings!!.VISIBILITY)

                                    }
                                
                        else {
                            this.isVisible= false

                        }
                            

    
                        if(jsonObject!!.has(gdProjectStrings!!.VISIBILITY))
                        
                                    {
                                    this.isLightingLayer= jsonObject!!.getBoolean(gdProjectStrings!!.IS_LIGHTING_LAYER)

                                    }
                                
                        else {
                            this.isLightingLayer= false

                        }
                            

    
                        if(jsonObject!!.has(gdProjectStrings!!.FOLLOW_BASE_LAYER_CAMERA))
                        
                                    {
                                    this.followBaseLayerCamera= jsonObject!!.getBoolean(gdProjectStrings!!.FOLLOW_BASE_LAYER_CAMERA)

                                    }
                                
                        else {
                            this.followBaseLayerCamera= false

                        }
                            

    
                        if(jsonObject!!.has(gdProjectStrings!!.AMBIENT_LIGHT_COLOR_R))
                        
                                    {
                                    this.ambientLightBasicColor= BasicColorFactory.getInstance()!!.createInstanceARGB(BasicColorUtil.getInstance()!!.ALPHA, jsonObject!!.getInt(gdProjectStrings!!.AMBIENT_LIGHT_COLOR_R), jsonObject!!.getInt(gdProjectStrings!!.AMBIENT_LIGHT_COLOR_G), jsonObject!!.getInt(gdProjectStrings!!.AMBIENT_LIGHT_COLOR_B), this.name)

                                    }
                                
                        else {
                            this.ambientLightBasicColor= 
                                        null
                                    

                        }
                            

    
                        if(jsonObject!!.has(gdProjectStrings!!.CAMERAS))
                        
                                    {
                                    
    var camerasJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.CAMERAS)!!


    var size: Int = camerasJSONArray!!.length()!!


    var nextJSONObject: JSONObject





                        for (index in 0 until size)

        {
nextJSONObject= camerasJSONArray!!.getJSONObject(index)
this.cameraList!!.add(GDLayer(nextJSONObject))
}


                                    }
                                
}


}
                
            

