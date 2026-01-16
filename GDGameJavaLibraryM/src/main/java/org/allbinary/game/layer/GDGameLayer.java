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
import org.allbinary.animation.text.CustomTextAnimation;
import org.allbinary.animation.text.GetTextInterface;
import org.allbinary.canvas.Processor;
import org.allbinary.game.combat.CombatBaseBehavior;
import org.allbinary.game.combat.damage.DamageableBaseBehavior;
import org.allbinary.game.combat.destroy.GDDestroyableSimpleBehavior;
import org.allbinary.game.layout.GDObject;
import org.allbinary.game.identification.Group;
import org.allbinary.game.multiplayer.layer.MultiPlayerGameLayer;
import org.allbinary.game.multiplayer.layer.RemoteInfo;
import org.allbinary.game.physics.velocity.VelocityProperties;
import org.allbinary.game.physics.velocity.DragVelocityBehavior;
import org.allbinary.game.physics.velocity.VelocityBehaviorBase;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.image.opengles.OpenGLSurfaceChangedInterface;
import org.allbinary.logic.string.StringMaker;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.ScaleFactorFactory;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.math.FrameUtil;
import org.allbinary.media.ScaleProperties;
import org.allbinary.util.BasicArrayList;
import org.allbinary.view.ViewPosition;

/**
 *
 * @author User
 */
