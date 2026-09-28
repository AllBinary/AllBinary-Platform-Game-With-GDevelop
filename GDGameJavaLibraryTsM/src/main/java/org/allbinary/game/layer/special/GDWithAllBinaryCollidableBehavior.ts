
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

        


            import { Exception } from '../../../../../java/lang/Exception.js';
        
import { CollidableBaseBehavior } from '../../../../../org/allbinary/game/collision/CollidableBaseBehavior.js';
//not GWT import const CollidableBaseBehavior

import { CollidableInterfaceCompositeInterface } from '../../../../../org/allbinary/game/collision/CollidableInterfaceCompositeInterface.js';
//not GWT import const CollidableInterfaceCompositeInterface

import { GroupInterface } from '../../../../../org/allbinary/game/identification/GroupInterface.js';
//not GWT import const GroupInterface

import { CollidableCompositeLayer } from '../../../../../org/allbinary/game/layer/CollidableCompositeLayer.js';
//not GWT import const CollidableCompositeLayer

import { GDNode } from '../../../../../org/allbinary/game/layout/GDNode.js';
//not GWT import const GDNode

//not plain js import { ForcedLogUtil } 
const ForcedLogUtil = globalThis.org.allbinary.logic.communication.log.ForcedLogUtil;

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDConditionWithGroupActions } from './GDConditionWithGroupActions.js';
//not GWT import - same folder const GDConditionWithGroupActions
import { CollidableDestroyableDamageableLayer } from './CollidableDestroyableDamageableLayer.js';
//not GWT import - same folder const CollidableDestroyableDamageableLayer
import { TempGameLayerUtil } from './TempGameLayerUtil.js';
//not GWT import - same folder const TempGameLayerUtil

export class GDWithAllBinaryCollidableBehavior extends CollidableBaseBehavior {
        

    public readonly conditionWIthGroupActions: GDConditionWithGroupActions;

public constructor (collidableBehavior: GDConditionWithGroupActions, collidable: boolean){
            super(collidable);
                    

                            //For kotlin this is before the body of the constructor.
                    
this.conditionWIthGroupActions= collidableBehavior;
    
}


    private readonly IS_COLLISION: string = "isCollision";

    public isCollision(ownerLayer: CollidableCompositeLayer, collisionLayer: CollidableCompositeLayer): boolean{

                        if(getCollidableInferface = collisionLayer!.getCollidableInferface()getCollidableInferface as GDWithAllBinaryCollidableBehavior
getCollidableInferface.
                    conditionWIthGroupActions!.groupWithActionsList!.size() > 0)
                        
                                    {
                                    
                        if(ownerLayer!.getGroupInterface()[0] != collisionLayer!.getGroupInterface()[0])
                        
                                    {
                                    
                        if(ownerLayer != collisionLayer)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return super.isCollision(ownerLayer, collisionLayer);;
    

                                    }
                                

                                    }
                                

                                    }
                                
                        else {
                            
                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public collide(ownerLayer: CollidableCompositeLayer, collisionLayer: CollidableCompositeLayer){

                        if((collisionLayer as CollidableDestroyableDamageableLayer).isDestroyed())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

                        if((ownerLayer as CollidableDestroyableDamageableLayer).isDestroyed())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

                        if(this.conditionWIthGroupActions!.groupWithActionsList!.size() > 0)
                        
                                    {
                                    
    var groupInterfaceArray: GroupInterface[] = collisionLayer!.getGroupInterface()!;;
    

    var size: number = groupInterfaceArray!.length
                ;;
    

    var indexOfGroup: number= 0;;
    

    var node: GDNode;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
indexOfGroup= this.conditionWIthGroupActions!.groupWithActionsList!.indexOf(groupInterfaceArray[index]!);
    

                        if(indexOfGroup >= 0)
                        
                                    {
                                    node= (this.conditionWIthGroupActions!.actionForGroupsList!.get(indexOfGroup) as GDNode);
    

    var tempGameLayerUtil: TempGameLayerUtil = TempGameLayerUtil.getInstance()!;;
    
tempGameLayerUtil!.clear();
    
tempGameLayerUtil!.gameLayerArray[0]= ownerLayer;
    
tempGameLayerUtil!.gameLayerArray[1]= collisionLayer;
    
tempGameLayerUtil!.clear2();
    

                                    }
                                
}


                                    }
                                
                        else {
                            
                        }
                            
}


    public isCollisionInterface(ownerLayer: CollidableCompositeLayer, collidableInterfaceCompositeInterface: CollidableInterfaceCompositeInterface): boolean{
ForcedLogUtil.log("No Longer Used", this);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false;
    
}


                //@Throws(Exception.constructor)
            
    public collideInterface(ownerLayer: CollidableCompositeLayer, collidableInterfaceCompositeInterface: CollidableInterfaceCompositeInterface){
ForcedLogUtil.log("No Longer Used", this);
    
}


    public toString(ownerLayer: CollidableCompositeLayer, collisionLayer: CollidableCompositeLayer, stringBuilder: StringMaker): string{

    var stringUtil: StringUtil = StringUtil.getInstance()!;;
    

    var size: number = ownerLayer!.getGroupInterface()!.length;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
stringBuilder!.append(stringUtil!.toString(ownerLayer!.getGroupInterface()[index]!));
    
}

stringBuilder!.append(" != ");
    
size= collisionLayer!.getGroupInterface()!.length;
    




                        for (
    var index: number = 0;index < size; index++)
        {
stringBuilder!.append(stringUtil!.toString(collisionLayer!.getGroupInterface()[index]!));
    
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuilder!.toString();;
    
}


}



