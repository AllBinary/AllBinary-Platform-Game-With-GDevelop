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
import org.allbinary.game.gd.resource.GDGameThreedJ2SEWithSWTJOGLEarlyResourceInitialization;
import org.allbinary.game.resource.GDThreedEarlyResourceInitializationFactory;
import org.allbinary.graphics.opengles.OpenGLFeatureFactory;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonStrings;

import org.microemu.opengles.device.PlatformOpenGLESGraphicsFactory;

/**
 *
 * @author User
 */
public class NativeBareMain {
    //protected final LogUtil logUtil = LogUtil.getInstance();

    public static void main(final String args[]) {
        
        if(ByteOrder.nativeOrder() == ByteOrder.BIG_ENDIAN) {
            System.out.println("ByteOrder:BIG_ENDIAN");
        } else {
            System.out.println("ByteOrder:LITTLE_ENDIAN");
        }        
        
        final Features features = Features.getInstance();

        final OpenGLFeatureFactory openGLFeatureFactory = OpenGLFeatureFactory.getInstance();
        
        try {
            
            //features.addDefault(openGLFeatureFactory.OPENGL_2D);
            features.addDefault(openGLFeatureFactory.OPENGL_2D_AND_3D);
            //features.addDefault(openGLFeatureFactory.OPENGL_3D);
            //features.addDefault(openGLFeatureFactory.OPENGL_SIMPLE_OBJECT3D_PROCESSOR);
            //features.addDefault(openGLFeatureFactory.OPENGL_SIMPLE_TEXTURE_PROCESSOR);

            OpenGLESGraphicsCompositeFactory.getInstance().set(new PlatformOpenGLESGraphicsFactory());
            //OpenGLESGraphicsFactory.getInstance().set(new PlatformDisplayMin3dGraphicsFactory());

            GDThreedEarlyResourceInitializationFactory.getInstance().list.add(new GDGameThreedJ2SEWithSWTJOGLEarlyResourceInitialization());
            
        } catch(Exception e) {
            final LogUtil logUtil = LogUtil.getInstance();
            final CommonStrings commonStrings = CommonStrings.getInstance();
            logUtil.put(commonStrings.EXCEPTION, features, commonStrings.PROCESS, e);
        }
        
        BareMain.main2(args, "GDGame", "/gd_icon.ico");
    }

}
