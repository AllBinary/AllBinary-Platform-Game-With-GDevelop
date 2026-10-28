
        /*
                * 
                *  AllBinary Open License Version 1
                *  Copyright (c) 2011 AllBinary
                *  
                *  By agreeing to this license you and any business entity you represent are
                *  legally bound to the AllBinary Open License Version 1 legal agreement.
                *  
                *  You may obtain the AllBinary Open License Version 1 legal agreement from
                *  AllBinary or the root directory of AllBinary's AllBinary Platform repository.
                *  
                *  Created By: Travis Berthelot  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../java/lang/Object.js';
        
import { GameKeyFactory } from '../../../../../org/allbinary/game/input/GameKeyFactory.js';
//not GWT import const GameKeyFactory

import { GameInputMapping } from '../../../../../org/allbinary/game/input/mapping/GameInputMapping.js';
//not GWT import const GameInputMapping

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDGameGameInputMappingFactory
            extends Object
         {
        

    private static readonly SINGLETON: GDGameGameInputMappingFactory = new GDGameGameInputMappingFactory();

    public static getInstance(): GDGameGameInputMappingFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameGameInputMappingFactory.SINGLETON;
    
}


    private gameInputMappingArray: GameInputMapping[] = new Array(7);

public constructor (){

            super();
        
    var gameKeyFactory: GameKeyFactory = GameKeyFactory.getInstance()!;;
    
this.gameInputMappingArray[0]= new GameInputMapping("Fire", gameKeyFactory!.KEY_NUM1);
    
this.gameInputMappingArray[1]= new GameInputMapping("Up", gameKeyFactory!.UP);
    
this.gameInputMappingArray[2]= new GameInputMapping("Left", gameKeyFactory!.LEFT);
    
this.gameInputMappingArray[3]= new GameInputMapping("Right", gameKeyFactory!.RIGHT);
    
this.gameInputMappingArray[4]= new GameInputMapping("Down", gameKeyFactory!.DOWN);
    
this.gameInputMappingArray[5]= new GameInputMapping("Zoom Out", gameKeyFactory!.KEY_NUM3);
    
this.gameInputMappingArray[6]= new GameInputMapping("Zoom In", gameKeyFactory!.KEY_NUM0);
    
}


    public get(): GameInputMapping[]{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameInputMappingArray;
    
}


}



