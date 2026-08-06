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
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.math.FrameUtil;
import org.allbinary.string.CommonStrings;

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
        return ResetAnimationBehavior.instance;
    }
    
    //protected final LogUtil logUtil = LogUtil.getInstance();
    //protected final CommonStrings commonStrings = CommonStrings.getInstance();

    //private final FrameUtil frameUtil = FrameUtil.getInstance();

    public void resetAnimation(final IndexedAnimation[] indexedAnimationInterfaceArray, final int animationIndex) {
        //logUtil.putF(commonStrings.CONSTRUCTOR, this, commonStrings.CONSTRUCTOR);
        indexedAnimationInterfaceArray[animationIndex].setFrame(0);
    }
}
