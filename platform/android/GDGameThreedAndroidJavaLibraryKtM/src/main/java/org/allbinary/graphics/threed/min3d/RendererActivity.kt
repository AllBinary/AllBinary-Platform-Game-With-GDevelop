
        /* Generated Code Do Not Modify */
        package org.allbinary.graphics.threed.min3d




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import android.app.Activity
import android.opengl.GLSurfaceView
import android.os.Bundle
import min3d.core.SceneController
import org.allbinary.AndroidResources
import org.allbinary.string.CommonStateStrings
import org.allbinary.data.resource.ResourceUtil
import org.allbinary.device.OpenGLESGraphicsCompositeFactory
import org.allbinary.graphics.displayable.DisplayInfoSingleton
import org.allbinary.game.configuration.feature.Features
import org.allbinary.graphics.opengles.OpenGLFeatureFactory
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.view.OptimizedGLSurfaceView
import org.microemu.opengles.device.PlatformOpenGLESGraphicsFactory

open public class RendererActivity : Activity {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val androidResources: AndroidResources = AndroidResources.getInstance()!!

    var _glSurfaceView: OptimizedGLSurfaceView

    private var _renderContinuously: Boolean= false

    var sceneController: SceneController

    override fun onCreate(savedInstanceState: Bundle?)
        //nullable = true from not(false or (false and false)) = true
{
var savedInstanceState = savedInstanceState

        try {
            super.onCreate(savedInstanceState)
ResourceUtil.getInstance()!!.setContextFromActivity(this)
ResourceUtil.getInstance()!!.setResources(this.getResources())

    var features: Features = Features.getInstance()!!


    var openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()!!

features.addDefault(openGLFeatureFactory!!.OPENGL_3D)
OpenGLESGraphicsCompositeFactory.getInstance()!!.set(PlatformOpenGLESGraphicsFactory())
this.setContentView(this.androidResources!!.layout.gd_min3d_layout)
this._glSurfaceView= this.findViewById(this.androidResources!!.id.gd_gl) as OptimizedGLSurfaceView

    var displayInfo: DisplayInfoSingleton = DisplayInfoSingleton.getInstance()!!

displayInfo!!.setLastSize(this._glSurfaceView.getWidth(), this._glSurfaceView.getHeight(), CommonStateStrings.getInstance()!!.CREATE)
this.setContentView(this._glSurfaceView)
} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, CommonStateStrings.getInstance()!!.CREATE, e)
}

}


    override fun onResume()
        //nullable = true from not(false or (false and true)) = true
{
super.onResume()
this._glSurfaceView.onResume()
}


    override fun onPause()
        //nullable = true from not(false or (false and true)) = true
{
super.onPause()
this._glSurfaceView.onPause()
}


    open fun renderContinuously($b: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
var $b = $b
this._renderContinuously= $b

    
                        if(this._renderContinuously)
                        this._glSurfaceView.setRenderMode(GLSurfaceView.RENDERMODE_CONTINUOUSLY)
                             else 
    
                        if()
                        
}


}
                
            

