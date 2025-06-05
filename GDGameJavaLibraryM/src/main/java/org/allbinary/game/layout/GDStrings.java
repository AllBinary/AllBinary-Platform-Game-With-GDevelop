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
package org.allbinary.game.layout;

/**
 *
 * @author User
 */
public class GDStrings {

    private static final GDStrings instance = new GDStrings();

    /**
     * @return the instance
     */
    public static GDStrings getInstance() {
        return instance;
    }

    public final String CANVAS_NEW = "Canvas is to new to process this action: ";
    public final String SCENE_NEW = "Scene is to new to process this action: ";
    
}
