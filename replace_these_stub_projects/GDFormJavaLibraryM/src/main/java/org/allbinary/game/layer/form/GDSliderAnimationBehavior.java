/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
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
package org.allbinary.game.layer.form;

import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.game.layer.GDGameLayer;
import org.allbinary.game.layout.GDObject;

/**
 *
 * @author User
 */
public class GDSliderAnimationBehavior extends GDItemAnimationBehavior 
implements GDGameLayerItemStateListener {
    
    public GDSliderAnimationBehavior() {
    }

    @Override
    public IndexedAnimation[] init(final GDObject gdObject, final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray) {
        return null;
    }
    
    @Override
    public void setAnimationArray(final IndexedAnimation[] animationArray)
    {
    }
    
    public void setValue(final int value) {
    }
    
    @Override
    public void add(final GDGameLayer gameLayer) {
    }

    @Override
    public void itemStateChanged(GDGameLayer gameLayerAsItem) {
        
    }
    
    public int Value() {
        throw new RuntimeException();
    }
}
