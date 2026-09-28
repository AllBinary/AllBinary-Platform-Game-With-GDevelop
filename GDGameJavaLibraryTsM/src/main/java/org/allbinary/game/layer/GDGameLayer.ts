
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
        
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
            import { RuntimeException } from '../../../../java/lang/RuntimeException.js';
        
            import { Integer } from '../../../../java/lang/Integer.js';
        
import { GL } from '../../../../javax/microedition/khronos/opengles/GL.js';
//not GWT import const GL

import { Graphics } from '../../../../javax/microedition/lcdui/Graphics.js';
//not GWT import const Graphics

import { Animation } from '../../../../org/allbinary/animation/Animation.js';
//not GWT import const Animation

import { AnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/AnimationInterfaceFactoryInterface.js';
//not GWT import const AnimationInterfaceFactoryInterface

import { IndexedAnimation } from '../../../../org/allbinary/animation/IndexedAnimation.js';
//not GWT import const IndexedAnimation

import { ProceduralAnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/ProceduralAnimationInterfaceFactoryInterface.js';
//not GWT import const ProceduralAnimationInterfaceFactoryInterface

import { RotationAnimation } from '../../../../org/allbinary/animation/RotationAnimation.js';
//not GWT import const RotationAnimation

import { CustomTextAnimation } from '../../../../org/allbinary/animation/text/CustomTextAnimation.js';
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
//not GWT import const GDDestroyableSimpleBehavior

import { GDObject } from '../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

import { Group } from '../../../../org/allbinary/game/identification/Group.js';
//not GWT import const Group

import { MultiPlayerGameLayer } from '../../../../org/allbinary/game/multiplayer/layer/MultiPlayerGameLayer.js';
//not GWT import const MultiPlayerGameLayer

import { RemoteInfo } from '../../../../org/allbinary/game/multiplayer/layer/RemoteInfo.js';
//not GWT import const RemoteInfo

import { VelocityProperties } from '../../../../org/allbinary/game/physics/velocity/VelocityProperties.js';
//not GWT import const VelocityProperties

import { DragVelocityBehavior } from '../../../../org/allbinary/game/physics/velocity/DragVelocityBehavior.js';
//not GWT import const DragVelocityBehavior

import { VelocityBehaviorBase } from '../../../../org/allbinary/game/physics/velocity/VelocityBehaviorBase.js';
//not GWT import const VelocityBehaviorBase

import { Rectangle } from '../../../../org/allbinary/graphics/Rectangle.js';
//not GWT import const Rectangle

import { BasicColor } from '../../../../org/allbinary/graphics/color/BasicColor.js';
//not GWT import const BasicColor

import { OpenGLSurfaceChangedInterface } from '../../../../org/allbinary/image/opengles/OpenGLSurfaceChangedInterface.js';
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

import { ViewPosition } from '../../../../org/allbinary/view/ViewPosition.js';
//not GWT import const ViewPosition

import { ViewPositionBase } from '../../../../org/allbinary/view/ViewPositionBase.js';
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
//not GWT import - same folder const GDThreedBehavior
import { GDAnimationBehaviorBase } from './GDAnimationBehaviorBase.js';
//not GWT import - same folder const GDAnimationBehaviorBase
import { ScalableProcessor } from './ScalableProcessor.js';
//not GWT import - same folder const ScalableProcessor

export class GDGameLayer extends MultiPlayerGameLayer {
        

    private static readonly HACK_ANIMATION_NAME: string = "ttack";

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    readonly stringUtil: StringUtil = StringUtil.getInstance()!;

    readonly frameUtil: FrameUtil = FrameUtil.getInstance()!;

    private readonly scaleFactorFactory: ScaleFactorFactory = ScaleFactorFactory.getInstance()!;

    readonly SCALE_FACTOR: number = scaleFactorFactory!.DEFAULT_SCALE_FACTOR;

    readonly SCALE_FACTOR2: number = SCALE_FACTOR *2;

    readonly quarterWidth: number = (this.getHalfWidth()>>1) -1;

    readonly quarterHeight: number = (this.getHalfHeight()>>1) -1;

    readonly combatBaseBehavior: CombatBaseBehavior;

    readonly initIndexedAnimationInterfaceArray: IndexedAnimation[];

    indexedAnimationInterfaceArray: IndexedAnimation[];

    private readonly resetAnimationBehavior: ResetAnimationBehavior;

    readonly velocityInterface: VelocityProperties;

    realX: number= 0;

    realY: number= 0;

    private readonly dimensionalBehavior: GDTwodBehavior;

    readonly gameLayerList: BasicArrayList;

    readonly gameLayerDestroyedList: BasicArrayList;

    readonly behaviorList: BasicArrayList;

    public readonly rectangleArrayOfArrays: Rectangle[][];

    public readonly linkedGDGameLayerList: BasicArrayList = new BasicArrayListD();

    public gdObject: GDObject;

    public primitiveDrawing: Animation;

    scalableProcessor: ScalableBaseProcessor = ScalableBaseProcessor.getInstance()!;

    moveProcessor: Processor = new class extends Processor
                                {
                                
                //@Throws(Exception.constructor)
            
    public processt(timeDelta: number){
move();
    
}

                                }
                            ;

    processor: Processor = moveProcessor;

    public velocityBehavior: VelocityBehaviorBase = DragVelocityBehavior.instance;
//    private float lastScaleY = 1;
//inner= member=true isStatic=
GDTextChangeListener = class extends TextChangeListener {
        
/*Static stuff is not allowed for TypeScript inner classes*//**/


    private readonly gameLayer: GDGameLayer;

 constructor (gameLayer: GDGameLayer){

            super();
        this.gameLayer= gameLayer;
    
}


    public onMeasure(){
this.gameLayer!.onMeasure();
    
}


}


    private textChangeListener: TextChangeListener = new this.GDTextChangeListener(this);

public constructor (primitiveDrawing: Animation, gameLayerList: BasicArrayList, gameLayerDestroyedList: BasicArrayList, behaviorList: BasicArrayList, velocityInterface: VelocityProperties, remoteInfo: RemoteInfo, groupInterface: Group[], gdName: string, animationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[], proceduralAnimationInterfaceFactoryInterfaceArray: ProceduralAnimationInterfaceFactoryInterface[], layerInfo: Rectangle, rectangleArrayOfArrays: Rectangle[][], viewPosition: ViewPosition, gdObject: GDObject, animationBehavior: GDAnimationBehaviorBase, rotationAdjustment: boolean){
            super(remoteInfo, groupInterface, gdName, layerInfo, viewPosition);
                    

                            //For kotlin this is before the body of the constructor.
                    
this.primitiveDrawing= primitiveDrawing;
    
this.gameLayerList= gameLayerList;
    
this.gameLayerDestroyedList= gameLayerDestroyedList;
    
this.behaviorList= behaviorList;
    
this.gdObject= gdObject;
    
this.velocityInterface= velocityInterface;
    
this.initPositionXYZ(this.gdObject!.x, this.gdObject!.y, this.gdObject!.zOrder);
    
this.initPosition();
    

    var size: number = animationInterfaceFactoryInterfaceArray!.length
                ;;
    




                        for (
    var index: number = 0;index < size; index++)
        {

    var animationName: string = this.gdObject!.getAnimationFromIndex(index)!;;
    

    var scaleProperties: ScaleProperties = new ScaleProperties();;
    
scaleProperties!.scaleX= this.gdObject!.initScaleX *this.gdObject!.customScale;
    
scaleProperties!.scaleY= this.gdObject!.initScaleY *this.gdObject!.customScale;
    
scaleProperties!.scaleWidth= this.gdObject!.Width(
                            null);
    
scaleProperties!.scaleHeight= this.gdObject!.Height(
                            null);
    

                        if(animationName != StringUtil.getInstance()!.EMPTY_STRING && animationName!.indexOf(HACK_ANIMATION_NAME) >= 0)
                        
                                    {
                                    scaleProperties!.shouldScale= true;
    

                                    }
                                
animationInterfaceFactoryInterfaceArray[index]!.setInitialScale(scaleProperties);
    
}

this.initIndexedAnimationInterfaceArray= animationBehavior!.init(this.gdObject, animationInterfaceFactoryInterfaceArray);
    
this.setIndexedAnimationInterfaceArray(this.initIndexedAnimationInterfaceArray);
    

                        if(this.initIndexedAnimationInterfaceArray[0]!.getSize() >= 90 && rotationAdjustment)
                        
                                    {
                                    this.resetAnimationBehavior= ResetRotationAnimationBehavior.getInstance();
    

                                    }
                                
                        else {
                            this.resetAnimationBehavior= ResetAnimationBehavior.getInstance();
    

                        }
                            
animationBehavior!.add(this);
    

                        if(this.initIndexedAnimationInterfaceArray!.length > 0 && this.initIndexedAnimationInterfaceArray[0]!.isThreed())
                        
                                    {
                                    this.dimensionalBehavior= new GDThreedBehavior(animationBehavior, this.initIndexedAnimationInterfaceArray as RotationAnimation[]);
    

                                    }
                                
                        else {
                            this.dimensionalBehavior= new GDTwodBehavior(animationBehavior);
    

                        }
                            
this.combatBaseBehavior= new CombatBaseBehavior(DamageableBaseBehavior.getInstance(), new GDDestroyableSimpleBehavior(this));
    
this.dimensionalBehavior!.reset(this, gdObject);
    
this.rectangleArrayOfArrays= rectangleArrayOfArrays;
    
}


    public hasCollisionMask(): boolean{

                        if(this.rectangleArrayOfArrays != 
                                    null
                                 && this.rectangleArrayOfArrays!.length > 0 && this.rectangleArrayOfArrays[0]!.length > 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    

                        }
                            
}


                //@Throws(Exception.constructor)
            
    public setGDObject(gdObject: Object){

    var size: number = this.initIndexedAnimationInterfaceArray!.length
                ;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
this.initIndexedAnimationInterfaceArray[index]!.setFrame(frameUtil!.getFrameForAngle(0, 1));
    
}

gdObject!.angle= this.gdObject!.angle;
    
this.dimensionalBehavior!.getAnimationBehavior()!.setAnimationArray(this.initIndexedAnimationInterfaceArray);
    
this.setIndexedAnimationInterfaceArray(this.initIndexedAnimationInterfaceArray);
    
this.dimensionalBehavior!.reset(this, gdObject);
    
this.gdObject= gdObject;
    
this.initPositionXYZ(this.gdObject!.x, this.gdObject!.y, this.gdObject!.zOrder);
    
this.initPosition();
    
this.setDestroyed(false);
    
}


                //@Throws(Exception.constructor)
            
    public set(gl: GL){

    var size: number = this.initIndexedAnimationInterfaceArray!.length
                ;;
    

    var openGLSurfaceChangedInterface: OpenGLSurfaceChangedInterface;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
openGLSurfaceChangedInterface= this.initIndexedAnimationInterfaceArray[index]! as OpenGLSurfaceChangedInterface;
    
openGLSurfaceChangedInterface!.set(gl);
    
}

}


    public getVelocityProperties(): VelocityProperties{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.velocityInterface;
    
}


    public setRotation(angleAdjustment: number){
this.dimensionalBehavior!.getAnimationBehavior()!.setRotation(this, angleAdjustment);
    
}


    getInitIndexedAnimationInterfaceArray(): IndexedAnimation[]{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return initIndexedAnimationInterfaceArray;
    
}


    setIndexedAnimationInterfaceArray(animationInterface: IndexedAnimation[]){
this.indexedAnimationInterfaceArray= animationInterface;
    
}


    public getIndexedAnimationInterfaceArray(): IndexedAnimation[]{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return indexedAnimationInterfaceArray;
    
}


    public getIndexedAnimationInterface(): IndexedAnimation{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return indexedAnimationInterfaceArray[this.gdObject!.animation]!;
    
}


    public getCombatBaseBehavior(): CombatBaseBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return combatBaseBehavior;
    
}


                //@Throws(Exception.constructor)
            
    public damage(damage: number, damageType: number){
this.combatBaseBehavior!.getDamageableBaseBehavior()!.damage(damage, damageType);
    
}


                //@Throws(Exception.constructor)
            
    public getDamage(damageType: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.combatBaseBehavior!.getDamageableBaseBehavior()!.getDamage(damageType);;
    
}


                //@Throws(Exception.constructor)
            
    public isDestroyed(): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.combatBaseBehavior!.getDestroyableBaseBehavior()!.isDestroyed();;
    
}


                //@Throws(Exception.constructor)
            
    public setDestroyed(destroyed: boolean){
this.gameLayerList!.remove(this);
    
this.gameLayerDestroyedList!.add(this);
    
this.combatBaseBehavior!.getDestroyableBaseBehavior()!.setDestroyed(destroyed);
    
}


    public move(){

    var velocityX: number = velocityInterface!.getVelocityXBasicDecimalP()!.getUnscaled()!;;
    

    var velocityY: number = velocityInterface!.getVelocityYBasicDecimalP()!.getUnscaled()!;;
    
this.realX= this.realX +velocityX;
    
this.realY= this.realY +velocityY;
    

    var scaleFactorValue: number = scaleFactorFactory!.DEFAULT_SCALE_VALUE;;
    

    var x: number = Math.round((this.realX /scaleFactorValue));;
    

    var y: number = Math.round((this.realY /scaleFactorValue));;
    
super.setPosition(x, y, this.z);
    
}


    public isMovingX(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.round((this.velocityInterface!.getVelocityXBasicDecimalP()!.getScaled() /this.SCALE_FACTOR));
    
}


    public isMovingY(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.round((this.velocityInterface!.getVelocityYBasicDecimalP()!.getScaled() /this.SCALE_FACTOR));
    
}


    public setPosition(x: number, y: number, z: number){
super.setPosition(x, y, z);
    

    var scaleFactorValue: number = ScaleFactorFactory.getInstance()!.DEFAULT_SCALE_VALUE;;
    
this.realX= x *scaleFactorValue;
    
this.realY= y *scaleFactorValue;
    
}


    public AddForceUsingPolarCoordinates(angle: number, length: number, clearing: number){

    var adjustedAngle: number = angle;;
    

        while(adjustedAngle > 359)
        {
adjustedAngle -= 360;
    
}


        while(adjustedAngle < 0)
        {
adjustedAngle += 360;
    
}

this.gdObject!.forceAngle= adjustedAngle;
    
this.velocityInterface!.setVelocityi(length *SCALE_FACTOR2, adjustedAngle, 0);
    

                        if(clearing == 1)
                        
                                    {
                                    
                        if(this.processor == this.moveProcessor)
                        
                                    {
                                    this.processor= new class extends Processor
                                {
                                
                //@Throws(Exception.constructor)
            
    public processt(timeDelta: number){
move();
    
updateGDObject(timeDelta);
    
}

                                }
                            ;
    

                                    }
                                

                                    }
                                
}


    public StopForce(){
this.velocityInterface!.setVelocityi(0, 0, 0);
    
}


    public AddForce(x: number, y: number){
this.velocityInterface!.getVelocityXBasicDecimalP()!.setint(x *SCALE_FACTOR2);
    
this.velocityInterface!.getVelocityYBasicDecimalP()!.setint(y *SCALE_FACTOR2);
    
}


    public updatePosition(){
this.setPosition(this.gdObject!.x, this.gdObject!.y, this.gdObject!.zOrder);
    
}


    public updateSize(){
this.setWidth(this.gdObject!.width);
    
this.setHeight(this.gdObject!.height);
    
}


                //@Throws(Exception.constructor)
            
    public process(timeDelta: number){
this.processor.processt(timeDelta);
    
}


    public updateGDObject(timeDelta: number){
this.gdObject!.setX(this.x);
    
this.gdObject!.setY(this.y);
    
this.updateRotation(timeDelta);
    

    var opacity: number = Math.round(this.gdObject!.opacity);;
    

                        if(opacity < 0)
                        
                                    {
                                    opacity= 0;
    

                                    }
                                

    var size: number = this.initIndexedAnimationInterfaceArray!.length
                ;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
this.initIndexedAnimationInterfaceArray[index]!.setAlpha(opacity);
    
this.scalableProcessor!.process(this, this.initIndexedAnimationInterfaceArray[index]!);
    

                        if(this.gdObject!.basicColor != 
                                    null
                                )
                        
                                    {
                                    this.initIndexedAnimationInterfaceArray[index]!.changeBasicColor(this.gdObject!.basicColor);
    

                                    }
                                
}

}


    public resetAnimation(){
this.resetAnimationBehavior!.resetAnimation(this.indexedAnimationInterfaceArray, this.gdObject!.animation);
    
}


                //@Throws(Exception.constructor)
            
    public animate(timeDelta: number){
velocityBehavior!.reduce(this.velocityInterface, 30, 100);
    
this.dimensionalBehavior!.getAnimationBehavior()!.animate(this.gdObject, this.initIndexedAnimationInterfaceArray, timeDelta);
    
this.primitiveDrawing!.nextFrame();
    
}


    public updateRotation(timeDelta: number){
this.dimensionalBehavior!.updateRotation(this, timeDelta);
    
}


    public setScalable(){

                        if(this.scalableProcessor == ScalableBaseProcessor.getInstance())
                        
                                    {
                                    
    var size: number = this.initIndexedAnimationInterfaceArray!.length
                ;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
this.initIndexedAnimationInterfaceArray[index]!.setMaxScale(5, 5);
    
}


                                    }
                                
