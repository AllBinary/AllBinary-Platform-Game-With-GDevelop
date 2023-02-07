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
import org.allbinary.game.layout.GDNode;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDCollidableBehavior extends CollidableBaseBehavior 
{
    
    public final GDConditionCollidableBehavior collidableBehavior;
    
    public GDCollidableBehavior(final CollidableCompositeLayer ownerLayer, final GDConditionCollidableBehavior collidableBehavior, final boolean collidable)
    {
        super(ownerLayer, collidable);
        
        this.collidableBehavior = collidableBehavior;
    }
    
    // TODO TWB Special Super Efficient Collision Processing
    public boolean isCollision(final CollidableCompositeLayer collisionLayer)
    {
//        if(!this.ownerLayer.getName().startsWith("player_bullet") || !collisionLayer.getName().startsWith("player_bullet")) {
//            final StringBuilder stringBuilder = new StringBuilder();
//            final String string = this.toString(collisionLayer, stringBuilder);
//            LogUtil.put(LogFactory.getInstance(string, this, "isCollision"));
//        } else {
//            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "isCollision - with self"));
//        }

        //if(this.collidableBehavior.groupCollisionList.size() > 0) {
        if(((GDCollidableBehavior) collisionLayer.getCollidableInferface()).collidableBehavior.groupCollisionList.size() > 0) {
            if (this.ownerLayer.getGroupInterface()[0] != collisionLayer.getGroupInterface()[0]) {
                final StringBuilder stringBuilder = new StringBuilder();
                LogUtil.put(LogFactory.getInstance(this.toString(collisionLayer, stringBuilder), this, "isCollision - super"));
                return super.isCollision(collisionLayer);
            }
        } else {
            //LogUtil.put(LogFactory.getInstance("isCollision: No Groups", this, "collide"));
        }
        
        return false;
    }
    
    private static final String COLLIDE = "collide";
    
    // TODO TWB Special Super Efficient Collision Processing
    //public void collide(CollidableDestroyableDamageableTeamLayer collisionLayer)
    public void collide(final CollidableCompositeLayer collisionLayer)
            throws Exception
    {
        if(this.collidableBehavior.groupCollisionList.size() > 0) {
            LogUtil.put(LogFactory.getInstance("collide: " + collisionLayer.toString(), this, COLLIDE));
            final StringBuilder stringBuilder = new StringBuilder();

            final GroupInterface[] groupInterfaceArray = collisionLayer.getGroupInterface();
            //final GroupInterface[] groupInterfaceArray = this.ownerLayer.getGroupInterface();

            final int size = groupInterfaceArray.length;
            int indexOfGroup;
            GDNode node;
            for (int index = 0; index < size; index++) {

                indexOfGroup = this.collidableBehavior.groupCollisionList.indexOf(groupInterfaceArray[index]);
                stringBuilder.delete(0, stringBuilder.length());
                stringBuilder.append("collide: ");
                this.collidableBehavior.append(stringBuilder);
                stringBuilder.append(" groups: ");
                LogUtil.put(LogFactory.getInstance(this.toString(collisionLayer, stringBuilder), this, COLLIDE));
                if (indexOfGroup >= 0) {
                    LogUtil.put(LogFactory.getInstance("groupIndex: " + indexOfGroup, this, COLLIDE));
                    node = ((GDNode) this.collidableBehavior.actionCollisionList.get(indexOfGroup));
                    node.gameLayerArray[0] = this.ownerLayer;
                    node.gameLayerArray[1] = collisionLayer;
                    node.processM(node.gameLayerArray, null, null);
                }
            }
        } else {
            LogUtil.put(LogFactory.getInstance("collide: No Groups", this, COLLIDE));
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
    
    public String toString(final CollidableCompositeLayer collisionLayer, final StringBuilder stringBuilder) {
        int size = this.ownerLayer.getGroupInterface().length;
        for (int index = 0; index < size; index++) {
            stringBuilder.append(this.ownerLayer.getGroupInterface()[index]);
        }
        stringBuilder.append(" != ");
        size = collisionLayer.getGroupInterface().length;
        for (int index = 0; index < size; index++) {
            stringBuilder.append(collisionLayer.getGroupInterface()[index]);
        }
        return stringBuilder.toString();
    }
}
