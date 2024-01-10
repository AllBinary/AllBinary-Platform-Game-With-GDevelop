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
                
package org.allbinary.game.layer;

import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.special.GDCustomCollidableBehavior;
import org.allbinary.game.layer.special.GDConditionWithGroupActions;
import org.allbinary.game.layout.GDObject;
import org.allbinary.graphics.Rectangle;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;

public class GDCustomGameLayerFactory extends GDGameLayerFactory
{

    private final int width;
    private final int height;

    public GDCustomGameLayerFactory(
            final BasicArrayList gameLayerList, final BasicArrayList gameLayerDestroyedList, 
            final Group[] groupInterface,
            final BasicArrayList behaviorList,
            final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
            final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
            final Rectangle layerInfo,
            final Rectangle[][] rectangleArrayOfArrays) {
        this(gameLayerList, gameLayerDestroyedList, groupInterface, behaviorList, animationInterfaceFactoryInterfaceArray, proceduralAnimationInterfaceFactoryInterfaceArray, layerInfo, rectangleArrayOfArrays, new RotationBehavior());
    }
    
    public GDCustomGameLayerFactory(
            final BasicArrayList gameLayerList, final BasicArrayList gameLayerDestroyedList, 
            final Group[] groupInterface,
            final BasicArrayList behaviorList,
            final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
            final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
            final Rectangle layerInfo, 
            final Rectangle[][] rectangleArrayOfArrays,
            final AnimationBehaviorBase animationBehavior) {
        
        super(gameLayerList, gameLayerDestroyedList, 
            groupInterface,
            behaviorList,
            animationInterfaceFactoryInterfaceArray,
            proceduralAnimationInterfaceFactoryInterfaceArray,
            layerInfo, 
            rectangleArrayOfArrays, 
            animationBehavior);
        
        this.width = this.layerInfo.getWidth();
        this.height = this.layerInfo.getHeight();
    }
    
    @Override
    public GDGameLayer create(final String name, final GDObject gdObject, final GDConditionWithGroupActions collidableBehavior) throws Exception {
        
        if(!name.startsWith(gdObject.name)) {
            LogUtil.put(LogFactory.getInstance(new StringBuilder().append(name).append(" GDObject name: ").append(gdObject.name).append(" animationInterfaceFactoryInterfaceArray size: ").append(this.animationInterfaceFactoryInterfaceArray.length).append(" animationInterfaceFactoryInterfaceArray[0]: ").append(this.animationInterfaceFactoryInterfaceArray[0]).toString(), this, "create", new Exception()));
        }

        //LogUtil.put(LogFactory.getInstance(new StringBuilder().append(name).append(" GDObject name: ").append(gdObject.name).append(" gdObject.width: ").append(gdObject.width).append("gdObject.height: ").append(gdObject.height).append(" this.width: ").append(this.width).append(" this.height: ").append(this.height).toString(), this, "create"));
        if(gdObject.width != 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> gdObject.height != 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> (this.width != gdObject.width || this.height != gdObject.height)) {
            //LogUtil.put(LogFactory.getInstance(new StringBuilder().append(name).append(" GDObject name: ").append(gdObject.name).toString(), this, "create"));
            this.layerInfo.setWidth(gdObject.width);
            this.layerInfo.setHeight(gdObject.height);
        } else {
            this.layerInfo.setWidth(this.width);
            this.layerInfo.setHeight(this.height);
        }

        final GDCustomGameLayer gameLayer = new GDCustomGameLayer(
                this.gameLayerList, this.gameLayerDestroyedList,
                this.behaviorList,
                name,
                this.groupInterface,
                this.animationInterfaceFactoryInterfaceArray,
                this.proceduralAnimationInterfaceFactoryInterfaceArray,
                this.layerInfo,  
                this.rectangleArrayOfArrays,
                gdObject, this.animationBehavior);
        
        gameLayer.setCollidableInferface(new GDCustomCollidableBehavior(gameLayer, collidableBehavior, true));

        //LogUtil.put(LogFactory.getInstance(new StringBuilder().append(name).append(" GDObject name: ").append(gdObject.name).append(" w/h/d: ").append(gameLayer.getWidth()).append('/').append(gameLayer.getHeight()).append('/').append(gameLayer.getDepth()).toString(), this, "create"));
        
        return gameLayer;
    }
    
}

    </xsl:template>

</xsl:stylesheet>
