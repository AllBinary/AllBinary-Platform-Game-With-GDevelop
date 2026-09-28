
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

        


            import { Exception } from '../../../../../java/lang/Exception.js';
        
import { Graphics } from '../../../../../javax/microedition/lcdui/Graphics.js';
//not GWT import const Graphics

import { GDGameLayer } from '../../../../../org/allbinary/game/layer/GDGameLayer.js';
//not GWT import const GDGameLayer

import { PathFindingLayerInterface } from '../../../../../org/allbinary/game/layer/PathFindingLayerInterface.js';
//not GWT import const PathFindingLayerInterface

import { GDObject } from '../../../../../org/allbinary/game/layout/GDObject.js';
//not GWT import const GDObject

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDBehavior } from './GDBehavior.js';
//not GWT import - same folder const GDBehavior

export class PathFindingBehavior extends GDBehavior {
        

    private static readonly instance: PathFindingBehavior = new PathFindingBehavior();

    public static getInstance(): PathFindingBehavior{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return PathFindingBehavior.instance;
    
}


private constructor (){

            super();
        }


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
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public setTarget(sourceGameLayer: GDGameLayer, targetGameLayer: GDGameLayer, x: number, y: number){
targetGameLayer!.setAllBinaryGameLayerManager(sourceGameLayer!.allBinaryGameLayerManagerP);
    

    var pathFindingLayerInterface: PathFindingLayerInterface = (sourceGameLayer as PathFindingLayerInterface);;
    
pathFindingLayerInterface!.setTarget(targetGameLayer as PathFindingLayerInterface);
    
}


}



