

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

package org.allbinary.graphics.threed.min3d;

import min3d.vos.Camera;
import min3d.vos.CameraSetup;

import org.allbinary.game.layer.CameraLayer;
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;

public class GDGameCameraSetup extends CameraSetup
{
    public static String NONE = "none";
    public static String SIMPLE = "simple";
    public static String FOLLOW = "follow";
    
    public final String type;
    
    protected GDGameCameraSetup(final String type)
    {
        this.type = type;
    }
    
    public void processTarget(final CameraLayer cameraLayer, final Camera camera) {
    }
    
    public int SceneWindowWidth() {
        return GameTickDisplayInfoSingleton.getInstance().getLastWidth();
    }

    public int SceneWindowHeight() {
        return GameTickDisplayInfoSingleton.getInstance().getLastHeight();
    }
               
}
    
