package org.allbinary.logic.system.security.licensing;

import org.allbinary.game.canvas.GDGameSoftwareInfo;

import org.allbinary.string.CommonSeps;

public class GDGameAndroidMobileClientInformation 
extends MobileClientInformation
{
    public static final GDGameAndroidMobileClientInformation instance = new GDGameAndroidMobileClientInformation();
    
    public GDGameAndroidMobileClientInformation()
    {
        super(
                GDGameSoftwareInfo.getInstance().getName() + ANDROID_DESC,
                GDGameSoftwareInfo.getInstance().getVersion(),
                GDGameSoftwareInfo.getInstance().getName() + ANDROID_DESC +
                CommonSeps.getInstance().SPACE + 
                GDGameSoftwareInfo.getInstance().getVersion(),
                GDGameSoftwareInfo.getInstance().toShortString()
                );
    }
}