public class GDGameLayer 
    //extends UnitLayer
    extends MultiPlayerGameLayer 
        //implements //RotationAnimationInterfaceCompositeInterface, DirectionalCompositeInterface,
        //ArtificialIntelligenceCompositeInterface, GameInputInterface,
        //VelocityInterfaceCompositeInterface 
        {
    protected final LogUtil logUtil = LogUtil.getInstance();

    protected final FrameUtil frameUtil = FrameUtil.getInstance();

    //protected final NoDecimalTrigTable noDecimalTrigTable = NoDecimalTrigTable.getInstance();
    private final ScaleFactorFactory scaleFactorFactory = ScaleFactorFactory.getInstance();
    //protected final int SCALE = noDecimalTrigTable.SCALE * 10; //* GameSpeed.getInstance().getSpeed();
    //protected final int SCALE_FACTOR_VALUE = (scaleFactorFactory.DEFAULT_SCALE_VALUE / scaleFactorFactory.DEFAULT_SCALE_FACTOR) * 2 / 3;
    protected final int SCALE_FACTOR = scaleFactorFactory.DEFAULT_SCALE_FACTOR;
    protected final int SCALE_FACTOR2 = SCALE_FACTOR * 2;

    protected final int quarterWidth = (this.getHalfWidth() >> 1) - 1;
    protected final int quarterHeight = (this.getHalfHeight() >> 1) - 1;

    protected final CombatBaseBehavior combatBaseBehavior;

    protected final IndexedAnimation[] initIndexedAnimationInterfaceArray;
    protected IndexedAnimation[] indexedAnimationInterfaceArray;
    private final ResetAnimationBehavior resetAnimationBehavior;

    protected final VelocityProperties velocityInterface;
    // protected AccelerationInterface accelerationInterface;
    //protected final BasicAccelerationProperties acceleration;

    protected long realX;
    protected long realY;
    
    private final GDTwodBehavior dimensionalBehavior;
    
    protected final BasicArrayList gameLayerList;
    protected final BasicArrayList gameLayerDestroyedList;
    protected final BasicArrayList behaviorList;

    public final Rectangle[][] rectangleArrayOfArrays;

    public final BasicArrayList linkedGDGameLayerList = new BasicArrayList();    

    public GDObject gdObject;

    public Animation primitiveDrawing;

    protected ScalableBaseProcessor scalableProcessor = ScalableBaseProcessor.getInstance();
    protected Processor moveProcessor = new Processor() {
        
        @Override
        public void process(final long timeDelta) throws Exception {
            move();
        }
    };
    protected Processor processor = moveProcessor;

    public VelocityBehaviorBase velocityBehavior = DragVelocityBehavior.instance;

//    private float lastScaleX = 1;
//    private float lastScaleY = 1;
    
    private static final String HACK_ANIMATION_NAME = "ttack";
    
    public GDGameLayer(final Animation primitiveDrawing, 
            final BasicArrayList gameLayerList, final BasicArrayList gameLayerDestroyedList, 
            final BasicArrayList behaviorList,
            final VelocityProperties velocityInterface,
            final RemoteInfo remoteInfo,
            final Group[] groupInterface,
            final String gdName, 
            final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
            final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
            final Rectangle layerInfo, 
            final Rectangle[][] rectangleArrayOfArrays,
            final ViewPosition viewPosition,
            final GDObject gdObject, final GDAnimationBehaviorBase animationBehavior,
            final boolean rotationAdjustment) throws Exception {
        super(remoteInfo, groupInterface, gdName, layerInfo, viewPosition);
//        super(remoteInfo, 
//            null,
//            //final AdvancedRTSGameLayer parentLayer,
//            groupInterface, gdObject.name, gdName, 
//
//               new VehicleProperties(new VelocityProperties(0,0),
//                   new VehicleFrictionProperties(0, 0, 0, 0)),
//               new Health(500 + UnitTechnologySingletonFactory.getInstance().getHealth()),
//               SmallIntegerSingletonFactory.getInstance().getInstance(50),
//            //final Integer maxLoad,
//               NoSound.getInstance(),
//            //final Sound moveSoundInterface,
//               GDFlagLayerInterfaceFactory.getInstance(),
//            //final LayerInterfaceFactoryInterface waypointLayerInterfaceFactoryInterface,
//            NullRotationAnimationFactory.getFactoryInstance(),
//            NullRotationAnimationFactory.getFactoryInstance(),
//            NullRotationAnimationFactory.getFactoryInstance(),
//            NullRotationAnimationFactory.getFactoryInstance(),
//            NullRotationAnimationFactory.getFactoryInstance(),
//            NullRotationAnimationFactory.getFactoryInstance(),
//            NullRotationAnimationFactory.getFactoryInstance(),
//            layerInfo, 
//            null,
//            //final BasicGeographicMap geographicMapInterface,
//            DirectionFactory.getInstance().LEFT,
//            0, 
//            0, 
//            0
////            viewPosition
//            );
                
        this.primitiveDrawing = primitiveDrawing;
        
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

        //logUtil.put(this.gdObject.toShortString(), this, commonStrings.CONSTRUCTOR);
        final int size = animationInterfaceFactoryInterfaceArray.length;
        for(int index = 0; index < size; index++) {
            final String animationName = this.gdObject.getAnimationFromIndex(index);
            final ScaleProperties scaleProperties = new ScaleProperties();
            scaleProperties.scaleX = this.gdObject.initScaleX * this.gdObject.customScale;
            scaleProperties.scaleY = this.gdObject.initScaleY * this.gdObject.customScale;
            scaleProperties.scaleWidth = this.gdObject.Width(null);
            scaleProperties.scaleHeight = this.gdObject.Height(null);
            if(animationName != StringUtil.getInstance().EMPTY_STRING && animationName.indexOf(HACK_ANIMATION_NAME) >= 0) {
                scaleProperties.shouldScale = true;
                //logUtil.put(new StringMaker().append(this.gdObject.toShortString()).append(scaleProperties.toString()).toString(), this, commonStrings.CONSTRUCTOR);
            }
            animationInterfaceFactoryInterfaceArray[index].setInitialScale(scaleProperties);
        }

        this.initIndexedAnimationInterfaceArray = animationBehavior.init(this.gdObject, animationInterfaceFactoryInterfaceArray);
        this.setIndexedAnimationInterfaceArray(this.initIndexedAnimationInterfaceArray);
        
        if(this.initIndexedAnimationInterfaceArray[0].getSize() >= 90 && rotationAdjustment) {
            this.resetAnimationBehavior = ResetRotationAnimationBehavior.getInstance();
        } else {
            this.resetAnimationBehavior = ResetAnimationBehavior.getInstance();
        }

        animationBehavior.add(this);

        if(this.initIndexedAnimationInterfaceArray.length > 0 && this.initIndexedAnimationInterfaceArray[0].isThreed()) { 
            this.dimensionalBehavior = new GDThreedBehavior(animationBehavior, (RotationAnimation[]) this.initIndexedAnimationInterfaceArray);
        } else {
//            if(this.gdObject.name.indexOf("player") >=0) {
//                this.dimensionalBehavior = new GDTwodBehavior2(animationBehavior);
//            } else {
                this.dimensionalBehavior = new GDTwodBehavior(animationBehavior);
//            }
        }
        
        this.combatBaseBehavior = new CombatBaseBehavior(
                DamageableBaseBehavior.getInstance(), new GDDestroyableSimpleBehavior(this));
        
        //logUtil.put(this.toString(), this, commonStrings.CONSTRUCTOR);
        
        this.dimensionalBehavior.reset(this, gdObject);
        
        this.rectangleArrayOfArrays = rectangleArrayOfArrays;
    }

    public boolean hasCollisionMask() {
        if (this.rectangleArrayOfArrays != null && this.rectangleArrayOfArrays.length > 0 && this.rectangleArrayOfArrays[0].length > 0) {
            return true;
        } else {
            return false;
        }
    }

    public void setGDObject(final GDObject gdObject) throws Exception {

        final int size = this.initIndexedAnimationInterfaceArray.length;
        for (int index = 0; index < size; index++) {
            this.initIndexedAnimationInterfaceArray[index].setFrame(frameUtil.getFrameForAngle((short) 0, 1));
        }

        //logUtil.put(playerGDGameLayer.getName(), this, "new");
        //logUtil.put(playerGDGameLayer.getName() + " old angle: " + playerGDGameLayer.gdObject.angle, this, "setGDObject");
        //playerGDGameLayer.setGDObject(gdObject);

        //gdObject.setAngle(this.gdObject.angle);
        gdObject.angle = this.gdObject.angle;

        this.dimensionalBehavior.getAnimationBehavior().setAnimationArray(this.initIndexedAnimationInterfaceArray);
        this.setIndexedAnimationInterfaceArray(this.initIndexedAnimationInterfaceArray);
        this.dimensionalBehavior.reset(this, gdObject);
        
        this.gdObject = gdObject;
        this.initPosition(this.gdObject.x, this.gdObject.y, this.gdObject.zOrder);
        this.initPosition();
        this.setDestroyed(false);
    }

    //Update main size when scaled.
//    public void setInitialScale(final float scaleX, final float scaleY) {
//        
//        if(this.lastScaleX != scaleX || this.lastScaleY != scaleY) {
//            
//            this.setWidth((int) (this.getInitWidth() * scaleX));
//            this.setHeight((int) (this.getInitHeight() * scaleY));
//            this.getCollidableInferface().update();
//            this.lastScaleX = scaleX;
//            this.lastScaleY = scaleY;
//        }
//    }

    @Override
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
        this.dimensionalBehavior.getAnimationBehavior().setRotation(this, angleAdjustment);
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

    @Override
    public void damage(final int damage, final int damageType)
    throws Exception
    {
        this.combatBaseBehavior.getDamageableBaseBehavior().damage(damage, damageType);
    }
    
    @Override
    public int getDamage(final int damageType)
    throws Exception
    {
        return this.combatBaseBehavior.getDamageableBaseBehavior().getDamage(damageType);
    }

    @Override
    public boolean isDestroyed() 
    throws Exception
    {
        return this.combatBaseBehavior.getDestroyableBaseBehavior().isDestroyed();
    }

    public void setDestroyed(final boolean destroyed)
        throws Exception
    {
        //super.setDestroyed(destroyed);
        this.gameLayerList.remove(this);
        this.gameLayerDestroyedList.add(this);
        this.combatBaseBehavior.getDestroyableBaseBehavior().setDestroyed(destroyed);
    }
        
//    private final String PLAYER = "player";
//    private final String MOVE = "move";
    
    @Override
    public void move()
    {
        //final int dx = velocityInterface.getVelocityXBasicDecimalP().getScaled();
        //final int dy = velocityInterface.getVelocityYBasicDecimalP().getScaled();
        //super.move(dx, dy);

        final long velocityX = velocityInterface.getVelocityXBasicDecimalP().getUnscaled();
        final long velocityY = velocityInterface.getVelocityYBasicDecimalP().getUnscaled();

        //final long priorRealX = this.realX;
        //final long priorRealY = this.realY;
        this.realX = this.realX + velocityX;
        this.realY = this.realY + velocityY;

        final int scaleFactorValue = scaleFactorFactory.DEFAULT_SCALE_VALUE;
        final int x = (int) (this.realX / scaleFactorValue);
        final int y = (int) (this.realY / scaleFactorValue);

        //if(this.getName().equals(PLAYER)) {
//        if(this.getName().startsWith(MEDIUM_ASTEROID)) {
//        if(this.getName().indexOf(BULLET) > 0) {
//            final PositionStrings positionStrings = PositionStrings.getInstance();
//            final StringMaker stringMaker = new StringMaker();
//            logUtil.put(stringMaker
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
//                .toString(), this, MOVE);            
//        }
        
        super.setPosition(x, y, this.z);
    }
    
    public int isMovingX() {
        return (int) (this.velocityInterface.getVelocityXBasicDecimalP().getScaled() / this.SCALE_FACTOR);
    }

    public int isMovingY() {
        return (int) (this.velocityInterface.getVelocityYBasicDecimalP().getScaled() / this.SCALE_FACTOR);
    }
    
    @Override
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
        
        this.gdObject.forceAngle = (short) adjustedAngle;
        this.velocityInterface.setVelocity((long) length * SCALE_FACTOR2, (short) adjustedAngle, (short) 0);
        //this.Force((int) (noDecimalTrigTable.cos((short) angle) * length) / SCALE, (int) (noDecimalTrigTable.sin((short) angle) * length) / SCALE, clearing);
        
        //if(this.getName().equals(PLAYER_0)) {
//        if(this.getName().startsWith(MEDIUM_ASTEROID)) {
//            final GDGameLayerStrings gameLayerStrings = GDGameLayerStrings.getInstance();
//            final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
//            logUtil.put(new StringMaker()
//                .append(this.getName())
//                .append(CommonSeps.getInstance().COLON)
//                .append(this.velocityInterface.toString())
//                ////.append(this.rotationAnimationInterface[this.gdObject.animation].getAngleInfo().toString())
//                ////.append(objectStrings.ROTATION).append(this.gdObject.rotation)
//                ////.append(objectStrings.ANGLE).append(this.gdObject.angle)
//                .append(objectStrings.ANGLE).append(angle)
//                .append(objectStrings.ANGLE).append(adjustedAngle)
//                .append(gameLayerStrings.LENGTH).append(length).toString(), this, gameLayerStrings.ADD_FORCE_AL);
//        }
        
        //TWB - The ChangePlan might cause this logic instead.
        if(clearing == 1) {
            if(this.processor == this.moveProcessor) {
                this.processor = new Processor() {
                    public void process(final long timeDelta) throws Exception {
                        move();
                        updateGDObject(timeDelta);
                    }
                };
            }
        }
    }

    public void StopForce() {
        
        this.velocityInterface.setVelocity(0, (short) 0, (short) 0);

    }
    
    public void AddForce(final int x, final int y) {
        
        this.velocityInterface.getVelocityXBasicDecimalP().set(x * SCALE_FACTOR2);
        this.velocityInterface.getVelocityYBasicDecimalP().set(y * SCALE_FACTOR2);
    }
    
    //private static final String FORCE = "force";
    //Force.cpp
    //public void Force(final int x_, final int y_, final float clearing_) {

        ////final PositionStrings positionStrings = PositionStrings.getInstance();
        ////final StringMaker stringMaker = new StringMaker();
        ////logUtil.put(stringMaker
                ////.append(positionStrings.DX_LABEL).append(x_)
                ////.append(positionStrings.DY_LABEL).append(y_)
                //////.append(positionStrings.DZ_LABEL).append(dz)
                ////.toString(), this, FORCE);

        //this.move(x_, y_);

        //this.gdObject.x = this.x;
        //this.gdObject.y = this.y;
        
        ////stringMaker.delete(0, stringMaker.length());
        ////this.toString(stringMaker);
        ////logUtil.put(stringMaker.toString(), this, FORCE);
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
//            logUtil.put(this.getName(), this, "updateGDObject");
//        }
        
        //this.move();
     
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
            //logUtil.put(this.getName(), this, "updateGDObject2");
            this.initIndexedAnimationInterfaceArray[index].setAlpha(opacity);
            this.scalableProcessor.process(this, this.initIndexedAnimationInterfaceArray[index]);
            if(this.gdObject.basicColor != null) {
                //logUtil.put("setBasicColor: " + this.gdObject.basicColor, this, "updateGDObject");
                this.initIndexedAnimationInterfaceArray[index].changeBasicColor(this.gdObject.basicColor);
            }
        }

        //if(this.getName().startsWith(PLAYER)) {
            //logUtil.put(commonStrings.UPDATE, this, this.toString());
        //}
    }

    public void resetAnimation() {
        this.resetAnimationBehavior.resetAnimation(this.indexedAnimationInterfaceArray, this.gdObject.animation);
    }
    
    public void animate(final long timeDelta) throws Exception {
        
        velocityBehavior.reduce(this.velocityInterface, 30, 100);

        this.dimensionalBehavior.getAnimationBehavior().animate(this.gdObject, this.initIndexedAnimationInterfaceArray, timeDelta);
        this.primitiveDrawing.nextFrame();
    }

    public void updateRotation(final long timeDelta) {
        this.dimensionalBehavior.updateRotation(this, timeDelta);
    }

