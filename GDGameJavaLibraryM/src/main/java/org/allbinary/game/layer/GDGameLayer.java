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
import org.allbinary.animation.Animation;
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
import org.allbinary.game.physics.velocity.VelocityProperties;
import org.allbinary.game.physics.velocity.VelocityUtil;
import org.allbinary.graphics.Rectangle;
import org.allbinary.image.opengles.OpenGLSurfaceChangedInterface;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.ScaleFactorFactory;
import org.allbinary.util.BasicArrayList;
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

    //protected final NoDecimalTrigTable noDecimalTrigTable = NoDecimalTrigTable.getInstance();
    private final ScaleFactorFactory scaleFactorFactory = ScaleFactorFactory.getInstance();
    //protected final int SCALE = noDecimalTrigTable.SCALE * 10; //* GameSpeed.getInstance().getSpeed();
    //protected final int SCALE_FACTOR_VALUE = (scaleFactorFactory.DEFAULT_SCALE_VALUE / scaleFactorFactory.DEFAULT_SCALE_FACTOR) * 2 / 3;
    protected final int SCALE_FACTOR = scaleFactorFactory.DEFAULT_SCALE_FACTOR;
    protected final int SCALE_FACTOR2 = SCALE_FACTOR * 4;

    protected final int quarterWidth = (this.getHalfWidth() >> 1) - 1;
    protected final int quarterHeight = (this.getHalfHeight() >> 1) - 1;

    protected final CombatBaseBehavior combatBaseBehavior;

    public Animation[] animationArray = new Animation[0];

    protected final IndexedAnimation[] initIndexedAnimationInterfaceArray;
    protected IndexedAnimation[] indexedAnimationInterfaceArray;

    protected final VelocityProperties velocityInterface;
    // protected AccelerationInterface accelerationInterface;
    //protected final BasicAccelerationProperties acceleration;

    protected long realX;
    protected long realY;
    
    protected final GDTwodBehavior dimensionalBehavior;
    
    protected final BasicArrayList gameLayerList;
    protected final BasicArrayList gameLayerDestroyedList;
    protected final BasicArrayList behaviorList;

    public final Rectangle[][] rectangleArrayOfArrays;

    public GDObject gdObject;

    protected ScalableBaseProcessor scalableProcessor = ScalableBaseProcessor.getInstance();
    protected Processor processor = Processor.getInstance();
    
    public GDGameLayer(final BasicArrayList gameLayerList, final BasicArrayList gameLayerDestroyedList, 
            final BasicArrayList behaviorList,
            final VelocityProperties velocityInterface,
            final String gdName, final Group[] groupInterface,
            final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
            final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
            final Rectangle layerInfo, 
            final Rectangle[][] rectangleArrayOfArrays,
            final ViewPosition viewPosition,
            final GDObject gdObject, final GDAnimationBehaviorBase animationBehavior) throws Exception {
        super(groupInterface, gdName, layerInfo, viewPosition);

        this.gameLayerList = gameLayerList;
        this.gameLayerDestroyedList = gameLayerDestroyedList;
        
        this.behaviorList = behaviorList;
        
        this.gdObject = gdObject;

        //final GameTickDisplayInfoSingleton gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
        //final MathUtil mathUtil = MathUtil.getInstance();
        //final GameSpeed gameSpeed = GameSpeed.getInstance();
        
        this.velocityInterface = velocityInterface; //new VelocityProperties(3200, 3200);
                        //(1700 * mathUtil.sqrt((gameTickDisplayInfoSingleton.getLastWidth() + gameTickDisplayInfoSingleton.getLastHeight()))) * gameSpeed.getSpeed() / 20, 
                        //(1322 * mathUtil.sqrt((gameTickDisplayInfoSingleton.getLastWidth() + gameTickDisplayInfoSingleton.getLastHeight()))) * gameSpeed.getSpeed() / 20);
        
        /*        
        this.acceleration = new BasicAccelerationProperties(
                this.velocityInterface.getMaxForwardVelocity() / 12,
                -this.velocityInterface.getMaxReverseVelocity() / 12
                );
        */
        
        this.initPosition(this.gdObject.x, this.gdObject.y, this.gdObject.zOrder);
        this.initPosition();

        //LogUtil.put(LogFactory.getInstance(this.gdObject.toShortString(), this, commonStrings.CONSTRUCTOR));
        final int size = animationInterfaceFactoryInterfaceArray.length;
        for(int index = 0; index < size; index++) {
            animationInterfaceFactoryInterfaceArray[index].setInitialSize(this.gdObject.Width(null), this.gdObject.Height(null));
        }

        this.initIndexedAnimationInterfaceArray = animationBehavior.init(this.gdObject, animationInterfaceFactoryInterfaceArray);
        this.setIndexedAnimationInterfaceArray(this.initIndexedAnimationInterfaceArray);

        if(this.initIndexedAnimationInterfaceArray.length > 0 && this.initIndexedAnimationInterfaceArray[0].isThreed()) { 
            this.dimensionalBehavior = new GDThreedBehavior(animationBehavior, (RotationAnimation[]) this.initIndexedAnimationInterfaceArray);
        } else {
            this.dimensionalBehavior = new GDTwodBehavior(animationBehavior);
        }
        
        this.combatBaseBehavior = new CombatBaseBehavior(
                DamageableBaseBehavior.getInstance(), new GDDestroyableSimpleBehavior(this));
        
        //LogUtil.put(LogFactory.getInstance(this.toString(), this, commonStrings.CONSTRUCTOR));
        
        this.dimensionalBehavior.reset(gdObject);
        
        this.rectangleArrayOfArrays = rectangleArrayOfArrays;
    }

    public void setGDObject(final GDObject gdObject) throws Exception {
        this.dimensionalBehavior.animationBehavior.setRotationAnimationInterfaceArray(this.initIndexedAnimationInterfaceArray);
        this.setIndexedAnimationInterfaceArray(this.initIndexedAnimationInterfaceArray);
        this.dimensionalBehavior.reset(gdObject);
        
        this.gdObject = gdObject;
        this.initPosition(this.gdObject.x, this.gdObject.y, this.gdObject.zOrder);
        this.initPosition();
        this.setDestroyed(false);
    }

    public void setAllBinaryGameLayerManager(final AllBinaryGameLayerManager allBinaryGameLayerManager) throws Exception {
        
    }

    public void set(final GL gl) throws Exception
    {
        final int size = this.initIndexedAnimationInterfaceArray.length;
        OpenGLSurfaceChangedInterface openGLSurfaceChangedInterface;
        for(int index = 0; index < size; index++) {
            openGLSurfaceChangedInterface = (OpenGLSurfaceChangedInterface) this.initIndexedAnimationInterfaceArray[index];
            openGLSurfaceChangedInterface.set(gl);
        }
    }

    public VelocityProperties getVelocityProperties() {
        return this.velocityInterface;
    }

    public void setRotation(final short angleAdjustment) {
        this.dimensionalBehavior.animationBehavior.setRotation(this, angleAdjustment);
    }
    
    protected IndexedAnimation[] getInitIndexedAnimationInterfaceArray()
    {
        return initIndexedAnimationInterfaceArray;
    }

    protected void setIndexedAnimationInterfaceArray(
            final IndexedAnimation[] animationInterface)
    {
        this.indexedAnimationInterfaceArray = animationInterface;
    }

    protected IndexedAnimation[] getIndexedAnimationInterfaceArray()
    {
        return indexedAnimationInterfaceArray;
    }

    public IndexedAnimation getIndexedAnimationInterface()
    {
        return indexedAnimationInterfaceArray[this.gdObject.animation];
    }
    
