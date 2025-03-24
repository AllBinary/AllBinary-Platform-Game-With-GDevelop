/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
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
package org.allbinary.logic.system.security.licensing;

import org.allbinary.string.CommonSeps;
import org.allbinary.game.canvas.GDGameSoftwareInfo;


public class GDGamePCClientInformation
extends AbeClientInformation
{
    protected static final GDGamePCClientInformation instance = new GDGamePCClientInformation();
    
    private final static String PC_DESC = "PC";
    public GDGamePCClientInformation()
    {
        super(
                GDGameSoftwareInfo.getInstance().getName() + PC_DESC,
                GDGameSoftwareInfo.getInstance().getVersion(),
                GDGameSoftwareInfo.getInstance().getName() + PC_DESC +
                CommonSeps.getInstance().SPACE + 
                GDGameSoftwareInfo.getInstance().getVersion(),
                GDGameSoftwareInfo.getInstance().toShortString()
                );
    }
}
