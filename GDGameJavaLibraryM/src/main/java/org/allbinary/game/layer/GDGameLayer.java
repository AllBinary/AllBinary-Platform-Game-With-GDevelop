/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
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

import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.animation.RotationAnimation;
import org.allbinary.game.configuration.GameSpeed;
import org.allbinary.game.layout.GDObject;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.graphics.Rectangle;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.basic.string.StringMaker;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.math.NoDecimalTrigTable;
import org.allbinary.math.PositionStrings;
import org.allbinary.view.ViewPosition;

/**
 *
 * @author User
 */
public class GDGameLayer extends CollidableDestroyableDamageableLayer {
    private final NoDecimalTrigTable noDecimalTrigTable = NoDecimalTrigTable.getInstance();
    private final int SCALE = noDecimalTrigTable.SCALE * 10; //* GameSpeed.getInstance().getSpeed();

    public final String gdName;    
    public final GDObject gdObject;

    private final int quarterWidth = (this.getHalfWidth() >> 1) - 1;
    private final int quarterHeight = (this.getHalfHeight() >> 1) - 1;

    private final IndexedAnimation[] initIndexedAnimationInterface;
    private IndexedAnimation[] indexedAnimationInterface;
    private RotationAnimation[] rotationAnimationInterface;

    private final int SIZE;

    //private final VelocityProperties velocityInterface;
    // private AccelerationInterface accelerationInterface;
    //protected final BasicAccelerationProperties acceleration;

    private float rotationRemainder;
    
