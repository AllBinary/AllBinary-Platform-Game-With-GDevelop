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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/replace.xsl" />

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

package org.allbinary.game.layer.special

import javax.microedition.lcdui.Graphics

import org.allbinary.game.canvas.GDGameGlobals
import org.allbinary.game.collision.CollidableBaseBehavior
import org.allbinary.game.collision.CollidableInterfaceCompositeInterface
import org.allbinary.game.identification.GroupInterface
import org.allbinary.game.layer.AllBinaryGameLayerManager
import org.allbinary.game.layer.CollidableCompositeLayer
import org.allbinary.game.layer.GDCustomGameLayer
import org.allbinary.game.layout.GDNode
import org.allbinary.game.layout.GDObject
import org.allbinary.graphics.GPoint
import org.allbinary.graphics.Rectangle
import org.allbinary.graphics.color.BasicColor
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.graphics.color.BasicColorSetUtil
import org.allbinary.logic.communication.log.ForcedLogUtil

import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.StringUtil
import org.allbinary.math.RectangleCollisionUtil
import org.allbinary.media.graphics.geography.map.BasicGeographicMap
import org.allbinary.media.graphics.geography.map.GeographicMapCellType
import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
import org.allbinary.view.ViewPositionBase
import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory

/**
 *
 * @author User
 */
open public class GDCustomMaskCollidableBehavior : CollidableBaseBehavior
{
    protected val logUtil: LogUtil = LogUtil.getInstance()

    private val stringUtil: StringUtil = StringUtil.getInstance()
    private val commonStrings: CommonStrings = CommonStrings.getInstance()

    private val rectangleCollisionUtil: RectangleCollisionUtil = RectangleCollisionUtil.getInstance()

    public val conditionWIthGroupActions: GDConditionWithGroupActions

    public constructor(collidableBehavior: GDConditionWithGroupActions, collidable: Boolean) : super(collidable) {

        this.conditionWIthGroupActions = collidableBehavior
    }

    override public fun update() {
        throw RuntimeException(this.commonStrings.NOT_IMPLEMENTED)
    }

    //private final String IS_COLLISION = "isCollision"
    //private final String B = "BatEnemy"

