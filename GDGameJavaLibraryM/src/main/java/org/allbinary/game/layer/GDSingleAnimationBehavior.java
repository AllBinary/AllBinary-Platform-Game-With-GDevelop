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
import org.allbinary.game.layout.GDObject;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;

/**
 *
 * @author User
 */
public class GDSingleAnimationBehavior extends GDAnimationBehaviorBase {
    protected final LogUtil logUtil = LogUtil.getInstance();

    
    private static final GDSingleAnimationBehavior instance = new GDSingleAnimationBehavior();

    /**
     * @return the instance
     */
    public static GDSingleAnimationBehavior getInstance() {
        return instance;
    }
    
    private long elapsedTime = 0;

    @Override
    public void animate(final GDObject gdObject, final IndexedAnimation[] initIndexedAnimationInterfaceArray, final long timeDelta) {
        try {
            elapsedTime += timeDelta;
            //animations/directions/timeBetweenFrames
            if (elapsedTime > 200) {
                elapsedTime = elapsedTime - 200;
                initIndexedAnimationInterfaceArray[gdObject.animation].nextFrame();
            }
        } catch (Exception e) {
            final CommonStrings commonStrings = CommonStrings.getInstance();
            //logUtil.put(new StringMaker().append(this.getName()).append(" GDObject name: ").append(this.gdObject.name).toString(), this, "animate");
            logUtil.put(commonStrings.EXCEPTION, this, "animate", e);
        }
    }
}
