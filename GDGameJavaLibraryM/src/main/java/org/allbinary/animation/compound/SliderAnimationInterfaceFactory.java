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
package org.allbinary.animation.compound;

import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationBehaviorFactory;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.IndexedAnimation;

public class SliderAnimationInterfaceFactory
    extends CompoundAnimationInterfaceFactory {

    private int width;
    private int height;
        
    public SliderAnimationInterfaceFactory(
        final AnimationInterfaceFactoryInterface[] basicAnimationInterfaceFactoryInterfaceArray,
        final int width, final int height)
    {
        this(basicAnimationInterfaceFactoryInterfaceArray, width, height, AnimationBehaviorFactory.getInstance());
    }
    
    public SliderAnimationInterfaceFactory(
        final AnimationInterfaceFactoryInterface[] basicAnimationInterfaceFactoryInterfaceArray, 
        final int width, final int height, final AnimationBehaviorFactory animationBehaviorFactory)
    {
        super(basicAnimationInterfaceFactoryInterfaceArray, animationBehaviorFactory);
        
        this.width = width;
        this.height = height;
    }

    //@Override
    protected Animation[] createArray(final int size) {
        return new IndexedAnimation[size];
    }
    
    //@Override
    protected Animation getInstance(final Animation[] animationInterfaceArray) {
        return new SliderAnimation((IndexedAnimation[]) animationInterfaceArray, this.width, this.height, this.animationBehaviorFactory.getOrCreateInstance());
    }
 
    public void setInitialSize(final int width, final int height) {        
        this.width = width;
        this.height = height;
    }
}
