
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
        package org.allbinary.game.layout




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.logic.string.StringMaker

open public class GDNodeStatsFactory : BaseGDNodeStats {
        
companion object {
            
    private val instance: BaseGDNodeStats = BaseGDNodeStats()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: BaseGDNodeStats{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDNodeStatsFactory.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    private val callCountGDNodeStats: CallCountGDNodeStats = CallCountGDNodeStats()

    private val callStackGDNodeStats: CallStackGDNodeStats = CallStackGDNodeStats()

    override fun reset()
        //nullable = true from not(false or (false and true)) = true
{
this.callCountGDNodeStats!!.reset()
this.callStackGDNodeStats!!.reset()
}


    override fun push(index: Int, name: Int)
        //nullable = true from not(false or (false and false)) = true
{
var index = index
var name = name
this.callCountGDNodeStats!!.push(index, name)
this.callStackGDNodeStats!!.push(index, name)
}


    override fun log(stringBuilder: StringMaker, anyType: Any)
        //nullable = true from not(false or (false and false)) = true
{
    //var stringBuilder = stringBuilder
    //var anyType = anyType
this.callCountGDNodeStats!!.log(stringBuilder)
this.callStackGDNodeStats!!.log(stringBuilder, anyType)
}


}
                
            

