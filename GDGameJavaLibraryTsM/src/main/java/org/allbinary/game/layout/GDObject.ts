
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

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { RuntimeException } from '../../../../java/lang/RuntimeException.js';
        
import { Graphics } from '../../../../javax/microedition/lcdui/Graphics.js';
//not GWT import const Graphics

import { AndroidUtil } from '../../../../org/allbinary/AndroidUtil.js';
//not GWT import const AndroidUtil

import { Features } from '../../../../org/allbinary/game/configuration/feature/Features.js';
//not GWT import const Features

import { GDGameLayer } from '../../../../org/allbinary/game/layer/GDGameLayer.js';
//not GWT import const GDGameLayer

import { GDBehavior } from '../../../../org/allbinary/game/layer/behavior/GDBehavior.js';
//not GWT import const GDBehavior

import { GDBehaviorUtil } from '../../../../org/allbinary/game/layer/behavior/GDBehaviorUtil.js';
//not GWT import const GDBehaviorUtil

import { GPoint } from '../../../../org/allbinary/graphics/GPoint.js';
//not GWT import const GPoint

import { GraphicsStrings } from '../../../../org/allbinary/graphics/GraphicsStrings.js';
//not GWT import const GraphicsStrings

import { BasicColor } from '../../../../org/allbinary/graphics/color/BasicColor.js';
//not GWT import const BasicColor

import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory

import { OpenGLFeatureFactory } from '../../../../org/allbinary/graphics/opengles/OpenGLFeatureFactory.js';
//not GWT import const OpenGLFeatureFactory

//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;

import { NoDecimalTrigTable } from '../../../../org/allbinary/math/NoDecimalTrigTable.js';
//not GWT import const NoDecimalTrigTable

//not plain js import { PositionStrings } 
const PositionStrings = globalThis.org.allbinary.math.PositionStrings;

//not plain js import { CommonLabels } 
const CommonLabels = globalThis.org.allbinary.string.CommonLabels;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDInitialVariables } from './GDInitialVariables.js';
//not GWT import - same folder const GDInitialVariables
import { BaseOffsetBehavior } from './BaseOffsetBehavior.js';
//not GWT import - same folder const BaseOffsetBehavior
import { OffsetBehavior } from './OffsetBehavior.js';
//not GWT import - same folder const OffsetBehavior
import { GDConfig } from './GDConfig.js';
//not GWT import - same folder const GDConfig
import { GDObjectStrings } from './GDObjectStrings.js';
//not GWT import - same folder const GDObjectStrings