//    private float lastScaleX = Float.MIN_VALUE;
//    private float lastScaleY = Float.MIN_VALUE;
    public void setScalable() {
//        if(this.gdObject.scaleX != lastScaleX) {
//            logUtil.put("scaleX: " + this.gdObject.scaleX, this, commonStrings.PROCESS);
//        }
//        if(this.gdObject.scaleY != lastScaleY) {
//            logUtil.put("scaleY: " + this.gdObject.scaleY, this, commonStrings.PROCESS);
//        }
        
        if(this.scalableProcessor == ScalableBaseProcessor.getInstance()) {
            //logUtil.put("set maxscaleallowed 5", this, commonStrings.PROCESS);
            final int size = this.initIndexedAnimationInterfaceArray.length;
            for (int index = 0; index < size; index++) {
                this.initIndexedAnimationInterfaceArray[index].setMaxScale(5, 5);
            }
        }
        this.scalableProcessor = ScalableProcessor.getInstance();
    }

    public boolean isDestination(final GDGameLayer gdGameLayer) throws Exception {
        throw new RuntimeException();
    }

    public int AnimationFrameCount() throws Exception {
        return this.getIndexedAnimationInterface().getSize();
    }

    //private boolean isFirst = true;
    //private final String PAINT = "paint";
    @Override
    public void paint(final Graphics graphics)
    {
        try
        {
            super.paintFirst(graphics);

            //int x = this.x - quarterWidth;
            //int y = this.y - quarterHeight;
            final ViewPosition viewPosition = this.getViewPosition();
            final int x = viewPosition.getX();
            final int y = viewPosition.getY();
            
            //if(animationBehaviorBase.getInstance() == this.animationBehavior) {
            //if(this.indexedAnimationInterfaceArray[this.gdObject.animation] instanceof CustomTextAnimation) {
                //logUtil.put(new StringMaker().append(this.gdObject.name).append(viewPosition.getX()).append(' ').append(viewPosition.getY()).append(this.getWidth()).toString(), this, PAINT);
//            if(this.isFirst) {
//                this.isFirst = false;
                //logUtil.put(this.gdObject.name + indexedAnimationInterfaceArray[this.gdObject.animation], this, PAINT);
                //graphics.drawString(new StringMaker().append(this.gdObject.name).append(viewPosition.getX()).append(' ').append(viewPosition.getY()).append(this.getWidth()).toString(), x, y, 0);
                //graphics.drawImage(img, this.x, this.y, Graphics.TOP | Graphics.LEFT);
            //}
            
            //for (int index = 0; index < SIZE; index++) {
            this.indexedAnimationInterfaceArray[this.gdObject.animation].paint(graphics, x, y);
            //}

            this.primitiveDrawing.paint(graphics, x, y);
            
            //this.paintPoints(graphics);
            //this.paintDebug(graphics);
            
            //if(this.gdObject instanceof GD1GDObjectsFactory.Icons) graphics.drawString(Integer.toString(((GD1GDObjectsFactory.Icons)this.gdObject).itemIndex), x, y, 0);
        }
        catch (Exception e)
        {
            //logUtil.put(new StringMaker().append(this.getName()).append(" GDObject name: ").append(this.gdObject.name).toString(), this, "paint");
            logUtil.put(commonStrings.EXCEPTION, this, "paint", e);
        }
        
    }

    @Override
    public void paintThreed(final Graphics graphics)
    {
        try
        {
            final ViewPosition viewPosition = this.getViewPosition();
            final int x = viewPosition.getX();
            final int y = viewPosition.getY();
            final int z = viewPosition.getZ();

            this.indexedAnimationInterfaceArray[this.gdObject.animation].paintThreed(graphics, x, y, z);
            
            this.primitiveDrawing.paintThreed(graphics, x, y, z);

        }
        catch (Exception e)
        {
            logUtil.put(commonStrings.EXCEPTION, this, "paintThreed", e);
        }
    }
    
    //private final StringMaker stringBuilder = new StringMaker();
    //private final String F = "F";
    //private final String E = "E";
    public void paintPoints(final Graphics graphics) {

        //if(this.getName().startsWith(PLAYER_0)) {

            //final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
            
            //this.basicSetColorUtil.setBasicColorP(graphics, BasicColorFactory.getInstance().AQUA);
        
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
//        logUtil.put(commonStrings.PROCESS, this, stringBuilder.append(commonStrings.EXCEPTION_LABEL).append(objectStrings.ANGLE).append(index).append(':').append(this.x).append(':').append(x).append(':').append(halfWidth).toString());
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
//                logUtil.put(commonStrings.PROCESS, this, stringBuilder.append(commonStrings.EXCEPTION_LABEL).append(angle).append(':').append(this.gdObject.angle).toString());
//            } else {
//                stringBuilder.delete(0, stringBuilder.length());
//                logUtil.put(commonStrings.PROCESS, this, stringBuilder.append(commonStrings.EXCEPTION_LABEL).append(angle).toString());
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

//            this.basicSetColorUtil.setBasicColorP(graphics, BasicColorFactory.getInstance().GREEN);
//
//        if(this.getName().startsWith(PLAYER)) {
//            final GD1SpecialAnimationGlobals globals = GD1SpecialAnimationGlobals.getInstance();
//            final int x = this.gdObject.PointX(globals.firespot);
//            final int y = this.gdObject.PointY(globals.firespot);
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
//
//        }
        //}
    }