    override public fun isCollision(ownerLayer: CollidableCompositeLayer, collisionLayer: CollidableCompositeLayer): Boolean {
        if(ownerLayer == collisionLayer) {
            var false: return
        }

//        final GDCustomGameLayer customGameLayer = (ownerLayer as GDCustomGameLayer)
//        if (customGameLayer.gdObject.name.compareTo(B) == 0) {
//            this.logUtil.putF("isCollision: " + customGameLayer.toString(), this, this.commonStrings.PROCESS)
//        }

        val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
        //if((ownerLayer as GDCustomGameLayer).gdObject.type == gameGlobals.TILEMAP__COLLISIONMASK) {
        val customGameLayer: GDCustomGameLayer = (collisionLayer as GDCustomGameLayer)
        <xsl:if test="contains($hasLayoutWithTileMapAndIsTopView, 'found')" >
        if(customGameLayer.gdObject.type == gameGlobals.TILEMAP__COLLISIONMASK) {

            return this.isCollision3(ownerLayer, customGameLayer)
        } else {
        </xsl:if>

            //return super.isCollision(collisionLayer)
            //return this.isCollision2(collisionLayer)
            val collisionMaskCustomGameLayer2: GDCustomGameLayer = ownerLayer as GDCustomGameLayer
            val frame: Int = collisionMaskCustomGameLayer2.getIndexedAnimationInterface().getFrame()
            val ownerMaskRectangle: Rectangle = collisionMaskCustomGameLayer2.rectangleArrayOfArrays[collisionMaskCustomGameLayer2.gdObject.animation][frame]
            val ownerMaskPoint: GPoint = ownerMaskRectangle.getPoint()
            val ownerViewPosition: ViewPositionBase = ownerLayer.getViewPosition()
            val ownerViewX: Int = ownerViewPosition.getX()
            val ownerViewY: Int = ownerViewPosition.getY()

//            final Rectangle maskRectangle = collisionMaskCustomGameLayer.rectangleArrayOfArrays[.gdObject.animation][frame3]
//            final GPoint maskPoint = maskRectangle.getPoint()
            val viewPosition: ViewPositionBase = customGameLayer.getViewPosition()
            val viewX: Int = viewPosition.getX()
            val viewY: Int = viewPosition.getY()

            if(customGameLayer.hasCollisionMask()) {

                val frame2: Int = customGameLayer.getIndexedAnimationInterface().getFrame()
                val maskRectangle: Rectangle = customGameLayer.rectangleArrayOfArrays[customGameLayer.gdObject.animation][frame2]
                val maskPoint: GPoint = maskRectangle.getPoint()

                return rectangleCollisionUtil.isCollision(ownerViewX + ownerMaskPoint.getX(), ownerViewY + ownerMaskPoint.getY(), ownerViewX + ownerMaskPoint.getX() + ownerMaskRectangle.getWidth(), ownerViewY + ownerMaskPoint.getY( )+ ownerMaskRectangle.getHeight(),
                    //viewX + maskPoint.getX(), viewY + maskPoint.getY(), viewX + maskRectangle.getWidth(), viewY + maskRectangle.getHeight())
                    viewX + maskPoint.getX(), viewY + maskPoint.getY(), viewX + maskPoint.getX() + maskRectangle.getWidth(), viewY + maskPoint.getY() + maskRectangle.getHeight())

            } else {

                return rectangleCollisionUtil.isCollision(ownerViewX + ownerMaskPoint.getX(), ownerViewY + ownerMaskPoint.getY(), ownerViewX + ownerMaskPoint.getX() + ownerMaskRectangle.getWidth(), ownerViewY + ownerMaskPoint.getY( )+ ownerMaskRectangle.getHeight(),
                    //viewX + maskPoint.getX(), viewY + maskPoint.getY(), viewX + maskRectangle.getWidth(), viewY + maskRectangle.getHeight())
                    viewX, viewY, viewX + customGameLayer.getWidth(), viewY + customGameLayer.getHeight())

            }
        <xsl:if test="contains($hasLayoutWithTileMapAndIsTopView, 'found')" >
        }
        </xsl:if>
    }

    <xsl:if test="contains($hasLayoutWithTileMapAndIsTopView, 'found')" >
//    GeographicMapCellPosition lastGeographicMapCellPosition
    open public fun isCollision3(ownerLayer: CollidableCompositeLayer, collisionMaskCustomGameLayer: GDCustomGameLayer): Boolean {
        try {

            if(collisionMaskCustomGameLayer.allBinaryGameLayerManagerP == AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER) {
                this.logUtil.putF(StringMaker().append("LayerManager was null: ").append(stringUtil.toString(collisionMaskCustomGameLayer.allBinaryGameLayerManagerP)).toString(), this, "move")
                var false: return
            }

            val geographicMapCompositeInterface: GeographicMapCompositeInterface = collisionMaskCustomGameLayer.allBinaryGameLayerManagerP as GeographicMapCompositeInterface

            val geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt; = geographicMapCompositeInterface.getGeographicMapInterface()
            val geographicMapCellTypeArray: Array&lt;GeographicMapCellType&gt; = geographicMapCompositeInterface.geographicMapCellTypeArray()

            if(geographicMapInterfaceArray != BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY) {

                val customGameLayer: GDCustomGameLayer = (ownerLayer as GDCustomGameLayer)
                val gdObject: GDObject = collisionMaskCustomGameLayer.gdObject
                val geographicMapCellPosition: GeographicMapCellPosition = customGameLayer.topViewGameBehavior.getGeographicMapCellPositionIfNotSolidBlockOrOffMapLocation(
                    geographicMapInterfaceArray, geographicMapCellTypeArray, customGameLayer.getVelocityProperties(), customGameLayer, gdObject.x, gdObject.y)

//                if(customGameLayer.gdObject.name.compareTo(B) == 0) {
//                    if(lastGeographicMapCellPosition != geographicMapCellPosition) {
//                        lastGeographicMapCellPosition = geographicMapCellPosition
//                       this.logUtil.putF("geographicMapCellPosition: " + geographicMapCellPosition, this, this.commonStrings.PROCESS)
//                    }
//                }

                if(geographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
                    //final GDGameGlobals gameGlobals = GDGameGlobals.getInstance()
                    //this.logUtil.put(gameGlobals.TILEMAP__COLLISIONMASK, this, this.commonStrings.PROCESS)
                    //this.logUtil.put(gdObject.toShortString(), this, this.commonStrings.PROCESS)
                    var true: return
                }

            } else {
                this.logUtil.put(this.this.commonStrings.EXCEPTION, this, this.this.commonStrings.PROCESS, Exception())
                var true: return
            }

        } catch (e: Exception) {
            this.logUtil.put(this.this.commonStrings.EXCEPTION, this, this.this.commonStrings.PROCESS, e)
        }

        var false: return
    }
    </xsl:if>

