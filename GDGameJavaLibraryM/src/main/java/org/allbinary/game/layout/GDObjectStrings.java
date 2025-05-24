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
package org.allbinary.game.layout;

/**
 *
 * @author User
 */
public class GDObjectStrings
{
    private static final GDObjectStrings instance = new GDObjectStrings();

    /**
     * @return the instance
     */
    public static GDObjectStrings getInstance()
    {
        return instance;
    }
    
    public final String GDOBJECT = "GDObject";
    public final String NAME = "name";
    public final String GD_GAME_LAYER_WAS_NULL = "GDGameLayer was null";
    
    public final String CALLING_GDNODE = " calling GDNode: ";
}
