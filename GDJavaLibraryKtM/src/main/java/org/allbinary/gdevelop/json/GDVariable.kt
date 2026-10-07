
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
        
import org.allbinary.logic.string.StringUtil
import org.allbinary.util.ABHashMap
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONArray
import org.json.JSONObject

open public class GDVariable
            : Object
         {
        

    val type: String

    val string: String

    val value: Double

    val boolValue: Boolean

    val childVariableMap: ABHashMap<String, GDVariable> = ABHashMap<String, GDVariable>()

    val childVariableList: BasicArrayList = BasicArrayListD()
public constructor (jsonObject: JSONObject)
            : super()
        {
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!


    var typeFactory: GDTypeFactory = GDTypeFactory.getInstance()!!

this.type= typeFactory!!.get(jsonObject!!.getString(gdProjectStrings!!.TYPE))

    var string: String


    var value: Double


    var boolValue: Boolean


    
                        if(typeFactory!!.isPrimitive(this.type))
                        
                                    {
                                    
    
                        if(this.type == typeFactory!!.STRING)
                        
                                    {
                                    string= jsonObject!!.getString(gdProjectStrings!!.VALUE)
value= 0.toDouble()
boolValue= false

                                    }
                                
                             else 
    
                        if(this.type == typeFactory!!.NUMBER)
                        
                                    {
                                    string= StringUtil.getInstance()!!.EMPTY_STRING
value= jsonObject!!.getDouble(gdProjectStrings!!.VALUE)
boolValue= false

                                    }
                                
                             else 
    
                        if(this.type == typeFactory!!.BOOLEAN)
                        
                                    {
                                    string= StringUtil.getInstance()!!.EMPTY_STRING
value= 0.toDouble()
boolValue= jsonObject!!.getBoolean(gdProjectStrings!!.VALUE)

                                    }
                                
                        else {
                            string= StringUtil.getInstance()!!.EMPTY_STRING
value= 0.toDouble()
boolValue= false

                        }
                            

                                    }
                                
                        else {
                            string= StringUtil.getInstance()!!.EMPTY_STRING
value= 0.toDouble()
boolValue= false

    
                        if(jsonObject!!.has(gdProjectStrings!!.CHILDREN))
                        
                                    {
                                    
    var variableJSONArray: JSONArray = jsonObject!!.getJSONArray(gdProjectStrings!!.CHILDREN)!!


    var size: Int = variableJSONArray!!.length()


    var childJSONObject: JSONObject





                        for (index in 0 until size)

        {
childJSONObject= variableJSONArray!!.getJSONObject(index)

    
                        if(this.type == typeFactory!!.STRUCTURE)
                        
                                    {
                                    this.childVariableMap!!.put(childJSONObject!!.getString(gdProjectStrings!!.NAME), GDVariable(childJSONObject))

                                    }
                                
                             else 
    
                        if(this.type == typeFactory!!.ARRAY)
                        
                                    {
                                    this.childVariableList!!.add(GDVariable(childJSONObject))

                                    }
                                
}


                                    }
                                

                        }
                            
this.string= string
this.value= value
this.boolValue= boolValue
}


}
                
            