    // TODO TWB Special Super Efficient Collision Processing
    open public fun isCollision2(ownerLayer: CollidableCompositeLayer, collisionLayer: CollidableCompositeLayer): Boolean {
        //final StringMaker stringBuilder = StringMaker()
        //this.logUtil.put(stringBuilder.append(commonSeps.COLON).append(ownerLayer.getName()).append(commonSeps.COLON).append(collisionLayer.getName()).toString(), this, IS_COLLISION)

        if(ownerLayer == collisionLayer) {
            var false: return
        }

//        if(!ownerLayer.getName().startsWith("player_bullet") || !collisionLayer.getName().startsWith("player_bullet")) {
//            final StringMaker stringBuilder = StringMaker()
//            final String string = this.toString(collisionLayer, stringBuilder)
//            this.logUtil.put(string, this, "isCollision")
//        } else {
//            this.logUtil.put(this.commonStrings.PROCESS, this, "isCollision - with self")
//        }

        val customGameLayer: GDCustomGameLayer = (collisionLayer as GDCustomGameLayer)
        //if(this.collidableBehavior.groupCollisionList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
        if((customGameLayer.getCollidableInferface() as GDCustomCollidableBehavior).conditionWIthGroupActions.groupWithActionsList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
            //stringBuilder.delete(0, stringBuilder.length)
            //this.logUtil.put(stringBuilder.append(ownerLayer.getGroupInterface()[0]).append(" != ").append(collisionLayer.getGroupInterface()[0]).toString(), this, IS_COLLISION)
            if (ownerLayer.getGroupInterface()[0] != collisionLayer.getGroupInterface()[0]) {
                //stringBuilder.delete(0, stringBuilder.length)
                //this.logUtil.put(this.toString(collisionLayer, stringBuilder), this, "isCollision - super")
                //return super.isCollision(collisionLayer)
            val collisionMackCustomGameLayer: GDCustomGameLayer = ownerLayer as GDCustomGameLayer
            val frame: Int = collisionMackCustomGameLayer.getIndexedAnimationInterface().getFrame()
            val ownerMaskRectangle: Rectangle = collisionMackCustomGameLayer.rectangleArrayOfArrays[collisionMackCustomGameLayer.gdObject.animation][frame]
            val ownerMaskPoint: GPoint = ownerMaskRectangle.getPoint()
            val ownerViewPosition: ViewPositionBase = ownerLayer.getViewPosition()
            val ownerViewX: Int = ownerViewPosition.getX()
            val ownerViewY: Int = ownerViewPosition.getY()

//            final Rectangle maskRectangle = collisionMaskCustomGameLayer.rectangleArrayOfArrays[.gdObject.animation][frame3]
//            final GPoint maskPoint = maskRectangle.getPoint()
            val viewPosition: ViewPositionBase = customGameLayer.getViewPosition()
            val viewX: Int = viewPosition.getX()
            val viewY: Int = viewPosition.getY()

            if(customGameLayer.hasCollisionMask()) {

                val frame2: Int = customGameLayer.getIndexedAnimationInterface().getFrame()
                val maskRectangle: Rectangle = customGameLayer.rectangleArrayOfArrays[customGameLayer.gdObject.animation][frame2]
                val maskPoint: GPoint = maskRectangle.getPoint()

                return rectangleCollisionUtil.isCollision(ownerViewX + ownerMaskPoint.getX(), ownerViewY + ownerMaskPoint.getY(), ownerViewX + ownerMaskPoint.getX() + ownerMaskRectangle.getWidth(), ownerViewY + ownerMaskPoint.getY( )+ ownerMaskRectangle.getHeight(),
                    //viewX + maskPoint.getX(), viewY + maskPoint.getY(), viewX + maskRectangle.getWidth(), viewY + maskRectangle.getHeight())
                    viewX + maskPoint.getX(), viewY + maskPoint.getY(), viewX + maskPoint.getX() + maskRectangle.getWidth(), viewY + maskPoint.getY() + maskRectangle.getHeight())

            } else {

                return rectangleCollisionUtil.isCollision(ownerViewX + ownerMaskPoint.getX(), ownerViewY + ownerMaskPoint.getY(), ownerViewX + ownerMaskPoint.getX() + ownerMaskRectangle.getWidth(), ownerViewY + ownerMaskPoint.getY() + ownerMaskRectangle.getHeight(),
                    //viewX + maskPoint.getX(), viewY + maskPoint.getY(), viewX + maskRectangle.getWidth(), viewY + maskRectangle.getHeight())
                    viewX, viewY, viewX + customGameLayer.getWidth(), viewY + customGameLayer.getHeight())

            }

            }
        } else {
            //stringBuilder.delete(0, stringBuilder.length)
            //this.logUtil.put(stringBuilder.append("isCollision: No Groups for: ").append(collisionLayer).toString(), this, IS_COLLISION)
        }

        var false: return
    }

