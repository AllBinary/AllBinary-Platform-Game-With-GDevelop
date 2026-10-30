
        /*
                *  
                *  To change this template, choose Tools | Templates  and open the template in the editor.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
import { AnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/AnimationInterfaceFactoryInterface.js';
//not GWT import const AnimationInterfaceFactoryInterface

import { BasicAnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/BasicAnimationInterfaceFactoryInterface.js';
//not GWT import const BasicAnimationInterfaceFactoryInterface

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

import { NullRotationAnimationFactory } from '../../../../org/allbinary/animation/NullRotationAnimationFactory.js';
//not GWT import const NullRotationAnimationFactory

import { Group } from '../../../../org/allbinary/game/identification/Group.js';
//not GWT import const Group

import { GDConditionWithGroupActions } from '../../../../org/allbinary/game/layer/special/GDConditionWithGroupActions.js';
//not GWT import const GDConditionWithGroupActions

import { GDObject } from '../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

import { Rectangle } from '../../../../org/allbinary/graphics/Rectangle.js';
//not GWT import const Rectangle

import { RectangleFactory } from '../../../../org/allbinary/graphics/RectangleFactory.js';
//not GWT import const RectangleFactory

import { AllBinaryLayer } from '../../../../org/allbinary/layer/AllBinaryLayer.js';
//not GWT import const AllBinaryLayer

import { LayerInterfaceFactoryInterface } from '../../../../org/allbinary/layer/LayerInterfaceFactoryInterface.js';
//not GWT import const LayerInterfaceFactoryInterface

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
type StringUtil<T = any, U = any> = typeof StringUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringUtil;

//not plain js import { ABHashtable } 
const ABHashtable = globalThis.org.allbinary.util.ABHashtable;
type ABHashtable<T = any, U = any> = typeof ABHashtable extends abstract new (...args: any[]) => infer Instance ? Instance : typeof ABHashtable;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameLayerFactory } from './GDGameLayerFactory.js';
//not GWT import - same folder const GDGameLayerFactory
import { GDRotationBehaviorFactory } from './GDRotationBehaviorFactory.js';
//not GWT import - same folder const GDRotationBehaviorFactory
import { GDGameLayer } from './GDGameLayer.js';
//not GWT import - same folder const GDGameLayer
import { AllBinaryGameLayerManager } from './AllBinaryGameLayerManager.js';
//not GWT import - same folder const AllBinaryGameLayerManager

export class GDFlagLayerInterfaceFactory
            extends Object
         implements LayerInterfaceFactoryInterface {
        

    private static readonly instance: GDFlagLayerInterfaceFactory = new GDFlagLayerInterfaceFactory();

    public static getInstance(): GDFlagLayerInterfaceFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDFlagLayerInterfaceFactory.instance;
    
}


    private static readonly NAME: string = "GDFlagLayerInterfaceFactory";

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private index: number = 0;

private constructor (){

            super();
        }


                //@Throws(Exception.constructor)
            
    public getNextInstance(hashtable: ABHashtable<any, any>, x: number, y: number, z: number): AllBinaryLayer{

    let gameLayerList: BasicArrayList = new BasicArrayListD();;
    

    let gameLayerDestroyedList: BasicArrayList = new BasicArrayListD();;
    

    let behaviorList: BasicArrayList = new BasicArrayListD();;
    

    let groupInterface: Group[] = 
                                                        [
                                                            
                                                        ];;
    

    let animationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[] = 
                                                        [
                                                            NullRotationAnimationFactory.getFactoryInstance()
                                                        ];;
    

    let proceduralAnimationInterfaceFactoryInterfaceArray: BasicAnimationInterfaceFactoryInterface[] = 
                                                        [
                                                            NullRotationAnimationFactory.getFactoryInstance()
                                                        ];;
    

    let layerInfo: Rectangle = RectangleFactory.SINGLETON;;
    

    let rectangleArrayOfArrays: Rectangle[][] = RectangleFactory.ARRAY_OF_ARRAYS;;
    

    let gameLayerFactory: GDGameLayerFactory = new GDGameLayerFactory(gameLayerList, gameLayerDestroyedList, groupInterface, behaviorList, animationInterfaceFactoryInterfaceArray, proceduralAnimationInterfaceFactoryInterfaceArray, layerInfo, rectangleArrayOfArrays, GDRotationBehaviorFactory.getInstance(), false);;
    

    let gdObject: GDObject = new GDObject(0, 0, GDFlagLayerInterfaceFactory.NAME, StringUtil.getInstance()!.EMPTY_STRING);;
    
gdObject!.set(StringUtil.getInstance()!.EMPTY_STRING, x, y, z);
    

    let layer: GDGameLayer = gameLayerFactory!.create( -1, GDFlagLayerInterfaceFactory.NAME, gdObject, 0.0, 0.0, new GDConditionWithGroupActions())!;;
    
layer.setAllBinaryGameLayerManager(hashtable.get(AllBinaryGameLayerManager.ID) as AllBinaryGameLayerManager);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return layer;
    
}


}

