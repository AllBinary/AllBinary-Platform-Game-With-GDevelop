
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

        


            import { Object } from '../../../../../java/lang/Object.js';
        
//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
type StringMaker<T = any, U = any> = typeof StringMaker extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringMaker;

//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;
type CommonSeps<T = any, U = any> = typeof CommonSeps extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonSeps;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDConditionWithGroupActions
            extends Object
         {
        

    public static readonly NULL_GD_CONDITION_WITH_GROUP_ACTIONS: GDConditionWithGroupActions = new GDConditionWithGroupActions();

    public readonly groupWithActionsList: BasicArrayList = new BasicArrayListD();

    public readonly actionForGroupsList: BasicArrayList = new BasicArrayListD();

public constructor (){

            super();
        }


    public append(stringBuilder: StringMaker){
stringBuilder!.append("GDConditionWithGroupActions: ");
    

    let size: number = this.groupWithActionsList!.size()!;;
    
stringBuilder!.appendint(size);
    
stringBuilder!.append(CommonSeps.getInstance()!.SPACE);
    




                        for (
    let index: number = 0;index < size; index++)
        {
stringBuilder!.append(this.groupWithActionsList!.get(index)!.toString());
    
}

}


}

