
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

        


            import { Object } from '../../../../java/lang/Object.js';
        
//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
type StringMaker<T = any, U = any> = typeof StringMaker extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringMaker;

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
type CommonStrings<T = any, U = any> = typeof CommonStrings extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonStrings;

//not plain js import { NullRunnable } 
const NullRunnable = globalThis.org.allbinary.thread.NullRunnable;
type NullRunnable<T = any, U = any> = typeof NullRunnable extends abstract new (...args: any[]) => infer Instance ? Instance : typeof NullRunnable;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDNode } from './GDNode.js';
//not GWT import - same folder const GDNode

export class GDNodes
            extends Object
         {
        

    public readonly runnableList: BasicArrayList = new BasicArrayListD();

    public process(){

    let gdNode: GDNode;;
    

    let size2: number = this.runnableList!.size()!;;
    




                        for (
    let index: number = 0;index < size2; index++)
        {
gdNode= this.runnableList!.get(index) as GDNode;
    
gdNode!.currentRunnable!.run();
    
}

}


    public clear(){

    let gdNode: GDNode;;
    

    let size2: number = this.runnableList!.size()!;;
    




                        for (
    let index: number = 0;index < size2; index++)
        {
gdNode= this.runnableList!.get(index) as GDNode;
    
gdNode!.currentRunnable= NullRunnable.getInstance();
    
}

}


}

