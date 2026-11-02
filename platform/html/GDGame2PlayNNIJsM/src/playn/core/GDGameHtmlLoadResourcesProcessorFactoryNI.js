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
import { Object } from '../../java/lang/Object.js';
import { GDLazyResources } from '../../org/allbinary/game/gd/resource/GDLazyResources.js';
//not GWT import const GDLazyResources
import { GDResources } from '../../org/allbinary/game/gd/resource/GDResources.js';
//not GWT import const GDResources
import { TouchScreenFactory } from '../../org/allbinary/input/motion/button/TouchScreenFactory.js';
//not GWT import const TouchScreenFactory
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
import { StringArrayFactory } from '../../org/allbinary/playn/processors/StringArrayFactory.js';
//not GWT import const StringArrayFactory
import { ProgressCanvasFactory } from '../../org/allbinary/graphics/canvas/transition/progress/ProgressCanvasFactory.js';
//not GWT import const ImageCache
import { ImageCacheFactory } from '../../org/allbinary/image/ImageCacheFactory.js';
//not GWT import const ImageCacheFactory
//Current folder imports from return types, extended types, and scope (deduplicated)
////not plain js - same folder import { GDGameStringArrayFactory } 
const GDGameStringArrayFactory = globalThis.playn.core.GDGameStringArrayFactory;
export class GDGameHtmlLoadResourcesProcessorFactoryNI extends Object {
    constructor() {
        super(...arguments);
        this.playn = globalThis.playn || {};
        this.core = globalThis.playn.core || {};
        this.GDGameHtmlLoadResourcesProcessorFactoryNI = GDGameHtmlLoadResourcesProcessorFactoryNI;
    }
    static loading() {
        ProgressCanvasFactory.getInstance().addNormalPortion(10, "Loading");
    }
    static isTouch() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return TouchScreenFactory.getInstance().isTouch();
        ;
    }
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return new this.GDGameStringArrayFactory();
    }
} //JSNI Expose on $wnd.playn.core so JSNI (GDGameHtmlLoadResourcesProcessorFactory) can construct this class *** 
//inner= member=true isStatic=static
GDGameHtmlLoadResourcesProcessorFactoryNI.GDGameStringArrayFactory = class GDGameStringArrayFactory extends StringArrayFactory {
    /*Static stuff is not allowed for TypeScript inner classes*/ /**/
    getOrCreate() {
        if (this.resourceStringArray == StringUtil.getInstance().ONE_EMPTY_STRING_ARRAY) {
            let imageCache = ImageCacheFactory.getInstance();
            ;
            let gdResources = GDResources.getInstance();
            ;
            let gdLazyResources = GDLazyResources.getInstance();
            ;
            let resourceStringArray = gdLazyResources.requiredResourcesBeforeLoadingArray;
            ;
            if (imageCache.isLazy()) {
            }
            else {
                resourceStringArray = gdResources.resourceStringArray;
            }
            this.resourceStringArray = resourceStringArray;
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.resourceStringArray;
    }
}; //JSNI Expose on $wnd.playn.core so JSNI (GDGameHtmlLoadResourcesProcessorFactory) can construct this class *** 
globalThis.playn = globalThis.playn || {};
globalThis.playn.core = globalThis.playn.core || {};
globalThis.playn.core.GDGameHtmlLoadResourcesProcessorFactoryNI = GDGameHtmlLoadResourcesProcessorFactoryNI;
console.log('Exported GDGameHtmlLoadResourcesProcessorFactoryNI as globalThis');
