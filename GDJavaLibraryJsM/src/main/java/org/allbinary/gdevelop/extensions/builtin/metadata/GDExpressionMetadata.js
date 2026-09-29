/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../../../java/lang/Object.js';
//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDParameterFactory } from './GDParameterFactory.js';
//not GWT import - same folder const GDParameterFactory
import { GDParameterMetadata } from './GDParameterMetadata.js';
//not GWT import - same folder const GDParameterMetadata
export class GDExpressionMetadata extends Object {
    constructor(returnType, extensionNamespace, name, fullname, description, group, smallicon) {
        super();
        this.stringUtil = StringUtil.getInstance();
        this.parameterFactory = GDParameterFactory.getInstance();
        this.parameterMetadataList = new BasicArrayListD();
        this.returnType = returnType;
        this.extensionNamespace = extensionNamespace;
        this.fullname = fullname;
        this.description = description;
        this.group = group;
        this.shown = true;
        this.smallIconFilename = smallicon;
        this.isPrivate = false;
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
        this.parameterMetadataList.add(parameterMetadata);
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
    addCodeOnlyParameter(type, supplementaryInformation) {
        var parameterMetadata = new GDParameterMetadata(type, supplementaryInformation, false, this.stringUtil.EMPTY_STRING, true);
        ;
        this.parameterMetadataList.add(parameterMetadata);
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
    setHidden() {
        this.shown = false;
        //if statement needs to be on the same line and ternary does not work the same way.
        return this;
    }
}
