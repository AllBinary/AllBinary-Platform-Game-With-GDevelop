
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
        package org.allbinary.game.layer.behavior




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Graphics
import org.allbinary.util.BasicArrayList

open public class DraggableBehavior : GDBehavior {
        
companion object {
            
    private val instance: DraggableBehavior = DraggableBehavior()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: DraggableBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return DraggableBehavior.instance
}


        }
            private constructor (){
}


    override fun process(gameLayerList: BasicArrayList, index: Int, graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var gameLayerList = gameLayerList
    //var index = index
    //var graphics = graphics



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


}
                
            

