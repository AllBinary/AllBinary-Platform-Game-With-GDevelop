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

import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.compound.SimultaneousCompoundIndexedAnimation;
import org.allbinary.game.layout.GDObject;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDSoftJoystickAnimationBehavior extends GDAnimationBehaviorBase {
    protected final LogUtil logUtil = LogUtil.getInstance();
    
    private final TouchMotionGestureFactory touchMotionGestureFactory = TouchMotionGestureFactory.getInstance();
    
    private int initialX;
    private int initialY;
    
    @Override
    public IndexedAnimation[] init(final GDObject gdObject, final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray) {

        final IndexedAnimation[] indexedAnimationArray = super.init(gdObject, animationInterfaceFactoryInterfaceArray);
        final SimultaneousCompoundIndexedAnimation simultaneousCompoundIndexedAnimation = (SimultaneousCompoundIndexedAnimation) indexedAnimationArray[0];
        final Animation animation = simultaneousCompoundIndexedAnimation.getAnimationInterfaceArray()[1];
        this.initialX = animation.getDx();
        this.initialY = animation.getDy();
        
        return indexedAnimationArray;

    }

    @Override
    public void set(final GDGameLayer gameLayer, final GDObject gdObject) throws Exception {
        
        final SimultaneousCompoundIndexedAnimation simultaneousCompoundIndexedAnimation = (SimultaneousCompoundIndexedAnimation) gameLayer.getIndexedAnimationInterfaceArray()[0];
        final Animation animation = simultaneousCompoundIndexedAnimation.getAnimationInterfaceArray()[1];
        
        final SoftJoystickInterface softJoystickInterface = (SoftJoystickInterface) gdObject;

        //final LogUtil logUtil = LogUtil.getInstance();
        //logUtil.put("", this, "set");
        
        final GPoint point = softJoystickInterface.getPoint();
        if(point == PointFactory.getInstance().ZERO_ZERO) {
            animation.setDx(this.initialX);
            animation.setDy(this.initialY);
        } else {
            animation.setDx(point.getX() - gameLayer.getXP() - (gameLayer.getWidth() >> 2));
            animation.setDy(point.getY() - gameLayer.getYP() - (gameLayer.getHeight() >> 2));
        }

    }

}
