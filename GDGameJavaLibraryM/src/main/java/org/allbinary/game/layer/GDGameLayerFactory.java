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
package org.allbinary.game.layer;

import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.game.layout.GDObject;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.special.GDConditionWithGroupActions;
import org.allbinary.game.layer.special.GDCollidableBehavior;
import org.allbinary.game.physics.velocity.VelocityProperties;
import org.allbinary.graphics.Rectangle;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.view.ViewPosition;

/**
 *
 * @author User
 */
public class GDGameLayerFactory
{
    protected final BasicArrayList behaviorList;
    protected final Group[] groupInterface;
    protected final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray;
    protected final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray;
    protected final Rectangle layerInfo;
    protected final AnimationBehaviorBase animationBehavior;
    
    protected final BasicArrayList gameLayerList;
    protected final BasicArrayList gameLayerDestroyedList;
            
    public GDGameLayerFactory(final BasicArrayList gameLayerList, final BasicArrayList gameLayerDestroyedList, 
            final Group[] groupInterface,
            final BasicArrayList behaviorList,
            final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
            final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
            final Rectangle layerInfo) {
        this(gameLayerList, gameLayerDestroyedList, groupInterface, behaviorList, animationInterfaceFactoryInterfaceArray, proceduralAnimationInterfaceFactoryInterfaceArray, layerInfo, new RotationBehavior());
    }
    
    public GDGameLayerFactory(final BasicArrayList gameLayerList, final BasicArrayList gameLayerDestroyedList, 
            final Group[] groupInterface,
            final BasicArrayList behaviorList,
            final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
            final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
            final Rectangle layerInfo, final AnimationBehaviorBase animationBehavior) {
        
        this.groupInterface = groupInterface;
        this.behaviorList = behaviorList;
        this.animationInterfaceFactoryInterfaceArray = animationInterfaceFactoryInterfaceArray;
        this.proceduralAnimationInterfaceFactoryInterfaceArray = proceduralAnimationInterfaceFactoryInterfaceArray;
        this.layerInfo = layerInfo;
        this.animationBehavior = animationBehavior;
        
        this.gameLayerList = gameLayerList;
        this.gameLayerDestroyedList = gameLayerDestroyedList;
    }
    
    public GDGameLayer create(final String name, final GDObject gdObject, final GDConditionWithGroupActions collidableBehavior) throws Exception {
        
        if(!name.startsWith(gdObject.name)) {
            LogUtil.put(LogFactory.getInstance(new StringBuilder().append(name).append(" GDObject name: ").append(gdObject.name).append(" animationInterfaceFactoryInterfaceArray size: ").append(this.animationInterfaceFactoryInterfaceArray.length).append(" animationInterfaceFactoryInterfaceArray[0]: ").append(this.animationInterfaceFactoryInterfaceArray.length > 0 ? this.animationInterfaceFactoryInterfaceArray[0] : "empty").toString(), this, "create", new Exception()));
        }
        
        final GDGameLayer gameLayer = new GDGameLayer(
                this.gameLayerList, this.gameLayerDestroyedList,
                this.behaviorList,
                new VelocityProperties(3200, 3200),
                name,
                this.groupInterface,
                this.animationInterfaceFactoryInterfaceArray,
                this.proceduralAnimationInterfaceFactoryInterfaceArray,
                this.layerInfo, new ViewPosition(), 
                gdObject, this.animationBehavior);
        
        gameLayer.setCollidableInferface(new GDCollidableBehavior(gameLayer, collidableBehavior, true));

        //LogUtil.put(LogFactory.getInstance(new StringBuilder().append(name).append(" GDObject name: ").append(gdObject.name).append(" w/h/d: ").append(gameLayer.getWidth()).append('/').append(gameLayer.getHeight()).append('/').append(gameLayer.getDepth()).toString(), this, "create"));
        
        return gameLayer;
    }
    
}
