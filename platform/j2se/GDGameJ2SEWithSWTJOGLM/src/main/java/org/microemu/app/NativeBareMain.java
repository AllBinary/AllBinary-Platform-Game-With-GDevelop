/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
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
package org.microemu.app;

import java.nio.ByteOrder;

import org.allbinary.device.OpenGLESGraphicsCompositeFactory;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.CommonStrings;
import org.microemu.opengles.device.PlatformOpenGLESGraphicsFactory;

/**
 *
 * @author User
 */
public class NativeBareMain {

    public static void main(final String args[]) {
        
        if(ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN) {
            System.out.println("ByteOrder:BIG_ENDIAN");
        } else {
            System.out.println("ByteOrder:LITTLE_ENDIAN");
        }        
        
        final Features features = Features.getInstance();

        final OpenGLFeatureFactory openGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        
        try {
            
            features.addDefault(openGLFeatureFactory.OPENGL_2D);
            //features.addDefault(openGLFeatureFactory.OPENGL_SIMPLE_OBJECT3D_PROCESSOR);
            //features.addDefault(openGLFeatureFactory.OPENGL_SIMPLE_TEXTURE_PROCESSOR);

            OpenGLESGraphicsCompositeFactory.getInstance().set(new PlatformOpenGLESGraphicsFactory());
            //OpenGLESGraphicsFactory.getInstance().set(new PlatformDisplayMin3dGraphicsFactory());
            
        } catch(Exception e) {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, features, CommonStrings.getInstance().PROCESS, e));
        }
        
        BareMain.main2(args, "GDGameMIDlet", "/gd_icon.ico", 1366, 768, false, false);
    }

}
