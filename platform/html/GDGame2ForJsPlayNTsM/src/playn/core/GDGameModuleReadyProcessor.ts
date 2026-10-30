
        /*
                *  
                *  To change this template, choose Tools | Templates  and open the template in the editor.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../java/lang/Exception.js';
        
import { Processor } from '../../org/allbinary/canvas/Processor.js';
//not GWT import const Processor

import { InitInterface } from '../../org/allbinary/init/InitInterface.js';
//not GWT import const InitInterface

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

import { AllBinaryPlayNGame } from '../../org/allbinary/playn/AllBinaryPlayNGame.js';
//not GWT import const AllBinaryPlayNGame

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
type CommonStrings<T = any, U = any> = typeof CommonStrings extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonStrings;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameModuleReadyProcessor extends Processor {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    readonly commonStrings: CommonStrings = CommonStrings.getInstance()!;

    private readonly initInterface: InitInterface;

    private readonly list: BasicArrayList;

public constructor (initInterface: InitInterface, list: BasicArrayList){

            super();
        this.logUtil!.putF(this.toString() +":GDGameModuleReadyProcessor", this, this.commonStrings!.CONSTRUCTOR);
    
this.initInterface= initInterface;
    
this.list= list;
    
}


                //@Throws(Exception.constructor)
            
    public process(){
this.logUtil!.putF(this.commonStrings!.START +":GDGameModuleReadyProcessor", this, this.commonStrings!.PROCESS);
    

                        if(this.isGDGameReady() && this.isTouchButtonShieldActionResourceReady() && this.isAllBinaryMidletReady())
                        
                                    {
                                    this.logUtil!.putF(this.commonStrings!.END +this.list.size(), this, this.commonStrings!.PROCESS);
    

                        if(!this.list.remove(this))
                        
                                    {
                                    this.logUtil!.putF(this.commonStrings!.EXCEPTION +":GDGameModuleReadyProcessor", this, this.commonStrings!.PROCESS);
    

                                    }
                                
this.initInterface!.init();
    
initInterface = this.initInterfaceinitInterface as AllBinaryPlayNGame
initInterface.
                    setLoadGameRunnableProcessor(Processor.getInstance());
    

                                    }
                                
}


    isGDGameReady(): boolean;
                //native - START
                {
                    
                }



                //native - END
                

    isTouchButtonShieldActionResourceReady(): boolean;
                //native - START
                {
                    
                }



                //native - END
                

    isAllBinaryMidletReady(): boolean;
                //native - START
                {
                    
                }



                //native - END
                

}

