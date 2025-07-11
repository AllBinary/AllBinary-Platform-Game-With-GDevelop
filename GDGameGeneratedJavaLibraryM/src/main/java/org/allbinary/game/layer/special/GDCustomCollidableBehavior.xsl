<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDGlobalCalls.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

        <xsl:variable name="foundOtherViewPosition" ><xsl:for-each select="layouts" ><xsl:for-each select="objects" ><xsl:for-each select="behaviors" ><xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:for-each></xsl:variable>

        <xsl:variable name="hasLayoutWithTileMapAndIsTopView" >
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:for-each select="objects" >                
                <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >
                <xsl:if test="type = 'TileMap::TileMap'" >found</xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        </xsl:variable>
        
package org.allbinary.game.layer.special;

import org.allbinary.game.canvas.GDGameGlobals;
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
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;

/**
 *
 * @author User
 */
public class GDCustomCollidableBehavior extends CollidableBaseBehavior 
{
    protected final LogUtil logUtil = LogUtil.getInstance();
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    
    public final GDConditionWithGroupActions conditionWIthGroupActions;
    
    public GDCustomCollidableBehavior(final CollidableCompositeLayer ownerLayer, final GDConditionWithGroupActions collidableBehavior, final boolean collidable)
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
//            logUtil.put("isCollision: " + customGameLayer.toString(), this, commonStrings.PROCESS);
//        }
        
        //final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
        //if(((GDCustomGameLayer) this.ownerLayer).gdObject.type == gameGlobals.TILEMAP__COLLISIONMASK) {
        final GDCustomGameLayer collisionMaskCustomGameLayer = ((GDCustomGameLayer) collisionLayer);
        <xsl:if test="contains($hasLayoutWithTileMapAndIsTopView, 'found')" >
        final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
        if(collisionMaskCustomGameLayer.gdObject.type == gameGlobals.TILEMAP__COLLISIONMASK) {
            
            return this.isCollision3(collisionMaskCustomGameLayer);
        } else {
            if(this.ownerLayer != collisionLayer) {
                return super.isCollision(collisionLayer);
                //return this.isCollision2(collisionLayer);
            }            
        }
        return false;
        </xsl:if>
        <xsl:if test="not(contains($hasLayoutWithTileMapAndIsTopView, 'found'))" >
        return super.isCollision(collisionLayer);
        </xsl:if>
            
    }
    
    <xsl:if test="contains($hasLayoutWithTileMapAndIsTopView, 'found')" >
