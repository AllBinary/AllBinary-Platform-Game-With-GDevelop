
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json.event.builtin




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.json.GDProjectStrings
import org.allbinary.gdevelop.json.event.GDEvent
import org.json.JSONObject

open public class GDCommentEvent : GDEvent {
        

    val r: Int

    val g: Int

    val b: Int

    val textR: Int

    val textG: Int

    val textB: Int

    val comment1: String

    val comment2: String
public constructor (type: String, jsonObject: JSONObject)                        

                            : super(type, jsonObject){
    //var type = type
    //var jsonObject = jsonObject


                            //For kotlin this is before the body of the constructor.
                    

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!


    var colorJSONObject: JSONObject = jsonObject!!.getJSONObject(gdProjectStrings!!.COLOR)!!

this.r= colorJSONObject!!.getInt(gdProjectStrings!!.R)
this.g= colorJSONObject!!.getInt(gdProjectStrings!!.G)
this.b= colorJSONObject!!.getInt(gdProjectStrings!!.B)
this.textR= colorJSONObject!!.getInt(gdProjectStrings!!.TEXT_R)
this.textG= colorJSONObject!!.getInt(gdProjectStrings!!.TEXT_G)
this.textB= colorJSONObject!!.getInt(gdProjectStrings!!.TEXT_B)
this.comment1= jsonObject!!.getString(gdProjectStrings!!.COMMENT)

    
                        if(jsonObject!!.has(gdProjectStrings!!.COMMENT2))
                        
                                    {
                                    this.comment2= jsonObject!!.getString(gdProjectStrings!!.COMMENT2)

                                    }
                                
                        else {
                            this.comment2= 
                                        null
                                    

                        }
                            
}


}
                
            