//    public void setCombatBaseBehavior(CombatBaseBehavior combatBaseBehavior)
//    {
//        this.combatBaseBehavior = combatBaseBehavior;
//    }

    public CombatBaseBehavior getCombatBaseBehavior()
    {
        return combatBaseBehavior;
    }

    public void damage(final int damage, final int damageType)
    throws Exception
    {
        this.combatBaseBehavior.getDamageableBaseBehavior().damage(damage, damageType);
    }

    public int getDamage(final int damageType)
    throws Exception
    {
        return this.combatBaseBehavior.getDamageableBaseBehavior().getDamage(damageType);
    }

    public boolean isDestroyed() 
    throws Exception
    {
        return this.combatBaseBehavior.getDestroyableBaseBehavior().isDestroyed();
    }

    public void setDestroyed(final boolean destroyed)
    {
        this.gameLayerList.remove(this);
        this.gameLayerDestroyedList.add(this);
        this.combatBaseBehavior.getDestroyableBaseBehavior().setDestroyed(destroyed);
    }
        
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

        final int scaleFactorValue = scaleFactorFactory.DEFAULT_SCALE_VALUE;
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
    
    public int isMovingX() {
        return (int) (this.velocityInterface.getVelocityXBasicDecimal().getScaled() / this.SCALE_FACTOR);
    }

    public int isMovingY() {
        return (int) (this.velocityInterface.getVelocityYBasicDecimal().getScaled() / this.SCALE_FACTOR);
    }
    
    public void setPosition(final int x, final int y, final int z)
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
//            LogUtil.put(LogFactory.getInstance(new StringMaker()
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

    public void AddForce(final int x, final int y) {
        
        this.velocityInterface.getVelocityXBasicDecimal().set(x * SCALE_FACTOR2);
        this.velocityInterface.getVelocityYBasicDecimal().set(y * SCALE_FACTOR2);
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
//        if(this.scalableProcessor == ScalableProcessor.getInstance()) {
//            LogUtil.put(LogFactory.getInstance(this.getName(), this, "updateGDObject"));
//        }
        
        this.move();
     
        //this.gdObject.x = this.x;
        //this.gdObject.y = this.y;
        this.gdObject.setX(this.x);
        this.gdObject.setY(this.y);
        
        this.updateRotation(timeDelta);

        int opacity = (int) this.gdObject.opacity;
        if(opacity < 0) {
            opacity = 0;
        }
        
        final int size = this.initIndexedAnimationInterfaceArray.length;
        for(int index = 0; index < size; index++) {
            //LogUtil.put(LogFactory.getInstance(this.getName(), this, "updateGDObject2"));
            this.initIndexedAnimationInterfaceArray[index].setAlpha(opacity);
            this.scalableProcessor.process(this.gdObject, this.initIndexedAnimationInterfaceArray[index]);
            if(this.gdObject.basicColor != null) {
                //LogUtil.put(LogFactory.getInstance("setBasicColor: " + this.gdObject.basicColor, this, "updateGDObject"));
                this.initIndexedAnimationInterfaceArray[index].changeBasicColor(this.gdObject.basicColor);
            }
        }

        //if(this.getName().startsWith(PLAYER)) {
            //LogUtil.put(LogFactory.getInstance(commonStrings.UPDATE, this, this.toString()));
        //}
    }

    public void resetAnimation() {
        this.initIndexedAnimationInterfaceArray[this.gdObject.animation].setFrame(0);
    }
    
    public void animate(final long timeDelta) {
        
        VelocityUtil.reduce(this.velocityInterface, 30, 100);

        this.dimensionalBehavior.animationBehavior.animate(this.gdObject, this.initIndexedAnimationInterfaceArray, timeDelta);
    }

    public void updateRotation(final long timeDelta) {
        this.dimensionalBehavior.updateRotation(this, timeDelta);
    }

