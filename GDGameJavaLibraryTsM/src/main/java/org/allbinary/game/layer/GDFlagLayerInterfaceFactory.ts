
        /*
                *  
                *  To change this template, choose Tools | Templates  and open the template in the editor.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
import { AnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/AnimationInterfaceFactoryInterface.js';
//not GWT import const AnimationInterfaceFactoryInterface

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { NullRotationAnimationFactory } from '../../../../org/allbinary/animation/NullRotationAnimationFactory.js';
//not GWT import const NullRotationAnimationFactory

import { ProceduralAnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/ProceduralAnimationInterfaceFactoryInterface.js';
//not GWT import const ProceduralAnimationInterfaceFactoryInterface

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

//not plain js import { ABHashtable } 
const ABHashtable = globalThis.org.allbinary.util.ABHashtable;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameLayerFactory } from './GDGameLayerFactory.js';
//not GWT import - same folder const GDGameLayerFactory
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
            
    public getNextInstance(hashtable: ABHashtable, x: number, y: number, z: number): AllBinaryLayer{

    var gameLayerList: BasicArrayList = new BasicArrayListD();;
    

    var gameLayerDestroyedList: BasicArrayList = new BasicArrayListD();;
    

    var behaviorList: BasicArrayList = new BasicArrayListD();;
    

    var groupInterface: Group[] = 
                                                        [
                                                            
                                                        ];;
    

    var animationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[] = 
                                                        [
                                                            NullRotationAnimationFactory.getFactoryInstance()
                                                        ];;
    

    var proceduralAnimationInterfaceFactoryInterfaceArray: ProceduralAnimationInterfaceFactoryInterface[] = 
                                                        [
                                                            NullRotationAnimationFactory.getFactoryInstance()
                                                        ];;
    

    var layerInfo: Rectangle = RectangleFactory.SINGLETON;;
    

    var rectangleArrayOfArrays: Rectangle[][] = new Array(0).fill(null).map(() => new Array(0).fill(null))
                                                            ;;
    

    var gameLayerFactory: GDGameLayerFactory = new GDGameLayerFactory(gameLayerList, gameLayerDestroyedList, groupInterface, behaviorList, animationInterfaceFactoryInterfaceArray, proceduralAnimationInterfaceFactoryInterfaceArray, layerInfo, rectangleArrayOfArrays, false);;
    

    var gdObject: GDObject = new GDObject(0, 0, GDFlagLayerInterfaceFactory.NAME, 
                            null);;
    
gdObject!.set(
                            null, x, y, z);
    

    var layer: GDGameLayer = gameLayerFactory!.create( -1, GDFlagLayerInterfaceFactory.NAME, gdObject, 0, 0, new GDConditionWithGroupActions())!;;
    
layer.setAllBinaryGameLayerManager(hashtable.get(AllBinaryGameLayerManager.ID) as AllBinaryGameLayerManager);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return layer;
    
}


}



