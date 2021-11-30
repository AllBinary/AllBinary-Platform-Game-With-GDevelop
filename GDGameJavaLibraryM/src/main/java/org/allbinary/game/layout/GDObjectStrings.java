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
    public final String ANIMATION = "animation";
    public final String ANGLE = "angle";
    public final String MOVEMENT_ANGLE = "movement_angle";
    public final String ROTATION = "rotation";

}
