/*
        *
        *  AllBinary Open License Version 1
        *  Copyright (c) 2011 AllBinary
        *
        *  By agreeing to this license you and any business entity you represent are
        *  legally bound to the AllBinary Open License Version 1 legal agreement.
        *
        *  You may obtain the AllBinary Open License Version 1 legal agreement from
        *  AllBinary or the root directory of AllBinary's AllBinary Platform repository.
        *
        *  Created By: Travis Berthelot
*/
import { RuntimeException } from '../../../../java/lang/RuntimeException.js';
//not GWT import const CustomTextAnimation
import { TextChangeListener } from '../../../../org/allbinary/animation/text/TextChangeListener.js';
//not GWT import const TextChangeListener
import { Processor } from '../../../../org/allbinary/canvas/Processor.js';
//not GWT import const Processor
import { CombatBaseBehavior } from '../../../../org/allbinary/game/combat/CombatBaseBehavior.js';
//not GWT import const CombatBaseBehavior
import { DamageableBaseBehavior } from '../../../../org/allbinary/game/combat/damage/DamageableBaseBehavior.js';
//not GWT import const DamageableBaseBehavior
import { GDDestroyableSimpleBehavior } from '../../../../org/allbinary/game/combat/destroy/GDDestroyableSimpleBehavior.js';
//not GWT import const Group
import { MultiPlayerGameLayer } from '../../../../org/allbinary/game/multiplayer/layer/MultiPlayerGameLayer.js';
//not GWT import const VelocityProperties
import { DragVelocityBehavior } from '../../../../org/allbinary/game/physics/velocity/DragVelocityBehavior.js';
//not GWT import const OpenGLSurfaceChangedInterface
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
import { ScaleFactorFactory } from '../../../../org/allbinary/logic/math/ScaleFactorFactory.js';
//not GWT import const ScaleFactorFactory
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
import { FrameUtil } from '../../../../org/allbinary/math/FrameUtil.js';
//not GWT import const FrameUtil
import { ScaleProperties } from '../../../../org/allbinary/media/ScaleProperties.js';
//not GWT import const ScaleProperties
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//not GWT import const ViewPositionBase
import { TextInterface } from '../../../../org/allbinary/animation/text/TextInterface.js';
//not GWT import const TextInterface
//Current folder imports from return types, extended types, and scope (deduplicated)
import { ResetAnimationBehavior } from './ResetAnimationBehavior.js';
//not GWT import - same folder const ResetAnimationBehavior
import { GDTwodBehavior } from './GDTwodBehavior.js';
//not GWT import - same folder const GDTwodBehavior
import { ScalableBaseProcessor } from './ScalableBaseProcessor.js';
//not GWT import - same folder const ScalableBaseProcessor
//import { GDTextChangeListener } from './GDTextChangeListener.js';
//not GWT import - same folder const GDTextChangeListener
import { ResetRotationAnimationBehavior } from './ResetRotationAnimationBehavior.js';
//not GWT import - same folder const ResetRotationAnimationBehavior
import { GDThreedBehavior } from './GDThreedBehavior.js';
//not GWT import - same folder const GDAnimationBehaviorBase
import { ScalableProcessor } from './ScalableProcessor.js';
//not GWT import - same folder const ScalableProcessor
export class GDGameLayer extends MultiPlayerGameLayer {
    constructor(primitiveDrawing, gameLayerList, gameLayerDestroyedList, behaviorList, velocityInterface, remoteInfo, groupInterface, gdName, animationInterfaceFactoryInterfaceArray, proceduralAnimationInterfaceFactoryInterfaceArray, layerInfo, rectangleArrayOfArrays, viewPosition, gdObject, animationBehavior, rotationAdjustment) {
        super(remoteInfo, groupInterface, gdName, layerInfo, viewPosition);
        this.logUtil = LogUtil.getInstance();
        this.stringUtil = StringUtil.getInstance();
        this.frameUtil = FrameUtil.getInstance();
        this.scaleFactorFactory = ScaleFactorFactory.getInstance();
        this.SCALE_FACTOR = this.scaleFactorFactory.DEFAULT_SCALE_FACTOR;
        this.SCALE_FACTOR2 = this.SCALE_FACTOR * 2;
        this.quarterWidth = (this.getHalfWidth() >> 1) - 1;
        this.quarterHeight = (this.getHalfHeight() >> 1) - 1;
        this.realX = 0;
        this.realY = 0;
        this.linkedGDGameLayerList = new BasicArrayListD();
        this.scalableProcessor = ScalableBaseProcessor.getInstance();
        this.moveProcessor = new class extends Processor {
            //@Throws(Exception.constructor)
            processt(timeDelta) {
                move();
            }
        };
        this.processor = this.moveProcessor;
        this.velocityBehavior = DragVelocityBehavior.instance;
        //    private float lastScaleY = 1;
        //inner= member=true isStatic=
        this.GDTextChangeListener = class extends TextChangeListener {
            constructor(gameLayer) {
                super();
                this.gameLayer = gameLayer;
            }
            onMeasure() {
                this.gameLayer.onMeasure();
            }
        };
        this.textChangeListener = new this.GDTextChangeListener(this);
        //For kotlin this is before the body of the constructor.
        this.primitiveDrawing = primitiveDrawing;
        this.gameLayerList = gameLayerList;
        this.gameLayerDestroyedList = gameLayerDestroyedList;
        this.behaviorList = behaviorList;
        this.gdObject = gdObject;
        this.velocityInterface = velocityInterface;
        this.initPositionXYZ(this.gdObject.x, this.gdObject.y, this.gdObject.zOrder);
        this.initPosition();
        var size = animationInterfaceFactoryInterfaceArray.length;
        ;
        for (var index = 0; index < size; index++) {
            var animationName = this.gdObject.getAnimationFromIndex(index);
            ;
            var scaleProperties = new ScaleProperties();
            ;
            scaleProperties.scaleX = this.gdObject.initScaleX * this.gdObject.customScale;
            scaleProperties.scaleY = this.gdObject.initScaleY * this.gdObject.customScale;
            scaleProperties.scaleWidth = this.gdObject.Width(null);
            scaleProperties.scaleHeight = this.gdObject.Height(null);
            if (animationName != StringUtil.getInstance().EMPTY_STRING && animationName.indexOf(GDGameLayer.HACK_ANIMATION_NAME) >= 0) {
                scaleProperties.shouldScale = true;
            }
            animationInterfaceFactoryInterfaceArray[index].setInitialScale(scaleProperties);
        }
        this.initIndexedAnimationInterfaceArray = animationBehavior.init(this.gdObject, animationInterfaceFactoryInterfaceArray);
        this.setIndexedAnimationInterfaceArray(this.initIndexedAnimationInterfaceArray);
        if (this.initIndexedAnimationInterfaceArray[0].getSize() >= 90 && rotationAdjustment) {
            this.resetAnimationBehavior = ResetRotationAnimationBehavior.getInstance();
        }
        else {
            this.resetAnimationBehavior = ResetAnimationBehavior.getInstance();
        }
        animationBehavior.add(this);
        if (this.initIndexedAnimationInterfaceArray.length > 0 && this.initIndexedAnimationInterfaceArray[0].isThreed()) {
            this.dimensionalBehavior = new GDThreedBehavior(animationBehavior, this.initIndexedAnimationInterfaceArray);
        }
        else {
            this.dimensionalBehavior = new GDTwodBehavior(animationBehavior);
        }
        this.combatBaseBehavior = new CombatBaseBehavior(DamageableBaseBehavior.getInstance(), new GDDestroyableSimpleBehavior(this));
        this.dimensionalBehavior.reset(this, gdObject);
        this.rectangleArrayOfArrays = rectangleArrayOfArrays;
    }
    hasCollisionMask() {
        if (this.rectangleArrayOfArrays !=
            null
            && this.rectangleArrayOfArrays.length > 0 && this.rectangleArrayOfArrays[0].length > 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return true;
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return false;
        }
    }
    //@Throws(Exception.constructor)
    setGDObject(gdObject) {
        var size = this.initIndexedAnimationInterfaceArray.length;
        ;
        for (var index = 0; index < size; index++) {
            this.initIndexedAnimationInterfaceArray[index].setFrame(this.frameUtil.getFrameForAngle(0, 1));
        }
        gdObject.angle = this.gdObject.angle;
        this.dimensionalBehavior.getAnimationBehavior().setAnimationArray(this.initIndexedAnimationInterfaceArray);
        this.setIndexedAnimationInterfaceArray(this.initIndexedAnimationInterfaceArray);
        this.dimensionalBehavior.reset(this, gdObject);
        this.gdObject = gdObject;
        this.initPositionXYZ(this.gdObject.x, this.gdObject.y, this.gdObject.zOrder);
        this.initPosition();
        this.setDestroyed(false);
    }
    //@Throws(Exception.constructor)
    set(gl) {
        var size = this.initIndexedAnimationInterfaceArray.length;
        ;
        var openGLSurfaceChangedInterface;
        ;
        for (var index = 0; index < size; index++) {
            openGLSurfaceChangedInterface = this.initIndexedAnimationInterfaceArray[index];
            openGLSurfaceChangedInterface.set(gl);
        }
    }
    getVelocityProperties() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.velocityInterface;
    }
    setRotation(angleAdjustment) {
        this.dimensionalBehavior.getAnimationBehavior().setRotation(this, angleAdjustment);
    }
    getInitIndexedAnimationInterfaceArray() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.initIndexedAnimationInterfaceArray;
    }
    setIndexedAnimationInterfaceArray(animationInterface) {
        this.indexedAnimationInterfaceArray = animationInterface;
    }
    getIndexedAnimationInterfaceArray() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.indexedAnimationInterfaceArray;
    }
    getIndexedAnimationInterface() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.indexedAnimationInterfaceArray[this.gdObject.animation];
    }
    getCombatBaseBehavior() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.combatBaseBehavior;
    }
    //@Throws(Exception.constructor)
    damage(damage, damageType) {
        this.combatBaseBehavior.getDamageableBaseBehavior().damage(damage, damageType);
    }
    //@Throws(Exception.constructor)
    getDamage(damageType) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.combatBaseBehavior.getDamageableBaseBehavior().getDamage(damageType);
        ;
    }
    //@Throws(Exception.constructor)
    isDestroyed() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.combatBaseBehavior.getDestroyableBaseBehavior().isDestroyed();
        ;
    }
    //@Throws(Exception.constructor)
    setDestroyed(destroyed) {
        this.gameLayerList.remove(this);
        this.gameLayerDestroyedList.add(this);
        this.combatBaseBehavior.getDestroyableBaseBehavior().setDestroyed(destroyed);
    }
    move() {
        var velocityX = this.velocityInterface.getVelocityXBasicDecimalP().getUnscaled();
        ;
        var velocityY = this.velocityInterface.getVelocityYBasicDecimalP().getUnscaled();
        ;
        this.realX = this.realX + velocityX;
        this.realY = this.realY + velocityY;
        var scaleFactorValue = this.scaleFactorFactory.DEFAULT_SCALE_VALUE;
        ;
        var x = Math.round((this.realX / scaleFactorValue));
        ;
        var y = Math.round((this.realY / scaleFactorValue));
        ;
        super.setPosition(x, y, this.z);
    }
    isMovingX() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return Math.round((this.velocityInterface.getVelocityXBasicDecimalP().getScaled() / this.SCALE_FACTOR));
    }
    isMovingY() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return Math.round((this.velocityInterface.getVelocityYBasicDecimalP().getScaled() / this.SCALE_FACTOR));
    }
    setPosition(x, y, z) {
        super.setPosition(x, y, z);
        var scaleFactorValue = ScaleFactorFactory.getInstance().DEFAULT_SCALE_VALUE;
        ;
        this.realX = x * scaleFactorValue;
        this.realY = y * scaleFactorValue;
    }
    AddForceUsingPolarCoordinates(angle, length, clearing) {
        var adjustedAngle = angle;
        ;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }
        this.gdObject.forceAngle = adjustedAngle;
        this.velocityInterface.setVelocityi(length * this.SCALE_FACTOR2, adjustedAngle, 0);
        if (clearing == 1) {
            if (this.processor == this.moveProcessor) {
                this.processor = new class extends Processor {
                    //@Throws(Exception.constructor)
                    processt(timeDelta) {
                        move();
                        updateGDObject(timeDelta);
                    }
                };
            }
        }
    }
    StopForce() {
        this.velocityInterface.setVelocityi(0, 0, 0);
    }
    AddForce(x, y) {
        this.velocityInterface.getVelocityXBasicDecimalP().setint(x * this.SCALE_FACTOR2);
        this.velocityInterface.getVelocityYBasicDecimalP().setint(y * this.SCALE_FACTOR2);
    }
    updatePosition() {
        this.setPosition(this.gdObject.x, this.gdObject.y, this.gdObject.zOrder);
    }
    updateSize() {
        this.setWidth(this.gdObject.width);
        this.setHeight(this.gdObject.height);
    }
    //@Throws(Exception.constructor)
    process(timeDelta) {
        this.processor.processt(timeDelta);
    }
    updateGDObject(timeDelta) {
        this.gdObject.setX(this.x);
        this.gdObject.setY(this.y);
        this.updateRotation(timeDelta);
        var opacity = Math.round(this.gdObject.opacity);
        ;
        if (opacity < 0) {
            opacity = 0;
        }
        var size = this.initIndexedAnimationInterfaceArray.length;
        ;
        for (var index = 0; index < size; index++) {
            this.initIndexedAnimationInterfaceArray[index].setAlpha(opacity);
            this.scalableProcessor.process(this, this.initIndexedAnimationInterfaceArray[index]);
            if (this.gdObject.basicColor !=
                null) {
                this.initIndexedAnimationInterfaceArray[index].changeBasicColor(this.gdObject.basicColor);
            }
        }
    }
    resetAnimation() {
        this.resetAnimationBehavior.resetAnimation(this.indexedAnimationInterfaceArray, this.gdObject.animation);
    }
    //@Throws(Exception.constructor)
    animate(timeDelta) {
        this.velocityBehavior.reduce(this.velocityInterface, 30, 100);
        this.dimensionalBehavior.getAnimationBehavior().animate(this.gdObject, this.initIndexedAnimationInterfaceArray, timeDelta);
        this.primitiveDrawing.nextFrame();
    }
    updateRotation(timeDelta) {
        this.dimensionalBehavior.updateRotation(this, timeDelta);
    }
    setScalable() {
        if (this.scalableProcessor == ScalableBaseProcessor.getInstance()) {
            var size = this.initIndexedAnimationInterfaceArray.length;
            ;
            for (var index = 0; index < size; index++) {
                this.initIndexedAnimationInterfaceArray[index].setMaxScale(5, 5);
            }
        }
        this.scalableProcessor = ScalableProcessor.getInstance();
    }
    //@Throws(Exception.constructor)
    isDestination(gdGameLayer) {
        throw new RuntimeException();
    }
    //@Throws(Exception.constructor)
    AnimationFrameCount() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.getIndexedAnimationInterface().getSize();
        ;
    }
    paint(graphics) {
        try {
            super.paintFirst(graphics);
            var viewPosition = this.getViewPosition();
            ;
            var x = viewPosition.getX();
            ;
            var y = viewPosition.getY();
            ;
            this.indexedAnimationInterfaceArray[this.gdObject.animation].paintXY(graphics, x, y);
            this.primitiveDrawing.paintXY(graphics, x, y);
            this.paintDebug(graphics);
            //: 
        }
        catch (e) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "paint", e);
        }
    }
    paintThreed(graphics) {
        try {
            var viewPosition = this.getViewPosition();
            ;
            var x = viewPosition.getX();
            ;
            var y = viewPosition.getY();
            ;
            var z = viewPosition.getZ();
            ;
            this.indexedAnimationInterfaceArray[this.gdObject.animation].paintThreedXYZ(graphics, x, y, z);
            this.primitiveDrawing.paintThreedXYZ(graphics, x, y, z);
            //: 
        }
        catch (e) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "paintThreed", e);
        }
    }
    paintPoints(graphics) {
    }
    paintAngle(angle, graphics) {
        var adjustedAngle = angle;
        ;
    }
    paintDebug(graphics) {
        super.paintDebug(graphics);
        this.getCollidableInferface().paint(this, graphics);
    }
    setBasicColor(basicColor) {
        this.initIndexedAnimationInterfaceArray[0].setBasicColorP(basicColor);
    }
    setBackgroundBasicColor(basicColor) {
        this.initIndexedAnimationInterfaceArray[0].setBackgroundBasicColorP(basicColor);
    }
    setText(value) {
        this.setText(value.toString());
    }
    setText(text) {
        var textInterface = this.initIndexedAnimationInterfaceArray[0];
        ;
        if (text ==
            null) {
            textInterface.setTextWithOnMeasure(this.stringUtil.EMPTY_STRING, this.textChangeListener);
        }
        else {
            textInterface.setTextWithOnMeasure(text, this.textChangeListener);
        }
    }
    onMeasure() {
        throw new RuntimeException();
    }
    Text() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return (as);
        TextInterface;
        getText();
        ;
    }
    getDimensionalBehavior() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.dimensionalBehavior;
    }
    setValue(value) {
        throw new RuntimeException();
    }
    Value() {
        throw new RuntimeException();
    }
    toStringAppend(stringBuffer) {
        super.toStringAppend(stringBuffer);
        if (this.dimensionalBehavior !=
            null) {
            this.dimensionalBehavior.getAnimationBehavior().toString(this.gdObject, stringBuffer);
        }
        stringBuffer.append(this.gdObject.toString());
    }
    toString() {
        var stringBuffer = new StringMaker();
        ;
        this.toStringAppend(stringBuffer);
        //if statement needs to be on the same line and ternary does not work the same way.
        return stringBuffer.toString();
        ;
    }
}
GDGameLayer.HACK_ANIMATION_NAME = "ttack";
