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

import org.allbinary.canvas.Processor;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.playn.AllBinaryPlayNGame;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import playn.html.HtmlPlatform;

/**
 *
 * @author User
 */
public class AllBinaryPlayNGameRunnableProcessor extends Processor {
    
    protected final LogUtil logUtil = LogUtil.getInstance();
    protected final CommonStrings commonStrings = CommonStrings.getInstance();
    
    private final String WAITING_DEVICEFACTORY = "waiting on org.microemu.device.DeviceFactory to load";
    //private final String WAITING_UIFACTORY = "waiting on org.microemu.device.ui.UIFactory to load";
    private final String WAITING_BRIDGE = "waiting on org.microemu.MIDletBridge to load";
    private final String WAITING_PLAYN_CANVAS_GRAPHICS = "waiting on org.microemu.device.playn.PlaynCanvasDisplayGraphics to load";
    
    private final String WAITING = "waiting on AllBinaryPlayNGameRunnable to load";
    private final String WAITING2 = "waiting on OpenGLES to load";
    
    private final HtmlPlatform platform;
    private final BasicArrayList list;
    private final AllBinaryPlayNGame initInterface;
    
    public final GDGameProcessor gdGameProcessor;

    public AllBinaryPlayNGameRunnableProcessor(final HtmlPlatform platform, final GDGameProcessor gdGameProcessor, final BasicArrayList list)
    {
        this.logUtil.putF(this.toString() + ":AllBinaryPlayNGameRunnableProcessor", this, this.commonStrings.CONSTRUCTOR);
        this.platform = platform;
        this.list = list;
        this.gdGameProcessor = gdGameProcessor;
        this.initInterface = new AllBinaryPlayNGame(this.platform, new GDGameMidletFactory(), this, true);
        this.initInterface.updateRate = this.initInterface.waitFrameRate;
    }

    @Override
    public void process() {
        
        if(!this.isDeviceFactoryLoaded()) {
            this.logUtil.putF(WAITING_DEVICEFACTORY, this, this.commonStrings.PROCESS);
            return;
        }

        if(!this.isMIDletBridgeLoaded()) {
            this.logUtil.putF(WAITING_BRIDGE, this, this.commonStrings.PROCESS);
            return;
        }

        if(!this.isPlaynCanvasDisplayGraphicsLoaded()) {
            this.logUtil.putF(WAITING_PLAYN_CANVAS_GRAPHICS, this, this.commonStrings.PROCESS);
            return;
        }
                
        if(!this.isAllBinaryPlayNGameRunnableReady()) {
            this.logUtil.putF(WAITING, this, this.commonStrings.PROCESS);
            return;
        }

        if(!this.isOpenGLESPackageLoaded()) {
            this.logUtil.putF(WAITING2, this, this.commonStrings.PROCESS);
            return;
        }

//        if(!this.isModuleLoaded("./org/microemu/device/ui/UIFactory.js")) {
//            this.logUtil.putF(WAITING_UIFACTORY, this, this.commonStrings.PROCESS);
//            return;
//        }

        this.logUtil.putF(this.commonStrings.START + this.list.size(), this, this.commonStrings.PROCESS);
        
        if(!this.list.remove(this)) {
            this.logUtil.putF(this.commonStrings.EXCEPTION + ":AllBinaryPlayNGameRunnableProcessor", this, this.commonStrings.PROCESS);
        }
        
        final Object gameRunnable = this.createGameRunnable(this.list);
        this.initInterface.setUsedRunnable(gameRunnable);
        this.logUtil.putF(this.commonStrings.INIT + this.list.size(), this, this.commonStrings.PROCESS);
        this.gdGameProcessor.setInitInterface(this.initInterface);
        this.initInterface.setLoadGameRunnableProcessor(this.gdGameProcessor);
    }

    private native boolean isDeviceFactoryLoaded()/*-{
        return !!($wnd.org && $wnd.org.microemu && $wnd.org.microemu.device && $wnd.org.microemu.device.DeviceFactory);
    }-*/;
    
    private native boolean isMIDletBridgeLoaded()/*-{
        return !!($wnd.org.microemu && $wnd.org.microemu.MIDletBridge);
    }-*/;
    
    private native boolean isPlaynCanvasDisplayGraphicsLoaded()/*-{
        return !!($wnd.org.microemu.device.playn && $wnd.org.microemu.device.playn.PlaynCanvasDisplayGraphics);
    }-*/;
    
    private native boolean isAllBinaryPlayNGameRunnableReady()/*-{
        return !!($wnd.org.allbinary.playn.AllBinaryPlayNGameRunnable);
    }-*/;

    private native boolean isOpenGLESPackageLoaded()/*-{
        return !!($wnd.org.allbinary.graphics.opengles);
    }-*/;

//    private native boolean isModuleLoaded(String module)/*-{
//        return !!($wnd.loadedModuleFiles && $wnd.loadedModuleFiles[module]);
//    }-*/;
    
    private native Object createGameRunnable(final BasicArrayList list)/*-{
        return new $wnd.org.allbinary.playn.AllBinaryPlayNGameRunnable(list);
    }-*/;

}
