
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2022 AllBinary 
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

        


            import { Integer } from '../../../../java/lang/Integer.js';
        
import { Graphics } from '../../../../javax/microedition/lcdui/Graphics.js';
//not GWT import const Graphics

import { TiledLayer } from '../../../../javax/microedition/lcdui/game/TiledLayer.js';
//not GWT import const TiledLayer

import { BasicColorFactory } from '../../../../org/allbinary/graphics/color/BasicColorFactory.js';
//not GWT import const BasicColorFactory

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { AllBinaryJ2METiledLayer } from './AllBinaryJ2METiledLayer.js';
//not GWT import - same folder const AllBinaryJ2METiledLayer

export class PlacementAllBinaryJ2METiledLayer extends AllBinaryJ2METiledLayer {
        

public constructor (dataId: Integer, tiledLayer: TiledLayer, i_Map2DArray: number[][], debugColor: number){
            super(dataId, tiledLayer, i_Map2DArray, debugColor);
                    

                            //For kotlin this is before the body of the constructor.
                    
}


    public setPosition(x: number, y: number, z: number){
super.setPosition(x, y, z);
    
}


    public paint(graphics: Graphics){
super.paint(graphics);
    
}


    private readonly colorArray: number[] = [BasicColorFactory.getInstance()!.RED.intValue(), BasicColorFactory.getInstance()!.GREEN.intValue(), BasicColorFactory.getInstance()!.YELLOW.intValue(), BasicColorFactory.getInstance()!.BLUE.intValue()];

    public paintPlacementDebug(graphics: Graphics){
}


}



