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
package org.allbinary.game.layer.form;

import org.allbinary.game.layer.GDAnimationBehaviorBase;
import org.allbinary.game.layer.GDAnimationBehaviorBaseFactory;

/**
 *
 * @author User
 */
public class GDTextInputAnimationBehaviorFactory extends GDAnimationBehaviorBaseFactory {
    
    private static final GDTextInputAnimationBehaviorFactory instance = new GDTextInputAnimationBehaviorFactory();

    /**
     * @return the instance
     */
    public static GDTextInputAnimationBehaviorFactory getInstance() {
        return instance;
    }
    
    @Override
    public GDAnimationBehaviorBase create() {
        return new GDTextInputAnimationBehavior();
    }
    
}
