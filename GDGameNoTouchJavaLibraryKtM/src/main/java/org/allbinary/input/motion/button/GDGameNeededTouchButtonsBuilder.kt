
        /*
                * 
                *  AllBinary Open License Version 1
                *  Copyright (c) 2011 AllBinary
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
        package org.allbinary.input.motion.button




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.input.motion.button.BaseTouchInput
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogFactory
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.input.gyro.SensorGameUpdateProcessor

open public class GDGameNeededTouchButtonsBuilder : BaseTouchInput {
        
companion object {
            
    private val instance: GDGameNeededTouchButtonsBuilder = GDGameNeededTouchButtonsBuilder()

    open fun getInstance(sensorGameUpdateProcessor: SensorGameUpdateProcessor)
        //nullable =  from not(true or (false and false)) = 
: BaseTouchInput{
var sensorGameUpdateProcessor = sensorGameUpdateProcessor



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    open fun build()
        //nullable = true from not(false or (false and true)) = true
{
logUtil!!.putF(commonStrings!!.START, this, "build")
}


}
                
            

