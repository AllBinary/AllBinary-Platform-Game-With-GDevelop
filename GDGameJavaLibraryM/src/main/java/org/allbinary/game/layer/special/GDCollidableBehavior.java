/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
* 
* By agreeing to this license you and any business entity you represent are
* legally bound to the AllBinary Open License Version 1 legal agreement.
* 
* You may obtain the AllBinary Open License Version 1 legal agreement from
* AllBinary or the root directory of AllBinary's AllBinary Platform repository.
* 
* Created By: Travis Berthelot
* 
 */
package org.allbinary.game.layer.special;

import org.allbinary.game.collision.CollidableBaseBehavior;
import org.allbinary.game.collision.CollidableInterfaceCompositeInterface;
import org.allbinary.game.identification.GroupInterface;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layout.GDAction;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDCollidableBehavior extends CollidableBaseBehavior 
{
    
    public final BasicArrayList groupCollisionList = new BasicArrayList();
    public final BasicArrayList actionCollisionList = new BasicArrayList();
    
    public GDCollidableBehavior(final CollidableCompositeLayer ownerLayer, final boolean collidable)
    {
        super(ownerLayer, collidable);
    }
    
    // TODO TWB Special Super Efficient Collision Processing
    public boolean isCollision(final CollidableCompositeLayer collisionLayer)
    {
        if (this.ownerLayer.getGroupInterface() != collisionLayer.getGroupInterface())
        {
            return super.isCollision(collisionLayer);
        }
        return false;
    }
    
    // TODO TWB Special Super Efficient Collision Processing
    //public void collide(CollidableDestroyableDamageableTeamLayer collisionLayer)
    public void collide(final CollidableCompositeLayer collidableInterfaceCompositeInterface)
            throws Exception
    {
        final GroupInterface[] groupInterfaceArray = collidableInterfaceCompositeInterface.getGroupInterface();
        
        final int size = groupInterfaceArray.length;
        for(int index = 0; index < size; index++) {
            
            int indexOfGroup = this.groupCollisionList.indexOf(groupInterfaceArray[index]);
            if(indexOfGroup < 0) {
                ((GDAction) this.actionCollisionList.get(indexOfGroup)).process(this.ownerLayer, collidableInterfaceCompositeInterface);
            }
        }

        //((CollidableDestroyableDamageableLayer) this.ownerLayer).damage(
                //((CollidableDestroyableDamageableLayer) collidableInterfaceCompositeInterface).getDamage(0), 0);
    }

    public boolean isCollision(final CollidableInterfaceCompositeInterface collidableInterfaceCompositeInterface)
    {
        ForcedLogUtil.log("No Longer Used", this);
        return false;
    }
    
    public void collide(final CollidableInterfaceCompositeInterface collidableInterfaceCompositeInterface)
            throws Exception
    {
        ForcedLogUtil.log("No Longer Used", this);
    }    
}
