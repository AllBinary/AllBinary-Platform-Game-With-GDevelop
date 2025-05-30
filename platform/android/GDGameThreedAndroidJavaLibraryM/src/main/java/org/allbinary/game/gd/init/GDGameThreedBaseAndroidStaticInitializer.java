package org.allbinary.game.gd.init;

import javax.microedition.lcdui.CommandListener;

import org.allbinary.game.resource.ResourceInitialization;
import org.allbinary.game.gd.configuration.GDGameGameFeatures;
import org.allbinary.game.init.GDGameStaticInitializer;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;

public class GDGameThreedBaseAndroidStaticInitializer extends GDGameStaticInitializer
{
    private boolean androidGameInitialized;
    
    public GDGameThreedBaseAndroidStaticInitializer(
            ResourceInitialization[] resourceInitializationArray, int portion)
    {
        super(resourceInitializationArray, portion);
    }

    public void initKey(int portion) throws Exception
    {
        super.initKey(portion);
        
        //AndroidGameKey.init();
        ProgressCanvasFactory.getInstance().addPortion(50, "Game Keys");        
    }

    public void init(final AbeClientInformationInterface abeClientInformation, final CommandListener commandListener, final int level) throws Exception
    {
        super.init(abeClientInformation, commandListener, level);

        if(this.isAndroidGameInitialized())
        {
            return;
        }
        
        this.setAndroidGameInitialized(true);
        
        new GDGameGameFeatures().init();

        //GameOptionsForm.init(commandListener, new GDGameGameFeatures(), "Game Options");
        ProgressCanvasFactory.getInstance().addPortion(50, "Game Options");
    }
    
    protected void setAndroidGameInitialized(boolean androidGameInitialized)
    {
        this.androidGameInitialized = androidGameInitialized;
    }

    protected boolean isAndroidGameInitialized()
    {
        return androidGameInitialized;
    }
}
