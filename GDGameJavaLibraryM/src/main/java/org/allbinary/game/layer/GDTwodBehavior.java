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

import org.allbinary.animation.RotationAnimation;
import org.allbinary.game.layout.GDObject;

/**
 *
 * @author User
 */
public class GDTwodBehavior {
    protected final LogUtil logUtil = LogUtil.getInstance();

    
    private final GDAnimationBehaviorBase animationBehavior;
    
    private float rotationRemainder;
    
    public GDTwodBehavior(final GDAnimationBehaviorBase animationBehavior) {
        this.animationBehavior = animationBehavior;
    }
    
    public void process(final GDObject gdObject, final RotationAnimation rotationAnimation) {
        
    }
    
    public void reset(final GDObject gdObject) throws Exception {
        this.rotationRemainder = 0;
        this.animationBehavior.set(gdObject);
    }

    public void updateRotation(final GDGameLayer gameLayer, final long timeDelta) {
        final GDObject gdObject = gameLayer.gdObject;
        //final StringMaker stringBuilder = new StringMaker();
        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("rotation: ").append(gdObject.rotation).toString(), this, "updateRotation"));
        //stringBuilder.delete(0, stringBuilder.length());
        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("timeDelta: ").append(timeDelta).toString(), this, "updateRotation"));
        //stringBuilder.delete(0, stringBuilder.length());
        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("prior rotationRemainder: ").append(rotationRemainder).toString(), this, "updateRotation"));
        final float newPortion = (gdObject.rotation * timeDelta / 1000f);
        //stringBuilder.delete(0, stringBuilder.length());
        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("newPortion : ").append(newPortion).toString(), this, "updateRotation"));
        rotationRemainder = rotationRemainder + newPortion;
        //stringBuilder.delete(0, stringBuilder.length());
        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("rotationRemainder: ").append(rotationRemainder).toString(), this, "updateRotation"));
        final short angleAdjustment = (short) (rotationRemainder);
        if(angleAdjustment != 0) {
            //stringBuilder.delete(0, stringBuilder.length());
            //LogUtil.put(LogFactory.getInstance(stringBuilder.append("angleAdjustment: ").append(angleAdjustment).toString(), this, "updateRotation"));
            
            int adjustedAngle2 = gdObject.angle + angleAdjustment;
            while (adjustedAngle2 > 359) {
                adjustedAngle2 -= 360;
            }
            while (adjustedAngle2 < 0) {
                adjustedAngle2 += 360;
            }
            
            //stringBuilder.delete(0, stringBuilder.length());
            //LogUtil.put(LogFactory.getInstance(stringBuilder.append("adjustedAngle2: ").append(adjustedAngle2).toString(), this, "updateRotation"));
            gdObject.angle = (short) adjustedAngle2;
            //gdObject.angle += angleAdjustment;
            this.getAnimationBehavior().setRotation(gameLayer, angleAdjustment);
            rotationRemainder -= angleAdjustment;
            //LogUtil.put(LogFactory.getInstance("reset", this, "updateRotation"));
        } else {
            //LogUtil.put(LogFactory.getInstance("skip", this, "updateRotation"));
        }
    }

    /**
     * @return the animationBehavior
     */
    public GDAnimationBehaviorBase getAnimationBehavior() {
        return animationBehavior;
    }
    
}
