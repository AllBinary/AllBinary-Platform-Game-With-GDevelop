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
package org.allbinary.game.layer;

import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.IndexedAnimationBehavior;
import org.allbinary.game.layout.GDObject;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;

/**
 *
 * @author User
 */
public class GDIndividualAnimationBehavior extends GDAnimationBehaviorBase {
    protected final LogUtil logUtil = LogUtil.getInstance();

    
    private static final GDIndividualAnimationBehavior instance = new GDIndividualAnimationBehavior();

    /**
     * @return the instance
     */
    public static GDIndividualAnimationBehavior getInstance() {
        return instance;
    }
    
    @Override
    public void animate(final GDObject gdObject, final IndexedAnimation[] initIndexedAnimationInterfaceArray, final long timeDelta) {
        try {
            final IndexedAnimation indexedAnimation = initIndexedAnimationInterfaceArray[gdObject.animation];

            final IndexedAnimationBehavior indexedAnimationBehavior = (IndexedAnimationBehavior) indexedAnimation.getAnimationBehavior();

            //animations/directions/loop
            if(indexedAnimationBehavior.loopTotal < 0 || !indexedAnimation.isLastFrame()) {
                indexedAnimationBehavior.elapsedTime += timeDelta;
                //animations/directions/timeBetweenFrames
                if (indexedAnimationBehavior.elapsedTime > (indexedAnimationBehavior.frameDelayTime / Math.abs(gdObject.timeScale))) {
                    indexedAnimationBehavior.elapsedTime = 0; //indexedAnimationBehavior.elapsedTime - indexedAnimationBehavior.frameDelayTime;
                    if(gdObject.timeScale > 0) {
                        indexedAnimation.nextFrame();
                    } else {
                        indexedAnimation.previousFrame();
                    }
                }
            }
        } catch (Exception e) {
            final CommonStrings commonStrings = CommonStrings.getInstance();
            //logUtil.put(new StringMaker().append(this.getName()).append(" GDObject name: ").append(this.gdObject.name).toString(), this, "animate");
            logUtil.put(commonStrings.EXCEPTION, this, "animate", e);
        }
    }
}
