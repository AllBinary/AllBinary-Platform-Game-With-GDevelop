/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.extensions.builtin.metadata;

import org.allbinary.logic.basic.string.CommonSeps;
import org.allbinary.logic.basic.string.StringUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDInstructionMetadata
{

    private static final String _PARAM = "_PARAM";
    private static final String _OF_PARAM0_ = " of _PARAM0_ ";

    private final GDParameterFactory parameterFactory = GDParameterFactory.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();
    private final StringUtil stringUtil = StringUtil.getInstance();

    public final String name;
    public final String fullname;
    public final String description;
    public String sentence;
    public final String group;
    public final String icon;
    public final String smallIcon;

    public final String extensionNamespace;

    public final String helpPath;

    public final boolean canHaveSubInstructions;
    public final boolean isPrivate;
    public final boolean objectInstruction;
    public final boolean behaviorInstruction;

    public final GDExtraInformation codeExtraInformation = new GDExtraInformation();

    public final BasicArrayList parameterList = new BasicArrayList();

    public boolean hidden;
    public int usageComplexity = 5;

    public GDInstructionMetadata(final String extensionNamespace,
            final String name,
            final String fullname,
            final String description,
            final String sentence,
            final String group,
            final String icon,
            final String smallIcon)
    {

        this.extensionNamespace = extensionNamespace;
        this.name = name;
        this.fullname = fullname;
        this.description = description;
        this.sentence = sentence;
        this.group = group;
        this.icon = icon;
        this.smallIcon = smallIcon;

        this.helpPath = this.stringUtil.EMPTY_STRING;

        this.canHaveSubInstructions = false;
        this.hidden = false;
        this.isPrivate = false;
        this.objectInstruction = false;
        this.behaviorInstruction = false;
    }

    public GDInstructionMetadata addParameter(
            final String type,
            final String description,
            final String optionalObjectType,
            final boolean parameterIsOptional)
    {
        final String supplementaryInformation
                = (parameterFactory.isObject(type)
                || parameterFactory.isBehavior(type))
                ? (optionalObjectType.isEmpty()
                ? this.stringUtil.EMPTY_STRING
                : extensionNamespace + optionalObjectType)
                : optionalObjectType;

        final GDParameterMetadata parameterMetadata = new GDParameterMetadata(
                type,
                supplementaryInformation,
                parameterIsOptional,
                description,
                false
        );

        this.parameterList.add(parameterMetadata);

        return this;
    }

    public GDInstructionMetadata addCodeOnlyParameter(final String type, final String supplementaryInformation)
    {
        final GDParameterMetadata parameterMetadata = new GDParameterMetadata(
                type,
                supplementaryInformation,
                false,
                this.stringUtil.EMPTY_STRING,
                false
        );

        this.parameterList.add(parameterMetadata);
        return this;
    }

    public GDInstructionMetadata useStandardRelationalOperatorParameters(final String type)
    {

        this.codeExtraInformation.setManipulatedType(type);
        this.addParameter(this.parameterFactory.RELATIONAL_OPERATOR, "Sign of the test", null, false);
        this.addParameter(type == this.parameterFactory.NUMBER ? this.parameterFactory.EXPRESSION : type, "Value to compare", null, false);

        final int operatorParamIndex = this.parameterList.size() - 2;
        final int valueParamIndex = this.parameterList.size() - 1;

        if (objectInstruction || behaviorInstruction)
        {
            final StringBuilder stringBuilder = new StringBuilder();

            stringBuilder.append(this.sentence);
            stringBuilder.append(_OF_PARAM0_);
            stringBuilder.append(_PARAM);
            stringBuilder.append(operatorParamIndex);
            stringBuilder.append(commonSeps.UNDERSCORE);
            stringBuilder.append(commonSeps.SPACE);
            stringBuilder.append(_PARAM);
            stringBuilder.append(valueParamIndex);
            stringBuilder.append(commonSeps.UNDERSCORE);

            this.sentence = stringBuilder.toString();

        } else
        {
            final StringBuilder stringBuilder = new StringBuilder();

            stringBuilder.append(this.sentence);
            stringBuilder.append(commonSeps.SPACE);
            stringBuilder.append(_PARAM);
            stringBuilder.append(operatorParamIndex);
            stringBuilder.append(commonSeps.UNDERSCORE);
            stringBuilder.append(commonSeps.SPACE);
            stringBuilder.append(_PARAM);
            stringBuilder.append(valueParamIndex);
            stringBuilder.append(commonSeps.UNDERSCORE);

            this.sentence = stringBuilder.toString();
        }

        return this;
    }

    public GDInstructionMetadata setParameterLongDescription(final String longDescription)
    {
        if (this.parameterList.size() > 0)
        {
            ((GDParameterMetadata) this.parameterList.get(this.parameterList.size() - 1)).setLongDescription(longDescription);
        }

        return this;
    }
    
    public GDInstructionMetadata setDefaultValue(final String defaultValue) {
        if (this.parameterList.size() > 0)
        {
            ((GDParameterMetadata) this.parameterList.get(this.parameterList.size() - 1)).setDefaultValue(defaultValue);
        }

        return this;
    }

    public GDInstructionMetadata setHidden() {
        this.hidden = true;
        return this;
    }
    
    public GDInstructionMetadata useStandardOperatorParameters(final String type)
    {

        this.codeExtraInformation.setManipulatedType(type);
        this.addParameter(this.parameterFactory.OPERATOR, "Modification's sign", null, false);
        this.addParameter(type == this.parameterFactory.NUMBER ? this.parameterFactory.EXPRESSION : type, "Value", null, false);

        final int operatorParamIndex = this.parameterList.size() - 2;
        final int valueParamIndex = this.parameterList.size() - 1;

        if (objectInstruction || behaviorInstruction)
        {

            final StringBuilder stringBuilder = new StringBuilder();

            stringBuilder.append("Change ");
            stringBuilder.append(this.sentence);
            stringBuilder.append(" of _PARAM0_: ");
            stringBuilder.append(this._PARAM);
            stringBuilder.append(operatorParamIndex);
            stringBuilder.append(commonSeps.UNDERSCORE);
            stringBuilder.append(commonSeps.SPACE);
            stringBuilder.append(this._PARAM);
            stringBuilder.append(valueParamIndex);
            stringBuilder.append(commonSeps.UNDERSCORE);

            sentence = stringBuilder.toString();

        } else
        {

            final StringBuilder stringBuilder = new StringBuilder();

            stringBuilder.append("Change ");
            stringBuilder.append(this.sentence);
            stringBuilder.append(": ");
            stringBuilder.append(this._PARAM);
            stringBuilder.append(operatorParamIndex);
            stringBuilder.append(commonSeps.UNDERSCORE);
            stringBuilder.append(commonSeps.SPACE);
            stringBuilder.append(this._PARAM);
            stringBuilder.append(valueParamIndex);
            stringBuilder.append(commonSeps.UNDERSCORE);

            sentence = stringBuilder.toString();
        }

        return this;
    }

    public GDInstructionMetadata markAsSimple()
    {
        usageComplexity = 2;
        return this;
    }

    public GDInstructionMetadata markAsAdvanced()
    {
        usageComplexity = 7;
        return this;
    }

    public GDInstructionMetadata markAsComplex()
    {
        usageComplexity = 9;
        return this;
    }

}
