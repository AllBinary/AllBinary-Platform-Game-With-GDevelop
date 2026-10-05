
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
        
import org.allbinary.gdevelop.json.event.GDExpression
import org.allbinary.logic.string.StringUtil
import org.json.JSONObject

open public class GDForEachEvent : GDStandardEvent {
        

    val objectsToPickExpression: GDExpression

    val objectsToPickSelected: Boolean
public constructor (type: String, jsonObject: JSONObject)                        

                            : super(type, jsonObject){
    //var type = type
    //var jsonObject = jsonObject


                            //For kotlin this is before the body of the constructor.
                    
this.objectsToPickExpression= GDExpression(StringUtil.getInstance()!!.EMPTY_STRING)
this.objectsToPickSelected= false
}


}
                
            