export class GDObject
            extends Object
         {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly noDecimalTrigTable: NoDecimalTrigTable = NoDecimalTrigTable.getInstance()!;

    public initialVariables: GDInitialVariables = GDInitialVariables.getInstance()!;

    public readonly name: string;

    public readonly type: string;

    public readonly behaviorArray: GDBehavior[] = new Array(GDBehaviorUtil.getInstance()!.MAX);

    public readonly isBehaviorEnabledArray: boolean[] = new Array(10);

    public readonly hasBehaviorArray: boolean[] = new Array(10);

    private readonly offsetBehavior: BaseOffsetBehavior;

    public xP: number= 0;

    public yP: number= 0;

    public zOrder: number= 0;

    public rotationP: number= 0.0;

    public rotationZP: number= 0.0;

    public angleP: number= 0;

    public movement_angle: number= 0;

    public scaleX: number = 1.0;

    public scaleY: number = 1.0;

    public initScaleX: number = 1.0;

    public initScaleY: number = 1.0;

    public customScale: number = 1.0;

    public animation: number= 0;

    public timeScale: number = 1.0;

    public opacity: number = 255;

    public basicColor: BasicColor = BasicColorFactory.getInstance()!.NULL_COLOR;

    public widthAtInitialScale: number= 0;

    public heightAtInitialScale: number= 0;

    public width: number= 0;

    public height: number= 0;

    private halfWidth: number= 0;

    private halfHeight: number= 0;

    public updateSinceSetAngle: boolean= false;

    public forceAngle: number = 0;

public constructor (width: number, height: number, name: string, type: string){

            super();
        this.name= name;
    
this.type= type;
    
this.updateSize(width, height);
    

    var features: Features = Features.getInstance()!;;
    

    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!;;
    

                        if(features.isFeature(openGLFeatureFactory!.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory!.OPENGL_3D))
                        
                                    {
                                    this.offsetBehavior= BaseOffsetBehavior.getInstance();
    

                                    }
                                
                        else {
                            this.offsetBehavior= OffsetBehavior.getInstance();
    

                        }
                            
}


    public set(unknown: string, x: number, y: number, zOrder: number){
this.xP= x;
    
this.yP= y;
    
this.zOrder= zOrder;
    
}


    public updateScale(scaleX: number, scaleY: number){
this.initScaleX= scaleX;
    
this.initScaleY= scaleY;
    
this.updateSize(Math.round((this.width *scaleX)), Math.round((this.height *scaleY)));
    
}


    public updateSize(width: number, height: number){
this.width= width;
    
this.height= height;
    
this.halfWidth= width /2;
    
this.halfHeight= height /2;
    
}


    public ForceAngle(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.forceAngle;
    
}


    public getAnimationFromIndex(index: number): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return StringUtil.getInstance()!.EMPTY_STRING;
    
}


    public getAnimation(animationName: string): string{



                            throw new RuntimeException();
                    
}


    public setAnimation(animationName: string): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


    public Width(graphicsCanBeNull: Graphics): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.width;
    
}


    public Height(graphicsCanBeNull: Graphics): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.height;
    
}


    public setX(x: number){
this.setX(Math.round(x));
    
}


    public setX(x: number){
this.xP= x;
    
}


    public setY(y: number){
this.setY(Math.round(y));
    
}


    public setY(y: number){
this.yP= y;
    
}


    public X(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.xP;
    
}


    public Y(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.yP;
    
}


    public X2(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.xP +this.width;
    
}


    public Y2(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.yP +this.height;
    
}


    private readonly offsetX: number = GDConfig.getInstance()!.getInverseScale()!;

    private readonly offsetY: number = 1.00;

    public PointX(point: GPoint): number{

    var adjustedAngle: number = this.angleP;;
    

        while(adjustedAngle > 359)
        {
adjustedAngle -= 360;
    
}


        while(adjustedAngle < 0)
        {
adjustedAngle += 360;
    
}


    var x: number = Math.round((this.noDecimalTrigTable!.cos(adjustedAngle) *(point.getX() -this.halfWidth -(this.halfWidth /2)))) /this.noDecimalTrigTable!.SCALE;;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.round((this.xP +(x *this.offsetX) +this.offsetBehavior!.PointX(this.halfWidth)));
    
}


    public PointY(point: GPoint): number{

    var adjustedAngle: number = this.angleP;;
    

        while(adjustedAngle > 359)
        {
adjustedAngle -= 360;
    
}


        while(adjustedAngle < 0)
        {
adjustedAngle += 360;
    
}


                        if(point.getX() > this.halfWidth)
                        
                                    {
                                    
    var y: number = Math.round((this.noDecimalTrigTable!.sin(adjustedAngle) *(point.getY() -(this.halfHeight /2)))) /this.noDecimalTrigTable!.SCALE;;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.round((this.yP +(y *this.offsetY) +this.offsetBehavior!.PointY(this.halfHeight)));
    

                                    }
                                
                        else {
                            
    var y: number = Math.round((this.noDecimalTrigTable!.sin(adjustedAngle) * -(point.getY() -(this.halfHeight /2)))) /this.noDecimalTrigTable!.SCALE;;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return Math.round((this.yP +(y *this.offsetY) +this.offsetBehavior!.PointY(this.halfHeight)));
    

                        }
                            
}


    public setAngle(angle: number){
this.angleP= angle;
    
}


    public setAngle(angle: number, gameLayer: GDGameLayer){
this.updateSinceSetAngle= false;
    

    var adjustedAngle: number = angle;;
    

        while(adjustedAngle > 359)
        {
adjustedAngle -= 360;
    
}


        while(adjustedAngle < 0)
        {
adjustedAngle += 360;
    
}

this.angleP= adjustedAngle;
    
gameLayer!.setRotation(adjustedAngle);
    
}


    public Angle(gameLayer: GDGameLayer): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.angleP;
    
}


    public Angle(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.angleP;
    
}


    public Variable(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public Variable(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public VariableChildCount(array: number[]): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return array.length;
    
}


    public VariableChildCount(array: string[]): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return array.length;
    
}


    public ObjectName(): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.name;
    
}


    public reset(){
}


    public getBehavior(index: number): GDBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.behaviorArray[index]! as GDBehavior;
    
}


    public toShortString(): string{

    var commonSeps: CommonSeps = CommonSeps.getInstance()!;;
    

    var gdObjectStrings: GDObjectStrings = GDObjectStrings.getInstance()!;;
    

    var positionStrings: PositionStrings = PositionStrings.getInstance()!;;
    

    var commonLabels: CommonLabels = CommonLabels.getInstance()!;;
    

    var stringBuilder: StringMaker = new StringMaker();;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuilder!.append(gdObjectStrings!.GDOBJECT)!.append(CommonSeps.getInstance()!.COLON)!.append(this.name)!.append(commonSeps!.SPACE)!.append(positionStrings!.X_LABEL)!.appendint(this.xP)!.append(positionStrings!.Y_LABEL)!.appendint(this.yP)!.append(commonLabels!.WIDTH_LABEL)!.appendint(this.width)!.append(commonLabels!.HEIGHT_LABEL)!.appendint(this.height)!.toString();;
    
}


    public toString(): string{

    var commonSeps: CommonSeps = CommonSeps.getInstance()!;;
    

    var graphicsStrings: GraphicsStrings = GraphicsStrings.getInstance()!;;
    

    var positionStrings: PositionStrings = PositionStrings.getInstance()!;;
    

    var commonLabels: CommonLabels = CommonLabels.getInstance()!;;
    

    var gdObjectStrings: GDObjectStrings = GDObjectStrings.getInstance()!;;
    

    var stringBuilder: StringMaker = new StringMaker();;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuilder!.append(gdObjectStrings!.GDOBJECT)!.append(CommonSeps.getInstance()!.COLON)!.append(this.name)!.appendint(this.hashCode())!.append(commonSeps!.SPACE)!.append(positionStrings!.X_LABEL)!.appendint(this.xP)!.append(positionStrings!.Y_LABEL)!.appendint(this.yP)!.append(commonSeps!.SPACE)!.append(positionStrings!.Z_LABEL)!.appendint(this.zOrder)!.append(commonSeps!.SPACE)!.append(commonLabels!.WIDTH_LABEL)!.appendint(this.width)!.append(commonSeps!.SPACE)!.append(commonLabels!.HEIGHT_LABEL)!.appendint(this.height)!.append(commonSeps!.SPACE)!.append(commonLabels!.WIDTH_LABEL)!.appendint(this.halfWidth)!.append(commonSeps!.SPACE)!.append(commonLabels!.HEIGHT_LABEL)!.appendint(this.halfHeight)!.append(commonSeps!.SPACE)!.append(graphicsStrings!.ANIMATION)!.appendint(this.animation)!.append(commonSeps!.SPACE)!.append(graphicsStrings!.ANGLE)!.append(commonSeps!.COLON)!.appendint(this.angleP)!.append(commonSeps!.SPACE)!.append(graphicsStrings!.MOVEMENT_ANGLE)!.append(commonSeps!.COLON)!.appendint(this.movement_angle)!.append(commonSeps!.SPACE)!.append(graphicsStrings!.ROTATION)!.append(commonSeps!.COLON)!.appendfloat(this.rotationP)!.append(commonSeps!.SPACE)!.append(graphicsStrings!.OPACITY)!.append(commonSeps!.COLON)!.appendfloat(this.opacity)!.toString();;
    
}


}



