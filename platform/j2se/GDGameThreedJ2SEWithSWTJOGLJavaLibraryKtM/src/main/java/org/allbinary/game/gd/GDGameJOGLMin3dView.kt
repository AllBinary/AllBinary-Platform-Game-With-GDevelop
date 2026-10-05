
        /* Generated Code Do Not Modify */
        package org.allbinary.game.gd




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import min3d.core.Renderer
import min3d.core.SceneController
import org.allbinary.game.GDGameAllBinarySceneControllerFactory
import org.allbinary.graphics.opengles.OpenGLThreadUtil
import org.allbinary.j2se.view.AllBinaryMidletMin3dSurfaceView
import org.allbinary.view.OptimizedGLSurfaceView

open public class GDGameJOGLMin3dView : AllBinaryMidletMin3dSurfaceView {
        
public constructor (){

    var sceneController: SceneController = GDGameAllBinarySceneControllerFactory.getInstance()!!

this.setRenderer(sceneController!!.getRenderer() as Renderer)
this.setRenderMode(OptimizedGLSurfaceView.RENDERMODE_CONTINUOUSLY)
OpenGLThreadUtil.getInstance()!!.set(this)
}


}
                
            

