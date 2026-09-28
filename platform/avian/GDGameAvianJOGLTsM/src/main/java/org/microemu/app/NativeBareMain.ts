
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

        


            import { Object } from '../../../java/lang/Object.js';
        
            import { Exception } from '../../../java/lang/Exception.js';
        
            import { System } from '../../../java/lang/System.js';
        
import { ByteOrder } from '../../../java/nio/ByteOrder.js';
//not GWT import const ByteOrder

import { OpenGLESGraphicsCompositeFactory } from '../../../org/allbinary/device/OpenGLESGraphicsCompositeFactory.js';
//not GWT import const OpenGLESGraphicsCompositeFactory

import { Features } from '../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const Features

import { OpenGLFeatureFactory } from '../../../org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory

//not plain js import { LogFactory } 
const LogFactory = globalThis.org.allbinary.logic.communication.log.LogFactory;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

import { PlatformOpenGLESGraphicsFactory } from '../../../org/microemu/opengles/device/PlatformOpenGLESGraphicsFactory.js';
//not GWT import const PlatformOpenGLESGraphicsFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { BareMain } from './BareMain.js';
//not GWT import - same folder const BareMain

export class NativeBareMain
            extends Object
         {
        

    public static main(args: string[]){

                        if(ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN)
                        
                                    {
                                    console.log("ByteOrder:BIG_ENDIAN");
    

                                    }
                                
                        else {
                            console.log("ByteOrder:LITTLE_ENDIAN");
    

                        }
                            

    var features: Features = Features.getInstance()!;;
    

    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!;;
    

        try {
            features.addDefault(openGLFeatureFactory!.OPENGL_2D);
    
OpenGLESGraphicsCompositeFactory.getInstance()!.set(new PlatformOpenGLESGraphicsFactory());
    

                //: 
} catch(e) 
            {

    var logUtil: LogUtil = LogUtil.getInstance()!;;
    

    var commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    
logUtil!.put(commonStrings!.EXCEPTION, features, commonStrings!.PROCESS, e);
    
}

BareMain.main2(args, "GDGameMIDlet", "/gd_icon.ico", 1366, 768, false, false);
    
}


}



