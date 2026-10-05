
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
        

open public class GDIncludeConfigFactory
            : Object
         {
        
companion object {
            
    private val instance: GDIncludeConfigFactory = GDIncludeConfigFactory()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDIncludeConfigFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDIncludeConfigFactory.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val INCLUDE_ALL: Int = 0

    val INCLUDE_EVENTS_GROUP: Int = 1

}
                
            

