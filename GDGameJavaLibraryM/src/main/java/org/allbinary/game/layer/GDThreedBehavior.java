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
import org.allbinary.logic.string.StringMaker;

/**
 *
 * @author User
 */
public class GDThreedBehavior extends GDTwodBehavior {
    
    private final RotationAnimation[] rotationAnimationInterfaceArray;
    
    private float rotationRemainderZ;
    
    public GDThreedBehavior(final GDAnimationBehaviorBase animationBehavior, RotationAnimation[] rotationAnimationInterfaceArray) {
        super(animationBehavior);
        
        this.rotationAnimationInterfaceArray = rotationAnimationInterfaceArray;
    }

    public void reset(final GDObject gdObject) throws Exception {
        super.reset(gdObject);
        this.rotationRemainderZ = 0;
    }
    
    public void updateRotation(final GDGameLayer gameLayer, final long timeDelta) {
        super.updateRotation(gameLayer, timeDelta);

        final GDObject gdObject = gameLayer.gdObject;
        final StringMaker stringBuilder = new StringMaker();
        //logUtil.put(stringBuilder.append("timeDelta: ").append(timeDelta).toString(), this, "updateRotation");
        //stringBuilder.delete(0, stringBuilder.length());
        //logUtil.put(stringBuilder.append("prior rotationRemainder: ").append(rotationRemainder).toString(), this, "updateRotation");
        final float newPortion = (gdObject.rotationZ * timeDelta / 1000f);
        //stringBuilder.delete(0, stringBuilder.length());
        //logUtil.put(stringBuilder.append("newPortion : ").append(newPortion).toString(), this, "updateRotation");
        rotationRemainderZ = rotationRemainderZ + newPortion;
        //stringBuilder.delete(0, stringBuilder.length());
        //logUtil.put(stringBuilder.append("rotationRemainder: ").append(rotationRemainder).toString(), this, "updateRotation");
        final short angleAdjustment = (short) (rotationRemainderZ);
        if(angleAdjustment != 0) {
            stringBuilder.delete(0, stringBuilder.length());
            //logUtil.put(stringBuilder.append("angleAdjustment: ").append(angleAdjustment).toString(), this, "updateRotation");
            gdObject.angle += angleAdjustment;
            this.setRotationZ(gdObject, angleAdjustment);
            rotationRemainderZ -= angleAdjustment;
            //logUtil.put("reset", this, "updateRotation");
        } else {
            //logUtil.put("skip", this, "updateRotation");
        }
    }
    
    public void setRotationZ(final GDObject gdObject, final short angleAdjustment) {
                
        final RotationAnimation rotationAnimation = rotationAnimationInterfaceArray[gdObject.animation];

        if (angleAdjustment > 0) {
            short value = angleAdjustment;
            while (value > 0) {
                rotationAnimation.nextRotationZ();
                value--;
            }

        } else {
            short value = angleAdjustment;
            while (value < 0) {
                rotationAnimation.previousRotationZ();
                value++;
            }

        }
    }
    
}
