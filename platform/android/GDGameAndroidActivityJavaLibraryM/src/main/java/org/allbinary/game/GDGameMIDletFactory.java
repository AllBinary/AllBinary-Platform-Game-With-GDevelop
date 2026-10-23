package org.allbinary.game;

import javax.microedition.midlet.MIDlet;

import org.allbinary.game.canvas.GDGameSoftwareInfo;
import org.allbinary.logic.NullUtil;
import org.allbinary.logic.system.security.licensing.GDGameClientInformationInterfaceFactory;
import org.allbinary.midlet.MidletFactoryInterface;

public class GDGameMIDletFactory extends MidletFactoryInterface {

    private static Object SINGLETON = NullUtil.getInstance().NULL_OBJECT;

    @Override
    public MIDlet getInstance() {
        if (GDGameMIDletFactory.SINGLETON == NullUtil.getInstance().NULL_OBJECT) {
            GDGameMIDletFactory.SINGLETON = new GDGameMIDlet(GDGameClientInformationInterfaceFactory.getFactoryInstance());
            GDGameSoftwareInfo.setTempClientInformation(GDGameClientInformationInterfaceFactory.getFactoryInstance().getInstance());
        }
        return (MIDlet) GDGameMIDletFactory.SINGLETON;
    }
}
