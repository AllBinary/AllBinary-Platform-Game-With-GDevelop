package org.allbinary.game.gd;

import min3d.core.Renderer;
import min3d.core.SceneController;
import org.allbinary.game.GDGameAllBinarySceneControllerFactory;

import org.allbinary.graphics.opengles.OpenGLThreadUtil;
import org.allbinary.j2se.view.AllBinaryMidletMin3dSurfaceView;
import org.allbinary.view.OptimizedGLSurfaceView;

public class GDGameJOGLMin3dView 
extends AllBinaryMidletMin3dSurfaceView
{
    public GDGameJOGLMin3dView()
    {
        SceneController sceneController = 
            GDGameAllBinarySceneControllerFactory.getInstance();

        this.setRenderer((Renderer) sceneController.getRenderer());

        this.setRenderMode(OptimizedGLSurfaceView.RENDERMODE_CONTINUOUSLY);

        OpenGLThreadUtil.getInstance().set(this);
    }
}
