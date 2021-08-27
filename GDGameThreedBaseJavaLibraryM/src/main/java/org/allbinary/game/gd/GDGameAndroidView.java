package org.allbinary.game.gd;

import org.allbinary.android.view.AllBinaryMidletView;
import android.content.Context;
import android.util.AttributeSet;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.PreLogUtil;

public class GDGameAndroidView extends AllBinaryMidletView
{	
    private final String TAG = "GDGameAndroidView";
    
	public GDGameAndroidView(Context context, AttributeSet attrs) {
		super(context, attrs);
                
                PreLogUtil.put(CommonStrings.getInstance().START, TAG, CommonStrings.getInstance().CONSTRUCTOR);
	}
}
