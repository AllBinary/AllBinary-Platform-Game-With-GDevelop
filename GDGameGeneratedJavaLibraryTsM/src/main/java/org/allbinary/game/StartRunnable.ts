
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

        


            import { Object } from '../../../java/lang/Object.js';
        
            import { Exception } from '../../../java/lang/Exception.js';
        
            import { Runnable } from '../../../java/lang/Runnable.js';
        
import { DemoGameMidlet } from '../../../org/allbinary/game/midlet/DemoGameMidlet.js';
//not GWT import const DemoGameMidlet

import { DemoGameMidletEvent } from '../../../org/allbinary/game/midlet/DemoGameMidletEvent.js';
//not GWT import const DemoGameMidletEvent

import { DemoGameMidletEventHandler } from '../../../org/allbinary/game/midlet/DemoGameMidletEventHandler.js';
//not GWT import const DemoGameMidletEventHandler

import { DemoGameMidletStateFactory } from '../../../org/allbinary/game/midlet/DemoGameMidletStateFactory.js';
//not GWT import const DemoGameMidletStateFactory

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { ProgressCanvasFactory } from '../../../org/allbinary/graphics/canvas/transition/progress/ProgressCanvasFactory.js';
//not GWT import const ProgressCanvasFactory

import { MyCommandsFactory } from '../../../org/allbinary/graphics/displayable/command/MyCommandsFactory.js';
//not GWT import const MyCommandsFactory

//not plain js import { CommonLabels } 
const CommonLabels = globalThis.org.allbinary.string.CommonLabels;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        //Similar to DemoRunnable
export class StartRunnable
            extends Object
         implements Runnable {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly commonStrings: CommonStrings = CommonStrings.getInstance()!;

    private readonly demoGameMidlet: DemoGameMidlet;

    private readonly startDemoGameMidletEvent: DemoGameMidletEvent;

public constructor (demoGameMidlet: DemoGameMidlet){

            super();
        this.demoGameMidlet= demoGameMidlet;
    
this.startDemoGameMidletEvent= new DemoGameMidletEvent(this.demoGameMidlet, DemoGameMidletStateFactory.getInstance()!.START_DEMO);
    
}


    public run(){

        try {
            this.logUtil!.putF(CommonLabels.getInstance()!.START_LABEL +"GameCanvasRunnableInterface", this, this.commonStrings!.RUN);
    
this.demoGameMidlet!.commandAction(MyCommandsFactory.getInstance()!.SET_DISPLAYABLE, ProgressCanvasFactory.getInstance());
    
this.demoGameMidlet!.setGameCanvasRunnableInterface(this.demoGameMidlet!.createDemoGameCanvasRunnableInterface());
    
this.demoGameMidlet!.demoSetup();
    
DemoGameMidletEventHandler.getInstance()!.fireEvent(this.startDemoGameMidletEvent);
    
this.demoGameMidlet!.startGameCanvasRunnableInterface();
    
this.demoGameMidlet!.postDemoSetup();
    
this.logUtil!.putF(this.commonStrings!.END_RUNNABLE, this, this.commonStrings!.RUN);
    

                //: 
} catch(e) 
            {
this.logUtil!.put(this.commonStrings!.EXCEPTION, this, this.commonStrings!.RUN, e);
    
}

}


}



