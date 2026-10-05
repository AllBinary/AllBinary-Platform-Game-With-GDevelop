
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
        package org.microemu.app




        import java.lang.Object        
        
        import java.lang.System
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import java.nio.ByteOrder
import org.allbinary.device.OpenGLESGraphicsCompositeFactory
import org.allbinary.game.configuration.feature.Features
import org.allbinary.graphics.opengles.OpenGLFeatureFactory
import org.allbinary.logic.communication.log.LogFactory
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.string.CommonStrings
import org.microemu.opengles.device.PlatformOpenGLESGraphicsFactory

open public class NativeBareMain
            : Object
         {
        
companion object {
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var args = args

    
                        if(ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN)
                        
                                    {
                                    System.out.println("ByteOrder:BIG_ENDIAN")

                                    }
                                
                        else {
                            System.out.println("ByteOrder:LITTLE_ENDIAN")

                        }
                            

    var features: Features = Features.getInstance()!!


    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!!


        try {
            features.addDefault(openGLFeatureFactory!!.OPENGL_2D)
OpenGLESGraphicsCompositeFactory.getInstance()!!.set(PlatformOpenGLESGraphicsFactory())
} catch(e: Exception)
            {

    var logUtil: LogUtil = LogUtil.getInstance()!!


    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

logUtil!!.put(commonStrings!!.EXCEPTION, features, commonStrings!!.PROCESS, e)
}

BareMain.main2(args, "GDGameMIDlet", "/gd_icon.ico", 1280, 720, false, false)
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
}
                
            

