/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package playn.core;

import org.allbinary.canvas.Processor;
import org.allbinary.init.Init;
import org.allbinary.init.InitInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.playn.AllBinaryPlayNGame;
import org.allbinary.playn.processors.GameHtmlHasLoadedResourcesProcessor;
import org.allbinary.playn.processors.GameHtmlLoadResourcesProcessor;
import org.allbinary.playn.processors.MidletStartupProcessor;
import org.allbinary.playn.processors.StringArrayFactory;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author user
 */
public class GDGameProcessor
        extends Processor
{
    protected final LogUtil logUtil = LogUtil.getInstance();
    protected final CommonStrings commonStrings = CommonStrings.getInstance();
    
    private final InitInterface NULL_INIT = new Init();
    private final BasicArrayList list;
    
    private InitInterface initInterface = this.NULL_INIT;
    private boolean alreadyDone = false;

    public GDGameProcessor(final BasicArrayList list)
    {
        this.logUtil.putF(this.toString() + ":GDGameProcessor", this, this.commonStrings.CONSTRUCTOR);
        this.list = list;
    }

    public void setInitInterface(final InitInterface initInterface) {
        this.logUtil.putF("setInitInterface", this, this.commonStrings.PROCESS);
        this.initInterface = initInterface;
    }

    @Override
    public void process() throws Exception
    {
        if(this.alreadyDone) {
            this.logUtil.putF("already done", this, this.commonStrings.PROCESS);
            return;
        }
        
        if(this.initInterface == this.NULL_INIT) {
            this.logUtil.putF("waiting for set InitInterface", this, this.commonStrings.PROCESS);
            return;
        }
        
        this.logUtil.putF(this.commonStrings.START + this.list.size(), this, this.commonStrings.PROCESS);
        
        if(!this.list.remove(this)) {
            this.logUtil.putF(this.commonStrings.EXCEPTION + ":GDGameProcessor", this, this.commonStrings.PROCESS);
        }

        //Device must be set before NullDisplayable is loaded by CurrentDisplayableFactory
        this.logUtil.putF("GDGamesModuleReadyProcessor - setDevice", this, this.commonStrings.INIT);
        this.setDevice();
        
        final GDGameModuleReadyProcessor miniSpaceWarsModuleReadyProcessor = new GDGameModuleReadyProcessor(this.initInterface, this.list);
        this.list.add(miniSpaceWarsModuleReadyProcessor);
        this.logUtil.putF(this.commonStrings.ADD + "GDGamesModuleReadyProcessor" + this.list.size(), this, this.commonStrings.PROCESS);
        this.alreadyDone = true;
        ((AllBinaryPlayNGame) this.initInterface).setLoadGameRunnableProcessor(miniSpaceWarsModuleReadyProcessor);
        this.initInterface = this.NULL_INIT;
        
        //ExplosionResources explosionResources = ExplosionResources.getInstance();
        //PlayerShipResources basicShipResources = PlayerShipResources.getInstance();
        if (GDGameHtmlLoadResourcesProcessorFactory.isTouch())
        {
            //this.logUtil.putF("touch", this, this.commonStrings.PROCESS);

            final StringArrayFactory stringArrayFactory = GDGameHtmlLoadResourcesProcessorFactory.getInstance();
            this.list.add(new GameHtmlLoadResourcesProcessor(this.list, stringArrayFactory));
            this.logUtil.putF(this.commonStrings.ADD + "GameHtmlLoadResourcesProcessor" + this.list.size(), this, this.commonStrings.PROCESS);

            final Processor gameHtmlHasLoadedResourcesProcessor = 
                new GameHtmlHasLoadedResourcesProcessor(this.list, stringArrayFactory);

            this.list.add(gameHtmlHasLoadedResourcesProcessor);
            this.logUtil.putF(this.commonStrings.ADD + "GameHtmlHasLoadedResourcesProcessor" + this.list.size(), this, this.commonStrings.PROCESS);
        }

        this.list.add(new MidletStartupProcessor(this.list));
        this.logUtil.putF(this.commonStrings.ADD + "MidletStartupProcessor" + this.list.size(), this, this.commonStrings.PROCESS);

        GDGameHtmlLoadResourcesProcessorFactory.loading();
    }
    
//    public String toString() {
//        return "GDGameProcessor";
//    }

    private native void setDevice()/*-{
        $wnd.org.microemu.device.DeviceFactory.setDevice(new $wnd.org.microemu.device.playn.PlaynDevice());
    }-*/;
    
}