    //private final String COLLIDE = "collide"

    // TODO TWB Special Super Efficient Collision Processing
    //public void collide(CollidableDestroyableDamageableTeamLayer collisionLayer)
    override public fun collide(ownerLayer: CollidableCompositeLayer, collisionLayer: CollidableCompositeLayer) {
        if((collisionLayer as CollidableDestroyableDamageableLayer).isDestroyed()) {
            return
        }

        if((ownerLayer as CollidableDestroyableDamageableLayer).isDestroyed()) {
            return
        }

        if(this.conditionWIthGroupActions.groupWithActionsList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
            //final StringMaker stringBuilder = StringMaker()
            //this.logUtil.put(stringBuilder.append.append(commonSeps.COLON).append(ownerLayer.getName()).append(commonSeps.COLON).append(collisionLayer.getName()).toString() as COLLIDE, this, COLLIDE)

            val groupInterfaceArray: Array&lt;GroupInterface&gt; = collisionLayer.getGroupInterface()
            //final GroupInterface[] groupInterfaceArray = ownerLayer.getGroupInterface()

            val size: Int = groupInterfaceArray.length
            var indexOfGroup: Int
            var node: GDNode
            for(index in 0 until size) {

                indexOfGroup = this.conditionWIthGroupActions.groupWithActionsList.indexOf(groupInterfaceArray[index])
//                stringBuilder.delete(0, stringBuilder.length)
//                stringBuilder.append("collide: ")
//                this.conditionWIthGroupActions.append(stringBuilder)
//                stringBuilder.append(" groups: ")
//                this.logUtil.put(this.toString(collisionLayer, stringBuilder), this, COLLIDE)
                if (indexOfGroup <xsl:text disable-output-escaping="yes" >&gt;</xsl:text>= 0) {
                    //this.logUtil.putF("groupIndex: " + indexOfGroup, this, COLLIDE)
                    node = (this.conditionWIthGroupActions.actionForGroupsList.get(indexOfGroup) as GDNode)

                    if(true) throw RuntimeException()
                    val tempGameLayerUtil: TempGameLayerUtil = TempGameLayerUtil.getInstance()
                    tempGameLayerUtil.clear()
                    tempGameLayerUtil.gameLayerArray[0] = ownerLayer
                    tempGameLayerUtil.gameLayerArray[1] = collisionLayer
                    //node.processGD(tempGameLayerUtil.gameLayerArray)
                    tempGameLayerUtil.clear2()
                }
            }
        } else {
            //this.logUtil.putF("collide: No Groups for: " + ownerLayer, this, COLLIDE)
        }

        //(ownerLayer as CollidableDestroyableDamageableLayer).damage(
                //(collidableInterfaceCompositeInterface as CollidableDestroyableDamageableLayer).getDamage(0), 0)
    }

