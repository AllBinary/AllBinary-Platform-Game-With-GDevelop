
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
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
import { AnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/AnimationInterfaceFactoryInterface.js';
//not GWT import const AnimationInterfaceFactoryInterface

import { NullAnimationFactory } from '../../../../org/allbinary/animation/NullAnimationFactory.js';
//not GWT import const NullAnimationFactory

import { ProceduralAnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/ProceduralAnimationInterfaceFactoryInterface.js';
//not GWT import const ProceduralAnimationInterfaceFactoryInterface

import { GDObject } from '../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

import { Group } from '../../../../org/allbinary/game/identification/Group.js';
//not GWT import const Group

import { GDConditionWithGroupActions } from '../../../../org/allbinary/game/layer/special/GDConditionWithGroupActions.js';
//not GWT import const GDConditionWithGroupActions

import { RemoteInfo } from '../../../../org/allbinary/game/multiplayer/layer/RemoteInfo.js';
//not GWT import const RemoteInfo

import { VelocityProperties } from '../../../../org/allbinary/game/physics/velocity/VelocityProperties.js';
//not GWT import const VelocityProperties

import { PointFactory } from '../../../../org/allbinary/graphics/PointFactory.js';
//not GWT import const PointFactory

import { Rectangle } from '../../../../org/allbinary/graphics/Rectangle.js';
//not GWT import const Rectangle

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

import { ViewPosition } from '../../../../org/allbinary/view/ViewPosition.js';
//not GWT import const ViewPosition

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDAnimationBehaviorBaseFactory } from './GDAnimationBehaviorBaseFactory.js';
//not GWT import - same folder const GDAnimationBehaviorBaseFactory
import { GDRotationBehaviorFactory } from './GDRotationBehaviorFactory.js';
//not GWT import - same folder const GDRotationBehaviorFactory
import { GDGameLayer } from './GDGameLayer.js';
//not GWT import - same folder const GDGameLayer

export class GDGameLayerFactory
            extends Object
         {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    readonly behaviorList: BasicArrayList;

    readonly groupInterface: Group[];

    readonly animationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[];

    readonly proceduralAnimationInterfaceFactoryInterfaceArray: ProceduralAnimationInterfaceFactoryInterface[];

    readonly layerInfo: Rectangle;

    readonly rectangleArrayOfArrays: Rectangle[][];

    readonly animationBehaviorFactory: GDAnimationBehaviorBaseFactory;

    readonly gameLayerList: BasicArrayList;

    readonly gameLayerDestroyedList: BasicArrayList;

    readonly resetAnimationBehavior: boolean;

public constructor (gameLayerList: BasicArrayList, gameLayerDestroyedList: BasicArrayList, groupInterface: Group[], behaviorList: BasicArrayList, animationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[], proceduralAnimationInterfaceFactoryInterfaceArray: ProceduralAnimationInterfaceFactoryInterface[], layerInfo: Rectangle, rectangleArrayOfArrays: Rectangle[][], resetAnimationBehavior: boolean){
            this(gameLayerList, gameLayerDestroyedList, groupInterface, behaviorList, animationInterfaceFactoryInterfaceArray, proceduralAnimationInterfaceFactoryInterfaceArray, layerInfo, rectangleArrayOfArrays, GDRotationBehaviorFactory.getInstance(), resetAnimationBehavior);
                    

                            //For kotlin this is before the body of the constructor.
                    
}


public constructor (gameLayerList: BasicArrayList, gameLayerDestroyedList: BasicArrayList, groupInterface: Group[], behaviorList: BasicArrayList, animationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[], proceduralAnimationInterfaceFactoryInterfaceArray: ProceduralAnimationInterfaceFactoryInterface[], layerInfo: Rectangle, rectangleArrayOfArrays: Rectangle[][], animationBehaviorFactory: GDAnimationBehaviorBaseFactory, resetAnimationBehavior: boolean){

            super();
        this.groupInterface= groupInterface;
    
this.behaviorList= behaviorList;
    
this.animationInterfaceFactoryInterfaceArray= animationInterfaceFactoryInterfaceArray;
    
this.proceduralAnimationInterfaceFactoryInterfaceArray= proceduralAnimationInterfaceFactoryInterfaceArray;
    
this.layerInfo= layerInfo;
    
this.rectangleArrayOfArrays= rectangleArrayOfArrays;
    
this.animationBehaviorFactory= animationBehaviorFactory;
    
this.gameLayerList= gameLayerList;
    
this.gameLayerDestroyedList= gameLayerDestroyedList;
    
this.resetAnimationBehavior= resetAnimationBehavior;
    
}


                //@Throws(Exception.constructor)
            
    public create(layoutIndex: number, name: string, gdObject: GDObject, scaleX: number, scaleY: number, collidableBehavior: GDConditionWithGroupActions): GDGameLayer{

                        if(!name.startsWith(gdObject!.name))
                        
                                    {
                                    this.logUtil!.put(new StringMaker().append(name)!.append(" GDObject name: ")!.append(gdObject!.name)!.append(" animationInterfaceFactoryInterfaceArray size: ")!.appendint(this.animationInterfaceFactoryInterfaceArray!.length)!.append(" animationInterfaceFactoryInterfaceArray[0]: ")!.append(this.animationInterfaceFactoryInterfaceArray!.length > 0
                        ?       
                                this.animationInterfaceFactoryInterfaceArray[0]!.toString()
                                :

                            "empty";

    )!.toString(), this, "create", new Exception());
    

                                    }
                                

    var rectangle: Rectangle = new Rectangle(PointFactory.getInstance()!.ZERO_ZERO, Math.round((this.layerInfo!.getWidth() *scaleX)), Math.round((this.layerInfo!.getHeight() *scaleY)));;
    
gdObject!.updateScale(scaleX, scaleY);
    

    var gameLayer: GDGameLayer = new GDGameLayer(NullAnimationFactory.getFactoryInstance()!.getInstance(0), this.gameLayerList, this.gameLayerDestroyedList, this.behaviorList, new VelocityProperties(9600, 9600), RemoteInfo.REMOTE_INFO, this.groupInterface, name, this.animationInterfaceFactoryInterfaceArray, this.proceduralAnimationInterfaceFactoryInterfaceArray, rectangle, this.rectangleArrayOfArrays, ViewPosition.getInstanceD(), gdObject, this.animationBehaviorFactory!.create(), this.resetAnimationBehavior);;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return gameLayer;
    
}


}



