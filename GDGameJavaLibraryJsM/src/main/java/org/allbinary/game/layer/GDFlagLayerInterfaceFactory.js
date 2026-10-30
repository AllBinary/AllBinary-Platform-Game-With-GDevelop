/*
        *
        *  To change this template, choose Tools | Templates  and open the template in the editor.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
//not GWT import const BasicAnimationInterfaceFactoryInterface
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
import { NullRotationAnimationFactory } from '../../../../org/allbinary/animation/NullRotationAnimationFactory.js';
//not GWT import const Group
import { GDConditionWithGroupActions } from '../../../../org/allbinary/game/layer/special/GDConditionWithGroupActions.js';
//not GWT import const GDConditionWithGroupActions
import { GDObject } from '../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const Rectangle
import { RectangleFactory } from '../../../../org/allbinary/graphics/RectangleFactory.js';
//not GWT import const LayerInterfaceFactoryInterface
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
//not plain js import { ABHashtable } 
const ABHashtable = globalThis.org.allbinary.util.ABHashtable;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDGameLayerFactory } from './GDGameLayerFactory.js';
//not GWT import - same folder const GDGameLayerFactory
import { GDRotationBehaviorFactory } from './GDRotationBehaviorFactory.js';
//not GWT import - same folder const GDGameLayer
import { AllBinaryGameLayerManager } from './AllBinaryGameLayerManager.js';
//not GWT import - same folder const AllBinaryGameLayerManager
export class GDFlagLayerInterfaceFactory extends Object {
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDFlagLayerInterfaceFactory.instance;
    }
    constructor() {
        super();
        this.logUtil = LogUtil.getInstance();
        this.index = 0;
    }
    //@Throws(Exception.constructor)
    getNextInstance(hashtable, x, y, z) {
        let gameLayerList = new BasicArrayListD();
        ;
        let gameLayerDestroyedList = new BasicArrayListD();
        ;
        let behaviorList = new BasicArrayListD();
        ;
        let groupInterface = [];
        ;
        let animationInterfaceFactoryInterfaceArray = [
            NullRotationAnimationFactory.getFactoryInstance()
        ];
        ;
        let proceduralAnimationInterfaceFactoryInterfaceArray = [
            NullRotationAnimationFactory.getFactoryInstance()
        ];
        ;
        let layerInfo = RectangleFactory.SINGLETON;
        ;
        let rectangleArrayOfArrays = RectangleFactory.ARRAY_OF_ARRAYS;
        ;
        let gameLayerFactory = new GDGameLayerFactory(gameLayerList, gameLayerDestroyedList, groupInterface, behaviorList, animationInterfaceFactoryInterfaceArray, proceduralAnimationInterfaceFactoryInterfaceArray, layerInfo, rectangleArrayOfArrays, GDRotationBehaviorFactory.getInstance(), false);
        ;
        let gdObject = new GDObject(0, 0, GDFlagLayerInterfaceFactory.NAME, StringUtil.getInstance().EMPTY_STRING);
        ;
        gdObject.set(StringUtil.getInstance().EMPTY_STRING, x, y, z);
        let layer = gameLayerFactory.create(-1, GDFlagLayerInterfaceFactory.NAME, gdObject, 0.0, 0.0, new GDConditionWithGroupActions());
        ;
        layer.setAllBinaryGameLayerManager(hashtable.get(AllBinaryGameLayerManager.ID));
        //if statement needs to be on the same line and ternary does not work the same way.
        return layer;
    }
}
GDFlagLayerInterfaceFactory.instance = new GDFlagLayerInterfaceFactory();
GDFlagLayerInterfaceFactory.NAME = "GDFlagLayerInterfaceFactory";
