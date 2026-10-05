
        /* Generated Code Do Not Modify */
        package org.allbinary.animation.image




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.animation.resource.BaseResourceAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.graphics.opengles.OpenGLFeatureFactory
import org.allbinary.graphics.threed.min3d.Min3dSceneResourcesFactory
import org.allbinary.image.opengles.OpenGLImageCacheFactory
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvas
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
import org.allbinary.logic.StdUtil

open public class GDGameOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory : BaseResourceAnimationInterfaceFactoryInterfaceFactory {
        
public constructor ()                        

                            : super("GDGame OpenGL ImageArray Animations", StdUtil.getInstance()!!.createHashtable(), StdUtil.getInstance()!!.createHashtable(), StdUtil.getInstance()!!.createHashtable()){


                            //For kotlin this is before the body of the constructor.
                    
}


    private val portion: Int = 120

    private var index: Int = 1

                @Throws(Exception::class)
            
    open fun loadDayTrack(loadingString: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var loadingString = loadingString

    var progressCanvas: ProgressCanvas = ProgressCanvasFactory.getInstance()!!


    var min3dSceneResourcesFactory: Min3dSceneResourcesFactory = Min3dSceneResourcesFactory.getInstance()!!

}


    private var isInitialized: BooleanArray = BooleanArray(11)

                @Throws(Exception::class)
            
    override fun init(level: Int)
        //nullable = true from not(false or (false and false)) = true
{
var level = level
super.initImageCache(OpenGLImageCacheFactory.getInstance(), level)

    var loadingString: String = this.toString() +" Loading: "

this.index= 1
}


    override fun isFeature()
        //nullable = true from not(false or (false and true)) = true
: Boolean{

    var features: Features = Features.getInstance()!!


    var graphicsFeatureFactory: GraphicsFeatureFactory = GraphicsFeatureFactory.getInstance()!!


    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!!


    
                        if(features.isFeature(graphicsFeatureFactory!!.IMAGE_GRAPHICS) && features.isFeature(graphicsFeatureFactory!!.IMAGE_TO_ARRAY_GRAPHICS) && features.isDefault(openGLFeatureFactory!!.OPENGL) && (features.isFeature(openGLFeatureFactory!!.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory!!.OPENGL_3D)))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                        }
                            
}


}
                
            

