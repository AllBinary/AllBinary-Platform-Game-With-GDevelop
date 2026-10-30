
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
        
            import { Integer } from '../../../../java/lang/Integer.js';
        
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDNode } from './GDNode.js';
//not GWT import - same folder const GDNode
import { GDNodes } from './GDNodes.js';
//not GWT import - same folder const GDNodes

export class GDNodeUtil
            extends Object
         {
        

    private static readonly instance: GDNodeUtil = new GDNodeUtil();

    public static getInstance(): GDNodeUtil{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDNodeUtil.instance;
    
}


    public readonly NULL_GDNODE: GDNode = new GDNode(Integer.MIN_VALUE);

    public readonly gdNodesList: BasicArrayList = new BasicArrayListD();

    public getOrCreateInstance(index: number): GDNodes{

        while(index > this.gdNodesList!.size() -1)
        {
this.gdNodesList!.add(new GDNodes());
    
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gdNodesList!.get(index) as GDNodes;
    
}


}

