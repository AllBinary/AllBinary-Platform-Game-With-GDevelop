
        /*
                *  
                *  To change this template, choose Tools | Templates  and open the template in the editor.  
        */
        
        /* Generated Code Do Not Modify */

        


import { MIDlet } from '../../javax/microedition/midlet/MIDlet.js';
//not GWT import const MIDlet

import { MidletFactoryInterface } from '../../org/allbinary/midlet/MidletFactoryInterface.js';
//not GWT import const MidletFactoryInterface

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        //not plain js - same folder import { GDGame } 
const GDGame = globalThis.playn.core.GDGame;

export class GDGameMidletFactory extends MidletFactoryInterface {
        

    public getInstance(): MIDlet{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDGame();
    
}


}



