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
public class ScalableProcessor extends ScalableBaseProcessor {
 
    private static final ScalableProcessor instance = new ScalableProcessor();

    /**
     * @return the instance
     */
    public static ScalableProcessor getInstance() {
        return instance;
    }
    
    public void process(final GDObject gdObject, final IndexedAnimation initIndexedAnimationInterface) {
        initIndexedAnimationInterface.setScale(gdObject.scaleX, gdObject.scaleY);
    }
}
