
        /* Generated Code Do Not Modify */

        


import { GDGameSoftwareInfo } from '../../../../../../org/allbinary/game/canvas/GDGameSoftwareInfo.js';
//not GWT import const GDGameSoftwareInfo

//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { MobileClientInformation } from './MobileClientInformation.js';
//not GWT import - same folder const MobileClientInformation

export class GDGameAndroidMobileClientInformation extends MobileClientInformation {
        

    static readonly instance: GDGameAndroidMobileClientInformation = new GDGameAndroidMobileClientInformation();

public constructor (){
            super(GDGameSoftwareInfo.getInstance()!.getName() +ANDROID_DESC, GDGameSoftwareInfo.getInstance()!.getVersion(), GDGameSoftwareInfo.getInstance()!.getName() +ANDROID_DESC +CommonSeps.getInstance()!.SPACE +GDGameSoftwareInfo.getInstance()!.getVersion(), GDGameSoftwareInfo.getInstance()!.toShortString());
                    

                            //For kotlin this is before the body of the constructor.
                    
}


}



