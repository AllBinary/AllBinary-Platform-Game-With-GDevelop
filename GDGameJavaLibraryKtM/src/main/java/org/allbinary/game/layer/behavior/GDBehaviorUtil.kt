
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
        package org.allbinary.game.layer.behavior




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        

open public class GDBehaviorUtil
            : Object
         {
        
companion object {
            
    val instance: GDBehaviorUtil = GDBehaviorUtil()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDBehaviorUtil{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDBehaviorUtil.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val PATHFINDING_BEHAVIOR_INDEX: Int = 0

    val DRAGGABLE_BEHAVIOR_INDEX: Int = 1

    val MAX: Int = this.DRAGGABLE_BEHAVIOR_INDEX +1

    open fun getInstance(index: Int)
        //nullable =  from not(true or (false and false)) = 
: GDBehavior{
    //var index = index

    
                        if(index == this.PATHFINDING_BEHAVIOR_INDEX)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return PathFindingBehavior.getInstance()

                                    }
                                
                             else 
    
                        if(index == this.DRAGGABLE_BEHAVIOR_INDEX)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return DraggableBehavior.getInstance()

                                    }
                                
                        else {
                            


                            throw RuntimeException()

                        }
                            
}


}
                
            

