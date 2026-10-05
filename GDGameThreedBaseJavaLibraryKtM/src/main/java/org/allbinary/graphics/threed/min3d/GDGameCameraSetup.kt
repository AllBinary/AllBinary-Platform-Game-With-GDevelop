
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
        package org.allbinary.graphics.threed.min3d




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import min3d.vos.Camera
import min3d.vos.CameraSetup
import org.allbinary.game.layer.CameraLayer
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton

open public class GDGameCameraSetup : CameraSetup {
        
companion object {
            
    var NONE: String = "none"

    var SIMPLE: String = "simple"

    var FOLLOW: String = "follow"

        }
            
    val type: String
protected constructor (type: String){
    //var type = type
this.type= type
}


    open fun processTarget(cameraLayer: CameraLayer, camera: Camera)
        //nullable = true from not(false or (false and false)) = true
{
    //var cameraLayer = cameraLayer
    //var camera = camera
}


    open fun SceneWindowWidth()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GameTickDisplayInfoSingleton.getInstance()!!.getLastWidth()
}


    open fun SceneWindowHeight()
        //nullable = true from not(false or (false and true)) = true
: Int{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GameTickDisplayInfoSingleton.getInstance()!!.getLastHeight()
}


}
                
            

