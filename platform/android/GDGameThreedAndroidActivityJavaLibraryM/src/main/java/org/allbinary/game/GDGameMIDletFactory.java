package org.allbinary.game;

import javax.microedition.midlet.MIDlet;

import org.allbinary.game.canvas.GDGameSoftwareInfo;
import org.allbinary.logic.system.security.licensing.GDGameClientInformationInterfaceFactory;
import org.allbinary.midlet.MidletFactoryInterface;

public class GDGameMIDletFactory extends MidletFactoryInterface {

    private static MIDlet SINGLETON = null;

    @Override
    public MIDlet getInstance() {
        if (GDGameMIDletFactory.SINGLETON == null) {
            GDGameMIDletFactory.SINGLETON = new GDGameMIDlet(GDGameClientInformationInterfaceFactory.getFactoryInstance());
            GDGameSoftwareInfo.setTempClientInformation(GDGameClientInformationInterfaceFactory.getFactoryInstance().getInstance());
        }
        return GDGameMIDletFactory.SINGLETON;
    }
}
