
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2022 AllBinary 
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
        package org.allbinary.game.layer.special




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.layer.CollidableCompositeLayer

open public class TempGameLayerUtil
            : Object
         {
        
companion object {
            
    private val instance: TempGameLayerUtil = TempGameLayerUtil()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: TempGameLayerUtil{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return TempGameLayerUtil.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val gameLayerArray: Array<CollidableCompositeLayer?> = arrayOfNulls(5)

    open fun clear()
        //nullable = true from not(false or (false and true)) = true
{




                        for (index in 0 until 5)

        {
this.gameLayerArray[index]= 
                                        null
                                    
}

}


    open fun clear2()
        //nullable = true from not(false or (false and true)) = true
{
this.clear()
}


}
                
            

