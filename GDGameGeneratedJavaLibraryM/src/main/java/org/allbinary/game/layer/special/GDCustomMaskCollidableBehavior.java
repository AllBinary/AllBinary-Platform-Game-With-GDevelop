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

import javax.microedition.lcdui.Graphics;
import org.allbinary.game.canvas.GD0SpecialAnimationGlobals;
import org.allbinary.game.collision.CollidableBaseBehavior;
import org.allbinary.game.collision.CollidableInterfaceCompositeInterface;
import org.allbinary.game.identification.GroupInterface;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layer.GDCustomGameLayer;
import org.allbinary.game.layout.GDNode;
import org.allbinary.game.layout.GDObject;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.Rectangle;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.color.BasicColorSetUtil;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.math.RectangleCollisionUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
import org.allbinary.view.ViewPosition;

/**
 *
 * @author User
 */
public class GDCustomMaskCollidableBehavior extends CollidableBaseBehavior 
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    
    private final RectangleCollisionUtil rectangleCollisionUtil = RectangleCollisionUtil.getInstance();
    
    public final GDConditionWithGroupActions conditionWIthGroupActions;
    
    public GDCustomMaskCollidableBehavior(final CollidableCompositeLayer ownerLayer, final GDConditionWithGroupActions collidableBehavior, final boolean collidable)
    {
        super(ownerLayer, collidable);
        
        this.conditionWIthGroupActions = collidableBehavior;
    }
    
    //private final String IS_COLLISION = "isCollision";
    //private final String B = "BatEnemy";

    public boolean isCollision(final CollidableCompositeLayer collisionLayer) 
    {
//        final GDCustomGameLayer customGameLayer = ((GDCustomGameLayer) this.ownerLayer);
//        if (customGameLayer.gdObject.name.compareTo(B) == 0) {
//            LogUtil.put(LogFactory.getInstance("isCollision: " + customGameLayer.toString(), this, commonStrings.PROCESS));
//        }
        
        final GD0SpecialAnimationGlobals globals = GD0SpecialAnimationGlobals.getInstance();
        //if(((GDCustomGameLayer) this.ownerLayer).gdObject.type == globals.TILEMAP__COLLISIONMASK) {
        final GDCustomGameLayer collisionMaskCustomGameLayer = ((GDCustomGameLayer) collisionLayer);
        if(collisionMaskCustomGameLayer.gdObject.type == globals.TILEMAP__COLLISIONMASK) {
            
            return this.isCollision3(collisionMaskCustomGameLayer);
        } else {
            //return super.isCollision(collisionLayer);
            //return this.isCollision2(collisionLayer);
            final GDCustomGameLayer customGameLayer = (GDCustomGameLayer) this.ownerLayer;
            final Rectangle ownerMaskRectangle = customGameLayer.rectangleArrayOfArrays[0][0];
            final GPoint ownerMaskPoint = ownerMaskRectangle.getPoint();
            final ViewPosition ownerViewPosition = this.ownerLayer.getViewPosition();
            final int ownerViewX = ownerViewPosition.getX();
            final int ownerViewY = ownerViewPosition.getY();
            
//            final Rectangle maskRectangle = collisionMaskCustomGameLayer.rectangleArrayOfArrays[0][0];
//            final GPoint maskPoint = maskRectangle.getPoint();
            final ViewPosition viewPosition = collisionMaskCustomGameLayer.getViewPosition();
            final int viewX = viewPosition.getX();
            final int viewY = viewPosition.getY();

            return rectangleCollisionUtil.isCollision(ownerViewX + ownerMaskPoint.getX(), ownerViewY + ownerMaskPoint.getY(), ownerViewX + ownerMaskRectangle.getWidth(), ownerViewY + ownerMaskRectangle.getHeight(), 
                    //viewX + maskPoint.getX(), viewY + maskPoint.getY(), viewX + maskRectangle.getWidth(), viewY + maskRectangle.getHeight());
                    viewX, viewY, viewX + collisionMaskCustomGameLayer.getWidth(), viewY + collisionMaskCustomGameLayer.getHeight());
        }
    }
    
