package org.allbinary.game.resource;

import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GraphicsFeatureFactory;

public class GDGameJOGLResources extends GDGameBaseJOGLResources
{
    private static final GDGameJOGLResources STATIC = new GDGameJOGLResources();

    protected boolean initialized;

    public static GDGameJOGLResources getInstance()
    {
        return STATIC;
    }

    protected void initImages(String[] RESOURCES) throws Exception
    {
        if (Features.getInstance().isFeature(
                GraphicsFeatureFactory.getInstance().IMAGE_TO_ARRAY_GRAPHICS))
        {
            //this.initImageArray(RESOURCES);
        }
        else
        {
            throw new Exception("GDGame Resource Error");
        }
    }
}