//    private final String PLAYER = "player";
    
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
//                logUtil.put(commonStrings.PROCESS, this, stringBuilder.append(commonStrings.EXCEPTION_LABEL).append(angle).append(':').append(this.gdObject.angle).toString());
//            } else {
//                stringBuilder.delete(0, stringBuilder.length());
//                logUtil.put(commonStrings.PROCESS, this, stringBuilder.append(commonStrings.EXCEPTION_LABEL).append(angle).toString());
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

    @Override
    public void paintDebug(final Graphics graphics) {
        
        //graphics.drawString(this.getName(), x, y, 0);

//        final int endX = (int) (this.x + (this.velocityInterface.getVelocityXBasicDecimalP().getUnscaled() / 10));
//        final int endY = (int) (this.y + (this.velocityInterface.getVelocityYBasicDecimalP().getUnscaled() / 10));
//        this.basicSetColorUtil.setBasicColorP(graphics, BasicColorFactory.getInstance().AQUA);
//        graphics.drawLine(this.x + this.getHalfWidth(), this.y + this.getHalfHeight(), endX + this.getHalfWidth(), endY + this.getHalfHeight());
//
//        //graphics.drawString(Integer.toString(this.getRotationAnimationInterface().getAngleInfo().getAngle()), this.x, this.y, 0);
//        
//        this.basicSetColorUtil.setBasicColorP(graphics, BasicColorFactory.getInstance().LIGHT_GREEN);
//        this.paintAngle(this.getRotationAnimationInterface().getAngleInfo().getAngle(), graphics);
//        this.basicSetColorUtil.setBasicColorP(graphics, BasicColorFactory.getInstance().LIGHT_RED);
//        this.paintAngle((short) this.getRotationAnimationInterface().getFrame(), graphics);
        
//        final ViewPosition viewPosition = this.getViewPosition();
//        final int viewX = viewPosition.getX();
//        final int viewY = viewPosition.getY();
        //logUtil.put("viewX: " + viewX + " viewY: " + viewY, this, "paint");
//        this.basicSetColorUtil.setBasicColorP(graphics, BasicColorFactory.getInstance().PINK);
//        graphics.drawRect(viewX - this.getHalfWidth(), viewY - this.getHalfHeight(), this.getWidth() * 2, this.getHeight() * 2);

        super.paintDebug(graphics);

//        final StringMaker stringMaker = new StringMaker();
//        final CommonSeps commonSeps = CommonSeps.getInstance();
//        this.basicSetColorUtil.setBasicColorP(graphics, BasicColorFactory.getInstance().WHITE);
//        graphics.drawString(stringMaker.append(c).append(commonSeps.COMMA).append(r).append(commonSeps.COLON).toString(), x + 5, y + 10, 0);        
//        final GDGameLayer PlatformerMapGDGameLayer = (GDGameLayer) globals.PlatformerMapGDGameLayerList.get(0);
//        final GD0GDObjectsFactory.PlatformerMap PlatformerMap = (GD0GDObjectsFactory.PlatformerMap) PlatformerMapGDGameLayer.gdObject;                                
//        EnemiesGDGameLayer.c = PlatformerMap.placementXIntArray[PlatformerMap.placementIntArray[PlatformerMap.placementIndex]] / 24;
//        EnemiesGDGameLayer.r = PlatformerMap.placementYIntArray[PlatformerMap.placementIntArray[PlatformerMap.placementIndex]] / 24;
//        stringBuilder.delete(0, stringBuilder.length());
//        logUtil.put(stringBuilder.append(" c: ").append(EnemiesGDGameLayer.c).append(" r: ").append(EnemiesGDGameLayer.r).toString(), this, commonStrings.PROCESS);

        this.getCollidableInferface().paint(graphics);
    }
        
