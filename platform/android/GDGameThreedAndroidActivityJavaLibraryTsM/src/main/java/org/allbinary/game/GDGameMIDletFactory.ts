
        /* Generated Code Do Not Modify */

        


import { MIDlet } from '../../../javax/microedition/midlet/MIDlet.js';
//not GWT import const MIDlet

import { GDGameSoftwareInfo } from '../../../org/allbinary/game/canvas/GDGameSoftwareInfo.js';
//not GWT import const GDGameSoftwareInfo

import { GDGameClientInformationInterfaceFactory } from '../../../org/allbinary/logic/system/security/licensing/GDGameClientInformationInterfaceFactory.js';
//not GWT import const GDGameClientInformationInterfaceFactory

import { MidletFactoryInterface } from '../../../org/allbinary/midlet/MidletFactoryInterface.js';
//not GWT import const MidletFactoryInterface

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameMIDlet } from './GDGameMIDlet.js';
//not GWT import - same folder const GDGameMIDlet

export class GDGameMIDletFactory extends MidletFactoryInterface {
        

    private static SINGLETON: MIDlet = 
                null
            ;

    public getInstance(): MIDlet{

                        if(GDGameMIDletFactory.SINGLETON == 
                                    null
                                )
                        
                                    {
                                    GDGameMIDletFactory.SINGLETON= new GDGameMIDlet(GDGameClientInformationInterfaceFactory.getFactoryInstance());
    
GDGameSoftwareInfo.TEMP_HACK_CLIENT_INFORMATION= GDGameClientInformationInterfaceFactory.getFactoryInstance()!.getInstance();
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameMIDletFactory.SINGLETON;
    
}


}



