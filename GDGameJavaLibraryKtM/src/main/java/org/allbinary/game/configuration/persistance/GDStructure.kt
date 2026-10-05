
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2026 AllBinary 
                *   
                *  By agreeing to this license you and any business entity you represent are 
                *  legally bound to the AllBinary Open License Version 1 legal agreement. 
                *   
                *  You may obtain the AllBinary Open License Version 1 legal agreement from 
                *  AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
                *   
                *  Created By: Travis Berthelot    
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.game.configuration.persistance




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        

open public class GDStructure
            : Object
         {
        
companion object {
            
    private val instance: GDStructure = GDStructure()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDStructure{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDStructure.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    var Size: Int =  -1

    open fun getJSONType()
        //nullable = true from not(false or (false and true)) = true
: Int{



                            throw RuntimeException()
}


    open fun toJSONAsString()
        //nullable = true from not(false or (false and true)) = true
: String{



                            throw RuntimeException()
}


}
                
            

