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

import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.RotationAnimation;
import org.allbinary.game.layout.GDObject;
import org.allbinary.graphics.GraphicsStrings;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.math.FrameUtil;

/**
 *
 * @author User
 */
public class GDRotationBehavior extends GDAnimationBehaviorBase {
    protected final LogUtil logUtil = LogUtil.getInstance();

    protected final FrameUtil frameUtil = FrameUtil.getInstance();
    
    public RotationAnimation[] rotationAnimationInterfaceArray;
    
    public IndexedAnimation[] init(final GDObject gdObject, final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray) {
        final int size = animationInterfaceFactoryInterfaceArray.length;
        final RotationAnimation[] initIndexedAnimationInterfaceArray = new RotationAnimation[size];
        
            for (int index = 0; index < size; index++)
            {
        try {
                initIndexedAnimationInterfaceArray[index] = (RotationAnimation) animationInterfaceFactoryInterfaceArray[index].getInstance(0);
        } catch(Exception e) {
            //final StringMaker stringMaker = new StringMaker();
            //super.toString(stringMaker);
            //stringMaker.toString()
            final CommonStrings commonStrings = CommonStrings.getInstance();
            logUtil.put(new StringMaker().append(animationInterfaceFactoryInterfaceArray[index].toString()).append(" index: ").append(index).toString(), this, commonStrings.CONSTRUCTOR, e);
            logUtil.put(gdObject.toString(), this, commonStrings.CONSTRUCTOR, e);
        }
            }
        
        this.rotationAnimationInterfaceArray = initIndexedAnimationInterfaceArray;
        return initIndexedAnimationInterfaceArray;
    }
    
    public void setAnimationArray(final IndexedAnimation[] rotationAnimationInterfaceArray)
    {
        this.rotationAnimationInterfaceArray = (RotationAnimation[]) rotationAnimationInterfaceArray;
    }

    public RotationAnimation[] getRotationAnimationInterfaceArray()
    {
        return this.rotationAnimationInterfaceArray;
    }
    
    public void set(final GDGameLayer gameLayer, final GDObject gdObject) throws Exception {
        final int size = this.rotationAnimationInterfaceArray.length;
        for(int index = 0; index < size; index++) {
            this.rotationAnimationInterfaceArray[index].setFrame(frameUtil.getFrameForAngle((short) 0, 1));
        }
    }
    
    @Override
    public void setRotation(final GDGameLayer gameLayer, final short angleAdjustment) {
                
        final GDObject gdObject = gameLayer.gdObject;
        RotationAnimation rotationAnimation;
        //short nextAngle;
        //for (int index = 0; index < SIZE; index++)
        //{
            //logUtil.put(new StringMaker().append(gameLayer.getName()).append(" GDObject name: ").append(gdObject.name).toString(), this, "setRotation");
            rotationAnimation = this.rotationAnimationInterfaceArray[gdObject.animation];
            
            if(angleAdjustment > 0) {
                short value = angleAdjustment;
                while(value > 0) {
                    rotationAnimation.nextRotation();                    
                    value--;
                }
                
            } else {
                short value = angleAdjustment;
                while(value < 0) {
                    rotationAnimation.previousRotation();
                    value++;
                }
                
            }
            
            //short angle = (short) (this.gdObject.angle + angleAdjustment);
            //while(angle > 359) { angle -= 360; }
            //while(angle < 0) { angle += 360; }
            //this.gdObject.angle = angle;
            //this.gdObject.angle = rotationAnimation.getAngleInfo().getAngle();
            
            //setFrame(FrameUtil.getInstance().getFrameForAngle(angle, 1));
            //rotationAnimation.setFrame(AngleFactory.getInstance().getInstance(angle));            
            //rotationAnimation.adjustFrame(nextAngle);
            //rotationAnimation.setFrame(rotationAnimation.getFrame() + angleAdjustment);
            
            //if(this.getName().equals(PLAYER)) {
            //if(this.getName().startsWith(PLAYER)) {
                //logUtil.put(rotationAnimation.toString(), this, "setRotation");
            //}
            
        //}
    }

    public void toString(final GDObject gdObject, final StringMaker stringBuffer) {
        final RotationAnimation rotationAnimation = this.rotationAnimationInterfaceArray[gdObject.animation];
        stringBuffer.append(GraphicsStrings.getInstance().ANGLE).append(rotationAnimation.getAngleInfoP().getAngle());
    }
    
}
