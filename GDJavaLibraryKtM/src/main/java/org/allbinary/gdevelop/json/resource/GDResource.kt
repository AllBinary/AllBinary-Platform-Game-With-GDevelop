
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json.resource




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.json.GDProjectStrings
import org.allbinary.logic.string.StringUtil
import org.json.JSONObject

open public class GDResource
            : Object
         {
        

    val kind: String

    val name: String

    val metadata: String

    val originName: String

    val originIdentifier: String

    val userAdded: Boolean

    val fileAsString: String
public constructor (kind: String, jsonObject: JSONObject)
            : super()
        {
    //var kind = kind
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.kind= kind
this.name= jsonObject!!.getString(gdProjectStrings!!.NAME)
this.metadata= jsonObject!!.getString(gdProjectStrings!!.METADATA)
this.userAdded= jsonObject!!.getBoolean(gdProjectStrings!!.USER_ADDED)

    
                        if(jsonObject!!.has(gdProjectStrings!!.ORIGIN))
                        
                                    {
                                    
    var originJSONObject: JSONObject = jsonObject!!.getJSONObject(gdProjectStrings!!.ORIGIN)!!

this.originName= originJSONObject!!.getString(gdProjectStrings!!.NAME)
this.originIdentifier= originJSONObject!!.getString(gdProjectStrings!!.IDENTIFIER)

                                    }
                                
                        else {
                            this.originName= StringUtil.getInstance()!!.NULL_STRING
this.originIdentifier= StringUtil.getInstance()!!.NULL_STRING

                        }
                            
this.fileAsString= jsonObject!!.getString(gdProjectStrings!!.FILE)
}


}
                
            

