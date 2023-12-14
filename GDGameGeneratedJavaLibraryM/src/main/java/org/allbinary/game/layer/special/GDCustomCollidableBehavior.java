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

import org.allbinary.game.canvas.GD0SpecialAnimationGlobals;
import org.allbinary.game.collision.CollidableBaseBehavior;
import org.allbinary.game.collision.CollidableInterfaceCompositeInterface;
import org.allbinary.game.identification.GroupInterface;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layer.GDCustomGameLayer;
import org.allbinary.game.layout.GDNode;
import org.allbinary.game.layout.GDObject;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;

/**
 *
 * @author User
 */
public class GDCustomCollidableBehavior extends CollidableBaseBehavior 
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    
    public final GDConditionWithGroupActions conditionWIthGroupActions;
    
    public GDCustomCollidableBehavior(final CollidableCompositeLayer ownerLayer, final GDConditionWithGroupActions collidableBehavior, final boolean collidable)
    {
        super(ownerLayer, collidable);
        
        this.conditionWIthGroupActions = collidableBehavior;
    }
    
    //private final String IS_COLLISION = "isCollision";

    public boolean isCollision(final CollidableCompositeLayer collisionLayer) 
    {
        final GD0SpecialAnimationGlobals globals = GD0SpecialAnimationGlobals.getInstance();
        //if(((GDCustomGameLayer) this.ownerLayer).gdObject.type == globals.TILEMAP__COLLISIONMASK) {
        final GDCustomGameLayer collisionMaskCustomGameLayer = ((GDCustomGameLayer) collisionLayer);
        if(collisionMaskCustomGameLayer.gdObject.type == globals.TILEMAP__COLLISIONMASK) {
            
            return this.isCollision3(collisionMaskCustomGameLayer);
        } else {
            return super.isCollision(collisionLayer);
            //return this.isCollision2(collisionLayer);
        }
    }
    
    public boolean isCollision3(final GDCustomGameLayer collisionMaskCustomGameLayer) {
        
        try {
            
            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) collisionMaskCustomGameLayer.allBinaryGameLayerManager;

            final BasicGeographicMap[] geographicMapInterfaceArray
                    = geographicMapCompositeInterface.getGeographicMapInterface();

            if(geographicMapInterfaceArray != null) {

                final GDCustomGameLayer customGameLayer = ((GDCustomGameLayer) this.ownerLayer);
                final GDObject gdObject = collisionMaskCustomGameLayer.gdObject;
                final GeographicMapCellPosition geographicMapCellPosition = collisionMaskCustomGameLayer.topViewGameBehavior.getGeographicMapCellPositionIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, customGameLayer.getVelocityProperties(), customGameLayer, gdObject.x, gdObject.y);

                //LogUtil.put(LogFactory.getInstance("geographicMapCellPosition: " + geographicMapCellPosition, this, commonStrings.PROCESS));
                if(geographicMapCellPosition == null) {
                    //LogUtil.put(LogFactory.getInstance(globals.TILEMAP__COLLISIONMASK, this, commonStrings.PROCESS));
                    //LogUtil.put(LogFactory.getInstance(gdObject.toShortString(), this, commonStrings.PROCESS));
                    return true;
                }
            }
            
        } catch(Exception e) {
            LogUtil.put(LogFactory.getInstance(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e));
        }
        
        return false;
    }
    
    // TODO TWB Special Super Efficient Collision Processing
    public boolean isCollision2(final CollidableCompositeLayer collisionLayer)
    {
        //final StringBuilder stringBuilder = new StringBuilder();
        //LogUtil.put(LogFactory.getInstance(stringBuilder.append(':').append(this.ownerLayer.getName()).append(':').append(collisionLayer.getName()).toString(), this, IS_COLLISION));
        
//        if(!this.ownerLayer.getName().startsWith("player_bullet") || !collisionLayer.getName().startsWith("player_bullet")) {
//            final StringBuilder stringBuilder = new StringBuilder();
//            final String string = this.toString(collisionLayer, stringBuilder);
//            LogUtil.put(LogFactory.getInstance(string, this, "isCollision"));
//        } else {
//            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "isCollision - with self"));
//        }

        //if(this.collidableBehavior.groupCollisionList.size() > 0) {
        if(((GDCustomCollidableBehavior) collisionLayer.getCollidableInferface()).conditionWIthGroupActions.groupWithActionsList.size() > 0) {
            //stringBuilder.delete(0, stringBuilder.length());
            //LogUtil.put(LogFactory.getInstance(stringBuilder.append(this.ownerLayer.getGroupInterface()[0]).append(" != ").append(collisionLayer.getGroupInterface()[0]).toString(), this, IS_COLLISION));
            if (this.ownerLayer.getGroupInterface()[0] != collisionLayer.getGroupInterface()[0]) {
                //stringBuilder.delete(0, stringBuilder.length());
                //LogUtil.put(LogFactory.getInstance(this.toString(collisionLayer, stringBuilder), this, "isCollision - super"));
                return super.isCollision(collisionLayer);
            }
        } else {
            //stringBuilder.delete(0, stringBuilder.length());
            //LogUtil.put(LogFactory.getInstance(stringBuilder.append("isCollision: No Groups for: ").append(collisionLayer).toString(), this, IS_COLLISION));
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
            //final StringBuilder stringBuilder = new StringBuilder();
            //LogUtil.put(LogFactory.getInstance(stringBuilder.append(COLLIDE).append(':').append(this.ownerLayer.getName()).append(':').append(collisionLayer.getName()).toString(), this, COLLIDE));

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
//                LogUtil.put(LogFactory.getInstance(this.toString(collisionLayer, stringBuilder), this, COLLIDE));
                if (indexOfGroup >= 0) {
                    //LogUtil.put(LogFactory.getInstance("groupIndex: " + indexOfGroup, this, COLLIDE));
                    node = ((GDNode) this.conditionWIthGroupActions.actionForGroupsList.get(indexOfGroup));
                    node.clear();
                    node.gameLayerArray[0] = this.ownerLayer;
                    node.gameLayerArray[1] = collisionLayer;
                    //node.processM(node.gameLayerArray, null, null);
                    node.processM(node.gameLayerArray);
                    node.clear2();
                }
            }
        } else {
            //LogUtil.put(LogFactory.getInstance("collide: No Groups for: " + this.ownerLayer, this, COLLIDE));
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