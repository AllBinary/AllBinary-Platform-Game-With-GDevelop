
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../java/lang/Exception.js';
        
import { GameAdState } from '../../../../org/allbinary/game/GameAdState.js';
//not GWT import const GameAdState

import { GDGameSoftwareInfo } from '../../../../org/allbinary/game/canvas/GDGameSoftwareInfo.js';
//not GWT import const GDGameSoftwareInfo

import { SoftwareInformation } from '../../../../org/allbinary/logic/system/SoftwareInformation.js';
//not GWT import const SoftwareInformation

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GameAdStateFactoryInterface } from './GameAdStateFactoryInterface.js';
//not GWT import - same folder const GameAdStateFactoryInterface
import { GDGameAdConfiguration } from './GDGameAdConfiguration.js';
//not GWT import - same folder const GDGameAdConfiguration
import { GameAdStateBase } from './GameAdStateBase.js';
//not GWT import - same folder const GameAdStateBase

export class GameAdStateFactory
            extends Object
         implements GameAdStateFactoryInterface {
        

    private static readonly instance: GameAdStateFactory = new GameAdStateFactory();

    public static getInstance(): GameAdStateFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance;
    
}


    private readonly gameAdStateArray: GameAdState[] = 
                                                        [
                                                            new GameAdState(new GDGameAdConfiguration())
                                                        ];

    private gameAdState: GameAdState;

    public getCurrentInstance(): GameAdState{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameAdState;
    
}


                //@Throws(Exception.constructor)
            
    public getInstanceForApp(softwareInformation: SoftwareInformation): GameAdStateBase{

                        if(softwareInformation == GDGameSoftwareInfo.getInstance())
                        
                                    {
                                    this.gameAdState= gameAdStateArray[0]!;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return gameAdStateArray[0]!;
    

                                    }
                                
                        else {
                            


                            throw new Exception("No Such Ad Configuration: " +softwareInformation);
                    

                        }
                            
}


}



