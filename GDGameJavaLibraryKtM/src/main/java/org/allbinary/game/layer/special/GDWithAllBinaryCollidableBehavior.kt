
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
        package org.allbinary.game.layer.special




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.collision.CollidableBaseBehavior
import org.allbinary.game.collision.CollidableInterfaceCompositeInterface
import org.allbinary.game.identification.GroupInterface
import org.allbinary.game.layer.CollidableCompositeLayer
import org.allbinary.game.layout.GDNode
import org.allbinary.logic.communication.log.ForcedLogUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.StringUtil

open public class GDWithAllBinaryCollidableBehavior : CollidableBaseBehavior {
        

    val conditionWIthGroupActions: GDConditionWithGroupActions
public constructor (collidableBehavior: GDConditionWithGroupActions, collidable: Boolean)                        

                            : super(collidable){
    //var collidableBehavior = collidableBehavior
    //var collidable = collidable


                            //For kotlin this is before the body of the constructor.
                    
this.conditionWIthGroupActions= collidableBehavior
}


    private val IS_COLLISION: String = "isCollision"

    override fun isCollision(ownerLayer: CollidableCompositeLayer, collisionLayer: CollidableCompositeLayer)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var ownerLayer = ownerLayer
    //var collisionLayer = collisionLayer

    
                        if(getCollidableInferface = collisionLayer!!.getCollidableInferface()getCollidableInferface as GDWithAllBinaryCollidableBehavior
getCollidableInferface.
                    conditionWIthGroupActions!!.groupWithActionsList!!.size() > 0)
                        
                                    {
                                    
    
                        if(ownerLayer!!.getGroupInterface()[0] != collisionLayer!!.getGroupInterface()[0])
                        
                                    {
                                    
    
                        if(ownerLayer != collisionLayer)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return super.isCollision(ownerLayer, collisionLayer)

                                    }
                                

                                    }
                                

                                    }
                                
                        else {
                            
                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


                @Throws(Exception::class)
            
    override fun collide(ownerLayer: CollidableCompositeLayer, collisionLayer: CollidableCompositeLayer)
        //nullable = true from not(false or (false and false)) = true
{
    //var ownerLayer = ownerLayer
    //var collisionLayer = collisionLayer

    
                        if(
                                    (collisionLayer as CollidableDestroyableDamageableLayer).isDestroyed())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(
                                    (ownerLayer as CollidableDestroyableDamageableLayer).isDestroyed())
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(this.conditionWIthGroupActions!!.groupWithActionsList!!.size() > 0)
                        
                                    {
                                    
    var groupInterfaceArray: Array<GroupInterface?> = collisionLayer!!.getGroupInterface()!!


    var size: Int = groupInterfaceArray!!.size
                


    var indexOfGroup: Int= 0


    var node: GDNode





                        for (index in 0 until size)

        {
indexOfGroup= this.conditionWIthGroupActions!!.groupWithActionsList!!.indexOf(groupInterfaceArray[index]!!)

    
                        if(indexOfGroup >= 0)
                        
                                    {
                                    node= (this.conditionWIthGroupActions!!.actionForGroupsList!!.get(indexOfGroup) as GDNode)

    var tempGameLayerUtil: TempGameLayerUtil = TempGameLayerUtil.getInstance()!!

tempGameLayerUtil!!.clear()
tempGameLayerUtil!!.gameLayerArray[0]= ownerLayer
tempGameLayerUtil!!.gameLayerArray[1]= collisionLayer
tempGameLayerUtil!!.clear2()

                                    }
                                
}


                                    }
                                
                        else {
                            
                        }
                            
}


    override fun isCollisionInterface(ownerLayer: CollidableCompositeLayer, collidableInterfaceCompositeInterface: CollidableInterfaceCompositeInterface)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var ownerLayer = ownerLayer
    //var collidableInterfaceCompositeInterface = collidableInterfaceCompositeInterface
ForcedLogUtil.log("No Longer Used", this)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


                @Throws(Exception::class)
            
    override fun collideInterface(ownerLayer: CollidableCompositeLayer, collidableInterfaceCompositeInterface: CollidableInterfaceCompositeInterface)
        //nullable = true from not(false or (false and false)) = true
{
    //var ownerLayer = ownerLayer
    //var collidableInterfaceCompositeInterface = collidableInterfaceCompositeInterface
ForcedLogUtil.log("No Longer Used", this)
}


    open fun toString(ownerLayer: CollidableCompositeLayer, collisionLayer: CollidableCompositeLayer, stringBuilder: StringMaker)
        //nullable = true from not(false or (true and false)) = true
: String{
    //var ownerLayer = ownerLayer
    //var collisionLayer = collisionLayer
    //var stringBuilder = stringBuilder

    var stringUtil: StringUtil = StringUtil.getInstance()!!


    var size: Int = ownerLayer!!.getGroupInterface()!!.length





                        for (index in 0 until size)

        {
stringBuilder!!.append(stringUtil!!.toString(ownerLayer!!.getGroupInterface()[index]!!))
}

stringBuilder!!.append(" != ")
size= collisionLayer!!.getGroupInterface()!!.length




                        for (index in 0 until size)

        {
stringBuilder!!.append(stringUtil!!.toString(collisionLayer!!.getGroupInterface()[index]!!))
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuilder!!.toString()
}


}
                
            

