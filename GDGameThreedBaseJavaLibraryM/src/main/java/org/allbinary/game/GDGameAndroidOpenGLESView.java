package org.allbinary.game;

import org.allbinary.android.view.AllBinaryMidletOpenGLSurfaceView;
import android.content.Context;
import android.util.AttributeSet;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.PreLogUtil;

public class GDGameAndroidOpenGLESView 
extends AllBinaryMidletOpenGLSurfaceView
{	
    private final String TAG = "GDGameAndroidOpenGLESView";
    
	public GDGameAndroidOpenGLESView(
	        Context context, AttributeSet attrs) {
		super(context, attrs);
                
                PreLogUtil.put(CommonStrings.getInstance().START, TAG, CommonStrings.getInstance().CONSTRUCTOR);
	}
}
