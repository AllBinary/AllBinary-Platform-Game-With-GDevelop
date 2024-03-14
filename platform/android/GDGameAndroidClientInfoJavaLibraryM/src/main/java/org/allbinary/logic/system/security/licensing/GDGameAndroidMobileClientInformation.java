package org.allbinary.logic.system.security.licensing;

import org.allbinary.logic.system.security.licensing.MobileClientInformation;
import org.allbinary.game.canvas.GDGameSoftwareInfo;

import org.allbinary.logic.string.CommonSeps;

public class GDGameAndroidMobileClientInformation 
extends MobileClientInformation
{
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
