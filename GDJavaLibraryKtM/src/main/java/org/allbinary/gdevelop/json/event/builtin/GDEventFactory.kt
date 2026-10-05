
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

open public class GDEventFactory
            : Object
         {
        
companion object {
            
    private val instance: GDEventFactory = GDEventFactory()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDEventFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDEventFactory.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    open fun create(jsonObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
: GDEvent{
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!


    var eventTypeFactory: GDEventTypeFactory = GDEventTypeFactory.getInstance()!!


    var type: String = jsonObject!!.getString(gdProjectStrings!!.TYPE)!!

type= eventTypeFactory!!.get(type)

    
                        if(type == eventTypeFactory!!.COMMENT)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDCommentEvent(type, jsonObject)

                                    }
                                
                             else 
    
                        if(type == eventTypeFactory!!.FOR_EACH)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDForEachEvent(type, jsonObject)

                                    }
                                
                             else 
    
                        if(type == eventTypeFactory!!.FOR_EACH_CHILD)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDForEachChildVariableEvent(type, jsonObject)

                                    }
                                
                             else 
    
                        if(type == eventTypeFactory!!.GROUP)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGroupEvent(type, jsonObject)

                                    }
                                
                             else 
    
                        if(type == eventTypeFactory!!.LINK)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDLinkEvent(type, jsonObject)

                                    }
                                
                             else 
    
                        if(type == eventTypeFactory!!.REPEAT)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDRepeatEvent(type, jsonObject)

                                    }
                                
                             else 
    
                        if(type == eventTypeFactory!!.STANDARD)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDStandardEvent(type, jsonObject)

                                    }
                                
                             else 
    
                        if(type == eventTypeFactory!!.WHILE)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDWhileEvent(type, jsonObject)

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null
}


}
                
            