    public GDGameLayer(final String gdName, final Group[] groupInterface,
            final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
            final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
            final Rectangle layerInfo,
            final GDObject gdObject) throws Exception {
        super(groupInterface, layerInfo, new ViewPosition());

        this.gdName = gdName;
        this.gdObject = gdObject;

        /*
        this.velocityInterface = 
                new VelocityProperties(
                        (1700 * MathUtil.getInstance().sqrt((DisplayInfoSingleton.getInstance().getLastWidth() + DisplayInfoSingleton.getInstance().getLastHeight()))) * GameSpeed.getInstance().getSpeed() / 20, 
                        (1322 * MathUtil.getInstance().sqrt((DisplayInfoSingleton.getInstance().getLastWidth() + DisplayInfoSingleton.getInstance().getLastHeight()))) * GameSpeed.getInstance().getSpeed() / 20);
        
        this.acceleration = new BasicAccelerationProperties(
                this.velocityInterface.getMaxForwardVelocity() / 12,
                -this.velocityInterface.getMaxReverseVelocity() / 12
                );
        */
        
        this.initPosition(this.gdObject.x, this.gdObject.y, this.gdObject.zOrder);
        this.initPosition();

        this.SIZE = animationInterfaceFactoryInterfaceArray.length;
        final RotationAnimation[] initIndexedAnimationInterface = new RotationAnimation[SIZE];
        
        LogUtil.put(LogFactory.getInstance(this.gdObject.name, this, CommonStrings.getInstance().CONSTRUCTOR));
        
        try {
            for (int index = 0; index < SIZE; index++)
            {
                initIndexedAnimationInterface[index] = (RotationAnimation) animationInterfaceFactoryInterfaceArray[index].getInstance();
            }
        } catch(Exception e) {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().CONSTRUCTOR, this, CommonStrings.getInstance().CONSTRUCTOR, e));
        }

        this.initIndexedAnimationInterface = initIndexedAnimationInterface;
        
        this.setRotationAnimationInterface(initIndexedAnimationInterface);
        //this.setIndexedAnimationInterface(this.initIndexedAnimationInterface);
    }

    protected IndexedAnimation[] getInitIndexedAnimationInterface()
    {
        return initIndexedAnimationInterface;
    }

    public void setRotationAnimationInterface(
            RotationAnimation[] rotationAnimationInterface)
    {
        this.rotationAnimationInterface = rotationAnimationInterface;
        this.setIndexedAnimationInterface(this.rotationAnimationInterface);
    }

    public RotationAnimation[] getRotationAnimationInterface()
    {
        return this.rotationAnimationInterface;
    }

    protected void setIndexedAnimationInterface(
            IndexedAnimation[] animationInterface)
    {
        this.indexedAnimationInterface = animationInterface;
    }

    protected IndexedAnimation[] getIndexedAnimationInterface()
    {
        return indexedAnimationInterface;
    }

    /*
    public void move()
    {
        int dx = velocityInterface.getVelocityXBasicDecimal().getScaled();
        int dy = velocityInterface.getVelocityYBasicDecimal().getScaled();
        super.move(dx, dy);
    }
    */
    
    //private boolean isFirst = true;
    //private final String PAINT = "paint";
    public void paint(Graphics graphics)
    {
        try
        {
            //if(this.isFirst) {
                //this.isFirst = false;
                //LogUtil.put(LogFactory.getInstance(this.gdObject.name, this, PAINT));
            //}
            
            int x = this.x - quarterWidth;
            int y = this.y - quarterHeight;

            //for (int index = 0; index < SIZE; index++) {
            indexedAnimationInterface[this.gdObject.animation].paint(graphics, x, y);
            //}
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "paint", e));
        }
    }

    //RuntimeObject.cpp
    public void AddForceUsingPolarCoordinates(final float angle, final float length, final float clearing) {
        //angle *= Math.PI / 180.0;
        float adjustedAngle = angle;
        while(adjustedAngle > 359) { adjustedAngle -= 360; }
        //final GDGameLayerStrings gameLayerStrings = GDGameLayerStrings.getInstance();
        //LogUtil.put(LogFactory.getInstance(new StringBuilder().append(GDObjectStrings.getInstance().ANGLE).append(angle).append(gameLayerStrings.LENGTH).append(length).toString(), this, gameLayerStrings.ADD_FORCE_AL));
        this.Force((int) (noDecimalTrigTable.cos((short) adjustedAngle) * length) / SCALE, (int) (noDecimalTrigTable.sin((short) adjustedAngle) * length) / SCALE, clearing);
    }

    //private static final String FORCE = "force";
    //Force.cpp
    public void Force(final int x_, final int y_, final float clearing_) {

        //final PositionStrings positionStrings = PositionStrings.getInstance();
        //final StringMaker stringMaker = new StringMaker();
        //LogUtil.put(LogFactory.getInstance(stringMaker
                //.append(positionStrings.DX_LABEL).append(x_)
                //.append(positionStrings.DY_LABEL).append(y_)
                ////.append(positionStrings.DZ_LABEL).append(dz)
                //.toString(), this, FORCE));

        this.move(x_, y_);

        this.gdObject.x = this.x;
        this.gdObject.y = this.y;
        
        //stringMaker.delete(0, stringMaker.length());
        //this.toString(stringMaker);
        //LogUtil.put(LogFactory.getInstance(stringMaker.toString(), this, FORCE));
    }
    
    public void updateGDObject(final long timeDelta)
    {
        this.setPosition(this.gdObject.x, this.gdObject.y, this.gdObject.zOrder);
        
        this.updateRotation(timeDelta);
                
        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().UPDATE, this, this.toString()));
    }

    public void updateRotation(final long timeDelta) {
        final StringBuilder stringBuilder = new StringBuilder();
        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("timeDelta: ").append(timeDelta).toString(), this, "updateRotation"));
        //stringBuilder.delete(0, stringBuilder.length());
        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("prior rotationRemainder: ").append(rotationRemainder).toString(), this, "updateRotation"));
        float newPortion = (this.gdObject.rotation * timeDelta / 1000f);
        //stringBuilder.delete(0, stringBuilder.length());
        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("newPortion : ").append(newPortion).toString(), this, "updateRotation"));
        rotationRemainder = rotationRemainder + newPortion;
        //stringBuilder.delete(0, stringBuilder.length());
        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("rotationRemainder: ").append(rotationRemainder).toString(), this, "updateRotation"));
        final short angleAdjustment = (short) (rotationRemainder);
        if(angleAdjustment != 0) {
            stringBuilder.delete(0, stringBuilder.length());
            //LogUtil.put(LogFactory.getInstance(stringBuilder.append("angleAdjustment: ").append(angleAdjustment).toString(), this, "updateRotation"));
            this.setRotation(angleAdjustment);
            rotationRemainder -= angleAdjustment;
            //LogUtil.put(LogFactory.getInstance("reset", this, "updateRotation"));
        } else {
            //LogUtil.put(LogFactory.getInstance("skip", this, "updateRotation"));
        }
    }
    
    public void setRotation(final short angleAdjustment) {
        RotationAnimation rotationAnimation;
        //short nextAngle;
        //for (int index = 0; index < SIZE; index++)
        //{
            rotationAnimation = this.rotationAnimationInterface[this.gdObject.animation];
            //LogUtil.put(LogFactory.getInstance(new StringBuilder().append("angle: ").append(rotationAnimation.getAngleInfo().getAngle()).toString(), this, "setRotation"));
            //nextAngle = (short) (rotationAnimation.getAngleInfo().getAngle() + angleAdjustment);
            //LogUtil.put(LogFactory.getInstance(new StringBuilder().append("nextAngle: ").append(nextAngle).toString(), this, "setRotation"));
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
            //rotationAnimation.adjustFrame(nextAngle);
        //}
    }

    public void toString(final StringMaker stringBuffer) {
        
        stringBuffer.append(this.gdName);
        super.toString(stringBuffer);
        stringBuffer.append(this.gdObject.toString());
    }    
    
    public String toString()
    {
        final StringMaker stringBuffer = new StringMaker();

        this.toString(stringBuffer);
 
        return stringBuffer.toString();
    }
    
}
