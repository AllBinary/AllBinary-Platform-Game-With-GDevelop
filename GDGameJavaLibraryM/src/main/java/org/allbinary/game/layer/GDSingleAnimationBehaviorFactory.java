/*
 * AllBinary Open License Version 1
 * Copyright (c) 2025 AllBinary
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

/**
 *
 * @author User
 */
public class GDSingleAnimationBehaviorFactory extends GDAnimationBehaviorBaseFactory {
 
    private static final GDSingleAnimationBehaviorFactory instance = new GDSingleAnimationBehaviorFactory();
    
    /**
     * @return the instance
     */
    public static GDAnimationBehaviorBaseFactory getInstance() {
        return instance;
    }

    public GDAnimationBehaviorBase create() {
        return new GDSingleAnimationBehavior();
    }
    
}