this.scalableProcessor= ScalableProcessor.getInstance();
    
}


                //@Throws(Exception.constructor)
            
    public isDestination(gdGameLayer: GDGameLayer): boolean{



                            throw new RuntimeException();
                    
}


                //@Throws(Exception.constructor)
            
    public AnimationFrameCount(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.getIndexedAnimationInterface()!.getSize();;
    
}


    public paint(graphics: Graphics){

        try {
            super.paintFirst(graphics);
    

    var viewPosition: ViewPositionBase = this.getViewPosition()!;;
    

    var x: number = viewPosition!.getX()!;;
    

    var y: number = viewPosition!.getY()!;;
    
this.indexedAnimationInterfaceArray[this.gdObject!.animation]!.paintXY(graphics, x, y);
    
this.primitiveDrawing!.paintXY(graphics, x, y);
    
this.paintDebug(graphics);
    

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, "paint", e);
    
}

}


    public paintThreed(graphics: Graphics){

        try {
            
    var viewPosition: ViewPositionBase = this.getViewPosition()!;;
    

    var x: number = viewPosition!.getX()!;;
    

    var y: number = viewPosition!.getY()!;;
    

    var z: number = viewPosition!.getZ()!;;
    
this.indexedAnimationInterfaceArray[this.gdObject!.animation]!.paintThreedXYZ(graphics, x, y, z);
    
this.primitiveDrawing!.paintThreedXYZ(graphics, x, y, z);
    

                //: 
} catch(e) 
            {
logUtil!.put(commonStrings!.EXCEPTION, this, "paintThreed", e);
    
}

}


    public paintPoints(graphics: Graphics){
}


    public paintAngle(angle: number, graphics: Graphics){

    var adjustedAngle: number = angle;;
    
}


    public paintDebug(graphics: Graphics){
super.paintDebug(graphics);
    
this.getCollidableInferface()!.paint(this, graphics);
    
}


    public setBasicColor(basicColor: BasicColor){
this.initIndexedAnimationInterfaceArray[0]!.setBasicColorP(basicColor);
    
}


    public setBackgroundBasicColor(basicColor: BasicColor){
this.initIndexedAnimationInterfaceArray[0]!.setBackgroundBasicColorP(basicColor);
    
}


    public setText(value: number){
this.setText(value.toString());
    
}


    public setText(text: string){

    var textInterface: TextInterface = (this.initIndexedAnimationInterfaceArray[0]! as TextInterface);;
    

                        if(text == 
                                    null
                                )
                        
                                    {
                                    textInterface!.setTextWithOnMeasure(this.stringUtil!.EMPTY_STRING, this.textChangeListener);
    

                                    }
                                
                        else {
                            textInterface!.setTextWithOnMeasure(text, this.textChangeListener);
    

                        }
                            
}


    public onMeasure(){



                            throw new RuntimeException();
                    
}


    public Text(): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ( as TextInterface).getText();;
    
}


    public getDimensionalBehavior(): GDTwodBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return dimensionalBehavior;
    
}


    public setValue(value: number){



                            throw new RuntimeException();
                    
}


    public Value(): number{



                            throw new RuntimeException();
                    
}


    public toStringAppend(stringBuffer: StringMaker){
super.toStringAppend(stringBuffer);
    

                        if(this.dimensionalBehavior != 
                                    null
                                )
                        
                                    {
                                    this.dimensionalBehavior!.getAnimationBehavior()!.toString(this.gdObject, stringBuffer);
    

                                    }
                                
stringBuffer!.append(this.gdObject!.toString());
    
}


    public toString(): string{

    var stringBuffer: StringMaker = new StringMaker();;
    
this.toStringAppend(stringBuffer);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuffer!.toString();;
    
}


}



