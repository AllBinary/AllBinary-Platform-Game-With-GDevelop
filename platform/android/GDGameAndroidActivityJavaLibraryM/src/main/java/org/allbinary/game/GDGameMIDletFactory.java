package org.allbinary.game;

import javax.microedition.midlet.MIDlet;
import org.allbinary.midlet.MidletFactoryInterface;

public class GDGameMIDletFactory extends MidletFactoryInterface {

    private static MIDlet SINGLETON = null;

    public MIDlet getInstance() {
        if (SINGLETON == null) {
            SINGLETON = new GDGameMIDlet();
        }
        return SINGLETON;
    }
}
