
        /*
                *  
                *  Copyright 2010 The PlayN Authors 
                *  
                *  Licensed under the Apache License, Version 2.0 (the "License"); 
                *  you may not use this file except in compliance with the License. 
                *  You may obtain a copy of the License at 
                *  
                *      http://www.apache.org/licenses/LICENSE-2.0 
                *  
                *  Unless required by applicable law or agreed to in writing, software 
                *  distributed under the License is distributed on an "AS IS" BASIS, 
                *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
                *  See the License for the specific language governing permissions and  limitations under the License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../java/lang/Object.js';
        
import { EntryPoint } from '../../com/google/gwt/core/client/EntryPoint.js';
//not GWT import const EntryPoint

import { GWT } from '../../com/google/gwt/core/client/GWT.js';
//not GWT import const GWT

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
type BasicArrayListD<T = any, U = any> = typeof BasicArrayListD extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayListD;

//not plain js import { AllBinaryPlayNGameRunnableProcessor } 
const AllBinaryPlayNGameRunnableProcessor = globalThis.playn.core.AllBinaryPlayNGameRunnableProcessor;
type AllBinaryPlayNGameRunnableProcessor<T = any, U = any> = typeof AllBinaryPlayNGameRunnableProcessor extends abstract new (...args: any[]) => infer Instance ? Instance : typeof AllBinaryPlayNGameRunnableProcessor;

//not plain js import { GDGameProcessor } 
const GDGameProcessor = globalThis.playn.core.GDGameProcessor;
type GDGameProcessor<T = any, U = any> = typeof GDGameProcessor extends abstract new (...args: any[]) => infer Instance ? Instance : typeof GDGameProcessor;

//not plain js import { PlayN } 
const PlayN = globalThis.playn.core.PlayN;
type PlayN<T = any, U = any> = typeof PlayN extends abstract new (...args: any[]) => infer Instance ? Instance : typeof PlayN;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        //not plain js - same folder import { Config } 
const Config = globalThis.playn.html.Config;
//not plain js - same folder import { HtmlPlatform } 
const HtmlPlatform = globalThis.playn.html.HtmlPlatform;

export class GDGameGameHtml
            extends Object
         implements EntryPoint {
        

    public onModuleLoad(){

    let config: HtmlPlatform.Config = new HtmlPlatform.Config();;
    
config.scaleFactor= 1;
    
config.frameBufferPixelRatio= 1;
    

    let platform: HtmlPlatform = new HtmlPlatform(config);;
    
PlayN.create(platform);
    
platform.assets()!.setPathPrefix(GWT.getModuleBaseForStaticFiles() +"res/");
    

    let list: BasicArrayList = new BasicArrayListD();;
    

    let gdGameProcessor: GDGameProcessor = new GDGameProcessor(list);;
    

    let allBinaryPlayNGameRunnableProcessor: AllBinaryPlayNGameRunnableProcessor = new AllBinaryPlayNGameRunnableProcessor(platform, gdGameProcessor, list);;
    
list.add(allBinaryPlayNGameRunnableProcessor);
    
list.add(gdGameProcessor);
    
platform.start();
    
}


}

