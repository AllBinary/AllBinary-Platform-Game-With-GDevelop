package org.allbinary.game.init;

import org.allbinary.game.init.GDGameStaticInitializer;
import org.allbinary.game.resource.ResourceInitialization;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import javax.microedition.lcdui.CommandListener;
import org.allbinary.game.configuration.GDGameGameFeatures;

public class GDGameAndroidStaticInitializer 
extends GDGameStaticInitializer
{
    private boolean platformGameInitialized;
    
    public GDGameAndroidStaticInitializer(
            ResourceInitialization[] resourceInitializationArray, int portion)
    {
        super(resourceInitializationArray, portion);
    }
    
    public void initKey(int portion) throws Exception
    {
        super.initKey(portion);
        
        //ProgressCanvasFactory.getInstance().addPortion(50, "Game Keys");        
    }

    public void init(CommandListener commandListener, int level) throws Exception
    {
        super.init(commandListener, level);

        if(this.isPlatformGameInitialized())
        {
            return;
        }
        
        this.setPlatformGameInitialized(true);
        
        ProgressCanvasFactory.getInstance().addPortion(50, "Game Options");
        
        new GDGameGameFeatures().init();
        //GameOptionsForm.init(commandListener, new GDGameGameFeatures(), "Game Options");
    }
    
    protected void setPlatformGameInitialized(boolean platformGameInitialized)
    {
        this.platformGameInitialized = platformGameInitialized;
    }

    protected boolean isPlatformGameInitialized()
    {
        return platformGameInitialized;
    }
}
