package org.allbinary.game.gd;

import javax.microedition.midlet.MIDlet;

import org.allbinary.game.GDGameMIDlet;
import org.allbinary.logic.system.security.licensing.GDGameClientInformationInterfaceFactory;

import org.allbinary.midlet.MidletFactoryInterface;

public class GDGameFactory extends MidletFactoryInterface
{
    private static MIDlet SINGLETON = null;
    
    public MIDlet getInstance()
    {
        if(SINGLETON == null)
        {
            SINGLETON = new GDGameMIDlet(GDGameClientInformationInterfaceFactory.getFactoryInstance());
        }
        return SINGLETON;
    }
}
