/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package playn.core;

import org.allbinary.canvas.Processor;
import org.allbinary.game.gd.resource.GDLazyResources;
import org.allbinary.game.gd.resource.GDResources;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.image.ImageCache;
import org.allbinary.image.ImageCacheFactory;
import org.allbinary.input.motion.button.TouchScreenFactory;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.playn.processors.GameHtmlHasLoadedResourcesProcessor;
import org.allbinary.playn.processors.GameHtmlLoadResourcesProcessor;
import org.allbinary.playn.processors.MidletStartupProcessor;
import org.allbinary.playn.processors.StringArrayFactory;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author user
 */
public class GDGameProcessor
        extends Processor
{

    private final BasicArrayList list;

    public GDGameProcessor(final BasicArrayList list)
    {
        this.list = list;
    }

    @Override
    public void process() throws Exception
    {
        this.list.removeAt(0);

        if (TouchScreenFactory.getInstance().isTouch())
        {
//            String[] resourceStringArray =
//            {
//                TouchButtonBlankResource.getInstance().RESOURCE,
//                TouchButtonGenericActionResource.getInstance().RESOURCE,
//                TouchButtonStartResource.getInstance().RESOURCE,
//                TouchButtonUpResource.getInstance().RESOURCE,
//                TouchButtonDownResource.getInstance().RESOURCE,
//                TouchButtonTurnLeftResource.getInstance().RESOURCE,
//                TouchButtonTurnRightResource.getInstance().RESOURCE,
//                TouchButtonStrafeLeftResource.getInstance().RESOURCE,
//                TouchButtonStrafeRightResource.getInstance().RESOURCE,
//            };
//
            
            class GDGameStringArrayFactory extends StringArrayFactory {
                
                public String[] getOrCreate() {

                    if (this.resourceStringArray == StringUtil.getInstance().ONE_EMPTY_STRING_ARRAY) {

                        final ImageCache imageCache = ImageCacheFactory.getInstance();
                        final GDResources gdResources = GDResources.getInstance();
                        final GDLazyResources gdLazyResources = GDLazyResources.getInstance();
                        String[] gdGameResourceStringArray = gdLazyResources.requiredResourcesBeforeLoadingArray;
                        if (imageCache.isLazy()) {
                        } else {
                            gdGameResourceStringArray = gdResources.resourceStringArray;
                        }
                        
                        this.resourceStringArray = gdGameResourceStringArray;
                    }

                    return this.resourceStringArray;
                }

            };
            
            final GDGameStringArrayFactory gdGameStringArrayFactory = new GDGameStringArrayFactory();
            this.list.add(new GameHtmlLoadResourcesProcessor(this.list, gdGameStringArrayFactory));

//        OnDemandResources[] onDemandResourcesArray =
//                MiniSpaceWarImageOnDemandResourcesFactory.getInstance().getOnDemandResourcesArray();
//
//        Processor htmlLoadResourcesProcessor = new HtmlLoadOnDemandResourcesProcessor(
//                list, onDemandResourcesArray);
//
//        for (int index = onDemandResourcesArray.length; --index >= 0;)
//        {
//            list.add(htmlLoadResourcesProcessor);
//        }
            
            final Processor gameHtmlHasLoadedResourcesProcessor = 
                new GameHtmlHasLoadedResourcesProcessor(this.list, gdGameStringArrayFactory);

            this.list.add(gameHtmlHasLoadedResourcesProcessor);
            
        }

        this.list.add(new MidletStartupProcessor(this.list));

        ProgressCanvasFactory.getInstance().addNormalPortion(10, "Loading");
    }
}
