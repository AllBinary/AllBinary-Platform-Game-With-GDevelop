
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2026 AllBinary 
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

        


import { Processor } from '../../org/allbinary/canvas/Processor.js';
//not GWT import const Processor

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

//not plain js import { HtmlPlatform } 
const HtmlPlatform = globalThis.playn.html.HtmlPlatform;
type HtmlPlatform<T = any, U = any> = typeof HtmlPlatform extends abstract new (...args: any[]) => infer Instance ? Instance : typeof HtmlPlatform;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        //not plain js - same folder import { GDGameProcessor } 
const GDGameProcessor = globalThis.playn.core.GDGameProcessor;
//not plain js - same folder import { GDGameMidletFactory } 
const GDGameMidletFactory = globalThis.playn.core.GDGameMidletFactory;

export class AllBinaryPlayNGameRunnableProcessor extends Processor {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    readonly commonStrings: CommonStrings = CommonStrings.getInstance()!;

    private readonly WAITING_DEVICEFACTORY: string = "waiting on org.microemu.device.DeviceFactory to load";

    private readonly WAITING_BRIDGE: string = "waiting on org.microemu.MIDletBridge to load";

    private readonly WAITING_PLAYN_CANVAS_GRAPHICS: string = "waiting on org.microemu.device.playn.PlaynCanvasDisplayGraphics to load";

    private readonly WAITING: string = "waiting on AllBinaryPlayNGameRunnable to load";

    private readonly WAITING2: string = "waiting on OpenGLES to load";

    private readonly platform: HtmlPlatform;

    private readonly list: BasicArrayList;

    private readonly initInterface: AllBinaryPlayNGame;

    public readonly gdGameProcessor: GDGameProcessor;

public constructor (platform: HtmlPlatform, gdGameProcessor: GDGameProcessor, list: BasicArrayList){

            super();
        this.logUtil!.putF(this.toString() +":AllBinaryPlayNGameRunnableProcessor", this, this.commonStrings!.CONSTRUCTOR);
    
this.platform= platform;
    
this.list= list;
    
this.gdGameProcessor= gdGameProcessor;
    
this.initInterface= new AllBinaryPlayNGame(this.platform, new GDGameMidletFactory(), this, true);
    
this.initInterface!.updateRate= this.initInterface!.waitFrameRate;
    
}


    public process(){

                        if(!this.isDeviceFactoryLoaded())
                        
                                    {
                                    this.logUtil!.putF(WAITING_DEVICEFACTORY, this, this.commonStrings!.PROCESS);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

                        if(!this.isMIDletBridgeLoaded())
                        
                                    {
                                    this.logUtil!.putF(WAITING_BRIDGE, this, this.commonStrings!.PROCESS);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

                        if(!this.isPlaynCanvasDisplayGraphicsLoaded())
                        
                                    {
                                    this.logUtil!.putF(WAITING_PLAYN_CANVAS_GRAPHICS, this, this.commonStrings!.PROCESS);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

                        if(!this.isAllBinaryPlayNGameRunnableReady())
                        
                                    {
                                    this.logUtil!.putF(WAITING, this, this.commonStrings!.PROCESS);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

                        if(!this.isOpenGLESPackageLoaded())
                        
                                    {
                                    this.logUtil!.putF(WAITING2, this, this.commonStrings!.PROCESS);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                
this.logUtil!.putF(this.commonStrings!.START +this.list.size(), this, this.commonStrings!.PROCESS);
    

                        if(!this.list.remove(this))
                        
                                    {
                                    this.logUtil!.putF(this.commonStrings!.EXCEPTION +":AllBinaryPlayNGameRunnableProcessor", this, this.commonStrings!.PROCESS);
    

                                    }
                                

    let gameRunnable: any = this.createGameRunnable(this.list)!;;
    
this.initInterface!.setUsedRunnable(gameRunnable);
    
this.logUtil!.putF(this.commonStrings!.INIT +this.list.size(), this, this.commonStrings!.PROCESS);
    
this.gdGameProcessor!.setInitInterface(this.initInterface);
    
this.initInterface!.setLoadGameRunnableProcessor(this.gdGameProcessor);
    
}


    isDeviceFactoryLoaded(): boolean;
                //native - START
                {
                    
                }



                //native - END
                

    isMIDletBridgeLoaded(): boolean;
                //native - START
                {
                    
                }



                //native - END
                

    isPlaynCanvasDisplayGraphicsLoaded(): boolean;
                //native - START
                {
                    
                }



                //native - END
                

    isAllBinaryPlayNGameRunnableReady(): boolean;
                //native - START
                {
                    
                }



                //native - END
                

    isOpenGLESPackageLoaded(): boolean;
                //native - START
                {
                    
                }



                //native - END
                

    createGameRunnable(list: BasicArrayList): any;
                //native - START
                {
                    
                }



                //native - END
                

}

