/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
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
