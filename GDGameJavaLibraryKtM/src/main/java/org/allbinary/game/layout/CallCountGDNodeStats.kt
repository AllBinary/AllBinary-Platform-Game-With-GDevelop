
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
        
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.string.CommonSeps

open public class CallCountGDNodeStats
            : Object
         {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val TOTAL_CALLS: String = "total calls: "

    private val SIZE: Int = 16

    private val totalCalls: Array<LongArray?> = Array(this.SIZE) { LongArray(15000) }

    open fun reset()
        //nullable = true from not(false or (false and true)) = true
{




                        for (index2 in 0 until this.SIZE)

        {




                        for (index in 0 until 15000)

        {
this.totalCalls[index2]!![index]= 0
}

}

}


    open fun push(index: Int, name: Int)
        //nullable = true from not(false or (false and false)) = true
{
var index = index
var name = name
this.totalCalls[index]!![name]++
}


    open fun log(stringBuilder: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var stringBuilder = stringBuilder

    var commonStrings: CommonStrings = CommonStrings.getInstance()!!


    var commonSeps: CommonSeps = CommonSeps.getInstance()!!

stringBuilder!!.delete(0, stringBuilder!!.length())
stringBuilder!!.append(this.TOTAL_CALLS)




                        for (index in 0 until this.SIZE)

        {




                        for (index2 in 0 until 15000)

        {

    
                        if(this.totalCalls[index]!![index2] > 20)
                        
                                    {
                                    stringBuilder!!.appendint(index)
stringBuilder!!.append(commonSeps!!.COLON)
stringBuilder!!.appendint(index2)
stringBuilder!!.append(commonSeps!!.COLON)
stringBuilder!!.appendlong(this.totalCalls[index]!![index2]!!)

                                    }
                                
}

}

stringBuilder!!.append(commonSeps!!.NEW_LINE)

    
                        if(stringBuilder!!.length() > this.TOTAL_CALLS.length +1)
                        
                                    {
                                    this.logUtil!!.putF(stringBuilder!!.toString(), this, commonStrings!!.PROCESS)

                                    }
                                
}


}
                
            

