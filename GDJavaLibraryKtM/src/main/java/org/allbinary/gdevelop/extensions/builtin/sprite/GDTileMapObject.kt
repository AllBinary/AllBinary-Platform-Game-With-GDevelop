
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
        
import org.allbinary.gdevelop.json.GDObject
import org.allbinary.gdevelop.json.GDProjectStrings
import org.json.JSONObject

open public class GDTileMapObject : GDObject {
        

    private val content: GDContent
public constructor (type: String, jsonObject: JSONObject)                        

                            : super(type, jsonObject){
    //var type = type
    //var jsonObject = jsonObject


                            //For kotlin this is before the body of the constructor.
                    

    var projectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!


    var contentJSONObject: JSONObject = jsonObject!!.getJSONObject(projectStrings!!.CONTENT)!!

this.content= GDContent(contentJSONObject)
}


}
                
            

