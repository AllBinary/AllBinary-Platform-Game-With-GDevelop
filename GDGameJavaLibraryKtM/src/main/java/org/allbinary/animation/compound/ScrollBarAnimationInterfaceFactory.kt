
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
        package org.allbinary.animation.compound




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.animation.Animation
import org.allbinary.animation.AnimationBehaviorFactory
import org.allbinary.animation.AnimationInterfaceFactoryInterface
import org.allbinary.animation.IndexedAnimation
import org.allbinary.media.ScaleProperties

open public class ScrollBarAnimationInterfaceFactory : CompoundAnimationInterfaceFactory {
        

    private var width: Int

    private var height: Int

    var scaleProperties: ScaleProperties = ScaleProperties.instance
public constructor (basicAnimationInterfaceFactoryInterfaceArray: Array<AnimationInterfaceFactoryInterface?>, width: Int, height: Int)                        

                            : this(basicAnimationInterfaceFactoryInterfaceArray, width, height, AnimationBehaviorFactory.getInstance()){
    //var basicAnimationInterfaceFactoryInterfaceArray = basicAnimationInterfaceFactoryInterfaceArray
    //var width = width
    //var height = height


                            //For kotlin this is before the body of the constructor.
                    
}

public constructor (basicAnimationInterfaceFactoryInterfaceArray: Array<AnimationInterfaceFactoryInterface?>, width: Int, height: Int, animationBehaviorFactory: AnimationBehaviorFactory)                        

                            : super(basicAnimationInterfaceFactoryInterfaceArray, animationBehaviorFactory){
    //var basicAnimationInterfaceFactoryInterfaceArray = basicAnimationInterfaceFactoryInterfaceArray
    //var width = width
    //var height = height
    //var animationBehaviorFactory = animationBehaviorFactory


                            //For kotlin this is before the body of the constructor.
                    
this.width= width
this.height= height
}


    override fun createArray(size: Int)
        //nullable = true from not(false or (false and false)) = true
: Array<Animation?>{
    //var size = size



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return arrayOfNulls(size)
}


    override fun createAnimation(animationInterfaceArray: Array<Animation?>)
        //nullable = true from not(false or (false and false)) = true
: Animation{
    //var animationInterfaceArray = animationInterfaceArray



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ScrollBarAnimation(animationInterfaceArray as Array<IndexedAnimation?>, this.scaleProperties!!.scaleWidth, this.scaleProperties!!.scaleHeight, this.animationBehaviorFactory!!.getOrCreateInstance())
}


    override fun setInitialScale(scaleProperties: ScaleProperties)
        //nullable = true from not(false or (false and false)) = true
{
    //var scaleProperties = scaleProperties
this.scaleProperties= scaleProperties
}


}
                
            

