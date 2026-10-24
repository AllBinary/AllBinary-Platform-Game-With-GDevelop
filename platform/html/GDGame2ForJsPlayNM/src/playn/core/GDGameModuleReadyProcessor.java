/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package playn.core;

import org.allbinary.canvas.Processor;
import org.allbinary.init.InitInterface;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.playn.AllBinaryPlayNGame;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

/**
 * Blocks the processor queue (like GameHtmlHasLoadedResourcesProcessor does for touch
 * resources) until non_gwt_javascript.js has loaded GDGame.js and registered
 * $wnd.playn.core.GDGame, so GDGameMidletFactory.getInstance() can construct it.
 *
 * @author user
 */
public class GDGameModuleReadyProcessor
        extends Processor
{
    protected final LogUtil logUtil = LogUtil.getInstance();
    protected final CommonStrings commonStrings = CommonStrings.getInstance();
    
    private final InitInterface initInterface;
    private final BasicArrayList list;

    public GDGameModuleReadyProcessor(final InitInterface initInterface, final BasicArrayList list)
    {
        this.logUtil.putF(this.toString() + ":GDGameModuleReadyProcessor", this, this.commonStrings.CONSTRUCTOR);
        this.initInterface = initInterface;
        this.list = list;
    }

    public void process() throws Exception
    {
        this.logUtil.putF(this.commonStrings.START + ":GDGameModuleReadyProcessor", this, this.commonStrings.PROCESS);
        if (this.isGDGameReady() && this.isTouchButtonShieldActionResourceReady() && this.isAllBinaryMidletReady())
        {
            this.logUtil.putF(this.commonStrings.END + this.list.size(), this, this.commonStrings.PROCESS);
            if(!this.list.remove(this)) {
                this.logUtil.putF(this.commonStrings.EXCEPTION + ":GDGameModuleReadyProcessor", this, this.commonStrings.PROCESS);
            }

            this.initInterface.init();
            ((AllBinaryPlayNGame) this.initInterface).setLoadGameRunnableProcessor(Processor.getInstance());
        }
        //else stay at the head of the queue; process() is retried next tick
    }

    private native boolean isGDGameReady()/*-{
        return !!($wnd.playn && $wnd.playn.core && $wnd.playn.core.GDGame);
    }-*/;

    private native boolean isTouchButtonShieldActionResourceReady()/*-{
        return !!($wnd.org && $wnd.org.allbinary && $wnd.org.allbinary && $wnd.org.allbinary.ag && $wnd.org.allbinary.ag.input && $wnd.org.allbinary.ag.input.TouchButtonShieldActionResource);
    }-*/;

    private native boolean isAllBinaryMidletReady()/*-{
        return !!($wnd.org.allbinary.midlet.AllBinaryMidlet);
    }-*/;

}
