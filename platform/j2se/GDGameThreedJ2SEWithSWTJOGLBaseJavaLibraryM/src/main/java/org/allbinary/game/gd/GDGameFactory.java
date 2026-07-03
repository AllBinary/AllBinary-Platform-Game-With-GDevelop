package org.allbinary.game.gd;

import javax.microedition.midlet.MIDlet;

import org.allbinary.game.GDGameMIDlet;
import org.allbinary.logic.system.security.licensing.GDGameClientInformationInterfaceFactory;

import org.allbinary.midlet.MidletFactoryInterface;

public class GDGameFactory extends MidletFactoryInterface
{
    private static MIDlet SINGLETON = null;
    
    @Override
    public MIDlet getInstance()
    {
        if(GDGameFactory.SINGLETON == null)
        {
            GDGameFactory.SINGLETON = new GDGameMIDlet(GDGameClientInformationInterfaceFactory.getFactoryInstance());
        }
        return GDGameFactory.SINGLETON;
    }
}
