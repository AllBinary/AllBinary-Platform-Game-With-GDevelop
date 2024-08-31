package org.allbinary.game;

import min3d.core.SceneController;


import android.content.Context;
import android.opengl.GLSurfaceView;
import android.util.AttributeSet;

import org.allbinary.graphics.opengles.OpenGLThreadUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.view.AllBinaryMidletMin3dSurfaceView;

public class GDGameAndroidMin3dView 
extends AllBinaryMidletMin3dSurfaceView
{
    private final String TAG = "GDGameAndroidMin3dView";
    
    public GDGameAndroidMin3dView(Context context, AttributeSet attrs)
    {
        super(context, attrs);

        PreLogUtil.put(CommonStrings.getInstance().START, TAG, CommonStrings.getInstance().CONSTRUCTOR);
        
        final SceneController sceneController = 
            GDGameAllBinarySceneControllerFactory.getInstance();

        this.setRenderer((GLSurfaceView.Renderer) sceneController.getRenderer());

        this.setRenderMode(GLSurfaceView.RENDERMODE_CONTINUOUSLY);

        OpenGLThreadUtil.getInstance().set(this);
    }
}
