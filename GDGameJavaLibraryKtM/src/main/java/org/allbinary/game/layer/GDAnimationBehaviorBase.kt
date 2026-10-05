
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
        package org.allbinary.game.layer




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.animation.AnimationInterfaceFactoryInterface
import org.allbinary.animation.IndexedAnimation
import org.allbinary.game.layout.GDObject
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.communication.log.LogUtil

open public class GDAnimationBehaviorBase
            : Object
         {
        
companion object {
            
    private val instance: GDAnimationBehaviorBase = GDAnimationBehaviorBase()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDAnimationBehaviorBase{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDAnimationBehaviorBase.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    open fun init(gdObject: GDObject, animationInterfaceFactoryInterfaceArray: Array<AnimationInterfaceFactoryInterface?>)
        //nullable = true from not(false or (false and false)) = true
: Array<IndexedAnimation?>{
    //var gdObject = gdObject
    //var animationInterfaceFactoryInterfaceArray = animationInterfaceFactoryInterfaceArray

    var size: Int = animationInterfaceFactoryInterfaceArray!!.size
                


    var initIndexedAnimationInterfaceArray: Array<IndexedAnimation?> = arrayOfNulls(size)





                        for (index in 0 until size)

        {

        try {
            initIndexedAnimationInterfaceArray[index]= animationInterfaceFactoryInterfaceArray[index]!!.getInstance(gdObject!!.hashCode()) as IndexedAnimation
} catch(e: Exception)
            {

    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

this.logUtil!!.put(StringMaker().
                            append(animationInterfaceFactoryInterfaceArray[index]!!.toString())!!.append(" index: ")!!.appendint(index)!!.toString(), this, commonStrings!!.CONSTRUCTOR, e)
this.logUtil!!.put(gdObject!!.toString(), this, commonStrings!!.CONSTRUCTOR, e)
}

}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return initIndexedAnimationInterfaceArray
}


    open fun setAnimationArray(rotationAnimationInterfaceArray: Array<IndexedAnimation?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var rotationAnimationInterfaceArray = rotationAnimationInterfaceArray
}


    open fun add(gameLayer: GDGameLayer)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameLayer = gameLayer
}


                @Throws(Exception::class)
            
    open fun set(gameLayer: GDGameLayer, gdObject: GDObject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameLayer = gameLayer
    //var gdObject = gdObject
}


    open fun setRotation(gameLayer: GDGameLayer, angleAdjustment: Short)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameLayer = gameLayer
    //var angleAdjustment = angleAdjustment
}


    open fun animate(gdObject: GDObject, initIndexedAnimationInterfaceArray: Array<IndexedAnimation?>, timeDelta: Long)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdObject = gdObject
    //var initIndexedAnimationInterfaceArray = initIndexedAnimationInterfaceArray
    //var timeDelta = timeDelta
}


    open fun toString(gdObject: GDObject, stringBuffer: StringMaker)
        //nullable = true from not(false or (true and false)) = true
{
    //var gdObject = gdObject
    //var stringBuffer = stringBuffer
}


}
                
            

