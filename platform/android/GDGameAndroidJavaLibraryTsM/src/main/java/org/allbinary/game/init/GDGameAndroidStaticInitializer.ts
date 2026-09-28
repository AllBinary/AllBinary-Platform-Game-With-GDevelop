
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { ResourceInitialization } from '../../../../org/allbinary/game/resource/ResourceInitialization.js';
//not GWT import const ResourceInitialization

import { ProgressCanvasFactory } from '../../../../org/allbinary/graphics/canvas/transition/progress/ProgressCanvasFactory.js';
//not GWT import const ProgressCanvasFactory

import { CommandListener } from '../../../../javax/microedition/lcdui/CommandListener.js';
//not GWT import const CommandListener

import { GDGameGameFeatures } from '../../../../org/allbinary/game/configuration/GDGameGameFeatures.js';
//not GWT import const GDGameGameFeatures

import { AbeClientInformationInterface } from '../../../../org/allbinary/logic/system/security/licensing/AbeClientInformationInterface.js';
//not GWT import const AbeClientInformationInterface

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameStaticInitializer } from './GDGameStaticInitializer.js';
//not GWT import - same folder const GDGameStaticInitializer

export class GDGameAndroidStaticInitializer extends GDGameStaticInitializer {
        

    private platformGameInitialized: boolean= false;

public constructor (resourceInitializationArray: ResourceInitialization[], portion: number){
            super(resourceInitializationArray, portion);
                    

                            //For kotlin this is before the body of the constructor.
                    
}


                //@Throws(Exception.constructor)
            
    public initKey(portion: number){
super.initKey(portion);
    
}


                //@Throws(Exception.constructor)
            
    public init(abeClientInformation: AbeClientInformationInterface, commandListener: CommandListener, level: number){
super.init(abeClientInformation, commandListener, level);
    

                        if(this.isPlatformGameInitialized())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                
this.setPlatformGameInitialized(true);
    
ProgressCanvasFactory.getInstance()!.addNormalPortion(50, "Game Options");
    
new GDGameGameFeatures().init();
    
}


    setPlatformGameInitialized(platformGameInitialized: boolean){
this.platformGameInitialized= platformGameInitialized;
    
}


    isPlatformGameInitialized(): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.platformGameInitialized;
    
}


}



