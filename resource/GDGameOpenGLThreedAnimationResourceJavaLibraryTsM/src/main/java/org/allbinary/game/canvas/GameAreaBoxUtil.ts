
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2022 AllBinary 
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
        
import { Object3d } from '../../../../min3d/core/Object3d.js';
//not GWT import const Object3d

import { AnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/AnimationInterfaceFactoryInterface.js';
//not GWT import const AnimationInterfaceFactoryInterface

import { AnimationInterfaceFactoryInterfaceComposite } from '../../../../org/allbinary/animation/AnimationInterfaceFactoryInterfaceComposite.js';
//not GWT import const AnimationInterfaceFactoryInterfaceComposite

import { BaseAnimationInterfaceFactoryInterfaceComposite } from '../../../../org/allbinary/animation/BaseAnimationInterfaceFactoryInterfaceComposite.js';
//not GWT import const BaseAnimationInterfaceFactoryInterfaceComposite

import { ProceduralAnimationInterfaceFactoryInterface } from '../../../../org/allbinary/animation/ProceduralAnimationInterfaceFactoryInterface.js';
//not GWT import const ProceduralAnimationInterfaceFactoryInterface

import { ThreedAnimationSingletonFactory } from '../../../../org/allbinary/animation/threed/ThreedAnimationSingletonFactory.js';
//not GWT import const ThreedAnimationSingletonFactory

import { BaseResourceAnimationInterfaceFactoryInterfaceFactory } from '../../../../org/allbinary/animation/resource/BaseResourceAnimationInterfaceFactoryInterfaceFactory.js';
//not GWT import const BaseResourceAnimationInterfaceFactoryInterfaceFactory

import { Group } from '../../../../org/allbinary/game/identification/Group.js';
//not GWT import const Group

import { GroupFactory } from '../../../../org/allbinary/game/identification/GroupFactory.js';
//not GWT import const GroupFactory

import { AllBinaryGameLayerManager } from '../../../../org/allbinary/game/layer/AllBinaryGameLayerManager.js';
//not GWT import const AllBinaryGameLayerManager

import { GDGameLayerFactory } from '../../../../org/allbinary/game/layer/GDGameLayerFactory.js';
//not GWT import const GDGameLayerFactory

import { PointFactory } from '../../../../org/allbinary/graphics/PointFactory.js';
//not GWT import const PointFactory

import { Rectangle } from '../../../../org/allbinary/graphics/Rectangle.js';
//not GWT import const Rectangle

import { Min3dSceneResourcesFactory } from '../../../../org/allbinary/graphics/threed/min3d/Min3dSceneResourcesFactory.js';
//not GWT import const Min3dSceneResourcesFactory

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GameAreaBoxUtil
            extends Object
         {
        

    private static readonly instance: GameAreaBoxUtil = new GameAreaBoxUtil();

    public static getInstance(): GameAreaBoxUtil{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GameAreaBoxUtil.instance;
    
}


    public BOX_ANIMATION_NAME: string = "box_animation";

    public BOX_PROCEDURAL_ANIMATION_NAME: string = "box_procedural_animation";

    public BOX_RECTANGLE_NAME_1: string = "box_rect";

    public BOX_RECTANGLE_NAME_2: string = "box_rect";

    public BOX_RECTANGLE_NAME_3: string = "box_rect";

    public BOX_RECTANGLE_NAME_4: string = "box_rect";

    private readonly min3dSceneResourcesFactory: Min3dSceneResourcesFactory = Min3dSceneResourcesFactory.getInstance()!;

    private readonly BOX: string = "box";

    public boxGDGameLayerFactory1: GDGameLayerFactory = 
                null
            ;

    public boxGDGameLayerFactory2: GDGameLayerFactory = 
                null
            ;

    public boxGDGameLayerFactory3: GDGameLayerFactory = 
                null
            ;

    public boxGDGameLayerFactory4: GDGameLayerFactory = 
                null
            ;

                //@Throws(Exception.constructor)
            
    public addGameLayerFactories(animationInterfaceFactoryInterfaceFactory: BaseResourceAnimationInterfaceFactoryInterfaceFactory){

    var gameLayerList: BasicArrayList = new BasicArrayListD();;
    

    var gameLayerDestroyedList: BasicArrayList = new BasicArrayListD();;
    

    var behaviorList: BasicArrayList = new BasicArrayListD();;
    

    var btn_rotate_leftGroupInterface: Group = GroupFactory.getInstance()!.getNextGroupByName(this.BOX)!;;
    

    var boxAnimationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[] = (getBasicAnimationInterfaceFactoryInstance as AnimationInterfaceFactoryInterfaceComposite).getAnimationInterfaceFactoryInterfaceArray() as AnimationInterfaceFactoryInterface[];;
    

    var boxProceduralAnimationInterfaceFactoryInterfaceArray: ProceduralAnimationInterfaceFactoryInterface[] = (getBasicAnimationInterfaceFactoryInstance as BaseAnimationInterfaceFactoryInterfaceComposite).getBasicAnimationInterfaceFactoryInterfaceArray() as ProceduralAnimationInterfaceFactoryInterface[];;
    

    var boxLayerInfo1: Rectangle = animationInterfaceFactoryInterfaceFactory!.getRectangle(this.BOX_RECTANGLE_NAME_1)!;;
    
this.boxGDGameLayerFactory1= new GDGameLayerFactory(gameLayerList, gameLayerDestroyedList, 
                                                [
                                                    btn_rotate_leftGroupInterface
                                                ], behaviorList, boxAnimationInterfaceFactoryInterfaceArray, boxProceduralAnimationInterfaceFactoryInterfaceArray, boxLayerInfo1, 
                            null, false);
    

    var boxLayerInfo2: Rectangle = animationInterfaceFactoryInterfaceFactory!.getRectangle(this.BOX_RECTANGLE_NAME_1)!;;
    
this.boxGDGameLayerFactory2= new GDGameLayerFactory(gameLayerList, gameLayerDestroyedList, 
                                                [
                                                    btn_rotate_leftGroupInterface
                                                ], behaviorList, boxAnimationInterfaceFactoryInterfaceArray, boxProceduralAnimationInterfaceFactoryInterfaceArray, boxLayerInfo2, 
                            null, false);
    

    var boxLayerInfo3: Rectangle = animationInterfaceFactoryInterfaceFactory!.getRectangle(this.BOX_RECTANGLE_NAME_1)!;;
    
this.boxGDGameLayerFactory3= new GDGameLayerFactory(gameLayerList, gameLayerDestroyedList, 
                                                [
                                                    btn_rotate_leftGroupInterface
                                                ], behaviorList, boxAnimationInterfaceFactoryInterfaceArray, boxProceduralAnimationInterfaceFactoryInterfaceArray, boxLayerInfo3, 
                            null, false);
    

    var boxLayerInfo4: Rectangle = animationInterfaceFactoryInterfaceFactory!.getRectangle(this.BOX_RECTANGLE_NAME_1)!;;
    
this.boxGDGameLayerFactory4= new GDGameLayerFactory(gameLayerList, gameLayerDestroyedList, 
                                                [
                                                    btn_rotate_leftGroupInterface
                                                ], behaviorList, boxAnimationInterfaceFactoryInterfaceArray, boxProceduralAnimationInterfaceFactoryInterfaceArray, boxLayerInfo4, 
                            null, false);
    
}


                //@Throws(Exception.constructor)
            
    public addAnimations(baseResourceAnimationInterfaceFactoryInterfaceFactory: BaseResourceAnimationInterfaceFactoryInterfaceFactory){

    var boxList: BasicArrayList = new BasicArrayListD();;
    

    var boxObject3dArray: Object3d[] = this.min3dSceneResourcesFactory!.get(this.BOX_ANIMATION_NAME)!;;
    

    var boxSize: number = boxObject3dArray!.length
                ;;
    




                        for (
    var index: number = 0;index < boxSize; index++)
        {
boxList!.add(new ThreedAnimationSingletonFactory(boxObject3dArray[index]!));
    
}


    var boxAnimationInterfaceFactoryInterfaceArray: AnimationInterfaceFactoryInterface[] = boxList!.toArrayType(new Array(boxSize)) as AnimationInterfaceFactoryInterface[];;
    

    var boxProceduralAnimationInterfaceFactoryInterfaceArray: ProceduralAnimationInterfaceFactoryInterface[] = [];;
    
baseResourceAnimationInterfaceFactoryInterfaceFactory!.add(this.BOX_ANIMATION_NAME, new AnimationInterfaceFactoryInterfaceComposite(boxAnimationInterfaceFactoryInterfaceArray));
    
baseResourceAnimationInterfaceFactoryInterfaceFactory!.add(this.BOX_PROCEDURAL_ANIMATION_NAME, new BaseAnimationInterfaceFactoryInterfaceComposite(boxProceduralAnimationInterfaceFactoryInterfaceArray));
    

    var boxLayerInfo: Rectangle = new Rectangle(PointFactory.getInstance()!.createXY(0, 0), 0, 0);;
    
baseResourceAnimationInterfaceFactoryInterfaceFactory!.addRectangle(this.BOX_RECTANGLE_NAME_2, boxLayerInfo);
    

    var boxLayerInfo2: Rectangle = new Rectangle(PointFactory.getInstance()!.createXY(192, 320), 0, 0);;
    
baseResourceAnimationInterfaceFactoryInterfaceFactory!.addRectangle(this.BOX_RECTANGLE_NAME_2, boxLayerInfo2);
    

    var boxLayerInfo3: Rectangle = new Rectangle(PointFactory.getInstance()!.createXY(0, 320), 0, 0);;
    
baseResourceAnimationInterfaceFactoryInterfaceFactory!.addRectangle(this.BOX_RECTANGLE_NAME_3, boxLayerInfo3);
    

    var boxLayerInfo4: Rectangle = new Rectangle(PointFactory.getInstance()!.createXY(192, 0), 0, 0);;
    
baseResourceAnimationInterfaceFactoryInterfaceFactory!.addRectangle(this.BOX_RECTANGLE_NAME_4, boxLayerInfo4);
    
}


                //@Throws(Exception.constructor)
            
    public append(allBinaryGameLayerManager: AllBinaryGameLayerManager){
}


}



