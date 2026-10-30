
        /*
                *  
                *  To change this template, choose Tools | Templates  and open the template in the editor.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../java/lang/Exception.js';
        
import { Processor } from '../../org/allbinary/canvas/Processor.js';
//not GWT import const Processor

import { Init } from '../../org/allbinary/init/Init.js';
//not GWT import const Init

import { InitInterface } from '../../org/allbinary/init/InitInterface.js';
//not GWT import const InitInterface

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;
type LogUtil<T = any, U = any> = typeof LogUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof LogUtil;

import { AllBinaryPlayNGame } from '../../org/allbinary/playn/AllBinaryPlayNGame.js';
//not GWT import const AllBinaryPlayNGame

import { GameHtmlHasLoadedResourcesProcessor } from '../../org/allbinary/playn/processors/GameHtmlHasLoadedResourcesProcessor.js';
//not GWT import const GameHtmlHasLoadedResourcesProcessor

import { GameHtmlLoadResourcesProcessor } from '../../org/allbinary/playn/processors/GameHtmlLoadResourcesProcessor.js';
//not GWT import const GameHtmlLoadResourcesProcessor

import { MidletStartupProcessor } from '../../org/allbinary/playn/processors/MidletStartupProcessor.js';
//not GWT import const MidletStartupProcessor

import { StringArrayFactory } from '../../org/allbinary/playn/processors/StringArrayFactory.js';
//not GWT import const StringArrayFactory

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;
type CommonStrings<T = any, U = any> = typeof CommonStrings extends abstract new (...args: any[]) => infer Instance ? Instance : typeof CommonStrings;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        //not plain js - same folder import { GDGameModuleReadyProcessor } 
const GDGameModuleReadyProcessor = globalThis.playn.core.GDGameModuleReadyProcessor;
//not plain js - same folder import { GDGameHtmlLoadResourcesProcessorFactory } 
const GDGameHtmlLoadResourcesProcessorFactory = globalThis.playn.core.GDGameHtmlLoadResourcesProcessorFactory;

export class GDGameProcessor extends Processor {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    readonly commonStrings: CommonStrings = CommonStrings.getInstance()!;

    private readonly NULL_INIT: InitInterface = new Init();

    private readonly list: BasicArrayList;

    private initInterface: InitInterface = this.NULL_INIT;

    private alreadyDone: boolean = false;

public constructor (list: BasicArrayList){

            super();
        this.logUtil!.putF(this.toString() +":GDGameProcessor", this, this.commonStrings!.CONSTRUCTOR);
    
this.list= list;
    
}


    public setInitInterface(initInterface: InitInterface){
this.logUtil!.putF("setInitInterface", this, this.commonStrings!.PROCESS);
    
this.initInterface= initInterface;
    
}


                //@Throws(Exception.constructor)
            
    public process(){

                        if(this.alreadyDone)
                        
                                    {
                                    this.logUtil!.putF("already done", this, this.commonStrings!.PROCESS);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

                        if(this.initInterface == this.NULL_INIT)
                        
                                    {
                                    this.logUtil!.putF("waiting for set InitInterface", this, this.commonStrings!.PROCESS);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                
this.logUtil!.putF(this.commonStrings!.START +this.list.size(), this, this.commonStrings!.PROCESS);
    

                        if(!this.list.remove(this))
                        
                                    {
                                    this.logUtil!.putF(this.commonStrings!.EXCEPTION +":GDGameProcessor", this, this.commonStrings!.PROCESS);
    

                                    }
                                
this.logUtil!.putF("GDGamesModuleReadyProcessor - setDevice", this, this.commonStrings!.INIT);
    
this.setDevice();
    

    let miniSpaceWarsModuleReadyProcessor: GDGameModuleReadyProcessor = new GDGameModuleReadyProcessor(this.initInterface, this.list);;
    
this.list.add(miniSpaceWarsModuleReadyProcessor);
    
this.logUtil!.putF(this.commonStrings!.ADD +"GDGamesModuleReadyProcessor" +this.list.size(), this, this.commonStrings!.PROCESS);
    
this.alreadyDone= true;
    
initInterface = this.initInterfaceinitInterface as AllBinaryPlayNGame
initInterface.
                    setLoadGameRunnableProcessor(miniSpaceWarsModuleReadyProcessor);
    
this.initInterface= this.NULL_INIT;
    

                        if(GDGameHtmlLoadResourcesProcessorFactory.isTouch())
                        
                                    {
                                    
    let stringArrayFactory: StringArrayFactory = GDGameHtmlLoadResourcesProcessorFactory.getInstance()!;;
    
this.list.add(new GameHtmlLoadResourcesProcessor(this.list, stringArrayFactory));
    
this.logUtil!.putF(this.commonStrings!.ADD +"GameHtmlLoadResourcesProcessor" +this.list.size(), this, this.commonStrings!.PROCESS);
    

    let gameHtmlHasLoadedResourcesProcessor: Processor = new GameHtmlHasLoadedResourcesProcessor(this.list, stringArrayFactory);;
    
this.list.add(gameHtmlHasLoadedResourcesProcessor);
    
this.logUtil!.putF(this.commonStrings!.ADD +"GameHtmlHasLoadedResourcesProcessor" +this.list.size(), this, this.commonStrings!.PROCESS);
    

                                    }
                                
this.list.add(new MidletStartupProcessor(this.list));
    
this.logUtil!.putF(this.commonStrings!.ADD +"MidletStartupProcessor" +this.list.size(), this, this.commonStrings!.PROCESS);
    
GDGameHtmlLoadResourcesProcessorFactory.loading();
    
}


    setDevice(): void;
                //native - START
                {
                    
                }



                //native - END
                

}

