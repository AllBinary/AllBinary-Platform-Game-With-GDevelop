
        /* Generated Code Do Not Modify */
        package org.allbinary.business.advertisement




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.logic.string.StringUtil
import org.allbinary.direction.Direction
import org.allbinary.direction.DirectionFactory

open public class GDGameAdConfiguration : AdConfiguration {
        

    private val directionArray: Array<Direction?> = arrayOf(DirectionFactory.getInstance()!!.DOWN,DirectionFactory.getInstance()!!.UP)
public constructor ()                        

                            : super(arrayOf("AllBinary_GDGame_Threed_Android","",StringUtil.getInstance()!!.EMPTY_STRING)){


                            //For kotlin this is before the body of the constructor.
                    
}


    override fun getValidAdSpots()
        //nullable = true from not(false or (false and true)) = true
: Array<Direction?>{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return directionArray
}


    override fun processDemo(state: Int)
        //nullable = true from not(false or (false and false)) = true
{
var state = state
}


}
                
            

