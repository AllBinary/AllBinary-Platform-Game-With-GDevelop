
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

        


import { Graphics } from '../../../../../javax/microedition/lcdui/Graphics.js';
//not GWT import const Graphics

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDBehavior } from './GDBehavior.js';
//not GWT import - same folder const GDBehavior

export class DraggableBehavior extends GDBehavior {
        

    private static readonly instance: DraggableBehavior = new DraggableBehavior();

    public static getInstance(): DraggableBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return DraggableBehavior.instance;
    
}


private constructor (){

            super();
        }


    public process(gameLayerList: BasicArrayList, index: number, graphics: Graphics): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


}



