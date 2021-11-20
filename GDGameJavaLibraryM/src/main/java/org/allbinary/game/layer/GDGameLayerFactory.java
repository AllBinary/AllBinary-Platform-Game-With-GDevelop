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
import org.allbinary.game.layer.special.GDActionsCollidableBehavior;
import org.allbinary.game.layer.special.GDCollidableBehavior;
import org.allbinary.graphics.Rectangle;

/**
 *
 * @author User
 */
public class GDGameLayerFactory
{
    private final Group[] groupInterface;
    private final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray;
    private final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray;
    private final Rectangle layerInfo;
    
    public GDGameLayerFactory(final Group[] groupInterface,
            final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
            final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
            final Rectangle layerInfo) {
        
        this.groupInterface = groupInterface;
        this.animationInterfaceFactoryInterfaceArray = animationInterfaceFactoryInterfaceArray;
        this.proceduralAnimationInterfaceFactoryInterfaceArray = proceduralAnimationInterfaceFactoryInterfaceArray;
        this.layerInfo = layerInfo;
    }
    
    public GDGameLayer create(final String name, final GDObject gdObject, final GDActionsCollidableBehavior collidableBehavior) throws Exception {
        
        final GDGameLayer gameLayer = new GDGameLayer(name,
                this.groupInterface,
                this.animationInterfaceFactoryInterfaceArray,
                this.proceduralAnimationInterfaceFactoryInterfaceArray,
                this.layerInfo, gdObject);
        
        gameLayer.setCollidableInferface(new GDCollidableBehavior(gameLayer, collidableBehavior, true));

        return gameLayer;
    }
    
}
