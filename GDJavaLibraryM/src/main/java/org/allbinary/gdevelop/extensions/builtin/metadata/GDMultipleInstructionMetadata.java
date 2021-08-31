/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.extensions.builtin.metadata;

/**
 *
 * @author User
 */
public class GDMultipleInstructionMetadata
{

    public final GDExpressionMetadata expression;
    public final GDInstructionMetadata conditionInstructionMetadata;
    public final GDInstructionMetadata actionInstructionMetadata;

    public GDMultipleInstructionMetadata(
            final GDExpressionMetadata expression,
            final GDInstructionMetadata conditionInstructionMetadata,
            final GDInstructionMetadata actionInstructionMetadata)
    {
        this.expression = expression;
        this.conditionInstructionMetadata = conditionInstructionMetadata;
        this.actionInstructionMetadata = actionInstructionMetadata;
    }

    public GDMultipleInstructionMetadata addParameter(
            final String type,
            final String label,
            final String optionalObjectType,
            final boolean parameterIsOptional)
    {

        if (expression != null)
        {
            expression.addParameter(
                    type, label, optionalObjectType, parameterIsOptional);
        }
        if (conditionInstructionMetadata != null)
        {
            conditionInstructionMetadata.addParameter(
                    type, label, optionalObjectType, parameterIsOptional);
        }
        if (actionInstructionMetadata != null)
        {
            actionInstructionMetadata.addParameter(
                    type, label, optionalObjectType, parameterIsOptional);
        }
        return this;
    }
    
    public GDMultipleInstructionMetadata useStandardParameters(final String type) {

        if (conditionInstructionMetadata != null) {
            conditionInstructionMetadata.useStandardRelationalOperatorParameters(type);
        }
    
        if (actionInstructionMetadata != null) {
            actionInstructionMetadata.useStandardOperatorParameters(type);
        }

        return this;
    }
    
}
