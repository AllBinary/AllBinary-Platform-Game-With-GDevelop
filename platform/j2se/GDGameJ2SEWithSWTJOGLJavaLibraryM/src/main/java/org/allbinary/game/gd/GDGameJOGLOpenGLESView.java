package org.allbinary.game.gd;

import org.allbinary.graphics.opengles.OpenGLThreadUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.view.AllBinaryMidletOpenGLSurfaceView;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.view.OptimizedGLSurfaceView;

public class GDGameJOGLOpenGLESView 
extends AllBinaryMidletOpenGLSurfaceView
{
    protected final LogUtil logUtil = LogUtil.getInstance();
	
    private final String TAG = "MiniSpaceWarJOGLOpenGLESView";
    
	public GDGameJOGLOpenGLESView() {
                
            PreLogUtil.put(commonStrings.START, TAG, commonStrings.CONSTRUCTOR);
                
            this.setRenderMode(OptimizedGLSurfaceView.RENDERMODE_CONTINUOUSLY);

            OpenGLThreadUtil.getInstance().set(this);
                
	}
}
