/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.project;

import org.allbinary.logic.string.StringUtil;

/**
 *
 * @author User
 */
public class GDProjectBehavior
{
    public static final GDProjectBehavior NULL_GDBEHAVIOR = new GDProjectBehavior(StringUtil.getInstance().NULL_STRING);

    public final String type;
    
    public GDProjectBehavior(final String type) {
        this.type = type;
    }
}
