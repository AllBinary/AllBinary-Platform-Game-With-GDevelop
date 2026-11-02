/*
 * AllBinary Open License Version 1
 * Copyright (c) 2026 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 * 
 */
package playn.core;

import org.allbinary.game.gd.resource.GDLazyResources;
import org.allbinary.game.gd.resource.GDResources;
import org.allbinary.input.motion.button.TouchScreenFactory;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.playn.processors.StringArrayFactory;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.image.ImageCache;
import org.allbinary.image.ImageCacheFactory;

/*//JSNI Expose on $wnd.playn.core so JSNI (GDGameHtmlLoadResourcesProcessorFactory) can construct this class *** &#10;
globalThis.playn = globalThis.playn || {}; &#10;
globalThis.playn.core = globalThis.playn.core || {}; &#10;
globalThis.playn.core.GDGameHtmlLoadResourcesProcessorFactoryNI = GDGameHtmlLoadResourcesProcessorFactoryNI; &#10;
console.log('Exported GDGameHtmlLoadResourcesProcessorFactoryNI as globalThis'); &#10;
*/
public class GDGameHtmlLoadResourcesProcessorFactoryNI {

        static class GDGameStringArrayFactory extends StringArrayFactory {

            public String[] getOrCreate() {

                if (this.resourceStringArray == StringUtil.getInstance().ONE_EMPTY_STRING_ARRAY) {

                    final ImageCache imageCache = ImageCacheFactory.getInstance();

                    final GDResources gdResources = GDResources.getInstance();
                    final GDLazyResources gdLazyResources = GDLazyResources.getInstance();
                    String[] resourceStringArray = gdLazyResources.requiredResourcesBeforeLoadingArray;
                    if (imageCache.isLazy()) {
                    } else {
                        resourceStringArray = gdResources.resourceStringArray;
                    }
                    this.resourceStringArray = resourceStringArray;
                }

                return this.resourceStringArray;
            }

//            public native String getTouchButtonShieldActionResource()/*-{
//                    return $wnd.org.allbinary.ag.input.TouchButtonShieldActionResource.getInstance().RESOURCE;
//            }-*/;

        };
    
    public static void loading() {
        ProgressCanvasFactory.getInstance().addNormalPortion(10, "Loading");
    }

    public static boolean isTouch() {
        return TouchScreenFactory.getInstance().isTouch();
    }

    public static StringArrayFactory getInstance() {
        return new GDGameStringArrayFactory();
    }
    
}
