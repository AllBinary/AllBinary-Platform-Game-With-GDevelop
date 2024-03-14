package org.allbinary.game;

import javax.microedition.midlet.MIDlet;

import org.allbinary.game.canvas.GDGameSoftwareInfo;
import org.allbinary.logic.system.security.licensing.GDGameClientInformationInterfaceFactory;
import org.allbinary.midlet.MidletFactoryInterface;

public class GDGameMIDletFactory extends MidletFactoryInterface {

    private static MIDlet SINGLETON = null;

    public MIDlet getInstance() {
        if (SINGLETON == null) {
            GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION = GDGameClientInformationInterfaceFactory.getInstance();
            SINGLETON = new GDGameMIDlet(GDGameClientInformationInterfaceFactory.getInstance());
        }
        return SINGLETON;
    }
}
