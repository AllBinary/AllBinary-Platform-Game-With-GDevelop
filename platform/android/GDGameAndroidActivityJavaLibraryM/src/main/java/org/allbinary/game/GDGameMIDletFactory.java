package org.allbinary.game;

import javax.microedition.midlet.MIDlet;

import org.allbinary.game.canvas.GDGameSoftwareInfo;
import org.allbinary.logic.system.security.licensing.GDGameClientInformationInterfaceFactory;
import org.allbinary.midlet.MidletFactoryInterface;

public class GDGameMIDletFactory extends MidletFactoryInterface {

    private static MIDlet SINGLETON = null;

    @Override
    public MIDlet getInstance() {
        if (SINGLETON == null) {
            SINGLETON = new GDGameMIDlet(GDGameClientInformationInterfaceFactory.getFactoryInstance());
            GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION = GDGameClientInformationInterfaceFactory.getFactoryInstance().getInstance();
        }
        return SINGLETON;
    }
}
