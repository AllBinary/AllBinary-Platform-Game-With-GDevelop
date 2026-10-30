
        /*
                *  
                *  To change this template, choose Tools | Templates  and open the template in the editor.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../java/lang/Exception.js';
        
import { Processor } from '../../org/allbinary/canvas/Processor.js';
//not GWT import const Processor

import { GDLazyResources } from '../../org/allbinary/game/gd/resource/GDLazyResources.js';
//not GWT import const GDLazyResources

import { GDResources } from '../../org/allbinary/game/gd/resource/GDResources.js';
//not GWT import const GDResources

import { ProgressCanvasFactory } from '../../org/allbinary/graphics/canvas/transition/progress/ProgressCanvasFactory.js';
//not GWT import const ProgressCanvasFactory

import { ImageCache } from '../../org/allbinary/image/ImageCache.js';
//not GWT import const ImageCache

import { ImageCacheFactory } from '../../org/allbinary/image/ImageCacheFactory.js';
//not GWT import const ImageCacheFactory

import { TouchScreenFactory } from '../../org/allbinary/input/motion/button/TouchScreenFactory.js';
//not GWT import const TouchScreenFactory

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
type StringUtil<T = any, U = any> = typeof StringUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringUtil;

import { GameHtmlHasLoadedResourcesProcessor } from '../../org/allbinary/playn/processors/GameHtmlHasLoadedResourcesProcessor.js';
//not GWT import const GameHtmlHasLoadedResourcesProcessor

import { GameHtmlLoadResourcesProcessor } from '../../org/allbinary/playn/processors/GameHtmlLoadResourcesProcessor.js';
//not GWT import const GameHtmlLoadResourcesProcessor

import { MidletStartupProcessor } from '../../org/allbinary/playn/processors/MidletStartupProcessor.js';
//not GWT import const MidletStartupProcessor

import { StringArrayFactory } from '../../org/allbinary/playn/processors/StringArrayFactory.js';
//not GWT import const StringArrayFactory

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
type BasicArrayList<T = any, U = any> = typeof BasicArrayList extends abstract new (...args: any[]) => infer Instance ? Instance : typeof BasicArrayList;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameProcessor extends Processor {
        

    private readonly list: BasicArrayList;

public constructor (list: BasicArrayList){

            super();
        this.list= list;
    
}


                //@Throws(Exception.constructor)
            
    public process(){
this.list.removeAt(0);
    

                        if(TouchScreenFactory.getInstance()!.isTouch())
                        
                                    {
                                    
//inner=true member= isStatic=
class GDGameStringArrayFactory extends StringArrayFactory {
        

    public getOrCreate(): string[]{

                        if(this.resourceStringArray == StringUtil.getInstance()!.ONE_EMPTY_STRING_ARRAY)
                        
                                    {
                                    
    let imageCache: ImageCache = ImageCacheFactory.getInstance()!;;
    

    let gdResources: GDResources = GDResources.getInstance()!;;
    

    let gdLazyResources: GDLazyResources = GDLazyResources.getInstance()!;;
    

    let gdGameResourceStringArray: string[] = gdLazyResources!.requiredResourcesBeforeLoadingArray;;
    

                        if(imageCache!.isLazy())
                        
                                    {
                                    
                                    }
                                
                        else {
                            gdGameResourceStringArray= gdResources!.resourceStringArray;
    

                        }
                            
this.resourceStringArray= gdGameResourceStringArray;
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.resourceStringArray;
    
}


}

                    //Otherwise - statement - EmptyStmt


    let gdGameStringArrayFactory: GDGameStringArrayFactory = new GDGameStringArrayFactory();;
    
this.list.add(new GameHtmlLoadResourcesProcessor(this.list, gdGameStringArrayFactory));
    

    let gameHtmlHasLoadedResourcesProcessor: Processor = new GameHtmlHasLoadedResourcesProcessor(this.list, gdGameStringArrayFactory);;
    
this.list.add(gameHtmlHasLoadedResourcesProcessor);
    

                                    }
                                
this.list.add(new MidletStartupProcessor(this.list));
    
ProgressCanvasFactory.getInstance()!.addNormalPortion(10, "Loading");
    
}


}

