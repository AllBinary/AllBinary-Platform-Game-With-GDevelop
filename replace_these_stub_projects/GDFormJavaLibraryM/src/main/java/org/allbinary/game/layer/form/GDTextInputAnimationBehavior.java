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
package org.allbinary.game.layer.form;

import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.game.layer.GDGameLayer;
import org.allbinary.game.layout.GDObject;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;

/**
 *
 * @author User
 */
public class GDTextInputAnimationBehavior extends GDItemAnimationBehavior 
    implements GDGameLayerItemStateListener {

    public GDTextInputAnimationBehavior() {
    }

    public IndexedAnimation[] init(final GDObject gdObject, final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray) {
        return null;
    }
    
    public void setAnimationArray(final IndexedAnimation[] animationArray)
    {

    }
    
    public void add(final GDGameLayer gameLayer) {
    }

    public void itemStateChanged(GDGameLayer gameLayerAsItem) {
        
    }

    public void onMotionGestureEvent(final MotionGestureEvent motionGestureEvent) {

    }

    public void keyPressed(final int keyCode) {
    }

    public void setFocus(final boolean hasFocus) {    
    }
        
}