/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
* 
* By agreeing to this license you and any business entity you represent are
* legally bound to the AllBinary Open License Version 1 legal agreement.
* 
* You may obtain the AllBinary Open License Version 1 legal agreement from
* AllBinary or the root directory of AllBinary's AllBinary Platform repository.
* 
* Created By: Travis Berthelot
* 
*/
package org.allbinary.input.motion.button;

import org.allbinary.input.motion.button.BaseTouchInput;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.input.gyro.SensorGameUpdateProcessor;


public class GDGameTouchButtonsBuilder
extends BaseTouchInput
{
    private static final GDGameTouchButtonsBuilder instance = 
            new GDGameTouchButtonsBuilder();
    
    public static BaseTouchInput getInstance(
            SensorGameUpdateProcessor sensorGameUpdateProcessor)
    {
        return instance;
    }
    
    public void build()
    {
       LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, "build"));
    }
}
