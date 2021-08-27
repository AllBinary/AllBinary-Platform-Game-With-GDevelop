package org.allbinary.business.advertisement;

import org.allbinary.game.GameAdState;
import org.allbinary.game.gd.canvas.GDGameSoftwareInfo;

import org.allbinary.logic.system.SoftwareInformation;

public class GameAdStateFactory
{
    private static final GameAdStateFactory instance = new GameAdStateFactory();

    public static GameAdStateFactory getInstance()
    {
        return instance;
    }

    private final GameAdState[] gameAdStateArray = {
            new GameAdState(new GDGameAdConfiguration())
            };

    private GameAdState gameAdState;

    public GameAdState getCurrentInstance()
    {
        return this.gameAdState;
    }
    
    public GameAdState getInstance(SoftwareInformation softwareInformation)
    throws Exception
    {
        if(softwareInformation == GDGameSoftwareInfo.getInstance())
        {
            this.gameAdState = gameAdStateArray[0];
            
            return gameAdStateArray[0];
        }
        else
        {
            throw new Exception("No Such Ad Configuration: " + softwareInformation);
        }
    }
}