    override public fun isCollisionInterface(ownerLayer: CollidableCompositeLayer, collidableInterfaceCompositeInterface: CollidableInterfaceCompositeInterface): Boolean {
        ForcedLogUtil.log("No Longer Used", this)
        var false: return
    }

    override public fun collideInterface(ownerLayer: CollidableCompositeLayer, collidableInterfaceCompositeInterface: CollidableInterfaceCompositeInterface) {
        ForcedLogUtil.log("No Longer Used", this)
    }

    private val COLLISION_MASK_COLOR: BasicColor = BasicColorFactory.getInstance().YELLOW

    protected val basicColorUtil: BasicColorSetUtil =
        BasicColorSetUtil.getInstance()

    override public fun paint(ownerLayer: CollidableCompositeLayer, graphics: Graphics) {
        try {

            val customGameLayer: GDCustomGameLayer = ownerLayer as GDCustomGameLayer
            val frame: Int = customGameLayer.getIndexedAnimationInterface().getFrame()
            val ownerMaskRectangle: Rectangle = customGameLayer.rectangleArrayOfArrays[customGameLayer.gdObject.animation][frame]
            val ownerMaskPoint: GPoint = ownerMaskRectangle.getPoint()

            val viewPosition: ViewPositionBase = ownerLayer.getViewPosition()
            val viewX: Int = viewPosition.getX()
            val viewY: Int = viewPosition.getY()

            //this.logUtil.put(StringMaker().append(customGameLayer.getName()).append("viewX: ").append(viewX).append(" viewY: ").append(viewY).append(" ownerMaskRectangle: ").append(ownerMaskRectangle.toString()).toString(), this, "paint")
            this.basicColorUtil.setBasicColorP(graphics, COLLISION_MASK_COLOR)

            graphics.drawRect(viewX + ownerMaskPoint.getX(), viewY + ownerMaskPoint.getY(), ownerMaskRectangle.getWidth(), ownerMaskRectangle.getHeight())
            //this.getViewPosition().getX2() - viewX,
            //this.getViewPosition().getY2() - viewY)

            //graphics.drawRect(viewX, viewY, width, height)
            //super.paint(graphics)

        } catch (e: Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION + ownerLayer.getName(), this, this.commonStrings.CONSTRUCTOR, e)
        }
    }

    open public fun toString(ownerLayer: CollidableCompositeLayer, collisionLayer: CollidableCompositeLayer, stringBuilder: StringMaker): String {
        var size: Int = ownerLayer.getGroupInterface().length
        for(index in 0 until size) {
            stringBuilder.append(stringUtil.toString(ownerLayer.getGroupInterface()[index]))
        }
        stringBuilder.append(" != ")
        size = collisionLayer.getGroupInterface().length
        for(index in 0 until size) {
            stringBuilder.append(stringUtil.toString(collisionLayer.getGroupInterface()[index]))
        }
        return stringBuilder.toString()
    }
}

    </xsl:template>

</xsl:stylesheet>
