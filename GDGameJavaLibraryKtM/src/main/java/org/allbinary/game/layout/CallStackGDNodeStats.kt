
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

open public class CallStackGDNodeStats
            : Object
         {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val SIZE: Int = 16

    private val callStack: Array<IntArray?> = Array(this.SIZE) { IntArray(6000) }

    private var total: Int = 0

    open fun reset()
        //nullable = true from not(false or (false and true)) = true
{




                        for (index2 in 0 until this.SIZE)

        {




                        for (index in 0 until this.total)

        {
this.callStack[index2]!![index]= 0
}

}

this.total= 0
}


    open fun push(index: Int, name: Int)
        //nullable = true from not(false or (false and false)) = true
{
var index = index
var name = name
this.callStack[index]!![this.total++]= name
}


    open fun log(stringBuilder: StringMaker, anyType: Any)
        //nullable = true from not(false or (false and false)) = true
{
    //var stringBuilder = stringBuilder
    //var anyType = anyType

    var commonStrings: CommonStrings = CommonStrings.getInstance()!!


    var commonSeps: CommonSeps = CommonSeps.getInstance()!!

stringBuilder!!.delete(0, stringBuilder!!.length())




                        for (index2 in 0 until this.total)

        {




                        for (index in 0 until this.SIZE)

        {

    
                        if(this.callStack[index]!![index2] != 0)
                        
                                    {
                                    stringBuilder!!.appendint(index2)
stringBuilder!!.append(commonSeps!!.COLON)
stringBuilder!!.appendint(index)
stringBuilder!!.append(commonSeps!!.COLON)
stringBuilder!!.appendint(this.callStack[index]!![index2]!!)
stringBuilder!!.append(commonSeps!!.SEMICOLON)

    
                        if(stringBuilder!!.length() > 256)
                        
                                    {
                                    this.logUtil!!.putF(stringBuilder!!.toString(), anyType, commonStrings!!.PROCESS)
stringBuilder!!.delete(0, stringBuilder!!.length())

                                    }
                                

                                    }
                                
}

}


    
                        if(stringBuilder!!.length() > 0)
                        
                                    {
                                    this.logUtil!!.putF(stringBuilder!!.toString(), anyType, commonStrings!!.PROCESS)

                                    }
                                
}


}
                
            