//    GeographicMapCellPosition lastGeographicMapCellPosition;
    public boolean isCollision3(final GDCustomGameLayer collisionMaskCustomGameLayer) {
        
        try {
            
            if(collisionMaskCustomGameLayer.allBinaryGameLayerManager == null) {
                logUtil.put(new StringMaker().append("LayerManager was null: ").append(StringUtil.getInstance().toString(collisionMaskCustomGameLayer.allBinaryGameLayerManager)).toString(), this, "move");
                return false;
            }
            
            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) collisionMaskCustomGameLayer.allBinaryGameLayerManager;

            final BasicGeographicMap[] geographicMapInterfaceArray
                    = geographicMapCompositeInterface.getGeographicMapInterface();
            final GeographicMapCellType[] geographicMapCellTypeArray = geographicMapCompositeInterface.geographicMapCellTypeArray();

            if(geographicMapInterfaceArray != null) {

                final GDCustomGameLayer customGameLayer = ((GDCustomGameLayer) this.ownerLayer);
                final GDObject gdObject = collisionMaskCustomGameLayer.gdObject;
                final GeographicMapCellPosition geographicMapCellPosition = customGameLayer.topViewGameBehavior.getGeographicMapCellPositionIfNotSolidBlockOrOffMap(
                    geographicMapInterfaceArray, geographicMapCellTypeArray, customGameLayer.getVelocityProperties(), customGameLayer, gdObject.x, gdObject.y);

//                if(customGameLayer.gdObject.name.compareTo(B) == 0) {
//                    if(lastGeographicMapCellPosition != geographicMapCellPosition) {
//                        lastGeographicMapCellPosition = geographicMapCellPosition;
//                       logUtil.put("geographicMapCellPosition: " + geographicMapCellPosition, this, commonStrings.PROCESS);
//                    }
//                }

                if(geographicMapCellPosition == null) {
                    //final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
                    //logUtil.put(gameGlobals.TILEMAP__COLLISIONMASK, this, commonStrings.PROCESS);
                    //logUtil.put(gdObject.toShortString(), this, commonStrings.PROCESS);
                    return true;
                }
                
            } else {
                logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, new Exception());
                return true;
            }
            
        } catch(Exception e) {
            logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e);
        }
        
        return false;
    }
    </xsl:if>
    
    // TODO TWB Special Super Efficient Collision Processing
    public boolean isCollision2(final CollidableCompositeLayer collisionLayer)
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

        //if(this.collidableBehavior.groupCollisionList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
        if(((GDCustomCollidableBehavior) collisionLayer.getCollidableInferface()).conditionWIthGroupActions.groupWithActionsList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
            //stringBuilder.delete(0, stringBuilder.length());
            //logUtil.put(stringBuilder.append(this.ownerLayer.getGroupInterface()[0]).append(" != ").append(collisionLayer.getGroupInterface()[0]).toString(), this, IS_COLLISION);
            if (this.ownerLayer.getGroupInterface()[0] != collisionLayer.getGroupInterface()[0]) {
                //stringBuilder.delete(0, stringBuilder.length());
                //logUtil.put(this.toString(collisionLayer, stringBuilder), this, "isCollision - super");
                return super.isCollision(collisionLayer);
            }
        } else {
            //stringBuilder.delete(0, stringBuilder.length());
            //logUtil.put(stringBuilder.append("isCollision: No Groups for: ").append(collisionLayer).toString(), this, IS_COLLISION);
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

        if(this.conditionWIthGroupActions.groupWithActionsList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
            //final StringMaker stringBuilder = new StringMaker();
            //logUtil.put(stringBuilder.append(COLLIDE).append(':').append(this.ownerLayer.getName()).append(':').append(collisionLayer.getName()).toString(), this, COLLIDE);

            final GroupInterface[] groupInterfaceArray = collisionLayer.getGroupInterface();
            //final GroupInterface[] groupInterfaceArray = this.ownerLayer.getGroupInterface();

            final int size = groupInterfaceArray.length;
            int indexOfGroup;
            GDNode node;
            for (int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                indexOfGroup = this.conditionWIthGroupActions.groupWithActionsList.indexOf(groupInterfaceArray[index]);
//                stringBuilder.delete(0, stringBuilder.length());
//                stringBuilder.append("collide: ");
//                this.conditionWIthGroupActions.append(stringBuilder);
//                stringBuilder.append(" groups: ");
//                logUtil.put(this.toString(collisionLayer, stringBuilder), this, COLLIDE);
                if (indexOfGroup <xsl:text disable-output-escaping="yes" >&gt;</xsl:text>= 0) {
                    //logUtil.put("groupIndex: " + indexOfGroup, this, COLLIDE);
                    node = ((GDNode) this.conditionWIthGroupActions.actionForGroupsList.get(indexOfGroup));
                    
                    if(true) throw new RuntimeException();
                    final TempGameLayerUtil tempGameLayerUtil = TempGameLayerUtil.getInstance();
                    tempGameLayerUtil.clear();
                    tempGameLayerUtil.gameLayerArray[0] = this.ownerLayer;
                    tempGameLayerUtil.gameLayerArray[1] = collisionLayer;
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
        for (int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            stringBuilder.append(stringUtil.toString(this.ownerLayer.getGroupInterface()[index]));
        }
        stringBuilder.append(" != ");
        size = collisionLayer.getGroupInterface().length;
        for (int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            stringBuilder.append(stringUtil.toString(collisionLayer.getGroupInterface()[index]));
        }
        return stringBuilder.toString();
    }
}

    </xsl:template>

</xsl:stylesheet>
