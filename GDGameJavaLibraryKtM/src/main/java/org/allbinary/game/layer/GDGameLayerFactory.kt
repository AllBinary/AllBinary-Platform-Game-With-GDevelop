
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
        package org.allbinary.game.layer




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.animation.AnimationInterfaceFactoryInterface
import org.allbinary.animation.NullAnimationFactory
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
import org.allbinary.game.layout.GDObject
import org.allbinary.game.identification.Group
import org.allbinary.game.layer.special.GDConditionWithGroupActions
import org.allbinary.game.multiplayer.layer.RemoteInfo
import org.allbinary.game.physics.velocity.VelocityProperties
import org.allbinary.graphics.PointFactory
import org.allbinary.graphics.Rectangle
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.util.BasicArrayList
import org.allbinary.view.ViewPosition

open public class GDGameLayerFactory
            : Object
         {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    val behaviorList: BasicArrayList

    val groupInterface: Array<Group?>

    val animationInterfaceFactoryInterfaceArray: Array<AnimationInterfaceFactoryInterface?>

    val proceduralAnimationInterfaceFactoryInterfaceArray: Array<ProceduralAnimationInterfaceFactoryInterface?>

    val layerInfo: Rectangle

    val rectangleArrayOfArrays: Array<Array<Rectangle?>?>

    val animationBehaviorFactory: GDAnimationBehaviorBaseFactory

    val gameLayerList: BasicArrayList

    val gameLayerDestroyedList: BasicArrayList

    val resetAnimationBehavior: Boolean
public constructor (gameLayerList: BasicArrayList, gameLayerDestroyedList: BasicArrayList, groupInterface: Array<Group?>, behaviorList: BasicArrayList, animationInterfaceFactoryInterfaceArray: Array<AnimationInterfaceFactoryInterface?>, proceduralAnimationInterfaceFactoryInterfaceArray: Array<ProceduralAnimationInterfaceFactoryInterface?>, layerInfo: Rectangle, rectangleArrayOfArrays: Array<Array<Rectangle?>?>, resetAnimationBehavior: Boolean)                        

                            : this(gameLayerList, gameLayerDestroyedList, groupInterface, behaviorList, animationInterfaceFactoryInterfaceArray, proceduralAnimationInterfaceFactoryInterfaceArray, layerInfo, rectangleArrayOfArrays, GDRotationBehaviorFactory.getInstance(), resetAnimationBehavior){
    //var gameLayerList = gameLayerList
    //var gameLayerDestroyedList = gameLayerDestroyedList
    //var groupInterface = groupInterface
    //var behaviorList = behaviorList
    //var animationInterfaceFactoryInterfaceArray = animationInterfaceFactoryInterfaceArray
    //var proceduralAnimationInterfaceFactoryInterfaceArray = proceduralAnimationInterfaceFactoryInterfaceArray
    //var layerInfo = layerInfo
    //var rectangleArrayOfArrays = rectangleArrayOfArrays
    //var resetAnimationBehavior = resetAnimationBehavior


                            //For kotlin this is before the body of the constructor.
                    
}

public constructor (gameLayerList: BasicArrayList, gameLayerDestroyedList: BasicArrayList, groupInterface: Array<Group?>, behaviorList: BasicArrayList, animationInterfaceFactoryInterfaceArray: Array<AnimationInterfaceFactoryInterface?>, proceduralAnimationInterfaceFactoryInterfaceArray: Array<ProceduralAnimationInterfaceFactoryInterface?>, layerInfo: Rectangle, rectangleArrayOfArrays: Array<Array<Rectangle?>?>, animationBehaviorFactory: GDAnimationBehaviorBaseFactory, resetAnimationBehavior: Boolean)
            : super()
        {
    //var gameLayerList = gameLayerList
    //var gameLayerDestroyedList = gameLayerDestroyedList
    //var groupInterface = groupInterface
    //var behaviorList = behaviorList
    //var animationInterfaceFactoryInterfaceArray = animationInterfaceFactoryInterfaceArray
    //var proceduralAnimationInterfaceFactoryInterfaceArray = proceduralAnimationInterfaceFactoryInterfaceArray
    //var layerInfo = layerInfo
    //var rectangleArrayOfArrays = rectangleArrayOfArrays
    //var animationBehaviorFactory = animationBehaviorFactory
    //var resetAnimationBehavior = resetAnimationBehavior
this.groupInterface= groupInterface
this.behaviorList= behaviorList
this.animationInterfaceFactoryInterfaceArray= animationInterfaceFactoryInterfaceArray
this.proceduralAnimationInterfaceFactoryInterfaceArray= proceduralAnimationInterfaceFactoryInterfaceArray
this.layerInfo= layerInfo
this.rectangleArrayOfArrays= rectangleArrayOfArrays
this.animationBehaviorFactory= animationBehaviorFactory
this.gameLayerList= gameLayerList
this.gameLayerDestroyedList= gameLayerDestroyedList
this.resetAnimationBehavior= resetAnimationBehavior
}


                @Throws(Exception::class)
            
    open fun create(layoutIndex: Int, name: String, gdObject: GDObject, scaleX: Float, scaleY: Float, collidableBehavior: GDConditionWithGroupActions)
        //nullable = true from not(false or (false and false)) = true
: GDGameLayer{
    //var layoutIndex = layoutIndex
    //var name = name
    //var gdObject = gdObject
    //var scaleX = scaleX
    //var scaleY = scaleY
    //var collidableBehavior = collidableBehavior

    
                        if(!name.startsWith(gdObject!!.name))
                        
                                    {
                                    this.logUtil!!.put(StringMaker().
                            append(name)!!.append(" GDObject name: ")!!.append(gdObject!!.name)!!.append(" animationInterfaceFactoryInterfaceArray size: ")!!.appendint(this.animationInterfaceFactoryInterfaceArray!!.size)!!.append(" animationInterfaceFactoryInterfaceArray[0]: ")!!.append(if(this.animationInterfaceFactoryInterfaceArray!!.size > 0) {
                            
                            this.animationInterfaceFactoryInterfaceArray[0]!!.toString()
                        
                            } else {
                            
                                        //Otherwise - expression - elseExpr - StringLiteralExpr

                            }
    )!!.toString(), this, "create", Exception())

                                    }
                                

    var rectangle: Rectangle = Rectangle(PointFactory.getInstance()!!.ZERO_ZERO, (this.layerInfo!!.getWidth() *scaleX).toInt(), (this.layerInfo!!.getHeight() *scaleY).toInt())

gdObject!!.updateScale(scaleX, scaleY)

    var gameLayer: GDGameLayer = GDGameLayer(NullAnimationFactory.getFactoryInstance()!!.getInstance(0), this.gameLayerList, this.gameLayerDestroyedList, this.behaviorList, VelocityProperties(9600, 9600), RemoteInfo.REMOTE_INFO, this.groupInterface, name, this.animationInterfaceFactoryInterfaceArray, this.proceduralAnimationInterfaceFactoryInterfaceArray, rectangle, this.rectangleArrayOfArrays, ViewPosition.getInstanceD(), gdObject, this.animationBehaviorFactory!!.create(), this.resetAnimationBehavior)




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return gameLayer
}


}
                
            

