
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

        


import { Graphics } from '../../../../../javax/microedition/lcdui/Graphics.js';
//not GWT import const Graphics

import { GDGameLayer } from '../../../../../org/allbinary/game/layer/GDGameLayer.js';
//not GWT import const GDGameLayer

import { GDObject } from '../../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

import { GameTickDisplayInfoSingleton } from '../../../../../org/allbinary/graphics/displayable/GameTickDisplayInfoSingleton.js';
//not GWT import const GameTickDisplayInfoSingleton

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDBehavior } from './GDBehavior.js';
//not GWT import - same folder const GDBehavior

export class DestroyOutsideBehavior extends GDBehavior {
        

    private readonly gameTickDisplayInfoSingleton: GameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance()!;

    public process(gameLayerList: BasicArrayList, index: number, graphics: Graphics): boolean{

    var gameLayer: GDGameLayer = gameLayerList!.get(index) as GDGameLayer;;
    

    var gdObject: GDObject = gameLayer!.gdObject;;
    

                        if(gdObject == 
                                    null
                                )
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    

                                    }
                                

                        if(gdObject!.x > this.SceneWindowWidth() +gdObject!.Width(graphics))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                

                        if(gdObject!.y > this.SceneWindowHeight() +gdObject!.Width(graphics))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                

                        if(gdObject!.y <  -gdObject!.Width(graphics))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                

                        if(gdObject!.x <  -gdObject!.Height(graphics))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true;
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


    public SceneWindowWidth(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameTickDisplayInfoSingleton!.getLastWidth();;
    
}


    public SceneWindowHeight(): number{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gameTickDisplayInfoSingleton!.getLastHeight();;
    
}


}



