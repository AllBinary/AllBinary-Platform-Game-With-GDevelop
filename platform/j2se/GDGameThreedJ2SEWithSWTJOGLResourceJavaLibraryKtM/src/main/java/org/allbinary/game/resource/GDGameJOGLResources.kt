
        /* Generated Code Do Not Modify */
        package org.allbinary.game.resource




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory

open public class GDGameJOGLResources : GDGameBaseJOGLResources {
        
companion object {
            
    private val STATIC: GDGameJOGLResources = GDGameJOGLResources()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDGameJOGLResources{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return STATIC
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    var initialized: Boolean= false

                @Throws(Exception::class)
            
    open fun initImages(RESOURCES: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var RESOURCES = RESOURCES

    
                        if(Features.getInstance()!!.isFeature(GraphicsFeatureFactory.getInstance()!!.IMAGE_TO_ARRAY_GRAPHICS))
                        
                                    {
                                    
                                    }
                                
                        else {
                            


                            throw Exception("GDGame Resource Error")

                        }
                            
}


}
                
            

