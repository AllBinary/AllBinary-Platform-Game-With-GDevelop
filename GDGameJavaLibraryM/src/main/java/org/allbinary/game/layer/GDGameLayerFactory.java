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
import org.allbinary.animation.NullAnimationFactory;
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
import org.allbinary.game.layout.GDObject;
import org.allbinary.game.identification.Group;
import org.allbinary.game.layer.special.GDConditionWithGroupActions;
import org.allbinary.game.layer.special.GDWithAllBinaryCollidableBehavior;
import org.allbinary.game.multiplayer.layer.RemoteInfo;
import org.allbinary.game.physics.velocity.VelocityProperties;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.view.ViewPosition;

/**
 *
 * @author User
 */
public class GDGameLayerFactory
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    protected final BasicArrayList behaviorList;
    protected final Group[] groupInterface;
    protected final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray;
    protected final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray;
    protected final Rectangle layerInfo;
    protected final Rectangle[][] rectangleArrayOfArrays;
    protected final GDAnimationBehaviorBase animationBehavior;
    
    protected final BasicArrayList gameLayerList;
    protected final BasicArrayList gameLayerDestroyedList;
            
    public GDGameLayerFactory(final BasicArrayList gameLayerList, final BasicArrayList gameLayerDestroyedList, 
            final Group[] groupInterface,
            final BasicArrayList behaviorList,
            final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
            final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
            final Rectangle layerInfo,
            final Rectangle[][] rectangleArrayOfArrays) {
        this(gameLayerList, gameLayerDestroyedList, groupInterface, behaviorList, animationInterfaceFactoryInterfaceArray, proceduralAnimationInterfaceFactoryInterfaceArray, layerInfo, rectangleArrayOfArrays, new GDRotationBehavior());
    }
    
    public GDGameLayerFactory(final BasicArrayList gameLayerList, final BasicArrayList gameLayerDestroyedList, 
            final Group[] groupInterface,
            final BasicArrayList behaviorList,
            final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
            final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
            final Rectangle layerInfo, 
            final Rectangle[][] rectangleArrayOfArrays,
            final GDAnimationBehaviorBase animationBehavior) {
        
        this.groupInterface = groupInterface;
        this.behaviorList = behaviorList;
        this.animationInterfaceFactoryInterfaceArray = animationInterfaceFactoryInterfaceArray;
        this.proceduralAnimationInterfaceFactoryInterfaceArray = proceduralAnimationInterfaceFactoryInterfaceArray;
        this.layerInfo = layerInfo;
        this.rectangleArrayOfArrays = rectangleArrayOfArrays;
        this.animationBehavior = animationBehavior;
        
        this.gameLayerList = gameLayerList;
        this.gameLayerDestroyedList = gameLayerDestroyedList;
    }
    
    public GDGameLayer create(final int layoutIndex, final String name, final GDObject gdObject, final float scaleX, final float scaleY, final GDConditionWithGroupActions collidableBehavior) throws Exception {
        
        if(!name.startsWith(gdObject.name)) {
            logUtil.put(new StringMaker().append(name).append(" GDObject name: ").append(gdObject.name).append(" animationInterfaceFactoryInterfaceArray size: ").append(this.animationInterfaceFactoryInterfaceArray.length).append(" animationInterfaceFactoryInterfaceArray[0]: ").append(this.animationInterfaceFactoryInterfaceArray.length > 0 ? this.animationInterfaceFactoryInterfaceArray[0].toString() : "empty").toString(), this, "create", new Exception());
        }
        
        final Rectangle rectangle = new Rectangle(
            PointFactory.getInstance().ZERO_ZERO,
            (int) (this.layerInfo.getWidth() * scaleX), 
            (int) (this.layerInfo.getHeight() * scaleY)
        );

        gdObject.updateScale(scaleX, scaleY);
        
        final GDGameLayer gameLayer = new GDGameLayer(
            NullAnimationFactory.getFactoryInstance().getInstance(0), 
                this.gameLayerList, this.gameLayerDestroyedList,
                this.behaviorList,
                new VelocityProperties(9600, 9600),
                RemoteInfo.REMOTE_INFO,
                this.groupInterface,
                name,
                this.animationInterfaceFactoryInterfaceArray,
                this.proceduralAnimationInterfaceFactoryInterfaceArray,
                rectangle, 
                this.rectangleArrayOfArrays,
                new ViewPosition(), 
                gdObject, this.animationBehavior);
        
        //gameLayer.setInitialScale(scaleX, scaleY);

        gameLayer.setCollidableInferface(new GDWithAllBinaryCollidableBehavior(gameLayer, collidableBehavior, true));

        //logUtil.put(new StringMaker().append(name).append(" GDObject name: ").append(gdObject.name).append(" w/h/d: ").append(gameLayer.getWidth()).append('/').append(gameLayer.getHeight()).append('/').append(gameLayer.getDepth()).toString(), this, "create");
        
        return gameLayer;
    }
    
}
