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
package org.allbinary.gdevelop.json.event.builtin;

/**
 *
 * @author User
 */
public class GDIncludeConfigFactory
{
    private static final GDIncludeConfigFactory instance = new GDIncludeConfigFactory();

    /**
     * @return the instance
     */
    public static GDIncludeConfigFactory getInstance()
    {
        return instance;
    }

    public final int INCLUDE_ALL = 0;
    public final int INCLUDE_EVENTS_GROUP = 1;
    //public final int INCLUDE_BY_INDEX = 2  // Deprecated
    
}
