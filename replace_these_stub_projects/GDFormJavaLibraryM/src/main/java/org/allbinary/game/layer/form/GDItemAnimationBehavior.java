package org.allbinary.game.layer.form;

import org.allbinary.game.input.GameKey;
import org.allbinary.game.input.GameKeyFactory;
import org.allbinary.game.layer.GDAnimationBehaviorBase;

public class GDItemAnimationBehavior extends GDAnimationBehaviorBase {
    
    protected final GameKeyFactory gameKeyFactory = GameKeyFactory.getInstance();
    
    protected boolean hasFocus;
    
    public void select(final GameKey gameKey) {

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
