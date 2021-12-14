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
import org.allbinary.game.layout.GDObject;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.game.layout.GDObjectStrings;
import org.allbinary.game.physics.velocity.VelocityProperties;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.basic.string.StringMaker;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.ScaleFactorFactory;
import org.allbinary.math.PositionStrings;
import org.allbinary.view.ViewPosition;

/**
 *
 * @author User
 */
public class GDGameLayer extends CollidableDestroyableDamageableLayer 
        //implements //RotationAnimationInterfaceCompositeInterface, DirectionalCompositeInterface,
        //ArtificialIntelligenceCompositeInterface, GameInputInterface,
        //VelocityInterfaceCompositeInterface 
        {

    //private final NoDecimalTrigTable noDecimalTrigTable = NoDecimalTrigTable.getInstance();
    //private final int SCALE = noDecimalTrigTable.SCALE * 10; //* GameSpeed.getInstance().getSpeed();
    //private final int SCALE_FACTOR_VALUE = (ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE / ScaleFactorFactory.getInstance().DEFAULT_SCALE_FACTOR) * 2 / 3;
    private static final int SCALE_FACTOR = ScaleFactorFactory.getInstance().DEFAULT_SCALE_FACTOR * 2;

    public final GDObject gdObject;

    private final int quarterWidth = (this.getHalfWidth() >> 1) - 1;
    private final int quarterHeight = (this.getHalfHeight() >> 1) - 1;

    private final IndexedAnimation[] initIndexedAnimationInterface;
    private IndexedAnimation[] indexedAnimationInterface;
    private RotationAnimation[] rotationAnimationInterface;

    private final int SIZE;

    private final VelocityProperties velocityInterface;
    // private AccelerationInterface accelerationInterface;
    //protected final BasicAccelerationProperties acceleration;

    protected long realX;
    protected long realY;
    
    private float rotationRemainder;
    
    public GDGameLayer(final String gdName, final Group[] groupInterface,
            final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
            final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
            final Rectangle layerInfo,
            final GDObject gdObject) throws Exception {
        super(groupInterface, gdName, layerInfo, new ViewPosition());

        this.gdObject = gdObject;

        //final DisplayInfoSingleton displayInfoSingleton = DisplayInfoSingleton.getInstance();
        //final MathUtil mathUtil = MathUtil.getInstance();
        //final GameSpeed gameSpeed = GameSpeed.getInstance();
        
        this.velocityInterface = new VelocityProperties(1200, 1200);
                        //(1700 * mathUtil.sqrt((displayInfoSingleton.getLastWidth() + displayInfoSingleton.getLastHeight()))) * gameSpeed.getSpeed() / 20, 
                        //(1322 * mathUtil.sqrt((displayInfoSingleton.getLastWidth() + displayInfoSingleton.getLastHeight()))) * gameSpeed.getSpeed() / 20);
        
        /*        
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
        
        this.setRotationAnimationInterfaceArray(initIndexedAnimationInterface);
        //this.setIndexedAnimationInterface(this.initIndexedAnimationInterface);
    }

    protected IndexedAnimation[] getInitIndexedAnimationInterface()
    {
        return initIndexedAnimationInterface;
    }

    public void setRotationAnimationInterfaceArray(
            final RotationAnimation[] rotationAnimationInterface)
    {
        this.rotationAnimationInterface = rotationAnimationInterface;
        this.setIndexedAnimationInterface(this.rotationAnimationInterface);
    }

    public RotationAnimation[] getRotationAnimationInterfaceArray()
    {
        return this.rotationAnimationInterface;
    }

    protected void setIndexedAnimationInterface(
            final IndexedAnimation[] animationInterface)
    {
        this.indexedAnimationInterface = animationInterface;
    }

    protected IndexedAnimation[] getIndexedAnimationInterface()
    {
        return indexedAnimationInterface;
    }

    public RotationAnimation getRotationAnimationInterface() {
        return this.rotationAnimationInterface[this.gdObject.animation];
    }

    private static final String MOVE = "move";
    private static final String PLAYER = "player_0";
    
    public void move()
    {
        //final int dx = velocityInterface.getVelocityXBasicDecimal().getScaled();
        //final int dy = velocityInterface.getVelocityYBasicDecimal().getScaled();
        //super.move(dx, dy);

        final long velocityX = velocityInterface.getVelocityXBasicDecimal().getUnscaled();
        final long velocityY = velocityInterface.getVelocityYBasicDecimal().getUnscaled();

        //final long priorRealX = this.realX;
        //final long priorRealY = this.realY;
        this.realX = this.realX + velocityX;
        this.realY = this.realY + velocityY;

        final int x = (int) (this.realX / ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE);
        final int y = (int) (this.realY / ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE);

        if(this.getName().equals(PLAYER)) {
        final PositionStrings positionStrings = PositionStrings.getInstance();
        final StringMaker stringMaker = new StringMaker();
        LogUtil.put(LogFactory.getInstance(stringMaker
                .append(positionStrings.X_LABEL).append(velocityX)
                .append(positionStrings.Y_LABEL).append(velocityY)
                ////.append(positionStrings.X_LABEL).append(priorRealX)
                ////.append(positionStrings.Y_LABEL).append(priorRealY)
                .append(positionStrings.X_LABEL).append(this.realX)
                .append(positionStrings.Y_LABEL).append(this.realY)
                .append(positionStrings.X_LABEL).append(x)
                .append(positionStrings.Y_LABEL).append(y)
                ////.append(positionStrings.DZ_LABEL).append(dz)
                .toString(), this, MOVE));            
        }
        
        super.setPosition(x, y, this.z);
    }

    public void setPosition(int x, int y, int z)
    {
        super.setPosition(x, y, z);

        final int scaleFactorValue = ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE;
        this.realX = x * scaleFactorValue;
        this.realY = y * scaleFactorValue;
    }

    //RuntimeObject.cpp
    public void AddForceUsingPolarCoordinates(final float angle, final float length, final float clearing) {
        
        //angle *= Math.PI / 180.0;
        float adjustedAngle = angle;
        
        if(this.getName().equals(PLAYER)) {
        final GDGameLayerStrings gameLayerStrings = GDGameLayerStrings.getInstance();
        final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
        LogUtil.put(LogFactory.getInstance(new StringBuilder()
                .append(this.velocityInterface.toString())
                ////.append(this.rotationAnimationInterface[this.gdObject.animation].getAngleInfo().toString())
                ////.append(objectStrings.ROTATION).append(this.gdObject.rotation)
                ////.append(objectStrings.ANGLE).append(this.gdObject.angle)
                .append(objectStrings.ANGLE).append(angle)
                .append(gameLayerStrings.LENGTH).append(length).toString(), this, gameLayerStrings.ADD_FORCE_AL));
        }

        this.velocityInterface.setVelocity((long) length * SCALE_FACTOR, (short) adjustedAngle, (short) 0);
        //this.Force((int) (noDecimalTrigTable.cos((short) adjustedAngle) * length) / SCALE, (int) (noDecimalTrigTable.sin((short) adjustedAngle) * length) / SCALE, clearing);
    }

    //private static final String FORCE = "force";
    //Force.cpp
    //public void Force(final int x_, final int y_, final float clearing_) {

        ////final PositionStrings positionStrings = PositionStrings.getInstance();
        ////final StringMaker stringMaker = new StringMaker();
        ////LogUtil.put(LogFactory.getInstance(stringMaker
                ////.append(positionStrings.DX_LABEL).append(x_)
                ////.append(positionStrings.DY_LABEL).append(y_)
                //////.append(positionStrings.DZ_LABEL).append(dz)
                ////.toString(), this, FORCE));

        //this.move(x_, y_);

        //this.gdObject.x = this.x;
        //this.gdObject.y = this.y;
        
        ////stringMaker.delete(0, stringMaker.length());
        ////this.toString(stringMaker);
        ////LogUtil.put(LogFactory.getInstance(stringMaker.toString(), this, FORCE));
    //}
    
    public void updatePosition() {
        this.setPosition(this.gdObject.x, this.gdObject.y, this.gdObject.zOrder);
    }
    
    public void updateGDObject(final long timeDelta)
    {
        this.move();
     
        this.gdObject.x = this.x;
        this.gdObject.y = this.y;
        
        this.updateRotation(timeDelta);
                
        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().UPDATE, this, this.toString()));
    }

    public void updateRotation(final long timeDelta) {
        final StringBuilder stringBuilder = new StringBuilder();
        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("timeDelta: ").append(timeDelta).toString(), this, "updateRotation"));
        //stringBuilder.delete(0, stringBuilder.length());
        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("prior rotationRemainder: ").append(rotationRemainder).toString(), this, "updateRotation"));
        final float newPortion = (this.gdObject.rotation * timeDelta / 1000f);
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
        short nextAngle;
        //for (int index = 0; index < SIZE; index++)
        //{
            rotationAnimation = this.rotationAnimationInterface[this.gdObject.animation];
            //LogUtil.put(LogFactory.getInstance(new StringBuilder().append(GDObjectStrings.getInstance().ANGLE).append(rotationAnimation.getAngleInfo().getAngle()).append(" angleAdjustment: ").append(angleAdjustment).toString(), this, "setRotation"));
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

            //graphics.setColor(BasicColorFactory.getInstance().AQUA.intValue());
            //graphics.drawLine(this.getWidth(), this.getHeight(), 
                    //this.getWidth() + this.velocityInterface.getVelocityXBasicDecimal().getScaled(), 
                    //this.getHeight() + this.velocityInterface.getVelocityYBasicDecimal().getScaled());

            super.paint(graphics);
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "paint", e));
        }
    }

    
    public void toString(final StringMaker stringBuffer) {

        super.toString(stringBuffer);
        
        final RotationAnimation rotationAnimation = this.rotationAnimationInterface[this.gdObject.animation];
        stringBuffer.append(GDObjectStrings.getInstance().ANGLE).append(rotationAnimation.getAngleInfo().getAngle());
        stringBuffer.append(this.gdObject.toString());
    }    
    
    public String toString()
    {
        final StringMaker stringBuffer = new StringMaker();

        this.toString(stringBuffer);
 
        return stringBuffer.toString();
    }
    
}
