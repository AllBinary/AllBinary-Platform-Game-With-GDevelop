
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

//not plain js import { ResourceUtil } 
const ResourceUtil = globalThis.org.allbinary.data.resource.ResourceUtil;

import { BasicColorFactory } from '../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory

import { InputStream } from '../../java/io/InputStream.js';
//not GWT import const InputStream

import { ImageModifierUtil } from '../../org/allbinary/media/image/ImageModifierUtil.js';
//not GWT import const ImageModifierUtil

import { Device } from '../../org/microemu/device/Device.js';
//not GWT import const Device

import { DeviceFactory } from '../../org/microemu/device/DeviceFactory.js';
//not GWT import const DeviceFactory

import { PlaynDevice } from '../../org/microemu/device/playn/PlaynDevice.js';
//not GWT import const PlaynDevice

import { PlaynSurfaceDisplayGraphics } from '../../org/microemu/device/playn/PlaynSurfaceDisplayGraphics.js';
//not GWT import const PlaynSurfaceDisplayGraphics

//not plain js import { graphics } 
const graphics = globalThis.playn.core.PlayN.graphics;

//not plain js import { keyboard } 
const keyboard = globalThis.playn.core.PlayN.keyboard;

//not plain js import { net } 
const net = globalThis.playn.core.PlayN.net;

//not plain js import { pointer } 
const pointer = globalThis.playn.core.PlayN.pointer;

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
//not plain js - same folder import { Graphics } 
const Graphics = globalThis.playn.core.Graphics;
//not plain js - same folder import { Image } 
const Image = globalThis.playn.core.Image;
//not plain js - same folder import { PlayN } 
const PlayN = globalThis.playn.core.PlayN;
//not plain js - same folder import { Pointer } 
const Pointer = globalThis.playn.core.Pointer;
//not plain js - same folder import { Event } 
const Event = globalThis.playn.core.Event;
//not plain js - same folder import { TypedEvent } 
const TypedEvent = globalThis.playn.core.TypedEvent;
//not plain js - same folder import { Surface } 
const Surface = globalThis.playn.core.Surface;
//http://localhost:8080/minispacewarvector-html-1.0-SNAPSHOT/
export class GraphicsTestGame
            extends Object
         implements Game, Keyboard.Listener {
        

    private static readonly NUM_STARS: number = 10;

    private gameLayer: SurfaceLayer;

    private touchVectorX: number= 0.0;private touchVectorY: number= 0.0;

    private device: Device;

    private graphics: javax.microedition.lcdui.Graphics;

    private originalImage: javax.microedition.lcdui.Image;

    private imageArray: javax.microedition.lcdui.Image[] = new Array(1);

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
    
this.device= DeviceFactory.getDevice();
    
this.graphics= new PlaynSurfaceDisplayGraphics(this.gameLayer!.surface());
    
this.graphics.setColor(BasicColorFactory.getInstance()!.WHITE.intValue());
    

        try {
            
    var inputStream: InputStream = ResourceUtil.getInstance()!.getResourceAsStream("/locked_demo_game_feature_64_by_64.png")!;;
    

    var image: javax.microedition.lcdui.Image = javax.microedition.lcdui.Image.createImage(inputStream)!;;
    
this.originalImage= this.imageArray[0]= image;
    
ImageModifierUtil.getInstanceOrCreate()!.handleImage(this.imageArray, 0, image);
    

                //: 
} catch(e) 
            {
PlayN.log()!.error(CommonStrings.getInstance()!.EXCEPTION, e);
    
}

}


    public onKeyTyped(event: Keyboard.TypedEvent){
}


    public onKeyDown(event: Keyboard.Event){
}


    public onKeyUp(event: Keyboard.Event){
}


    public update(delta: number){
}


    private readonly aChar: string = 'Z';

    private readonly charArray: string[] = ['A','l','l','B','i','n','a','r','y'];

    private readonly string: string = "AllBinary";

    falling: boolean = true;

    alpha: number = 1;

    public paint(alpha: number){

    var surface: Surface = this.gameLayer!.surface()!;;
    
surface.clear();
    
this.graphics.drawLine(0, 0, 100, 100);
    
this.graphics.drawLine(100, 0, 0, 100);
    
this.graphics.drawRect(200, 200, 233, 50);
    
this.graphics.fillRect(300, 300, 233, 50);
    
this.graphics.drawArc(100, 100, 40, 40, 0, 360);
    
this.graphics.fillArc(150, 150, 30, 30, 0, 360);
    
this.graphics.drawImage(this.imageArray[0]!, 20, 50, 0);
    

                        if(this.falling)
                        
                                    {
                                    alpha -= .01;
    

                                    }
                                
                        else {
                            alpha += .01;
    

                        }
                            

                        if(alpha <= 0)
                        
                                    {
                                    this.falling= false;
    

                                    }
                                
                             else 
                        if(alpha >= 1)
                        
                                    {
                                    this.falling= true;
    

                                    }
                                
ImageModifierUtil.getInstanceOrCreate()!.setAlpha(this.originalImage, this.imageArray[0]!, 0, Math.round((alpha *255)));
    
}


    touchMove(x: number, y: number){

    var cx: number = PlayN.graphics()!.screenWidth() /2;;
    

    var cy: number = PlayN.graphics()!.screenHeight() /2;;
    
touchVectorX= (x -cx) *1.0 /cx;
    
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
                        return 33;
    
}


}



