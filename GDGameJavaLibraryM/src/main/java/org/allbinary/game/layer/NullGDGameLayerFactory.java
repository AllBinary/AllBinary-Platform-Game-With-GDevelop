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
import org.allbinary.animation.BasicAnimationInterfaceFactoryInterface;
import org.allbinary.animation.NullRotationAnimationFactory;
import org.allbinary.game.identification.GroupFactory;
import org.allbinary.game.layout.GDObject;
import org.allbinary.graphics.RectangleFactory;
import org.allbinary.util.BasicArrayListUtil;

/**
 *
 * @author User
 */
public class NullGDGameLayerFactory extends GDGameLayerFactory
{
    public static final NullGDGameLayerFactory NULL_GD_GAME_LAYER_FACTORY = new NullGDGameLayerFactory();
    
    private NullGDGameLayerFactory() {
        
        super(BasicArrayListUtil.getInstance().getImmutableInstance(), BasicArrayListUtil.getInstance().getImmutableInstance(), GroupFactory.getInstance().NULL_GROUP_ARRAY, BasicArrayListUtil.getInstance().getImmutableInstance(), new AnimationInterfaceFactoryInterface[] {NullRotationAnimationFactory.getFactoryInstance()}, new BasicAnimationInterfaceFactoryInterface[] {NullRotationAnimationFactory.getFactoryInstance()}, RectangleFactory.SINGLETON, RectangleFactory.ARRAY_OF_ARRAYS, false);
    }
    
    public GDGameLayer create(final GDObject gdObject) {
        
        throw new RuntimeException();
        //return null;
    }
}
