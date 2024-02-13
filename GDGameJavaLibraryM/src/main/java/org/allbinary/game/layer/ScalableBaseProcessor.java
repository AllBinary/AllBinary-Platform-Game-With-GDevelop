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
package org.allbinary.game.layer;

import org.allbinary.animation.IndexedAnimation;
import org.allbinary.game.layout.GDObject;

/**
 *
 * @author User
 */
public class ScalableBaseProcessor {
    
    private static final ScalableBaseProcessor instance = new ScalableBaseProcessor();

    /**
     * @return the instance
     */
    public static ScalableBaseProcessor getInstance() {
        return instance;
    }
    
    public void process(final GDGameLayer gameLayer, final IndexedAnimation initIndexedAnimationInterface) {
        
    }
}
