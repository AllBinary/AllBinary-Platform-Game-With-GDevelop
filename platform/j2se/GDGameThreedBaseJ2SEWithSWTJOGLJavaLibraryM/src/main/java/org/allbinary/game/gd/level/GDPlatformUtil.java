/*
 * AllBinary Open License Version 1
 * Copyright (c) 2025 AllBinary
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
package org.allbinary.game.gd.level;

import javax.microedition.lcdui.Image;
import org.allbinary.game.layer.CameraLayer;
import org.allbinary.image.ImageCache;

/**
 *
 * @author User
 */
public class GDPlatformUtil {

    private static final GDPlatformUtil instance = new GDPlatformUtil();

    /**
     * @return the instance
     */
    public static GDPlatformUtil getInstance() {
        return instance;
    }
    
    public int getRange() {

//        final OperatingSystemInterface operatingSystem
//            = OperatingSystemFactory.getInstance().getOperatingSystemInstance();
//
//        int range = 3;
//
//        if (operatingSystem.isOverScan()) {
//            range = 4;
//        } else {
//            range = 3;
//        }
//
//        final Features features = Features.getInstance();
//
//        final OpenGLFeatureFactory openGLFeatureFactory
//            = OpenGLFeatureFactory.getInstance();
//
//        //if(OpenGLCapabilities.getInstance().isVertexBufferObjectSupport())
//        if (features.isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory.OPENGL_3D)) {
//
//            if (operatingSystem.isOverScan()) {
//                range = 6;
//            } else {
//                range = 5;
//            }
//
//        }
//        return range;
          return 9;
    }
    
    public void updateCamera(final CameraLayer cameraLayer) {

        cameraLayer.setRotationY((short) 18);
//        if (OpenGLCapabilities.getInstance().isVertexBufferObjectSupport()) {
//            final OperatingSystemInterface operatingSystem
//                = OperatingSystemFactory.getInstance().getOperatingSystemInstance();
//
//            if (operatingSystem.isOverScan()) {
//                cameraLayer.setRotationY((short) 33);
//            } else {
//                cameraLayer.setRotationY((short) 45);
//            }
//
//        } else {
//            final OperatingSystemInterface operatingSystem
//                = OperatingSystemFactory.getInstance().getOperatingSystemInstance();
//
//            if (operatingSystem.isOverScan()) {
//                cameraLayer.setRotationY((short) 45);
//            } else {
//                cameraLayer.setRotationY((short) 67);
//            }
//        }
    }

    public void updateResource(final ImageCache imageCache, final Image image, final String resource) {

    }
    
}
