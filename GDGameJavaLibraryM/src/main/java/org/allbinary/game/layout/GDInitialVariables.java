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
package org.allbinary.game.layout;

/**
 *
 * @author User
 */
public class GDInitialVariables {
    
    private static final GDInitialVariables instance = new GDInitialVariables();

    /**
     * @return the instance
     */
    public static GDInitialVariables getInstance() {
        return instance;
    }
    
    public void reset() {
        
    }
}
