
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2022 AllBinary 
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
        package org.allbinary.game.combat.destroy




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.layer.CollidableCompositeLayer
import org.allbinary.logic.communication.log.LogUtil

open public class GDDestroyableSimpleBehavior : DestroyableSimpleBehavior {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!
public constructor (ownerLayer: CollidableCompositeLayer)                        

                            : super(ownerLayer){
var ownerLayer = ownerLayer


                            //For kotlin this is before the body of the constructor.
                    
}


    override fun setDestroyed(destroyed: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
var destroyed = destroyed
super.setDestroyed(destroyed)
}


}
                
            