//    public int c;
//    public int r;

    public void setBasicColor(final BasicColor basicColor) {
        ((CustomTextAnimation) this.initIndexedAnimationInterfaceArray[0]).setBasicColorP(basicColor);
    }

    public void setText(final int value) {
        this.setText(Integer.toString(value));
    }
    
    public void setText(final String text) {
        final CustomTextAnimation customTextAnimation = ((CustomTextAnimation) this.initIndexedAnimationInterfaceArray[0]);
        customTextAnimation.setText(text);
        this.gdObject.width = customTextAnimation.getWidth();
        this.gdObject.height = customTextAnimation.getHeight();
        this.setWidth(this.gdObject.width);
        this.setHeight(this.gdObject.height);
    }
    
    public String Text() {
        return ((GetTextInterface) this.initIndexedAnimationInterfaceArray[0]).getText();
    }

    public GDTwodBehavior getDimensionalBehavior() {
        return dimensionalBehavior;
    }

    public void setValue(final int value) {
        throw new RuntimeException();
    }
    
    public int Value() {
        throw new RuntimeException();
    }
    
    public void toString(final StringMaker stringBuffer) {

        super.toString(stringBuffer);
        if(this.dimensionalBehavior != null) {
            this.dimensionalBehavior.getAnimationBehavior().toString(this.gdObject, stringBuffer);
        }
        stringBuffer.append(this.gdObject.toString());
    }    
    
    public String toString()
    {
        final StringMaker stringBuffer = new StringMaker();

        this.toString(stringBuffer);
 
        return stringBuffer.toString();
    }
    
}
