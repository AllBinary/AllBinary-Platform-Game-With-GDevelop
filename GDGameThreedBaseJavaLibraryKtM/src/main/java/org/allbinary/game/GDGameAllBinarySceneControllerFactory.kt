
        /* Generated Code Do Not Modify */
        package org.allbinary.game




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.graphics.threed.min3d.AllBinarySceneController
import org.allbinary.graphics.threed.min3d.GDGameSceneController
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.PreLogUtil

open public class GDGameAllBinarySceneControllerFactory
            : Object
         {
        
companion object {
            
    private val instance: AllBinarySceneController = GDGameSceneController()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: AllBinarySceneController{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameAllBinarySceneControllerFactory.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
}
                
            

