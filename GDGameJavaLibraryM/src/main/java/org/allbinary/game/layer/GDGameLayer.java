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

import javax.microedition.khronos.opengles.GL;
import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.animation.RotationAnimation;
import org.allbinary.canvas.Processor;
import org.allbinary.game.combat.CombatBaseBehavior;
import org.allbinary.game.combat.damage.DamageableBaseBehavior;
import org.allbinary.game.combat.destroy.GDDestroyableSimpleBehavior;
import org.allbinary.game.layout.GDObject;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.game.layout.GDObjectStrings;
import org.allbinary.game.physics.velocity.VelocityProperties;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.image.opengles.OpenGLSurfaceChangedInterface;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.basic.string.StringMaker;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.ScaleFactorFactory;
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
    private static final int SCALE_FACTOR = ScaleFactorFactory.getInstance().DEFAULT_SCALE_FACTOR;

    public GDObject gdObject;

    private final int quarterWidth = (this.getHalfWidth() >> 1) - 1;
    private final int quarterHeight = (this.getHalfHeight() >> 1) - 1;

    private final CombatBaseBehavior combatBaseBehavior;
    
    private final IndexedAnimation[] initIndexedAnimationInterfaceArray;
    private IndexedAnimation[] indexedAnimationInterfaceArray;
    private RotationAnimation[] rotationAnimationInterfaceArray;

    private final int SIZE;

    private final VelocityProperties velocityInterface;
    // private AccelerationInterface accelerationInterface;
    //protected final BasicAccelerationProperties acceleration;

    protected long realX;
    protected long realY;
    
    private float rotationRemainder;
    
    private Processor processor = Processor.getInstance();
    
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
        
        this.velocityInterface = new VelocityProperties(3200, 3200);
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
        
        try {
            for (int index = 0; index < SIZE; index++)
            {
                initIndexedAnimationInterface[index] = (RotationAnimation) animationInterfaceFactoryInterfaceArray[index].getInstance();
            }
        } catch(Exception e) {
            LogUtil.put(LogFactory.getInstance(this.toString(), this, CommonStrings.getInstance().CONSTRUCTOR, e));
        }

        this.initIndexedAnimationInterfaceArray = initIndexedAnimationInterface;
        
        this.setRotationAnimationInterfaceArray(initIndexedAnimationInterface);
        //this.setIndexedAnimationInterface(this.initIndexedAnimationInterface);
        
        this.combatBaseBehavior = new CombatBaseBehavior(
                DamageableBaseBehavior.getInstance(), new GDDestroyableSimpleBehavior(this));
        
        //LogUtil.put(LogFactory.getInstance(this.toString(), this, CommonStrings.getInstance().CONSTRUCTOR));
    }

    public void set(final GDObject gdObject) throws Exception {
        final int size = this.rotationAnimationInterfaceArray.length;
        for(int index = 0; index < size; index++) {
            this.rotationAnimationInterfaceArray[index].setFrame(0);
        }
        this.gdObject = gdObject;
        this.initPosition(this.gdObject.x, this.gdObject.y, this.gdObject.zOrder);
        this.initPosition();
        this.updateGDObject(0);
        this.setDestroyed(false);
    }

    public void set(GL gl) throws Exception
    {
        final int size = this.rotationAnimationInterfaceArray.length;
        OpenGLSurfaceChangedInterface openGLSurfaceChangedInterface;
        for(int index = 0; index < size; index++) {
            openGLSurfaceChangedInterface = (OpenGLSurfaceChangedInterface) this.rotationAnimationInterfaceArray[index];
            openGLSurfaceChangedInterface.set(gl);
        }
    }
    
    protected IndexedAnimation[] getInitIndexedAnimationInterface()
    {
        return initIndexedAnimationInterfaceArray;
    }

    public void setRotationAnimationInterfaceArray(
            final RotationAnimation[] rotationAnimationInterface)
    {
        this.rotationAnimationInterfaceArray = rotationAnimationInterface;
        this.setIndexedAnimationInterface(this.rotationAnimationInterfaceArray);
    }

    public RotationAnimation[] getRotationAnimationInterfaceArray()
    {
        return this.rotationAnimationInterfaceArray;
    }

    protected void setIndexedAnimationInterface(
            final IndexedAnimation[] animationInterface)
    {
        this.indexedAnimationInterfaceArray = animationInterface;
    }

    protected IndexedAnimation[] getIndexedAnimationInterface()
    {
        return indexedAnimationInterfaceArray;
    }

    public RotationAnimation getRotationAnimationInterface() {
        return this.rotationAnimationInterfaceArray[this.gdObject.animation];
    }
    
