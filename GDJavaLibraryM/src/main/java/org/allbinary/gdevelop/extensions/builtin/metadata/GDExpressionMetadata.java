/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.extensions.builtin.metadata;

import org.allbinary.logic.basic.string.StringUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDExpressionMetadata
{

    private final StringUtil stringUtil = StringUtil.getInstance();
    private final GDParameterFactory parameterFactory = GDParameterFactory.getInstance();

    public final String returnType;
    public final String fullname;
    public final String description;
    public final String group;

    public final String smallIconFilename;
    public final String extensionNamespace;
    public final boolean isPrivate;

    public final BasicArrayList parameterMetadataList = new BasicArrayList();

    public boolean shown;
    public String helpPath;

    public GDExpressionMetadata(final String returnType,
            final String extensionNamespace,
            final String name,
            final String fullname,
            final String description,
            final String group,
            final String smallicon)
    {

        this.returnType = returnType;
        this.extensionNamespace = extensionNamespace;
        this.fullname = fullname;
        this.description = description;
        this.group = group;
        this.shown = true;
        this.smallIconFilename = smallicon;
        this.isPrivate = false;
    }

    public GDExpressionMetadata addParameter(
            final String type,
            final String description,
            final String optionalObjectType,
            final boolean parameterIsOptional)
    {
        final String supplementaryInformation
                = (this.parameterFactory.isObject(type)
                || this.parameterFactory.isBehavior(type))
                ? (optionalObjectType.isEmpty() ? this.stringUtil.EMPTY_STRING : extensionNamespace + optionalObjectType)
                : optionalObjectType;

        final GDParameterMetadata parameterMetadata = new GDParameterMetadata(
                type,
                supplementaryInformation,
                parameterIsOptional,
                description,
                false
        );

        this.parameterMetadataList.add(parameterMetadata);

        return this;
    }
    
    public GDExpressionMetadata addCodeOnlyParameter(
            final String type, final String supplementaryInformation)
    {
        final GDParameterMetadata parameterMetadata = new GDParameterMetadata(
                type, supplementaryInformation, false,
                this.stringUtil.EMPTY_STRING, true);

        this.parameterMetadataList.add(parameterMetadata);

        return this;
    }

    public GDExpressionMetadata setHidden() {
        this.shown = false;
        return this;
    }

}
