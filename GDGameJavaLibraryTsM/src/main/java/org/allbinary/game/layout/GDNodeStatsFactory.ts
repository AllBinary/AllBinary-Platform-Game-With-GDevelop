
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

        


//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { BaseGDNodeStats } from './BaseGDNodeStats.js';
//not GWT import - same folder const BaseGDNodeStats
import { CallCountGDNodeStats } from './CallCountGDNodeStats.js';
//not GWT import - same folder const CallCountGDNodeStats
import { CallStackGDNodeStats } from './CallStackGDNodeStats.js';
//not GWT import - same folder const CallStackGDNodeStats

export class GDNodeStatsFactory extends BaseGDNodeStats {
        

    private static readonly instance: BaseGDNodeStats = new BaseGDNodeStats();

    public static getInstance(): BaseGDNodeStats{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDNodeStatsFactory.instance;
    
}


    private readonly callCountGDNodeStats: CallCountGDNodeStats = new CallCountGDNodeStats();

    private readonly callStackGDNodeStats: CallStackGDNodeStats = new CallStackGDNodeStats();

    public reset(){
this.callCountGDNodeStats!.reset();
    
this.callStackGDNodeStats!.reset();
    
}


    public push(index: number, name: number){
this.callCountGDNodeStats!.push(index, name);
    
this.callStackGDNodeStats!.push(index, name);
    
}


    public log(stringBuilder: StringMaker, anyType: any = {}){
this.callCountGDNodeStats!.log(stringBuilder);
    
this.callStackGDNodeStats!.log(stringBuilder, anyType);
    
}


}