//    public void setCombatBaseBehavior(CombatBaseBehavior combatBaseBehavior)
//    {
//        this.combatBaseBehavior = combatBaseBehavior;
//    }

    public CombatBaseBehavior getCombatBaseBehavior()
    {
        return combatBaseBehavior;
    }

    public void damage(int damage,int damageType)
    throws Exception
    {
        this.combatBaseBehavior.getDamageableBaseBehavior().damage(damage, damageType);
    }

    public int getDamage(int damageType)
    throws Exception
    {
        return this.combatBaseBehavior.getDamageableBaseBehavior().getDamage(damageType);
    }

    public boolean isDestroyed() 
    throws Exception
    {
        return this.combatBaseBehavior.getDestroyableBaseBehavior().isDestroyed();
    }

    public void setDestroyed(boolean destroyed)
    {
        this.combatBaseBehavior.getDestroyableBaseBehavior().setDestroyed(destroyed);
    }
    
    private static final String MOVE = "move";
    //private static final String PLAYER_0 = "player_0";
    //private static final String PLAYER = "player";
    //private static final String MEDIUM_ASTEROID = "medium_asteroid";
    
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

        final int scaleFactorValue = ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE;
        final int x = (int) (this.realX / scaleFactorValue);
        final int y = (int) (this.realY / scaleFactorValue);

        //if(this.getName().equals(PLAYER)) {
//        if(this.getName().startsWith(MEDIUM_ASTEROID)) {
//            final PositionStrings positionStrings = PositionStrings.getInstance();
//            final StringMaker stringMaker = new StringMaker();
//            LogUtil.put(LogFactory.getInstance(stringMaker
//                .append(this.getName())
//                .append(positionStrings.X_LABEL).append(velocityX)
//                .append(positionStrings.Y_LABEL).append(velocityY)
//                //.append(positionStrings.X_LABEL).append(priorRealX)
//                //.append(positionStrings.Y_LABEL).append(priorRealY)
//                .append(positionStrings.X_LABEL).append(this.realX)
//                .append(positionStrings.Y_LABEL).append(this.realY)
//                .append(positionStrings.X_LABEL).append(x)
//                .append(positionStrings.Y_LABEL).append(y)
//                //.append(positionStrings.DZ_LABEL).append(dz)
//                .toString(), this, MOVE));            
//        }
        
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
        
        //if(this.gdObject.updateSinceSetAngle) {
            //return;
        //}
        
        //this.gdObject.updateSinceSetAngle = true;
        
        short adjustedAngle = (short) angle;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }
        
        //angle *= Math.PI / 180.0;
        
        //if(this.getName().equals(PLAYER)) {
