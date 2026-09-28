
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

        


            import { Exception } from '../../../../java/lang/Exception.js';
        
import { GameScrollMenuPaintable } from '../../../../org/allbinary/game/paint/GameScrollMenuPaintable.js';
//not GWT import const GameScrollMenuPaintable

import { MainGameDemoStatePaintable } from '../../../../org/allbinary/game/paint/MainGameDemoStatePaintable.js';
//not GWT import const MainGameDemoStatePaintable

import { OwnershipPaintable } from '../../../../org/allbinary/game/paint/OwnershipPaintable.js';
//not GWT import const OwnershipPaintable

import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory

import { Paintable } from '../../../../org/allbinary/graphics/paint/Paintable.js';
//not GWT import const Paintable

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDGameHelpPaintable } from './GDGameHelpPaintable.js';
//not GWT import - same folder const GDGameHelpPaintable

export class GDGameMenuPaintable extends GameScrollMenuPaintable {
        

public constructor (paintable: Paintable){
            super(new MainGameDemoStatePaintable(OwnershipPaintable.getInstance(), paintable), OwnershipPaintable.getInstance(), GDGameHelpPaintable.getInstance(), BasicColorFactory.getInstance()!.YELLOW);
                    

                            //For kotlin this is before the body of the constructor.
                    
}


}