//    GeographicMapCellPosition lastGeographicMapCellPosition;
    public boolean isCollision3(final GDCustomGameLayer collisionMaskCustomGameLayer) {
        
        try {
            
            if(collisionMaskCustomGameLayer.allBinaryGameLayerManager == null) {
                LogUtil.put(LogFactory.getInstance(new StringMaker().append("LayerManager was null: ").append(collisionMaskCustomGameLayer.allBinaryGameLayerManager).toString(), this, "move"));
                return false;
            }
            
            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) collisionMaskCustomGameLayer.allBinaryGameLayerManager;

            final BasicGeographicMap[] geographicMapInterfaceArray
                    = geographicMapCompositeInterface.getGeographicMapInterface();

            if(geographicMapInterfaceArray != null) {

                final GDCustomGameLayer customGameLayer = ((GDCustomGameLayer) this.ownerLayer);
                final GDObject gdObject = collisionMaskCustomGameLayer.gdObject;
                final GeographicMapCellPosition geographicMapCellPosition = customGameLayer.topViewGameBehavior.getGeographicMapCellPositionIfNotSolidBlockOrOffMap(geographicMapInterfaceArray, customGameLayer.getVelocityProperties(), customGameLayer, gdObject.x, gdObject.y);

//                if(customGameLayer.gdObject.name.compareTo(B) == 0) {
//                    if(lastGeographicMapCellPosition != geographicMapCellPosition) {
//                        lastGeographicMapCellPosition = geographicMapCellPosition;
//                       LogUtil.put(LogFactory.getInstance("geographicMapCellPosition: " + geographicMapCellPosition, this, commonStrings.PROCESS));
//                    }
//                }

                if(geographicMapCellPosition == null) {
                    //LogUtil.put(LogFactory.getInstance(globals.TILEMAP__COLLISIONMASK, this, commonStrings.PROCESS));
                    //LogUtil.put(LogFactory.getInstance(gdObject.toShortString(), this, commonStrings.PROCESS));
                    return true;
                }
                
            } else {
                LogUtil.put(LogFactory.getInstance(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, new Exception()));
                return true;
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

        final GDCustomGameLayer collisionMaskCustomGameLayer = ((GDCustomGameLayer) collisionLayer);
        //if(this.collidableBehavior.groupCollisionList.size() > 0) {
        if(((GDCustomCollidableBehavior) collisionMaskCustomGameLayer.getCollidableInferface()).conditionWIthGroupActions.groupWithActionsList.size() > 0) {
            //stringBuilder.delete(0, stringBuilder.length());
            //LogUtil.put(LogFactory.getInstance(stringBuilder.append(this.ownerLayer.getGroupInterface()[0]).append(" != ").append(collisionLayer.getGroupInterface()[0]).toString(), this, IS_COLLISION));
            if (this.ownerLayer.getGroupInterface()[0] != collisionLayer.getGroupInterface()[0]) {
                //stringBuilder.delete(0, stringBuilder.length());
                //LogUtil.put(LogFactory.getInstance(this.toString(collisionLayer, stringBuilder), this, "isCollision - super"));
                //return super.isCollision(collisionLayer);
            final GDCustomGameLayer customGameLayer = (GDCustomGameLayer) this.ownerLayer;
            final Rectangle ownerMaskRectangle = customGameLayer.rectangleArrayOfArrays[0][0];
            final GPoint ownerMaskPoint = ownerMaskRectangle.getPoint();
            final ViewPosition ownerViewPosition = this.ownerLayer.getViewPosition();
            final int ownerViewX = ownerViewPosition.getX();
            final int ownerViewY = ownerViewPosition.getY();
            
//            final Rectangle maskRectangle = collisionMaskCustomGameLayer.rectangleArrayOfArrays[0][0];
//            final GPoint maskPoint = maskRectangle.getPoint();
            final ViewPosition viewPosition = collisionMaskCustomGameLayer.getViewPosition();
            final int viewX = viewPosition.getX();
            final int viewY = viewPosition.getY();

            return rectangleCollisionUtil.isCollision(ownerViewX + ownerMaskPoint.getX(), ownerViewY + ownerMaskPoint.getY(), ownerViewX + ownerMaskRectangle.getWidth(), ownerViewY + ownerMaskRectangle.getHeight(), 
                    //viewX + maskPoint.getX(), viewY + maskPoint.getY(), viewX + maskRectangle.getWidth(), viewY + maskRectangle.getHeight());
                    viewX, viewY, viewX + collisionMaskCustomGameLayer.getWidth(), viewY + collisionMaskCustomGameLayer.getHeight());
            }
        } else {
            //stringBuilder.delete(0, stringBuilder.length());
            //LogUtil.put(LogFactory.getInstance(stringBuilder.append("isCollision: No Groups for: ").append(collisionLayer).toString(), this, IS_COLLISION));
        }
        
        return false;
    }
    
    //private static final String COLLIDE = "collide";
    
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

    private final BasicColor PURPLE = BasicColorFactory.getInstance().PURPLE;
    
    protected final BasicColorSetUtil basicColorUtil = 
        BasicColorSetUtil.getInstance();
    
    public void paint(final Graphics graphics)
    {
        final GDCustomGameLayer customGameLayer = (GDCustomGameLayer) this.ownerLayer;
        final Rectangle ownerMaskRectangle = customGameLayer.rectangleArrayOfArrays[0][0];
        final GPoint ownerMaskPoint = ownerMaskRectangle.getPoint();
        
        final ViewPosition viewPosition = this.ownerLayer.getViewPosition();
        final int viewX = viewPosition.getX();
        final int viewY = viewPosition.getY();

        //LogUtil.put(LogFactory.getInstance("viewX: ").append(viewX).append(" viewY: ").append(viewY, this, "paint"));

        this.basicColorUtil.setBasicColor(graphics, PURPLE);

        graphics.drawRect(viewX + ownerMaskPoint.getX(), viewY + ownerMaskPoint.getY(), ownerMaskRectangle.getWidth(), ownerMaskRectangle.getHeight());
        //this.getViewPosition().getX2() - viewX,
        //this.getViewPosition().getY2() - viewY);

        //graphics.drawRect(viewX, viewY, width, height);

        //super.paint(graphics);
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
