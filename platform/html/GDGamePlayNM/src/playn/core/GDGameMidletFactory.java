/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package playn.core;

import javax.microedition.midlet.MIDlet;
import org.allbinary.midlet.MidletFactoryInterface;

/**
 *
 * @author user
 */
public class GDGameMidletFactory
    extends MidletFactoryInterface {

    public MIDlet getInstance() {
        return new GDGame();
    }
}
