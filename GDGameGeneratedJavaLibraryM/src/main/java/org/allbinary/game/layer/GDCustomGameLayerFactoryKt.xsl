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

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

package org.allbinary.game.layer

import org.allbinary.animation.Animation
import org.allbinary.animation.AnimationInterfaceFactoryInterface
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
import org.allbinary.game.identification.Group
import org.allbinary.game.layer.special.GDCustomCollidableBehavior
import org.allbinary.game.layer.special.GDCustomMaskCollidableBehavior
import org.allbinary.game.layer.special.GDConditionWithGroupActions
import org.allbinary.game.layout.GDObject
import org.allbinary.game.multiplayer.layer.RemoteInfo
import org.allbinary.graphics.PointFactory
import org.allbinary.graphics.Rectangle

import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.StringUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDCustomGameLayerFactory : GDGameLayerFactory
{

    private val primitiveDrawingAnimationFactory: AnimationInterfaceFactoryInterface
    private val width: Int
    private val height: Int

    public constructor(primitiveDrawingAnimationFactory: AnimationInterfaceFactoryInterface, gameLayerList: BasicArrayList, gameLayerDestroyedList: BasicArrayList, groupInterface: Array&lt;Group&gt;, behaviorList: BasicArrayList, animationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt;, proceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt;, layerInfo: Rectangle, rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt;) : this(primitiveDrawingAnimationFactory, gameLayerList, gameLayerDestroyedList, groupInterface, behaviorList, animationInterfaceFactoryInterfaceArray, proceduralAnimationInterfaceFactoryInterfaceArray, layerInfo, rectangleArrayOfArrays, GDRotationBehaviorFactory.getInstance()) {
    }

    public constructor(primitiveDrawingAnimationFactory: AnimationInterfaceFactoryInterface, gameLayerList: BasicArrayList, gameLayerDestroyedList: BasicArrayList, groupInterface: Array&lt;Group&gt;, behaviorList: BasicArrayList, animationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt;, proceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt;, layerInfo: Rectangle, rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt;, animationBehaviorFactory: GDAnimationBehaviorBaseFactory) : super(gameLayerList, gameLayerDestroyedList,
            groupInterface,
            behaviorList,
            animationInterfaceFactoryInterfaceArray,
            proceduralAnimationInterfaceFactoryInterfaceArray,
            layerInfo,
            rectangleArrayOfArrays,
        animationBehaviorFactory<xsl:for-each select="properties" ><xsl:if test="not(resetAnimationBehavior)" >, true</xsl:if><xsl:for-each select="resetAnimationBehavior" >, <xsl:value-of select="text()" /></xsl:for-each></xsl:for-each>) {; <xsl:for-each select="properties" ><xsl:if test="not(resetAnimationBehavior)" >//Using default true value when not in json</xsl:if></xsl:for-each> //abjson final boolean resetAnimationBehavior

        this.primitiveDrawingAnimationFactory = primitiveDrawingAnimationFactory
        this.width = this.layerInfo.getWidth()
        this.height = this.layerInfo.getHeight()
    }

    override public fun create(layoutIndex: Int, name: String, gdObject: GDObject, scaleX: Float, scaleY: Float, collidableBehavior: GDConditionWithGroupActions): GDGameLayer {
        if(!name.startsWith(gdObject.name)) {
            val stringUtil: StringUtil = StringUtil.getInstance()
            this.logUtil.put(StringMaker().append(name).append(" 0GDObject name: ").append(gdObject.name).append(" animationInterfaceFactoryInterfaceArray size: ").append(this.animationInterfaceFactoryInterfaceArray.length).append(" animationInterfaceFactoryInterfaceArray[0]: ").append(stringUtil.toString(this.animationInterfaceFactoryInterfaceArray[0])).toString(), this, "create", Exception())
        }

        val gdObjectWidth: Int = gdObject.Width(null)
        val gdObjectHeight: Int = gdObject.Height(null)
        ////this.logUtil.put(StringMaker().append(name).append(" 1GDObject name: ").append(gdObject.name).append(" gdObjectWidth: ").append(gdObjectWidth).append("gdObjectHeight: ").append(gdObjectHeight).append(" this.width: ").append(this.width).append(" this.height: ").append(this.height).toString(), this, "create")
        if(gdObjectWidth != 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> gdObjectHeight != 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> (this.width != gdObjectWidth || this.height != gdObjectHeight)) {
            this.layerInfo.setWidth(gdObjectWidth)
            this.layerInfo.setHeight(gdObjectHeight)
            //this.logUtil.put(StringMaker().append(name).append(" 2GDObject name: ").append(gdObject.name).append(commonSeps.SPACE).append(this.layerInfo.toString()).toString(), this, "create")
        } else {
            this.layerInfo.setWidth(this.width)
            this.layerInfo.setHeight(this.height)
            //this.logUtil.put(StringMaker().append(name).append(" 3GDObject name: ").append(gdObject.name).append(commonSeps.SPACE).append(this.layerInfo.toString()).toString(), this, "create")
        }

        val rectangle: Rectangle = this.init(gdObject, scaleX, scaleY)

        val gameLayer: GDCustomGameLayer = GDCustomGameLayer(
                layoutIndex,
                this.primitiveDrawingAnimationFactory.getInstance(0),
                this.gameLayerList, this.gameLayerDestroyedList,
                this.behaviorList,
                RemoteInfo.REMOTE_INFO,
                this.groupInterface,
                name,
                this.animationInterfaceFactoryInterfaceArray,
                this.proceduralAnimationInterfaceFactoryInterfaceArray,
                rectangle,
                this.rectangleArrayOfArrays,
                gdObject, this.animationBehaviorFactory.create(), this.resetAnimationBehavior) {
                    /*public void updatePosition() {
                        var change: Boolean = false
                        if(this.gdObject.x != this.getXP() || this.gdObject.y != this.getYP()) {
                            change = true
                        }
                        if(change) this.logUtil.put(this.getXP() + " TWBB " + this.getYP(), this, this.commonStrings.PROCESS)
                        super.updatePosition()
                        if(change) this.logUtil.put(this.getXP() + " TWBA " + this.getYP(), this, this.commonStrings.PROCESS)
                    }*/
                }

        //gameLayer.setInitialScale(scaleX, scaleY)

        if(gameLayer.hasCollisionMask()) {
            gameLayer.setCollidableInferface(GDCustomMaskCollidableBehavior(collidableBehavior, true))
        } else {
            gameLayer.setCollidableInferface(GDCustomCollidableBehavior(collidableBehavior, true))
        }

        //this.logUtil.put(StringMaker().append(name).append(" GDObject name: ").append(gdObject.name).append(" w/h/d: ").append(gameLayer.getWidth()).append('/').append(gameLayer.getHeight()).append('/').append(gameLayer.getDepth()).toString(), this, "create")

        var gameLayer: return
    }

    open public fun init(gdObject: GDObject, scaleX: Float, scaleY: Float): Rectangle {
        gdObject.updateScale(scaleX, scaleY)

        val rectangle: Rectangle = Rectangle(
            PointFactory.getInstance().ZERO_ZERO,
            (this.layerInfo.getWidth() * scaleX).toInt(),
            (this.layerInfo.getHeight() * scaleY).toInt()
        )

        var rectangle: return
    }

}

    </xsl:template>

</xsl:stylesheet>
