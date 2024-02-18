package org.allbinary.game.canvas;

import org.allbinary.logic.system.SoftwareInformation;

public class GDGameSoftwareInfo
{
    private static final SoftwareInformation SINGLETON = 
        new SoftwareInformation("GDGameThreed", "1.2.0");

    public static SoftwareInformation getInstance()
    {
        return SINGLETON;
    }
}
