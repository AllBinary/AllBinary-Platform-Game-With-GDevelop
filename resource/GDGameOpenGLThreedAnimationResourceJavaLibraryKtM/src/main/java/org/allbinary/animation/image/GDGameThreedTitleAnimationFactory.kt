
        /* Generated Code Do Not Modify */
        package org.allbinary.animation.image




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.animation.IndexedAnimation
import org.allbinary.animation.special.TitleAnimation
import org.allbinary.graphics.color.BasicColor
import org.allbinary.graphics.color.BasicColorFactory

open public class GDGameThreedTitleAnimationFactory
            : Object
         {
        
companion object {
            
    private val instance: GDGameThreedTitleAnimationFactory = GDGameThreedTitleAnimationFactory()

    open fun getIntance()
        //nullable = true from not(false or (false and true)) = true
: GDGameThreedTitleAnimationFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameThreedTitleAnimationFactory.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
                @Throws(Exception::class)
            
    open fun getInstance(animationInterfaceArray: Array<IndexedAnimation?>)
        //nullable =  from not(true or (false and false)) = 
: TitleAnimation{
var animationInterfaceArray = animationInterfaceArray

    var basicColorFactory: BasicColorFactory = BasicColorFactory.getInstance()!!


    var basicColorArray: Array<BasicColor?> = arrayOfNulls(3)

basicColorArray[0]= basicColorFactory!!.CLEAR_COLOR
basicColorArray[1]= basicColorFactory!!.CLEAR_COLOR
basicColorArray[2]= basicColorFactory!!.CLEAR_COLOR

    var deltaXArray: IntArray = IntArray(3)

deltaXArray[0]= 0
deltaXArray[1]= 52
deltaXArray[2]= 0

    var deltaYArray: IntArray = IntArray(3)

deltaYArray[0]= 0
deltaYArray[1]= 30
deltaYArray[2]= 37



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameThreedTitleAnimation(animationInterfaceArray, basicColorArray, deltaXArray, deltaYArray, 15, 120)
}


}
                
            

