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
public class ResetRotationAnimationBehavior extends ResetAnimationBehavior {

    private static final ResetRotationAnimationBehavior instance = new ResetRotationAnimationBehavior();
    
    /**
     * @return the instance
     */
    public static ResetRotationAnimationBehavior getInstance() {
        return instance;
    }
    
    private final FrameUtil frameUtil = FrameUtil.getInstance();

    @Override
    public void resetAnimation(final IndexedAnimation[] indexedAnimationInterfaceArray, final int animationIndex) {
        indexedAnimationInterfaceArray[animationIndex].setFrame(frameUtil.getFrameForAngle((short) 90, 1));
    }
}
