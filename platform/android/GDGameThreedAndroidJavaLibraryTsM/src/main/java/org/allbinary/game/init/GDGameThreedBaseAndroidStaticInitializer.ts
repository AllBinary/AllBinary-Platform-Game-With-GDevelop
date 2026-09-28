
        /* Generated Code Do Not Modify */

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { CommandListener } from '../../../../javax/microedition/lcdui/CommandListener.js';
//not GWT import const CommandListener

import { ResourceInitialization } from '../../../../org/allbinary/game/resource/ResourceInitialization.js';
//not GWT import const ResourceInitialization

import { GDGameGameFeatures } from '../../../../org/allbinary/game/gd/configuration/GDGameGameFeatures.js';
//not GWT import const GDGameGameFeatures

import { ProgressCanvasFactory } from '../../../../org/allbinary/graphics/canvas/transition/progress/ProgressCanvasFactory.js';
//not GWT import const ProgressCanvasFactory

import { AbeClientInformationInterface } from '../../../../org/allbinary/logic/system/security/licensing/AbeClientInformationInterface.js';
//not GWT import const AbeClientInformationInterface

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameStaticInitializer } from './GDGameStaticInitializer.js';
//not GWT import - same folder const GDGameStaticInitializer

export class GDGameThreedBaseAndroidStaticInitializer extends GDGameStaticInitializer {
        

    private androidGameInitialized: boolean= false;

public constructor (resourceInitializationArray: ResourceInitialization[], portion: number){
            super(resourceInitializationArray, portion);
                    

                            //For kotlin this is before the body of the constructor.
                    
}


                //@Throws(Exception.constructor)
            
    public initKey(portion: number){
super.initKey(portion);
    
ProgressCanvasFactory.getInstance()!.addNormalPortion(50, "Game Keys");
    
}


                //@Throws(Exception.constructor)
            
    public init(abeClientInformation: AbeClientInformationInterface, commandListener: CommandListener, level: number){
super.init(abeClientInformation, commandListener, level);
    

                        if(this.isAndroidGameInitialized())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                
this.setAndroidGameInitialized(true);
    
new GDGameGameFeatures().init();
    
ProgressCanvasFactory.getInstance()!.addNormalPortion(50, "Game Options");
    
}


    setAndroidGameInitialized(androidGameInitialized: boolean){
this.androidGameInitialized= androidGameInitialized;
    
}


    isAndroidGameInitialized(): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.androidGameInitialized;
    
}


}



