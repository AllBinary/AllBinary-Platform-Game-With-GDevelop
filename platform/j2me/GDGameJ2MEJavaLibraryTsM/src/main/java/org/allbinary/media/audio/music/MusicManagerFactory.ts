
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
        
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { MusicManager } from './MusicManager.js';
//not GWT import - same folder const MusicManager
import { MusicService } from './MusicService.js';
//not GWT import - same folder const MusicService

export class MusicManagerFactory
            extends Object
         {
        

    public static createMusicManager(list: BasicArrayList): MusicManager{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new MusicManager(MusicServicelist);
    
}


}

