
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
        
import org.allbinary.input.motion.button.TouchScreenFactory
import org.allbinary.input.motion.button.BaseTouchInput
import org.allbinary.input.gyro.SensorGameUpdateProcessor

open public class GDGameNeededTouchButtonsBuilder
            : Object
         {
        
companion object {
            
    open fun getInstance(sensorGameUpdateProcessor: SensorGameUpdateProcessor)
        //nullable =  from not(true or (false and false)) = 
: BaseTouchInput{
var sensorGameUpdateProcessor = sensorGameUpdateProcessor

    
                        if(sensorGameUpdateProcessor!!.isAnySensor())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameNeededWithSensorTouchButtonsBuilder()

                                    }
                                
                             else 
    
                        if(TouchScreenFactory.getInstance()!!.isMultiTouch())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameNeededMultiTouchButtonsBuilder()

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameNeededMultiTouchButtonsBuilder()

                        }
                            
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
}
                
            

