/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.extensions.builtin.metadata;

import org.allbinary.logic.string.StringUtil;

/**
 *
 * @author User
 */
public class GDExtraInformation
{
    public String type = StringUtil.getInstance().NULL_STRING;
    
    public void setManipulatedType(final String type) {
        this.type = type;
    }
}
