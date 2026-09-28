
        /* Generated Code Do Not Modify */

        


import { MIDlet } from '../../../../javax/microedition/midlet/MIDlet.js';
//not GWT import const MIDlet

import { GDGameMIDlet } from '../../../../org/allbinary/game/GDGameMIDlet.js';
//not GWT import const GDGameMIDlet

import { GDGameClientInformationInterfaceFactory } from '../../../../org/allbinary/logic/system/security/licensing/GDGameClientInformationInterfaceFactory.js';
//not GWT import const GDGameClientInformationInterfaceFactory

import { MidletFactoryInterface } from '../../../../org/allbinary/midlet/MidletFactoryInterface.js';
//not GWT import const MidletFactoryInterface

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameFactory extends MidletFactoryInterface {
        

    private static SINGLETON: MIDlet = 
                null
            ;

    public getInstance(): MIDlet{

                        if(GDGameFactory.SINGLETON == 
                                    null
                                )
                        
                                    {
                                    GDGameFactory.SINGLETON= new GDGameMIDlet(GDGameClientInformationInterfaceFactory.getFactoryInstance());
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameFactory.SINGLETON;
    
}


}



