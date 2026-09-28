
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
        
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class CallCountGDNodeStats
            extends Object
         {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly TOTAL_CALLS: string = "total calls: ";

    private readonly SIZE: number = 16;

    private readonly totalCalls: number[][] = new Array(this.SIZE).fill(null).map(() => new Array(15000).fill(null));

    public reset(){




                        for (
    var index2: number = 0;index2 < this.SIZE; index2++)
        {




                        for (
    var index: number = 0;index < 15000; index++)
        {
this.totalCalls[index2]![index]= 0;
    
}

}

}


    public push(index: number, name: number){
this.totalCalls[index]![name]++;
    
}


    public log(stringBuilder: StringMaker){

    var commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    

    var commonSeps: CommonSeps = CommonSeps.getInstance()!;;
    
stringBuilder!.delete(0, stringBuilder!.length());
    
stringBuilder!.append(this.TOTAL_CALLS);
    




                        for (
    var index: number = 0;index < this.SIZE; index++)
        {




                        for (
    var index2: number = 0;index2 < 15000; index2++)
        {

                        if(this.totalCalls[index]![index2] > 20)
                        
                                    {
                                    stringBuilder!.appendint(index);
    
stringBuilder!.append(commonSeps!.COLON);
    
stringBuilder!.appendint(index2);
    
stringBuilder!.append(commonSeps!.COLON);
    
stringBuilder!.appendlong(this.totalCalls[index]![index2]!);
    

                                    }
                                
}

}

stringBuilder!.append(commonSeps!.NEW_LINE);
    

                        if(stringBuilder!.length() > this.TOTAL_CALLS.length +1)
                        
                                    {
                                    this.logUtil!.putF(stringBuilder!.toString(), this, commonStrings!.PROCESS);
    

                                    }
                                
}


}



