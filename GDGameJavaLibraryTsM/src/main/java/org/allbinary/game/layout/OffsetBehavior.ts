
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

        


















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { BaseOffsetBehavior } from './BaseOffsetBehavior.js';
//not GWT import - same folder const BaseOffsetBehavior

export class OffsetBehavior extends BaseOffsetBehavior {
        

    public static getInstance(): OffsetBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return OffsetBehavior.instance;
    
}


    private static readonly instance: OffsetBehavior = new OffsetBehavior();

    public PointX(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


    public PointY(value: number): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return value;
    
}


}



