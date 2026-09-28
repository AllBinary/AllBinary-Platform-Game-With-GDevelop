
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

        


import { AllBinaryPlayNGame } from '../../org/allbinary/playn/AllBinaryPlayNGame.js';
//not GWT import const AllBinaryPlayNGame

import { AllBinaryPlayNGameRunnable } from '../../org/allbinary/playn/AllBinaryPlayNGameRunnable.js';
//not GWT import const AllBinaryPlayNGameRunnable

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

//not plain js import { GDGameMidletFactory } 
const GDGameMidletFactory = globalThis.playn.core.GDGameMidletFactory;

//not plain js import { PlayN } 
const PlayN = globalThis.playn.core.PlayN;

//not plain js import { GDGameProcessor } 
const GDGameProcessor = globalThis.playn.core.GDGameProcessor;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        //not plain js - same folder import { HtmlGame } 
const HtmlGame = globalThis.playn.html.HtmlGame;
//not plain js - same folder import { HtmlPlatform } 
const HtmlPlatform = globalThis.playn.html.HtmlPlatform;

export class GDGameGameHtml extends HtmlGame {
        

    public start(){

    var platform: HtmlPlatform = HtmlPlatform.register()!;;
    
platform.assetManager()!.setPathPrefix("gd/res/", false);
    

    var list: BasicArrayList = new BasicArrayListD();;
    
list.add(new GDGameProcessor(list));
    

    var gameRunnable: AllBinaryPlayNGameRunnable = new AllBinaryPlayNGameRunnable(list);;
    
PlayN.run(new AllBinaryPlayNGame(new GDGameMidletFactory(), gameRunnable, 960, 600));
    
}


}



