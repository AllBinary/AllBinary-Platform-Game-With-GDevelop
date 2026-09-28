
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

        


            import { Object } from '../../../../../java/lang/Object.js';
        
            import { RuntimeException } from '../../../../../java/lang/RuntimeException.js';
        
















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { DraggableBehavior } from './DraggableBehavior.js';
//not GWT import - same folder const DraggableBehavior
import { PathFindingBehavior } from './PathFindingBehavior.js';
//not GWT import - same folder const PathFindingBehavior
import { GDBehavior } from './GDBehavior.js';
//not GWT import - same folder const GDBehavior

export class GDBehaviorUtil
            extends Object
         {
        

    static readonly instance: GDBehaviorUtil = new GDBehaviorUtil();

    public static getInstance(): GDBehaviorUtil{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDBehaviorUtil.instance;
    
}


    public readonly PATHFINDING_BEHAVIOR_INDEX: number = 0;

    public readonly DRAGGABLE_BEHAVIOR_INDEX: number = 1;

    public readonly MAX: number = this.DRAGGABLE_BEHAVIOR_INDEX +1;

    public getInstance(index: number): GDBehavior{

                        if(index == this.PATHFINDING_BEHAVIOR_INDEX)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return PathFindingBehavior.getInstance();;
    

                                    }
                                
                             else 
                        if(index == this.DRAGGABLE_BEHAVIOR_INDEX)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return DraggableBehavior.getInstance();;
    

                                    }
                                
                        else {
                            


                            throw new RuntimeException();
                    

                        }
                            
}


}



