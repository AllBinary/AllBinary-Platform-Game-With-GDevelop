/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package playn.core;

import org.allbinary.canvas.Processor;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.input.motion.button.TouchButtonBlankResource;
import org.allbinary.input.motion.button.TouchButtonDownResource;
import org.allbinary.input.motion.button.TouchButtonGenericActionResource;
import org.allbinary.input.motion.button.TouchButtonStartResource;
import org.allbinary.input.motion.button.TouchButtonStrafeLeftResource;
import org.allbinary.input.motion.button.TouchButtonStrafeRightResource;
import org.allbinary.input.motion.button.TouchButtonTurnLeftResource;
import org.allbinary.input.motion.button.TouchButtonTurnRightResource;
import org.allbinary.input.motion.button.TouchButtonUpResource;
import org.allbinary.input.motion.button.TouchScreenFactory;
import org.allbinary.playn.processors.GameHtmlHasLoadedResourcesProcessor;
import org.allbinary.playn.processors.GameHtmlLoadResourcesProcessor;
import org.allbinary.playn.processors.MidletStartupProcessor;
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

    public void process() throws Exception
    {
        this.list.remove(0);

        //ExplosionResources explosionResources = ExplosionResources.getInstance();
        //PlayerShipResources basicShipResources = PlayerShipResources.getInstance();
        if (TouchScreenFactory.getInstance().isTouch())
        {
            String[] resourceStringArray =
            {
                TouchButtonBlankResource.getInstance().RESOURCE,
                TouchButtonGenericActionResource.getInstance().RESOURCE,
                TouchButtonStartResource.getInstance().RESOURCE,
                TouchButtonUpResource.getInstance().RESOURCE,
                TouchButtonDownResource.getInstance().RESOURCE,
                TouchButtonTurnLeftResource.getInstance().RESOURCE,
                TouchButtonTurnRightResource.getInstance().RESOURCE,
                TouchButtonStrafeLeftResource.getInstance().RESOURCE,
                TouchButtonStrafeRightResource.getInstance().RESOURCE,
            };

            list.add(new GameHtmlLoadResourcesProcessor(list, resourceStringArray));

            Processor gameHtmlHasLoadedResourcesProcessor
                    = new GameHtmlHasLoadedResourcesProcessor(list, resourceStringArray);

            list.add(gameHtmlHasLoadedResourcesProcessor);
        }

        list.add(new MidletStartupProcessor(list));

        ProgressCanvasFactory.getInstance().addPortion(10, "Loading");
    }
}
