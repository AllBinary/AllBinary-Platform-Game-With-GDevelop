
        /* Generated Code Do Not Modify */

        


import { MIDlet } from '../../../javax/microedition/midlet/MIDlet.js';
//not GWT import const MIDlet

import { GDGameSoftwareInfo } from '../../../org/allbinary/game/canvas/GDGameSoftwareInfo.js';
//not GWT import const GDGameSoftwareInfo

//not plain js import { NullUtil } 
const NullUtil = globalThis.org.allbinary.logic.NullUtil;

import { GDGameClientInformationInterfaceFactory } from '../../../org/allbinary/logic/system/security/licensing/GDGameClientInformationInterfaceFactory.js';
//not GWT import const GDGameClientInformationInterfaceFactory

import { MidletFactoryInterface } from '../../../org/allbinary/midlet/MidletFactoryInterface.js';
//not GWT import const MidletFactoryInterface

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameMIDlet } from './GDGameMIDlet.js';
//not GWT import - same folder const GDGameMIDlet

export class GDGameMIDletFactory extends MidletFactoryInterface {
        

    private static SINGLETON: any = NullUtil.getInstance()!.NULL_OBJECT;

    public getInstance(): MIDlet{

                        if(GDGameMIDletFactory.SINGLETON == NullUtil.getInstance()!.NULL_OBJECT)
                        
                                    {
                                    GDGameMIDletFactory.SINGLETON= new GDGameMIDlet(GDGameClientInformationInterfaceFactory.getFactoryInstance());
    
GDGameSoftwareInfo.setTempClientInformation(GDGameClientInformationInterfaceFactory.getFactoryInstance()!.getInstance());
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameMIDletFactory.SINGLETON as MIDlet;
    
}


}



