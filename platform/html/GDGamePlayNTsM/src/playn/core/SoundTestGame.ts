
        /*
                *  
                *  Copyright 2010 The PlayN Authors 
                *  
                *  Licensed under the Apache License, Version 2.0 (the "License"); you may not 
                *  use this file except in compliance with the License. You may obtain a copy of 
                *  the License at 
                *  
                *  http://www.apache.org/licenses/LICENSE-2.0 
                *  
                *  Unless required by applicable law or agreed to in writing, software 
                *  distributed under the License is distributed on an "AS IS" BASIS, WITHOUT 
                *  WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the 
                *  License for the specific language governing permissions and limitations under  the License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../java/lang/Object.js';
        
            import { Throwable } from '../../java/lang/Throwable.js';
        
            import { Exception } from '../../java/lang/Exception.js';
        
//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { LogFactory } 
const LogFactory = globalThis.org.allbinary.logic.communication.log.LogFactory;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { DisplayThreadPool } from '../../org/allbinary/thread/DisplayThreadPool.js';
//not GWT import const DisplayThreadPool

import { SecondaryThreadPool } from '../../org/allbinary/thread/SecondaryThreadPool.js';
//not GWT import const SecondaryThreadPool

import { EmuThreadPool } from '../../org/allbinary/thread/EmuThreadPool.js';
//not GWT import const EmuThreadPool

import { CurrentDisplayableFactory } from '../../org/allbinary/graphics/opengles/CurrentDisplayableFactory.js';
//not GWT import const CurrentDisplayableFactory

import { ThreadPool } from '../../org/allbinary/thread/ThreadPool.js';
//not GWT import const ThreadPool

import { DeviceFactory } from '../../org/microemu/device/DeviceFactory.js';
//not GWT import const DeviceFactory

import { PlaynDevice } from '../../org/microemu/device/playn/PlaynDevice.js';
//not GWT import const PlaynDevice

//not plain js import { PlayN } 
const PlayN = globalThis.playn.core.PlayN;

//not plain js import { Callback } 
const Callback = globalThis.playn.core.util.Callback;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        //not plain js - same folder import { Game } 
const Game = globalThis.playn.core.Game;
//not plain js - same folder import { Listener } 
const Listener = globalThis.playn.core.Listener;
//not plain js - same folder import { Keyboard } 
const Keyboard = globalThis.playn.core.Keyboard;
//not plain js - same folder import { SurfaceLayer } 
const SurfaceLayer = globalThis.playn.core.SurfaceLayer;
//not plain js - same folder import { Sound } 
const Sound = globalThis.playn.core.Sound;
//not plain js - same folder import { Graphics } 
const Graphics = globalThis.playn.core.Graphics;
//not plain js - same folder import { Pointer } 
const Pointer = globalThis.playn.core.Pointer;
//not plain js - same folder import { Event } 
const Event = globalThis.playn.core.Event;
//not plain js - same folder import { TypedEvent } 
const TypedEvent = globalThis.playn.core.TypedEvent;
//not plain js - same folder import { Surface } 
const Surface = globalThis.playn.core.Surface;
//null.nullMethod()
export class SoundTestGame
            extends Object
         implements Game, Keyboard.Listener {
        

    private static readonly NUM_STARS: number = 10;

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private gameLayer: SurfaceLayer;

    private touchVectorX: number= 0.0;private touchVectorY: number= 0.0;

    private sound: Sound;

    public init(){

    var graphics: Graphics = PlayN.graphics()!;;
    
graphics.setSize(800, 600);
    
this.gameLayer= graphics.createSurfaceLayer(graphics.width(), graphics.height());
    
graphics.rootLayer()!.add(this.gameLayer);
    
PlayN.keyboard()!.setListener(this);
    
PlayN.pointer()!.setListener(new class extends Pointer.Listener
                                {
                                
    public onPointerEnd(event: Pointer.Event){
touchVectorX= touchVectorY= 0;
    
}

    public onPointerDrag(event: Pointer.Event){
touchMove(event.x(), event.y());
    
}

    public onPointerStart(event: Pointer.Event){
touchMove(event.x(), event.y());
    
}

                                }
                            );
    
DeviceFactory.setDevice(new PlaynDevice());
    
}


    public onKeyTyped(event: Keyboard.TypedEvent){
PlayN.log()!.debug("key typed");
    
}


    public onKeyDown(event: Keyboard.Event){
PlayN.log()!.debug("key down");
    
}


    public onKeyUp(event: Keyboard.Event){
PlayN.log()!.debug("key up");
    

        try {
            
                        if(this.sound == 
                                    null
                                )
                        
                                    {
                                    this.sound= PlayN.assetManager()!.getSound("/wav/select");
    

                                    }
                                

                //: 
} catch(e) 
            {
PlayN.log()!.error(CommonStrings.getInstance()!.EXCEPTION, e);
    
}


                        if(!this.sound.isPlaying())
                        
                                    {
                                    PlayN.log()!.debug("play sound");
    
this.sound.play();
    

                                    }
                                
}


    private readonly currentDisplayableFactory: CurrentDisplayableFactory = CurrentDisplayableFactory.getInstance()!;

    private readonly primaryThreadPool: EmuThreadPool = DisplayThreadPool.getInstance()!;

    private readonly secondaryThreadPool: ThreadPool = SecondaryThreadPool.getInstance()!;

    private isCrashed: boolean = false;

    public update(delta: number){

        try {
            
                //: 
} catch(e) 
            {
this.isCrashed= true;
    
this.logUtil!.put(CommonStrings.getInstance()!.EXCEPTION, this, CommonStrings.getInstance()!.UPDATE, e);
    
}

}


    public paint(alpha: number){

    var surface: Surface = this.gameLayer!.surface()!;;
    
surface.clear();
    
}


    touchMove(x: number, y: number){

    var cx: number = PlayN.graphics()!.screenWidth() /2;;
    

    var cy: number = PlayN.graphics()!.screenHeight() /2;;
    
this.touchVectorX= (x -cx) *1.0 /cx;
    
this.touchVectorY= (y -cy) *1.0 /cy;
    
}


    post(payload: string){
PlayN.net()!.post("/rpc", payload, new class extends Callback<string>
                                {
                                
    public onSuccess(response: string){
}

    public onFailure(error: Throwable){
}

                                }
                            );
    
}


    public updateRate(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 42;
    
}


}



