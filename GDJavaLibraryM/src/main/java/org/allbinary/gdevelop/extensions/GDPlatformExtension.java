/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.extensions;

import org.allbinary.gdevelop.extensions.builtin.metadata.GDBehaviorMetadata;
import org.allbinary.logic.basic.string.StringUtil;

/**
 *
 * @author User
 */
public class GDPlatformExtension extends GDBehaviorMetadata
{

    private static final GDPlatformExtension instance = new GDPlatformExtension();

    /**
     * @return the instance
     */
    public static GDPlatformExtension getInstance()
    {
        return instance;
    }

    public final String NAMESPACE_SEP = "::";

    private GDPlatformExtension()
    {
        super(StringUtil.getInstance().EMPTY_STRING,
            StringUtil.getInstance().EMPTY_STRING,
            StringUtil.getInstance().EMPTY_STRING,
            StringUtil.getInstance().EMPTY_STRING,
            StringUtil.getInstance().EMPTY_STRING,
            StringUtil.getInstance().EMPTY_STRING,
            StringUtil.getInstance().EMPTY_STRING,
            StringUtil.getInstance().EMPTY_STRING,
            null,
            null);
    }    
}
