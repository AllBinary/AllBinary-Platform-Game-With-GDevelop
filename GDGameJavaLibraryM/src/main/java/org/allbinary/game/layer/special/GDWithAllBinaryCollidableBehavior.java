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
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;

/**
 *
 * @author User
 */
public class GDWithAllBinaryCollidableBehavior extends CollidableBaseBehavior 
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    
    public final GDConditionWithGroupActions conditionWIthGroupActions;
    
    public GDWithAllBinaryCollidableBehavior(final CollidableCompositeLayer ownerLayer, final GDConditionWithGroupActions collidableBehavior, final boolean collidable)
    {
        super(ownerLayer, collidable);
        
        this.conditionWIthGroupActions = collidableBehavior;
    }
    
    private final String IS_COLLISION = "isCollision";

    // TODO TWB Special Super Efficient Collision Processing
    public boolean isCollision(final CollidableCompositeLayer collisionLayer)
    {
        //final StringMaker stringBuilder = new StringMaker();
        //logUtil.put(stringBuilder.append(':').append(this.ownerLayer.getName()).append(':').append(collisionLayer.getName()).toString(), this, IS_COLLISION);
        
//        if(!this.ownerLayer.getName().startsWith("player_bullet") || !collisionLayer.getName().startsWith("player_bullet")) {
//            final StringMaker stringBuilder = new StringMaker();
//            final String string = this.toString(collisionLayer, stringBuilder);
//            logUtil.put(string, this, "isCollision");
//        } else {
//            logUtil.put(commonStrings.PROCESS, this, "isCollision - with self");
//        }

        //if(this.collidableBehavior.groupCollisionList.size() > 0) {
        if(((GDWithAllBinaryCollidableBehavior) collisionLayer.getCollidableInferface()).conditionWIthGroupActions.groupWithActionsList.size() > 0) {
            //stringBuilder.delete(0, stringBuilder.length());
            //logUtil.put(stringBuilder.append(this.ownerLayer.getGroupInterface()[0]).append(" != ").append(collisionLayer.getGroupInterface()[0]).toString(), this, IS_COLLISION);
            if (this.ownerLayer.getGroupInterface()[0] != collisionLayer.getGroupInterface()[0]) {
                //stringBuilder.delete(0, stringBuilder.length());
                //logUtil.put(this.toString(collisionLayer, stringBuilder), this, "isCollision - super");
                if(this.ownerLayer != collisionLayer) {
                    return super.isCollision(collisionLayer);
                }
            }
        } else {
            //stringBuilder.delete(0, stringBuilder.length());
            //logUtil.put(stringBuilder.append("isCollision: No Groups for: ").append(collisionLayer).toString(), this, IS_COLLISION);
        }
        
        return false;
    }
    
    private static final String COLLIDE = "collide";
    
    // TODO TWB Special Super Efficient Collision Processing
    //public void collide(CollidableDestroyableDamageableTeamLayer collisionLayer)
    public void collide(final CollidableCompositeLayer collisionLayer)
            throws Exception
    {
        if(((CollidableDestroyableDamageableLayer) collisionLayer).isDestroyed()) {
            return;
        }
        
        if(((CollidableDestroyableDamageableLayer) this.ownerLayer).isDestroyed()) {
            return;
        }

        if(this.conditionWIthGroupActions.groupWithActionsList.size() > 0) {
            //final StringMaker stringBuilder = new StringMaker();
            //logUtil.put(stringBuilder.append(COLLIDE).append(':').append(this.ownerLayer.getName()).append(':').append(collisionLayer.getName()).toString(), this, COLLIDE);

            final GroupInterface[] groupInterfaceArray = collisionLayer.getGroupInterface();
            //final GroupInterface[] groupInterfaceArray = this.ownerLayer.getGroupInterface();

            final int size = groupInterfaceArray.length;
            int indexOfGroup;
            GDNode node;
            for (int index = 0; index < size; index++) {

                indexOfGroup = this.conditionWIthGroupActions.groupWithActionsList.indexOf(groupInterfaceArray[index]);
//                stringBuilder.delete(0, stringBuilder.length());
//                stringBuilder.append("collide: ");
//                this.conditionWIthGroupActions.append(stringBuilder);
//                stringBuilder.append(" groups: ");
//                logUtil.put(this.toString(collisionLayer, stringBuilder), this, COLLIDE);
                if (indexOfGroup >= 0) {
                    //logUtil.put("groupIndex: " + indexOfGroup, this, COLLIDE);
                    node = ((GDNode) this.conditionWIthGroupActions.actionForGroupsList.get(indexOfGroup));
                    final TempGameLayerUtil tempGameLayerUtil = TempGameLayerUtil.getInstance();
                    tempGameLayerUtil.clear();
                    tempGameLayerUtil.gameLayerArray[0] = this.ownerLayer;
                    tempGameLayerUtil.gameLayerArray[1] = collisionLayer;
                    //node.processM(node.gameLayerArray, null, null);
                    node.processM(tempGameLayerUtil.gameLayerArray);
                    tempGameLayerUtil.clear2();
                }
            }
        } else {
            //logUtil.put("collide: No Groups for: " + this.ownerLayer, this, COLLIDE);
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
    
    public String toString(final CollidableCompositeLayer collisionLayer, final StringMaker stringBuilder) {
        final StringUtil stringUtil = StringUtil.getInstance();
        int size = this.ownerLayer.getGroupInterface().length;
        for (int index = 0; index < size; index++) {
            stringBuilder.append(stringUtil.toString(this.ownerLayer.getGroupInterface()[index]));
        }
        stringBuilder.append(" != ");
        size = collisionLayer.getGroupInterface().length;
        for (int index = 0; index < size; index++) {
            stringBuilder.append(stringUtil.toString(collisionLayer.getGroupInterface()[index]));
        }
        return stringBuilder.toString();
    }
}
