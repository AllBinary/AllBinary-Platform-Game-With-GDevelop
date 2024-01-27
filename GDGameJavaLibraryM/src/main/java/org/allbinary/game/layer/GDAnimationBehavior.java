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
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDAnimationBehavior extends GDAnimationBehaviorBase {
    
    private static final GDAnimationBehavior instance = new GDAnimationBehavior();

    /**
     * @return the instance
     */
    public static GDAnimationBehavior getInstance() {
        return instance;
    }
    
    private long elapsedTime = 0;
    
    @Override
    public void animate(final GDObject gdObject, final IndexedAnimation[] initIndexedAnimationInterfaceArray, final long timeDelta) {
        try {
            final IndexedAnimation indexedAnimation = initIndexedAnimationInterfaceArray[gdObject.animation];

            final IndexedAnimationBehavior indexedAnimationBehavior = (IndexedAnimationBehavior) indexedAnimation.animationBehavior;

            //animations/directions/loop
            if(indexedAnimationBehavior.loopTotal < 0 || !indexedAnimation.isLastFrame()) {
                elapsedTime += timeDelta;
                //animations/directions/timeBetweenFrames
                if (elapsedTime > indexedAnimationBehavior.frameDelayTime) {
                    elapsedTime = elapsedTime - indexedAnimationBehavior.frameDelayTime;
                    indexedAnimation.nextFrame();
                }
            }
        } catch (Exception e) {
            //LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.getName()).append(" GDObject name: ").append(this.gdObject.name).toString(), this, "animate"));
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "animate", e));
        }
    }
}
