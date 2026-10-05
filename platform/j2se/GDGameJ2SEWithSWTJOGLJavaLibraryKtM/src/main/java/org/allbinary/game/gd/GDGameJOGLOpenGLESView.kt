
        /* Generated Code Do Not Modify */
        package org.allbinary.game.gd




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.graphics.opengles.OpenGLThreadUtil
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.view.AllBinaryMidletOpenGLSurfaceView
import org.allbinary.logic.communication.log.PreLogUtil
import org.allbinary.view.OptimizedGLSurfaceView

open public class GDGameJOGLOpenGLESView : AllBinaryMidletOpenGLSurfaceView {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val TAG: String = "MiniSpaceWarJOGLOpenGLESView"
public constructor (){
PreLogUtil.put(this.commonStrings!!.START, this.TAG, this.commonStrings!!.CONSTRUCTOR)
this.setRenderMode(OptimizedGLSurfaceView.RENDERMODE_CONTINUOUSLY)
OpenGLThreadUtil.getInstance()!!.set(this)
}


}
                
            

