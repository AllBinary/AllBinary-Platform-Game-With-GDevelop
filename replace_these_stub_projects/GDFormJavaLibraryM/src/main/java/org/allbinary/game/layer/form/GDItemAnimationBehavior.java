package org.allbinary.game.layer.form;

import org.allbinary.game.input.GameKey;
import org.allbinary.game.input.GameKeyFactory;
import org.allbinary.game.layer.GDAnimationBehaviorBase;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;

public class GDItemAnimationBehavior extends GDAnimationBehaviorBase {
    
    protected final GameKeyFactory gameKeyFactory = GameKeyFactory.getInstance();
    
    protected boolean hasFocus;
    
    public int select(final GameKey gameKey, final int keyCode) {
        return 0;
    }
    
    public void onMotionGestureEvent(final MotionGestureEvent motionGestureEvent) {
    
    }

    public void keyPressed(final int keyCode) {
        
    }
    
    public boolean isFocusable() {
        return true;
    }
    
    public void setFocus(final boolean hasFocus) {
        this.hasFocus = hasFocus;
    }

    public boolean hasFocus() {
        return hasFocus;
    }
    
    int traverse(int gameKeyCode, int top, int bottom, boolean action) {
        return 0;
    }
    
}
