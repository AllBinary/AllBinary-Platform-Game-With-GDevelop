/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../../../java/lang/Object.js';
import { GDPlatformExtension } from '../../../../../../org/allbinary/gdevelop/extensions/GDPlatformExtension.js';
//not GWT import const GDBehaviorsSharedData
//not plain js import { CommonSeps } 
const CommonSeps = globalThis.org.allbinary.string.CommonSeps;
//not plain js import { ABHashMap } 
const ABHashMap = globalThis.org.allbinary.util.ABHashMap;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDParameterFactory } from './GDParameterFactory.js';
//not GWT import - same folder const GDParameterFactory
import { GDInstructionMetadata } from './GDInstructionMetadata.js';
//not GWT import - same folder const GDInstructionMetadata
import { StringBuilder } from './StringBuilder.js';
//not GWT import - same folder const StringBuilder
import { GDExpressionMetadata } from './GDExpressionMetadata.js';
//not GWT import - same folder const GDExpressionMetadata
import { GDMultipleInstructionMetadata } from './GDMultipleInstructionMetadata.js';
//not GWT import - same folder const GDMultipleInstructionMetadata
export class GDBehaviorMetadata extends Object {
    constructor(extensionNamespace, name, fullname, defaultName, description, group, icon24x24, className, behavior, behaviorsSharedData) {
        super();
        this.commonSeps = CommonSeps.getInstance();
        this.parameterFactory = GDParameterFactory.getInstance();
        this.conditionInstructionMetadataList = new BasicArrayListD();
        this.actionInstructionMetadataList = new BasicArrayListD();
        this.nameToConditionInstructionMetadataMap = new ABHashMap();
        this.nameToActionInstructionMetadataMap = new ABHashMap();
        this.nameToExpressionMetadataMap = new ABHashMap();
        this.nameToStrExpressionMetadataMap = new ABHashMap();
        this.extensionNamespace = extensionNamespace;
        this.name = name;
        this.fullname = fullname;
        this.defaultName = defaultName;
        this.description = description;
        this.group = group;
        this.icon24x24 = icon24x24;
        this.className = className;
        this.behavior = behavior;
        this.behaviorsSharedData = behaviorsSharedData;
    }
    addCondition(name, fullname, description, sentence, group, icon, smallicon) {
        var nameWithNamespace = this.extensionNamespace.isEmpty()
            ?
                name
            :
                this.extensionNamespace + name;
        ;
        ;
        var instructionMetadata = new GDInstructionMetadata(this.extensionNamespace, nameWithNamespace, fullname, description, sentence, group, icon, smallicon);
        ;
        this.conditionInstructionMetadataList.add(instructionMetadata);
        //if statement needs to be on the same line and ternary does not work the same way.
        return instructionMetadata;
    }
    addAction(name, fullname, description, sentence, group, icon, smallicon) {
        var nameWithNamespace = this.extensionNamespace.isEmpty()
            ?
                name
            :
                this.extensionNamespace + name;
        ;
        ;
        var instructionMetadata = new GDInstructionMetadata(this.extensionNamespace, nameWithNamespace, fullname, description, sentence, group, icon, smallicon);
        ;
        this.actionInstructionMetadataList.add(instructionMetadata);
        //if statement needs to be on the same line and ternary does not work the same way.
        return instructionMetadata;
    }
    addScopedCondition(name, fullname, description, sentence, group, icon, smallicon) {
        var nameWithNamespace = new StringBuilder().append(this.getName()).append(GDPlatformExtension.getInstance().NAMESPACE_SEP).append(name).toString();
        ;
        var instructionMetadata = new GDInstructionMetadata(this.extensionNamespace, nameWithNamespace, fullname, description, sentence, group, icon, smallicon);
        ;
        this.nameToConditionInstructionMetadataMap.put(nameWithNamespace, instructionMetadata);
        //if statement needs to be on the same line and ternary does not work the same way.
        return instructionMetadata;
    }
    addScopedAction(name, fullname, description, sentence, group, icon, smallicon) {
        var nameWithNamespace = new StringBuilder().append(this.getName()).append(GDPlatformExtension.getInstance().NAMESPACE_SEP).append(name).toString();
        ;
        var instructionMetadata = new GDInstructionMetadata(this.extensionNamespace, nameWithNamespace, fullname, description, sentence, group, icon, smallicon);
        ;
        this.nameToActionInstructionMetadataMap.put(nameWithNamespace, instructionMetadata);
        //if statement needs to be on the same line and ternary does not work the same way.
        return instructionMetadata;
    }
    addExpression(name, fullname, description, group, smallicon) {
        var expressionMetadata = new GDExpressionMetadata(this.parameterFactory.NUMBER, this.extensionNamespace, name, fullname, description, group, smallicon);
        ;
        this.nameToExpressionMetadataMap.put(name, expressionMetadata);
        //if statement needs to be on the same line and ternary does not work the same way.
        return expressionMetadata;
    }
    addStrExpression(name, fullname, description, group, smallicon) {
        var expressionMetadata = new GDExpressionMetadata(this.parameterFactory.STRING, this.extensionNamespace, name, fullname, description, group, smallicon);
        ;
        this.nameToStrExpressionMetadataMap.put(name, expressionMetadata);
        //if statement needs to be on the same line and ternary does not work the same way.
        return expressionMetadata;
    }
    addExpressionAndConditionAndAction(type, name, fullname, descriptionSubject, sentenceName, group, icon) {
        var expression = (type == this.parameterFactory.NUMBER)
            ?
                this.addExpression(name, fullname, new StringBuilder().append(GDBehaviorMetadata.RETURN_).append(descriptionSubject).append(this.commonSeps.PERIOD).toString(), group, icon)
            :
                this.addStrExpression(name, fullname, new StringBuilder().append(GDBehaviorMetadata.RETURN_).append(descriptionSubject).append(this.commonSeps.PERIOD).toString(), group, icon);
        ;
        ;
        var conditionInstructionMetadata = this.addScopedCondition(name, fullname, new StringBuilder().append(GDBehaviorMetadata.COMPARE_).append(descriptionSubject).append(this.commonSeps.PERIOD).toString(), sentenceName, group, icon, icon);
        ;
        var actionInstructionMetadata = this.addScopedAction("Set" + name, fullname, new StringBuilder().append(GDBehaviorMetadata.COMPARE_).append(descriptionSubject).append(this.commonSeps.PERIOD).toString(), sentenceName, group, icon, icon);
        ;
        //if statement needs to be on the same line and ternary does not work the same way.
        return new GDMultipleInstructionMetadata(expression, conditionInstructionMetadata, actionInstructionMetadata);
    }
    getName() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.behavior.type;
    }
}
GDBehaviorMetadata.RETURN_ = "Return ";
GDBehaviorMetadata.COMPARE_ = "Compare ";
