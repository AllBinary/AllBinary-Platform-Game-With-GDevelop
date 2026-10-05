
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json.event




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.json.GDProjectStrings
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDInstruction
            : Object
         {
        

    val typeValue: String

    val parametersExpressionList: BasicArrayList = BasicArrayListD()
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!


    var typeJSONObject: JSONObject = jsonObject!!.getJSONObject(gdProjectStrings!!.TYPE)!!

this.typeValue= typeJSONObject!!.getString(gdProjectStrings!!.VALUE)

    var expressionJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.PARAMETERS)!!


    var size: Int = expressionJSONArray!!.length()!!





                        for (index in 0 until size)

        {
this.parametersExpressionList!!.add(GDExpression(expressionJSONArray!!.getString(index)))
}

}


}
                
            

