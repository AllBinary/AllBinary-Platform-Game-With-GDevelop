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
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class AnimationBehavior extends AnimationBehaviorBase {
    
    private static final AnimationBehavior instance = new AnimationBehavior();

    /**
     * @return the instance
     */
    public static AnimationBehavior getInstance() {
        return instance;
    }
    
    @Override
    public void animate(final GDObject gdObject, final IndexedAnimation[] initIndexedAnimationInterfaceArray) {
        try {
            initIndexedAnimationInterfaceArray[gdObject.animation].nextFrame();
        } catch (Exception e) {
            //LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.getName()).append(" GDObject name: ").append(this.gdObject.name).toString(), this, "animate"));
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "animate", e));
        }
    }
}