//        if(this.getName().startsWith(MEDIUM_ASTEROID)) {
//            final GDGameLayerStrings gameLayerStrings = GDGameLayerStrings.getInstance();
//            final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
//            LogUtil.put(LogFactory.getInstance(new StringBuilder()
//                .append(this.getName())
//                .append(CommonSeps.getInstance().COLON)
//                .append(this.velocityInterface.toString())
//                ////.append(this.rotationAnimationInterface[this.gdObject.animation].getAngleInfo().toString())
//                ////.append(objectStrings.ROTATION).append(this.gdObject.rotation)
//                ////.append(objectStrings.ANGLE).append(this.gdObject.angle)
//                .append(objectStrings.ANGLE).append(angle)
//                .append(objectStrings.ANGLE).append(adjustedAngle)
//                .append(gameLayerStrings.LENGTH).append(length).toString(), this, gameLayerStrings.ADD_FORCE_AL));
//        }

        this.velocityInterface.setVelocity((long) length * SCALE_FACTOR, (short) adjustedAngle, (short) 0);
        //this.Force((int) (noDecimalTrigTable.cos((short) angle) * length) / SCALE, (int) (noDecimalTrigTable.sin((short) angle) * length) / SCALE, clearing);
        
        //TWB - The ChangePlan might cause this logic instead.
        if(clearing == 1) {
            if(this.processor == Processor.getInstance()) {
                this.processor = new GDProcessor(this);
            }
        }
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

    public void process(final long timeDelta) throws Exception {
        this.processor.process(timeDelta);
    }
    
    public void updateGDObject(final long timeDelta)
    {
        this.move();
     
        this.gdObject.x = this.x;
        this.gdObject.y = this.y;
        
        this.updateRotation(timeDelta);

        int opacity = this.gdObject.opacity;
        if(opacity < 0) {
            opacity = 0;
        }
        
        final int size = this.initIndexedAnimationInterfaceArray.length;
        for(int index = 0; index < size; index++) {
            this.initIndexedAnimationInterfaceArray[index].setAlpha(opacity);
            if(this.gdObject.basicColor != null) {
                //LogUtil.put(LogFactory.getInstance("setBasicColor: " + this.gdObject.basicColor, this, "updateGDObject"));
                this.initIndexedAnimationInterfaceArray[index].setBasicColor(this.gdObject.basicColor);
            }
        }
        
        //if(this.getName().startsWith(PLAYER)) {
            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().UPDATE, this, this.toString()));
        //}
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
            this.gdObject.angle += angleAdjustment;
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
            //LogUtil.put(LogFactory.getInstance(new StringBuilder().append(this.getName()).append(" GDObject name: ").append(this.gdObject.name).toString(), this, "setRotation"));
            rotationAnimation = this.rotationAnimationInterfaceArray[this.gdObject.animation];
            //if(this.getName().equals(PLAYER)) {
            //if(this.getName().startsWith(PLAYER)) {
                //LogUtil.put(LogFactory.getInstance(new StringBuilder().append(this.getName()).append(GDObjectStrings.getInstance().ANGLE).append(rotationAnimation.getAngleInfo().getAngle()).append(" angleAdjustment: ").append(angleAdjustment).toString(), this, "setRotation"));
            //}
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
                //LogUtil.put(LogFactory.getInstance(rotationAnimation.toString(), this, "setRotation"));
            //}
            
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
            indexedAnimationInterfaceArray[this.gdObject.animation].paint(graphics, x, y);
            //}

            //this.paintPoints(graphics);
            //this.paintDebug(graphics);
        }
        catch (Exception e)
        {
            //LogUtil.put(LogFactory.getInstance(new StringBuilder().append(this.getName()).append(" GDObject name: ").append(this.gdObject.name).toString(), this, "paint"));
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "paint", e));
        }
        
    }

    public void paintThreed(Graphics graphics)
    {
        try
        {
            final ViewPosition viewPosition = this.getViewPosition();
            this.indexedAnimationInterfaceArray[this.gdObject.animation].paintThreed(graphics,
                viewPosition.getX(), viewPosition.getY(), viewPosition.getZ());
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "paintThreed", e));
        }
    }
    
    //private final StringBuilder stringBuilder = new StringBuilder();
    //private final String F = "F";
    //private final String E = "E";
    public void paintPoints(Graphics graphics) {

        //if(this.getName().startsWith(PLAYER_0)) {

            //final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
            
            //this.basicColorUtil.setBasicColor(graphics, BasicColorFactory.getInstance().AQUA);
        
//        for(int index = 0; index < 360; index+=30) {
//
//        final int x = (int) (noDecimalTrigTable.cos((short) index) * 16) / noDecimalTrigTable.SCALE;
//        final int y = (int) (noDecimalTrigTable.sin((short) index) * 16) / noDecimalTrigTable.SCALE;
//        //final int x = 0;
//        //final int y = 0;
//        final int startX = x - 5;
//        final int startY = y - 5;
//        final int endX = x + 5;
//        final int endY = y + 5;
//
//        final int halfWidth = this.getHalfWidth();
//        final int halfHeight = this.getHalfHeight();
//        graphics.drawLine(this.x + startX + halfWidth, this.y + y + halfHeight, this.x + endX + halfWidth, this.y + y + halfHeight);
//        graphics.drawLine(this.x + x + halfWidth, this.y + startY + halfHeight, this.x + x + halfWidth, this.y + endY + halfHeight);
//
//        stringBuilder.delete(0, stringBuilder.length());
//        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, stringBuilder.append(CommonStrings.getInstance().EXCEPTION_LABEL).append(objectStrings.ANGLE).append(index).append(':').append(this.x).append(':').append(x).append(':').append(halfWidth).toString()));
//        
//        }
        
            //final short angle = this.getRotationAnimationInterface().getAngleInfo().getAngle() - 90;
//            final short angle = this.gdObject.angle;
//
//            int adjustedAngle = angle;
//            while (adjustedAngle > 359) {
//                adjustedAngle -= 360;
//            }
//            while (adjustedAngle < 0) {
//                adjustedAngle += 360;
//            }
//
//            if (angle != this.gdObject.angle) {
//                stringBuilder.delete(0, stringBuilder.length());
//                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, stringBuilder.append(CommonStrings.getInstance().EXCEPTION_LABEL).append(angle).append(':').append(this.gdObject.angle).toString()));
//            } else {
//                stringBuilder.delete(0, stringBuilder.length());
//                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, stringBuilder.append(CommonStrings.getInstance().EXCEPTION_LABEL).append(angle).toString()));
//            }
//
//            final int x = (int) (noDecimalTrigTable.cos((short) adjustedAngle) * 16) / noDecimalTrigTable.SCALE;
//            final int y = (int) (noDecimalTrigTable.sin((short) adjustedAngle) * 16) / noDecimalTrigTable.SCALE;
//            graphics.drawString(F, this.x + x + this.getHalfWidth(), this.y + y + this.getHalfHeight(), 0);
//            final int x2 = (int) (noDecimalTrigTable.cos((short) adjustedAngle) * -16) / noDecimalTrigTable.SCALE;
//            final int y2 = (int) (noDecimalTrigTable.sin((short) adjustedAngle) * -16) / noDecimalTrigTable.SCALE;
//            graphics.drawString(E, this.x + x2 + this.getHalfWidth(), this.y + y2 + this.getHalfHeight(), 0);

//        stringBuilder.delete(0, stringBuilder.length());
//        final String location = stringBuilder.append(Integer.toString(x)).append(',').append(Integer.toString(y)).toString();
//        
//        final ViewPosition viewPosition = this.getViewPosition();
//        final int viewX = viewPosition.getX();
//        final int viewY = viewPosition.getY();
//        graphics.drawString(location, viewX - this.getHalfWidth(), viewY - this.getHalfHeight(), 0);
//        graphics.drawString(location, viewX - this.getHalfWidth(), viewY - this.getHalfHeight() + this.getHeight() * 2, 0);
//        graphics.drawString(location, viewX - this.getHalfWidth() + this.getWidth() * 2, viewY - this.getHalfHeight(), 0);
//        graphics.drawString(location, viewX - this.getHalfWidth() + this.getWidth() * 2, viewY - this.getHalfHeight() + this.getHeight() * 2, 0);

//            this.basicColorUtil.setBasicColor(graphics, BasicColorFactory.getInstance().GREEN);
//
//            final int x = this.gdObject.PointX(null);
//            final int y = this.gdObject.PointY(null);
//            //final int x = 0;
//            //final int y = 0;
//            final int startX = x - 5;
//            final int startY = y - 5;
//            final int endX = x + 5;
//            final int endY = y + 5;
//
//            //final int halfWidth = this.getHalfWidth();
//            //final int halfHeight = this.getHalfHeight();
//            graphics.drawLine(startX, y, endX, y);
//            graphics.drawLine(x, startY, x, endY);
        
        //}
    }
    
    public void paintAngle(final short angle, final Graphics graphics) {

            int adjustedAngle = angle;
//            while (adjustedAngle > 359) {
//                adjustedAngle -= 360;
//            }
//            while (adjustedAngle < 0) {
//                adjustedAngle += 360;
//            }

//            if (angle != this.gdObject.angle) {
//                stringBuilder.delete(0, stringBuilder.length());
//                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, stringBuilder.append(CommonStrings.getInstance().EXCEPTION_LABEL).append(angle).append(':').append(this.gdObject.angle).toString()));
//            } else {
//                stringBuilder.delete(0, stringBuilder.length());
//                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, stringBuilder.append(CommonStrings.getInstance().EXCEPTION_LABEL).append(angle).toString()));
//            }

//            final int x = (int) (noDecimalTrigTable.cos((short) adjustedAngle) * 48) / noDecimalTrigTable.SCALE;
//            final int y = (int) (noDecimalTrigTable.sin((short) adjustedAngle) * 48) / noDecimalTrigTable.SCALE;
////            //graphics.drawString(F, this.x + x + this.getHalfWidth(), this.y + y + this.getHalfHeight(), 0);
//            final int x2 = (int) (noDecimalTrigTable.cos((short) adjustedAngle) * -48) / noDecimalTrigTable.SCALE;
//            final int y2 = (int) (noDecimalTrigTable.sin((short) adjustedAngle) * -48) / noDecimalTrigTable.SCALE;
////            //graphics.drawString(E, this.x + x2 + this.getHalfWidth(), this.y + y2 + this.getHalfHeight(), 0);
//            graphics.drawLine(this.x + this.getHalfWidth(), this.y + this.getHalfHeight(), this.x + this.getHalfWidth() + x, this.y + this.getHalfHeight() + y);
//            graphics.drawLine(this.x + this.getHalfWidth(), this.y + this.getHalfHeight(), this.x + this.getHalfWidth() + x2, this.y + this.getHalfHeight() + y2);
    }

    public void paintDebug(final Graphics graphics) {
        
//        final int endX = (int) (this.x + (this.velocityInterface.getVelocityXBasicDecimal().getUnscaled() / 10));
//        final int endY = (int) (this.y + (this.velocityInterface.getVelocityYBasicDecimal().getUnscaled() / 10));
//        this.basicColorUtil.setBasicColor(graphics, BasicColorFactory.getInstance().AQUA);
//        graphics.drawLine(this.x + this.getHalfWidth(), this.y + this.getHalfHeight(), endX + this.getHalfWidth(), endY + this.getHalfHeight());
//
//        //graphics.drawString(Integer.toString(this.getRotationAnimationInterface().getAngleInfo().getAngle()), this.x, this.y, 0);
//        
//        this.basicColorUtil.setBasicColor(graphics, BasicColorFactory.getInstance().LIGHT_GREEN);
//        this.paintAngle(this.getRotationAnimationInterface().getAngleInfo().getAngle(), graphics);
//        this.basicColorUtil.setBasicColor(graphics, BasicColorFactory.getInstance().LIGHT_RED);
//        this.paintAngle((short) this.getRotationAnimationInterface().getFrame(), graphics);
        
        final ViewPosition viewPosition = this.getViewPosition();
        final int viewX = viewPosition.getX();
        final int viewY = viewPosition.getY();
        //LogUtil.put(LogFactory.getInstance("viewX: " + viewX + " viewY: " + viewY, this, "paint"));
        this.basicColorUtil.setBasicColor(graphics, BasicColorFactory.getInstance().PINK);
        graphics.drawRect(viewX - this.getHalfWidth(), viewY - this.getHalfHeight(), this.getWidth() * 2, this.getHeight() * 2);

        super.paint(graphics);

    }
    
    public void toString(final StringMaker stringBuffer) {

        super.toString(stringBuffer);
        
        final RotationAnimation rotationAnimation = this.rotationAnimationInterfaceArray[this.gdObject.animation];
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
