
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2025 AllBinary 
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
        package org.allbinary.game.layer




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.graphics.GPoint

interface SoftJoystickInterface {
        

    open fun setId(id: Int)
        //nullable = true from not(false or (false and false)) = true


    open fun getId()
        //nullable = true from not(false or (false and true)) = true
: Int

    open fun setPoint(point: GPoint)
        //nullable = true from not(false or (false and false)) = true


    open fun getPoint()
        //nullable = true from not(false or (false and true)) = true
: GPoint

    open fun setStickForceX(stickForceX: Float)
        //nullable = true from not(false or (false and false)) = true


    open fun setStickForceY(stickForceY: Float)
        //nullable = true from not(false or (false and false)) = true


    open fun StickForceX()
        //nullable = true from not(false or (false and true)) = true
: Float

    open fun StickForceY()
        //nullable = true from not(false or (false and true)) = true
: Float

}
                
            

