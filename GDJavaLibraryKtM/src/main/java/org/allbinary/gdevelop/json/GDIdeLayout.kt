
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.json.JSONArray
import org.json.JSONObject

open public class GDIdeLayout
            : Object
         {
        

    val editorSettings: GDEditorSettings

    val objectsGroups: JSONArray
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!

this.editorSettings= GDEditorSettings(jsonObject!!.getJSONObject(gdProjectStrings!!.EDITOR_SETTINGS))
this.objectsGroups= jsonObject!!.getJSONArray(gdProjectStrings!!.OBJECT_GROUPS)
}


}
                
            

