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
public class GDParameterMetadata
{
    public final String type;
    public final String supplementaryInformation;
    public final boolean optional;
    public final String description;
    public final boolean codeOnly;

    private String longDescription = StringUtil.getInstance().EMPTY_STRING;
    private String defaultValue = StringUtil.getInstance().EMPTY_STRING;
    private String name = StringUtil.getInstance().EMPTY_STRING;

    public GDParameterMetadata(
            final String type,
            final String supplementaryInformation,
            final boolean optional,
            final String description,
            final boolean codeOnly
    )
    {
        this.type = type;
        this.supplementaryInformation = supplementaryInformation;
        this.optional = optional;
        this.description = description;
        this.codeOnly = codeOnly;
    }
        
    public GDParameterMetadata setLongDescription(final String longDescription) {
        this.longDescription = longDescription;
        return this;
    }

    public GDParameterMetadata setDefaultValue(final String defaultValue) {
        this.defaultValue = defaultValue;
        return this;
    }
    
}
