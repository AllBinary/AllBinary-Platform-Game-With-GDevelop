/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../../../java/lang/Object.js';
//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDParameterFactory } from './GDParameterFactory.js';
//not GWT import - same folder const GDParameterFactory
import { GDExtraInformation } from './GDExtraInformation.js';
//not GWT import - same folder const GDExtraInformation
import { GDParameterMetadata } from './GDParameterMetadata.js';
//not GWT import - same folder const GDParameterMetadata
import { StringBuilder } from './StringBuilder.js';
//not GWT import - same folder const StringBuilder
export class GDInstructionMetadata extends Object {
    constructor(extensionNamespace, name, fullname, description, sentence, group, icon, smallIcon) {
        super();
        this.parameterFactory = GDParameterFactory.getInstance();
        this.commonSeps = CommonSeps.getInstance();
        this.stringUtil = StringUtil.getInstance();
        this.codeExtraInformation = new GDExtraInformation();
        this.parameterList = new BasicArrayListD();
        this.usageComplexity = 5;
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
    addParameter(type, description, optionalObjectType, parameterIsOptional) {
        var supplementaryInformation = (this.parameterFactory.isObject(type) || this.parameterFactory.isBehavior(type))
            ?
                (optionalObjectType.isEmpty()
                    ?
                        this.stringUtil.EMPTY_STRING
                    :
                        this.extensionNamespace + optionalObjectType) : ;
        optionalObjectType;
        ;
        ;
        var parameterMetadata = new GDParameterMetadata(type, supplementaryInformation, parameterIsOptional, description, false);
        ;
        this.parameterList.add(parameterMetadata);
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
    addCodeOnlyParameter(type, supplementaryInformation) {
        var parameterMetadata = new GDParameterMetadata(type, supplementaryInformation, false, this.stringUtil.EMPTY_STRING, false);
        ;
        this.parameterList.add(parameterMetadata);
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
    useStandardRelationalOperatorParameters(type) {
        this.codeExtraInformation.setManipulatedType(type);
        this.addParameter(this.parameterFactory.RELATIONAL_OPERATOR, "Sign of the test", null, false);
        this.addParameter(type == this.parameterFactory.NUMBER
            ?
                this.parameterFactory.EXPRESSION
            :
                type);
        "Value to compare",
            null, false;
        ;
        var operatorParamIndex = this.parameterList.size() - 2;
        ;
        var valueParamIndex = this.parameterList.size() - 1;
        ;
        if (this.objectInstruction || this.behaviorInstruction) {
            var stringBuilder = new StringBuilder();
            ;
            stringBuilder.append(this.sentence);
            stringBuilder.append(GDInstructionMetadata._OF_PARAM0_);
            stringBuilder.append(GDInstructionMetadata._PARAM);
            stringBuilder.append(operatorParamIndex);
            stringBuilder.append(this.commonSeps.UNDERSCORE);
            stringBuilder.append(this.commonSeps.SPACE);
            stringBuilder.append(GDInstructionMetadata._PARAM);
            stringBuilder.append(valueParamIndex);
            stringBuilder.append(this.commonSeps.UNDERSCORE);
            this.sentence = stringBuilder.toString();
        }
        else {
            var stringBuilder = new StringBuilder();
            ;
            stringBuilder.append(this.sentence);
            stringBuilder.append(this.commonSeps.SPACE);
            stringBuilder.append(GDInstructionMetadata._PARAM);
            stringBuilder.append(operatorParamIndex);
            stringBuilder.append(this.commonSeps.UNDERSCORE);
            stringBuilder.append(this.commonSeps.SPACE);
            stringBuilder.append(GDInstructionMetadata._PARAM);
            stringBuilder.append(valueParamIndex);
            stringBuilder.append(this.commonSeps.UNDERSCORE);
            this.sentence = stringBuilder.toString();
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
    setParameterLongDescription(longDescription) {
        if (this.parameterList.size() > 0) {
            get = this.parameterList.get(this.parameterList.size() - 1);
            get;
            get.
                setLongDescription(longDescription);
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
    setDefaultValue(defaultValue) {
        if (this.parameterList.size() > 0) {
            get = this.parameterList.get(this.parameterList.size() - 1);
            get;
            get.
                setDefaultValue(defaultValue);
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
    setHidden() {
        this.hidden = true;
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
    useStandardOperatorParameters(type) {
        this.codeExtraInformation.setManipulatedType(type);
        this.addParameter(this.parameterFactory.OPERATOR, "Modification's sign", null, false);
        this.addParameter(type == this.parameterFactory.NUMBER
            ?
                this.parameterFactory.EXPRESSION
            :
                type);
        "Value",
            null, false;
        ;
        var operatorParamIndex = this.parameterList.size() - 2;
        ;
        var valueParamIndex = this.parameterList.size() - 1;
        ;
        if (this.objectInstruction || this.behaviorInstruction) {
            var stringBuilder = new StringBuilder();
            ;
            stringBuilder.append("Change ");
            stringBuilder.append(this.sentence);
            stringBuilder.append(" of _PARAM0_: ");
            stringBuilder.append(GDInstructionMetadata._PARAM);
            stringBuilder.append(operatorParamIndex);
            stringBuilder.append(this.commonSeps.UNDERSCORE);
            stringBuilder.append(this.commonSeps.SPACE);
            stringBuilder.append(GDInstructionMetadata._PARAM);
            stringBuilder.append(valueParamIndex);
            stringBuilder.append(this.commonSeps.UNDERSCORE);
            this.sentence = stringBuilder.toString();
        }
        else {
            var stringBuilder = new StringBuilder();
            ;
            stringBuilder.append("Change ");
            stringBuilder.append(this.sentence);
            stringBuilder.append(": ");
            stringBuilder.append(GDInstructionMetadata._PARAM);
            stringBuilder.append(operatorParamIndex);
            stringBuilder.append(this.commonSeps.UNDERSCORE);
            stringBuilder.append(this.commonSeps.SPACE);
            stringBuilder.append(GDInstructionMetadata._PARAM);
            stringBuilder.append(valueParamIndex);
            stringBuilder.append(this.commonSeps.UNDERSCORE);
            this.sentence = stringBuilder.toString();
        }
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
    markAsSimple() {
        this.usageComplexity = 2;
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
    markAsAdvanced() {
        this.usageComplexity = 7;
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
    markAsComplex() {
        this.usageComplexity = 9;
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
}
GDInstructionMetadata._PARAM = "_PARAM";
GDInstructionMetadata._OF_PARAM0_ = " of _PARAM0_ ";