//    private float lastScaleX = Float.MIN_VALUE;
//    private float lastScaleY = Float.MIN_VALUE;
    public void setScalable() {
//        if(this.gdObject.scaleX != lastScaleX) {
//            LogUtil.put(LogFactory.getInstance("scaleX: " + this.gdObject.scaleX, this, commonStrings.PROCESS));
//        }
//        if(this.gdObject.scaleY != lastScaleY) {
//            LogUtil.put(LogFactory.getInstance("scaleY: " + this.gdObject.scaleY, this, commonStrings.PROCESS));
//        }
        
        if(this.scalableProcessor == ScalableBaseProcessor.getInstance()) {
            //LogUtil.put(LogFactory.getInstance("set maxscaleallowed 5", this, commonStrings.PROCESS));
            final int size = this.initIndexedAnimationInterfaceArray.length;
            for (int index = 0; index < size; index++) {
                this.initIndexedAnimationInterfaceArray[index].setMaxScale(5, 5);
            }
        }
        this.scalableProcessor = ScalableProcessor.getInstance();
    }
    
    //private boolean isFirst = true;
    //private final String PAINT = "paint";
    //private final String W_ = "w ";
    public void paint(final Graphics graphics)
    {
        try
        {
            //if(animationBehaviorBase.getInstance() == this.animationBehavior) {
                //final ViewPosition viewPosition = this.getViewPosition();
                //LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.gdObject.name).append(viewPosition.getX()).append(' ').append(viewPosition.getY()).toString(), this, PAINT));
//            if(this.isFirst) {
//                this.isFirst = false;
                //LogUtil.put(LogFactory.getInstance(this.gdObject.name + indexedAnimationInterfaceArray[this.gdObject.animation], this, PAINT));
                //graphics.drawString(W_ + this.getWidth(), x, y, 0);
                //graphics.drawImage(img, this.x, this.y, Graphics.TOP | Graphics.LEFT);
            //}
            
            //int x = this.x - quarterWidth;
            //int y = this.y - quarterHeight;
            final ViewPosition viewPosition = this.getViewPosition();
            final int x = viewPosition.getX();
            final int y = viewPosition.getY();

            //for (int index = 0; index < SIZE; index++) {
            this.indexedAnimationInterfaceArray[this.gdObject.animation].paint(graphics, x, y);
            //}

            final int size = animationArray.length;
            for (int index = 0; index < size; index++) {
                this.animationArray[index].paint(graphics, x, y);
            }
            
            //this.paintPoints(graphics);
            this.paintDebug(graphics);
        }
        catch (Exception e)
        {
            //LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.getName()).append(" GDObject name: ").append(this.gdObject.name).toString(), this, "paint"));
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "paint", e));
        }
        
    }

    public void paintThreed(final Graphics graphics)
    {
        try
        {
            final ViewPosition viewPosition = this.getViewPosition();
            final int x = viewPosition.getX();
            final int y = viewPosition.getY();
            final int z = viewPosition.getZ();

            this.indexedAnimationInterfaceArray[this.gdObject.animation].paintThreed(graphics, x, y, z);
            
            final int size = animationArray.length;
            for (int index = 0; index < size; index++) {
                this.animationArray[index].paintThreed(graphics, x, y, z);
            }

        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "paintThreed", e));
        }
    }
    
    //private final StringMaker stringBuilder = new StringMaker();
    //private final String F = "F";
    //private final String E = "E";
    public void paintPoints(final Graphics graphics) {

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
//        LogUtil.put(LogFactory.getInstance(commonStrings.PROCESS, this, stringBuilder.append(commonStrings.EXCEPTION_LABEL).append(objectStrings.ANGLE).append(index).append(':').append(this.x).append(':').append(x).append(':').append(halfWidth).toString()));
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
//                LogUtil.put(LogFactory.getInstance(commonStrings.PROCESS, this, stringBuilder.append(commonStrings.EXCEPTION_LABEL).append(angle).append(':').append(this.gdObject.angle).toString()));
//            } else {
//                stringBuilder.delete(0, stringBuilder.length());
//                LogUtil.put(LogFactory.getInstance(commonStrings.PROCESS, this, stringBuilder.append(commonStrings.EXCEPTION_LABEL).append(angle).toString()));
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
//                LogUtil.put(LogFactory.getInstance(commonStrings.PROCESS, this, stringBuilder.append(commonStrings.EXCEPTION_LABEL).append(angle).append(':').append(this.gdObject.angle).toString()));
//            } else {
//                stringBuilder.delete(0, stringBuilder.length());
//                LogUtil.put(LogFactory.getInstance(commonStrings.PROCESS, this, stringBuilder.append(commonStrings.EXCEPTION_LABEL).append(angle).toString()));
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
        
        //graphics.drawString(this.getName(), x, y, 0);

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
        
//        final ViewPosition viewPosition = this.getViewPosition();
//        final int viewX = viewPosition.getX();
//        final int viewY = viewPosition.getY();
        //LogUtil.put(LogFactory.getInstance("viewX: " + viewX + " viewY: " + viewY, this, "paint"));
//        this.basicColorUtil.setBasicColor(graphics, BasicColorFactory.getInstance().PINK);
//        graphics.drawRect(viewX - this.getHalfWidth(), viewY - this.getHalfHeight(), this.getWidth() * 2, this.getHeight() * 2);

        super.paint(graphics);

//        final StringMaker stringMaker = new StringMaker();
//        final CommonSeps commonSeps = CommonSeps.getInstance();
//        this.basicColorUtil.setBasicColor(graphics, BasicColorFactory.getInstance().WHITE);
//        graphics.drawString(stringMaker.append(c).append(commonSeps.COMMA).append(r).append(commonSeps.COLON).toString(), x + 5, y + 10, 0);        
//        final GDGameLayer PlatformerMapGDGameLayer = (GDGameLayer) globals.PlatformerMapGDGameLayerList.get(0);
//        final GD0GDObjectsFactory.PlatformerMap PlatformerMap = (GD0GDObjectsFactory.PlatformerMap) PlatformerMapGDGameLayer.gdObject;                                
//        EnemiesGDGameLayer.c = PlatformerMap.placementXIntArray[PlatformerMap.placementIntArray[PlatformerMap.placementIndex]] / 24;
//        EnemiesGDGameLayer.r = PlatformerMap.placementYIntArray[PlatformerMap.placementIntArray[PlatformerMap.placementIndex]] / 24;
//        stringBuilder.delete(0, stringBuilder.length());
//        LogUtil.put(LogFactory.getInstance(stringBuilder.append("TWB c: ").append(EnemiesGDGameLayer.c).append(" r: ").append(EnemiesGDGameLayer.r).toString(), this, commonStrings.PROCESS));

        this.getCollidableInferface().paint(graphics);
    }
        
//    public int c;
//    public int r;
    
    public void toString(final StringMaker stringBuffer) {

        super.toString(stringBuffer);        
        this.dimensionalBehavior.animationBehavior.toString(this.gdObject, stringBuffer);
        stringBuffer.append(this.gdObject.toString());
    }    
    
    public String toString()
    {
        final StringMaker stringBuffer = new StringMaker();

        this.toString(stringBuffer);
 
        return stringBuffer.toString();
    }
    
}
