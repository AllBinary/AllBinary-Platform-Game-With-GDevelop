
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

//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDConditionWithGroupActions
            extends Object
         {
        

    public readonly groupWithActionsList: BasicArrayList = new BasicArrayListD();

    public readonly actionForGroupsList: BasicArrayList = new BasicArrayListD();

public constructor (){

            super();
        }


    public append(stringBuilder: StringMaker){
stringBuilder!.append("GDConditionWithGroupActions: ");
    

    var size: number = this.groupWithActionsList!.size()!;;
    
stringBuilder!.appendint(size);
    
stringBuilder!.append(CommonSeps.getInstance()!.SPACE);
    




                        for (
    var index: number = 0;index < size; index++)
        {
stringBuilder!.append(this.groupWithActionsList!.get(index)!.toString());
    
}

}


}



