package org.allbinary.logic.system.security.licensing;

import org.allbinary.game.gd.canvas.GDGameSoftwareInfo;
import org.allbinary.logic.basic.string.CommonSeps;

public class GDGameAndroidMobileClientInformation extends
    MobileClientInformation
{
    public GDGameAndroidMobileClientInformation()
    {
        super(
                GDGameSoftwareInfo.getInstance().getName() + ANDROID_DESC, 
                GDGameSoftwareInfo.getInstance().getVersion(),
                GDGameSoftwareInfo.getInstance().getName() + ANDROID_DESC + 
                CommonSeps.getInstance().SPACE + 
                GDGameSoftwareInfo.getInstance().getVersion()
                );
    }
}
