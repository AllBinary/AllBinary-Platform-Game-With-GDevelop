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
package org.allbinary.game.canvas;

import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.special.SpecialAnimation;

/**
 *
 * @author User
 */
public class GDSpecialAnimation extends SpecialAnimation {
    
    public GDSpecialAnimation() {
        super(AnimationBehavior.getInstance());
    }
   
    public GDSceneGlobals getGlobals() {
        throw new RuntimeException();
    }
}
