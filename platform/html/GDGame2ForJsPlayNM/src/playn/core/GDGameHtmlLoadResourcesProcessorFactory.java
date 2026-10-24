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

import org.allbinary.playn.processors.StringArrayFactory;

/**
 *
 * @author User
 */
public class GDGameHtmlLoadResourcesProcessorFactory {

    public static native void loading()/*-{
        $wnd.playn.core.GDGameHtmlLoadResourcesProcessorFactoryNI.loading();
    }-*/;

    public static native boolean isTouch()/*-{
        return $wnd.playn.core.GDGameHtmlLoadResourcesProcessorFactoryNI.isTouch();
    }-*/;

    public static native StringArrayFactory getInstance()/*-{
        return $wnd.playn.core.GDGameHtmlLoadResourcesProcessorFactoryNI.getInstance();
    }-*/;
    
}
