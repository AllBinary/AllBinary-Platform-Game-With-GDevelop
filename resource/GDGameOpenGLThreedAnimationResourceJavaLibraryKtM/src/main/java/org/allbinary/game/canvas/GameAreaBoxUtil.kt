
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
        package org.allbinary.game.canvas




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import min3d.core.Object3d
import org.allbinary.animation.AnimationInterfaceFactoryInterface
import org.allbinary.animation.AnimationInterfaceFactoryInterfaceComposite
import org.allbinary.animation.BaseAnimationInterfaceFactoryInterfaceComposite
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
import org.allbinary.animation.threed.ThreedAnimationSingletonFactory
import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.game.identification.Group
import org.allbinary.game.identification.GroupFactory
import org.allbinary.game.layer.AllBinaryGameLayerManager
import org.allbinary.game.layer.GDGameLayerFactory
import org.allbinary.graphics.PointFactory
import org.allbinary.graphics.Rectangle
import org.allbinary.graphics.threed.min3d.Min3dSceneResourcesFactory
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GameAreaBoxUtil
            : Object
         {
        
companion object {
            
    private val instance: GameAreaBoxUtil = GameAreaBoxUtil()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GameAreaBoxUtil{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GameAreaBoxUtil.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    var BOX_ANIMATION_NAME: String = "box_animation"

    var BOX_PROCEDURAL_ANIMATION_NAME: String = "box_procedural_animation"

    var BOX_RECTANGLE_NAME_1: String = "box_rect"

    var BOX_RECTANGLE_NAME_2: String = "box_rect"

    var BOX_RECTANGLE_NAME_3: String = "box_rect"

    var BOX_RECTANGLE_NAME_4: String = "box_rect"

    private val min3dSceneResourcesFactory: Min3dSceneResourcesFactory = Min3dSceneResourcesFactory.getInstance()!!

    private val BOX: String = "box"

    var boxGDGameLayerFactory1: GDGameLayerFactory = 
                null
            

    var boxGDGameLayerFactory2: GDGameLayerFactory = 
                null
            

    var boxGDGameLayerFactory3: GDGameLayerFactory = 
                null
            

    var boxGDGameLayerFactory4: GDGameLayerFactory = 
                null
            

                @Throws(Exception::class)
            
    open fun addGameLayerFactories(animationInterfaceFactoryInterfaceFactory: BaseResourceAnimationInterfaceFactoryInterfaceFactory)
        //nullable = true from not(false or (false and false)) = true
{
    //var animationInterfaceFactoryInterfaceFactory = animationInterfaceFactoryInterfaceFactory

    var gameLayerList: BasicArrayList = BasicArrayListD()


    var gameLayerDestroyedList: BasicArrayList = BasicArrayListD()


    var behaviorList: BasicArrayList = BasicArrayListD()


    var btn_rotate_leftGroupInterface: Group = GroupFactory.getInstance()!!.getNextGroupByName(this.BOX)!!


    var boxAnimationInterfaceFactoryInterfaceArray: Array<AnimationInterfaceFactoryInterface?> = 
                                    (getBasicAnimationInterfaceFactoryInstance as AnimationInterfaceFactoryInterfaceComposite).getAnimationInterfaceFactoryInterfaceArray() as Array<AnimationInterfaceFactoryInterface?>


    var boxProceduralAnimationInterfaceFactoryInterfaceArray: Array<ProceduralAnimationInterfaceFactoryInterface?> = 
                                    (getBasicAnimationInterfaceFactoryInstance as BaseAnimationInterfaceFactoryInterfaceComposite).getBasicAnimationInterfaceFactoryInterfaceArray() as Array<ProceduralAnimationInterfaceFactoryInterface?>


    var boxLayerInfo1: Rectangle = animationInterfaceFactoryInterfaceFactory!!.getRectangle(this.BOX_RECTANGLE_NAME_1)!!

this.boxGDGameLayerFactory1= GDGameLayerFactory(gameLayerList, gameLayerDestroyedList, arrayOf(btn_rotate_leftGroupInterface), behaviorList, boxAnimationInterfaceFactoryInterfaceArray, boxProceduralAnimationInterfaceFactoryInterfaceArray, boxLayerInfo1, 
                            null, false)

    var boxLayerInfo2: Rectangle = animationInterfaceFactoryInterfaceFactory!!.getRectangle(this.BOX_RECTANGLE_NAME_1)!!

this.boxGDGameLayerFactory2= GDGameLayerFactory(gameLayerList, gameLayerDestroyedList, arrayOf(btn_rotate_leftGroupInterface), behaviorList, boxAnimationInterfaceFactoryInterfaceArray, boxProceduralAnimationInterfaceFactoryInterfaceArray, boxLayerInfo2, 
                            null, false)

    var boxLayerInfo3: Rectangle = animationInterfaceFactoryInterfaceFactory!!.getRectangle(this.BOX_RECTANGLE_NAME_1)!!

this.boxGDGameLayerFactory3= GDGameLayerFactory(gameLayerList, gameLayerDestroyedList, arrayOf(btn_rotate_leftGroupInterface), behaviorList, boxAnimationInterfaceFactoryInterfaceArray, boxProceduralAnimationInterfaceFactoryInterfaceArray, boxLayerInfo3, 
                            null, false)

    var boxLayerInfo4: Rectangle = animationInterfaceFactoryInterfaceFactory!!.getRectangle(this.BOX_RECTANGLE_NAME_1)!!

this.boxGDGameLayerFactory4= GDGameLayerFactory(gameLayerList, gameLayerDestroyedList, arrayOf(btn_rotate_leftGroupInterface), behaviorList, boxAnimationInterfaceFactoryInterfaceArray, boxProceduralAnimationInterfaceFactoryInterfaceArray, boxLayerInfo4, 
                            null, false)
}


                @Throws(Exception::class)
            
    open fun addAnimations(baseResourceAnimationInterfaceFactoryInterfaceFactory: BaseResourceAnimationInterfaceFactoryInterfaceFactory)
        //nullable = true from not(false or (false and false)) = true
{
    //var baseResourceAnimationInterfaceFactoryInterfaceFactory = baseResourceAnimationInterfaceFactoryInterfaceFactory

    var boxList: BasicArrayList = BasicArrayListD()


    var boxObject3dArray: Array<Object3d?> = this.min3dSceneResourcesFactory!!.get(this.BOX_ANIMATION_NAME)!!


    var boxSize: Int = boxObject3dArray!!.size
                





                        for (index in 0 until boxSize)

        {
boxList!!.add(ThreedAnimationSingletonFactory(boxObject3dArray[index]!!))
}


    var boxAnimationInterfaceFactoryInterfaceArray: Array<AnimationInterfaceFactoryInterface?> = boxList!!.toArrayType(arrayOfNulls(boxSize)) as Array<AnimationInterfaceFactoryInterface?>


    var boxProceduralAnimationInterfaceFactoryInterfaceArray: Array<ProceduralAnimationInterfaceFactoryInterface?> = arrayOfNulls(0)

baseResourceAnimationInterfaceFactoryInterfaceFactory!!.add(this.BOX_ANIMATION_NAME, AnimationInterfaceFactoryInterfaceComposite(boxAnimationInterfaceFactoryInterfaceArray))
baseResourceAnimationInterfaceFactoryInterfaceFactory!!.add(this.BOX_PROCEDURAL_ANIMATION_NAME, BaseAnimationInterfaceFactoryInterfaceComposite(boxProceduralAnimationInterfaceFactoryInterfaceArray))

    var boxLayerInfo: Rectangle = Rectangle(PointFactory.getInstance()!!.createXY(0, 0), 0, 0)

baseResourceAnimationInterfaceFactoryInterfaceFactory!!.addRectangle(this.BOX_RECTANGLE_NAME_2, boxLayerInfo)

    var boxLayerInfo2: Rectangle = Rectangle(PointFactory.getInstance()!!.createXY(192, 320), 0, 0)

baseResourceAnimationInterfaceFactoryInterfaceFactory!!.addRectangle(this.BOX_RECTANGLE_NAME_2, boxLayerInfo2)

    var boxLayerInfo3: Rectangle = Rectangle(PointFactory.getInstance()!!.createXY(0, 320), 0, 0)

baseResourceAnimationInterfaceFactoryInterfaceFactory!!.addRectangle(this.BOX_RECTANGLE_NAME_3, boxLayerInfo3)

    var boxLayerInfo4: Rectangle = Rectangle(PointFactory.getInstance()!!.createXY(192, 0), 0, 0)

baseResourceAnimationInterfaceFactoryInterfaceFactory!!.addRectangle(this.BOX_RECTANGLE_NAME_4, boxLayerInfo4)
}


                @Throws(Exception::class)
            
    open fun append(allBinaryGameLayerManager: AllBinaryGameLayerManager)
        //nullable = true from not(false or (false and false)) = true
{
    //var allBinaryGameLayerManager = allBinaryGameLayerManager
}


}
                
            

