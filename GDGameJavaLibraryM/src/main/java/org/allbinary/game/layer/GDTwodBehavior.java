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
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;

/**
 *
 * @author User
 */
public class GDTwodBehavior {
    
    //protected final LogUtil logUtil = LogUtil.getInstance();
    
    private final GDAnimationBehaviorBase animationBehavior;
    
    private float rotationRemainder;
    
    public GDTwodBehavior(final GDAnimationBehaviorBase animationBehavior) {
        this.animationBehavior = animationBehavior;
    }
    
    public void process(final GDObject gdObject, final RotationAnimation rotationAnimation) {
        
    }
    
    public void reset(final GDGameLayer gameLayer, final GDObject gdObject) throws Exception {
        this.rotationRemainder = 0;
        this.animationBehavior.set(gameLayer, gdObject);
    }

    //private final String UPDATE_ROTATION = "updateRotation";
    public void updateRotation(final GDGameLayer gameLayer, final long timeDelta) {
        final GDObject gdObject = gameLayer.gdObject;
//        final StringMaker stringBuilder = new StringMaker();
//        logUtil.putF(stringBuilder.append("rotation: ").appendfloat(gdObject.rotationP).toString(), this, UPDATE_ROTATION);
//        stringBuilder.delete(0, stringBuilder.length());
//        logUtil.putF(stringBuilder.append("timeDelta: ").appendlong(timeDelta).toString(), this, UPDATE_ROTATION);
//        stringBuilder.delete(0, stringBuilder.length());
//        logUtil.putF(stringBuilder.append("prior rotationRemainder: ").appendfloat(rotationRemainder).toString(), this, UPDATE_ROTATION);
        final float newPortion = (gdObject.rotationP * timeDelta / 1000f);
//        stringBuilder.delete(0, stringBuilder.length());
//        logUtil.putF(stringBuilder.append("newPortion : ").appendfloat(newPortion).toString(), this, UPDATE_ROTATION);
        this.rotationRemainder = this.rotationRemainder + newPortion;
//        stringBuilder.delete(0, stringBuilder.length());
//        logUtil.putF(stringBuilder.append("rotationRemainder: ").appendfloat(rotationRemainder).toString(), this, UPDATE_ROTATION);
        final short angleAdjustment = (short) (this.rotationRemainder);
        if(angleAdjustment != 0) {
//            stringBuilder.delete(0, stringBuilder.length());
//            logUtil.putF(stringBuilder.append("angleAdjustment: ").appendint(angleAdjustment).toString(), this, UPDATE_ROTATION);
            
            int adjustedAngle2 = gdObject.angle + angleAdjustment;
            while (adjustedAngle2 > 359) {
                adjustedAngle2 -= 360;
            }
            while (adjustedAngle2 < 0) {
                adjustedAngle2 += 360;
            }
            
//            stringBuilder.delete(0, stringBuilder.length());
//            logUtil.putF(stringBuilder.append("adjustedAngle2: ").appendint(adjustedAngle2).toString(), this, UPDATE_ROTATION);
            gdObject.setAngle((short) adjustedAngle2);
            gdObject.angle = (short) adjustedAngle2;
            //gdObject.angle += angleAdjustment;
            this.getAnimationBehavior().setRotation(gameLayer, angleAdjustment);
            this.rotationRemainder -= angleAdjustment;
            //logUtil.put("reset", this, UPDATE_ROTATION);
        } else {
            //logUtil.put("skip", this, UPDATE_ROTATION);
        }
    }

    /**
     * @return the animationBehavior
     */
    public GDAnimationBehaviorBase getAnimationBehavior() {
        return this.animationBehavior;
    }
    
}
