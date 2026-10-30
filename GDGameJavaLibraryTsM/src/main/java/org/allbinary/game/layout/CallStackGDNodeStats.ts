
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
type CommonStrings<T = any, U = any> = typeof CommonStrings extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonStrings;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;
type StringMaker<T = any, U = any> = typeof StringMaker extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringMaker;

//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;
type CommonSeps<T = any, U = any> = typeof CommonSeps extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonSeps;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class CallStackGDNodeStats
            extends Object
         {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly SIZE: number = 16;

    private readonly callStack: number[][] = new Array(this.SIZE).fill(null).map(() => new Array(6000).fill(null));

    private total: number = 0;

    public reset(){




                        for (
    let index2: number = 0;index2 < this.SIZE; index2++)
        {




                        for (
    let index: number = 0;index < this.total; index++)
        {
this.callStack[index2]![index]= 0;
    
}

}

this.total= 0;
    
}


    public push(index: number, name: number){
this.callStack[index]![this.total++]= name;
    
}


    public log(stringBuilder: StringMaker, anyType: any){

    let commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    

    let commonSeps: CommonSeps = CommonSeps.getInstance()!;;
    
stringBuilder!.delete(0, stringBuilder!.length());
    




                        for (
    let index2: number = 0;index2 < this.total; index2++)
        {




                        for (
    let index: number = 0;index < this.SIZE; index++)
        {

                        if(this.callStack[index]![index2] != 0)
                        
                                    {
                                    stringBuilder!.appendint(index2);
    
stringBuilder!.append(commonSeps!.COLON);
    
stringBuilder!.appendint(index);
    
stringBuilder!.append(commonSeps!.COLON);
    
stringBuilder!.appendint(this.callStack[index]![index2]!);
    
stringBuilder!.append(commonSeps!.SEMICOLON);
    

                        if(stringBuilder!.length() > 256)
                        
                                    {
                                    this.logUtil!.putF(stringBuilder!.toString(), anyType, commonStrings!.PROCESS);
    
stringBuilder!.delete(0, stringBuilder!.length());
    

                                    }
                                

                                    }
                                
}

}


                        if(stringBuilder!.length() > 0)
                        
                                    {
                                    this.logUtil!.putF(stringBuilder!.toString(), anyType, commonStrings!.PROCESS);
    

                                    }
                                
}


}

