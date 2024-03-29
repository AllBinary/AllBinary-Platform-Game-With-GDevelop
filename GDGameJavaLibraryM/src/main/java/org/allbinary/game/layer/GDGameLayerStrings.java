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
package org.allbinary.game.layer;

/**
 *
 * @author User
 */
public class GDGameLayerStrings
{
    private static final GDGameLayerStrings instance = new GDGameLayerStrings();

    /**
     * @return the instance
     */
    public static GDGameLayerStrings getInstance()
    {
        return instance;
    }
    
    public final String ADD_FORCE_AL = "AddForceUsingPolarCoordinates";
    public final String LENGTH = "length: ";
    public final String MULTIPLE_TIMES = "Attempting to add to cache more than 1 time: ";
}
