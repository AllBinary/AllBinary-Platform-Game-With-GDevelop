/*
 * AllBinary Open License Version 1
 * Copyright (c) 2025 AllBinary
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
package org.allbinary.game.layer;

import org.allbinary.animation.IndexedAnimation;
import org.allbinary.math.FrameUtil;

/**
 *
 * @author User
 */
public class ResetAnimationBehavior {

    private static final ResetAnimationBehavior instance = new ResetAnimationBehavior();
    
    /**
     * @return the instance
     */
    public static ResetAnimationBehavior getInstance() {
        return instance;
    }
    
    private final FrameUtil frameUtil = FrameUtil.getInstance();

    public void resetAnimation(final IndexedAnimation[] indexedAnimationInterfaceArray, final int animationIndex) {
        indexedAnimationInterfaceArray[animationIndex].setFrame(0);
    }
}
