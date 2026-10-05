
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2025 AllBinary 
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
        package org.allbinary.game.layout




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        

open public class OffsetBehavior : BaseOffsetBehavior {
        
companion object {
            
    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: OffsetBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return OffsetBehavior.instance
}


    private val instance: OffsetBehavior = OffsetBehavior()

        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    override fun PointX(value: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var value = value



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value
}


    override fun PointY(value: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var value = value



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value
}


}
                
            

