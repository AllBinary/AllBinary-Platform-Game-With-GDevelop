
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../../java/lang/Object.js';
        
import { GDPlatformExtension } from '../../../../../../org/allbinary/gdevelop/extensions/GDPlatformExtension.js';
//not GWT import const GDPlatformExtension

import { GDBehavior } from '../../../../../../org/allbinary/gdevelop/project/GDBehavior.js';
//not GWT import const GDBehavior

import { GDBehaviorsSharedData } from '../../../../../../org/allbinary/gdevelop/project/GDBehaviorsSharedData.js';
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

export class GDBehaviorMetadata
            extends Object
         {
        

    private static RETURN_: string = "Return ";

    private static COMPARE_: string = "Compare ";

    private readonly commonSeps: CommonSeps = CommonSeps.getInstance()!;

    private readonly parameterFactory: GDParameterFactory = GDParameterFactory.getInstance()!;

    public readonly extensionNamespace: string;

    public readonly name: string;

    public readonly fullname: string;

    public readonly defaultName: string;

    public readonly description: string;

    public readonly group: string;

    public readonly icon24x24: string;

    public readonly className: string;

    public readonly behavior: GDBehavior;

    public readonly behaviorsSharedData: GDBehaviorsSharedData;

    public readonly conditionInstructionMetadataList: BasicArrayList = new BasicArrayListD();

    public readonly actionInstructionMetadataList: BasicArrayList = new BasicArrayListD();

    private readonly nameToConditionInstructionMetadataMap: ABHashMap<string, GDInstructionMetadata> = new ABHashMap<string, GDInstructionMetadata>();

    private readonly nameToActionInstructionMetadataMap: ABHashMap<string, GDInstructionMetadata> = new ABHashMap<string, GDInstructionMetadata>();

    private readonly nameToExpressionMetadataMap: ABHashMap<string, GDExpressionMetadata> = new ABHashMap<string, GDExpressionMetadata>();

    private readonly nameToStrExpressionMetadataMap: ABHashMap<string, GDExpressionMetadata> = new ABHashMap<string, GDExpressionMetadata>();

public constructor (extensionNamespace: string, name: string, fullname: string, defaultName: string, description: string, group: string, icon24x24: string, className: string, behavior: GDBehavior, behaviorsSharedData: GDBehaviorsSharedData){

            super();
        this.extensionNamespace= extensionNamespace;
    
this.name= name;
    
this.fullname= fullname;
    
this.defaultName= defaultName;
    
this.description= description;
    
this.group= group;
    
this.icon24x24= icon24x24;
    
this.className= className;
    
this.behavior= behavior;
    
this.behaviorsSharedData= behaviorsSharedData;
    
}


    public addCondition(name: string, fullname: string, description: string, sentence: string, group: string, icon: string, smallicon: string): GDInstructionMetadata{

    var nameWithNamespace: string = this.extensionNamespace!.isEmpty()
                        ?       
                                name
                                :

                            this.extensionNamespace +name;

    ;;
    

    var instructionMetadata: GDInstructionMetadata = new GDInstructionMetadata(this.extensionNamespace, nameWithNamespace, fullname, description, sentence, group, icon, smallicon);;
    
this.conditionInstructionMetadataList!.add(instructionMetadata);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instructionMetadata;
    
}


    public addAction(name: string, fullname: string, description: string, sentence: string, group: string, icon: string, smallicon: string): GDInstructionMetadata{

    var nameWithNamespace: string = this.extensionNamespace!.isEmpty()
                        ?       
                                name
                                :

                            this.extensionNamespace +name;

    ;;
    

    var instructionMetadata: GDInstructionMetadata = new GDInstructionMetadata(this.extensionNamespace, nameWithNamespace, fullname, description, sentence, group, icon, smallicon);;
    
this.actionInstructionMetadataList!.add(instructionMetadata);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instructionMetadata;
    
}


    public addScopedCondition(name: string, fullname: string, description: string, sentence: string, group: string, icon: string, smallicon: string): GDInstructionMetadata{

    var nameWithNamespace: string = new StringBuilder().append(this.getName())!.append(GDPlatformExtension.getInstance()!.NAMESPACE_SEP)!.append(name)!.toString()!;;
    

    var instructionMetadata: GDInstructionMetadata = new GDInstructionMetadata(this.extensionNamespace, nameWithNamespace, fullname, description, sentence, group, icon, smallicon);;
    
this.nameToConditionInstructionMetadataMap!.put(nameWithNamespace, instructionMetadata);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instructionMetadata;
    
}


    public addScopedAction(name: string, fullname: string, description: string, sentence: string, group: string, icon: string, smallicon: string): GDInstructionMetadata{

    var nameWithNamespace: string = new StringBuilder().append(this.getName())!.append(GDPlatformExtension.getInstance()!.NAMESPACE_SEP)!.append(name)!.toString()!;;
    

    var instructionMetadata: GDInstructionMetadata = new GDInstructionMetadata(this.extensionNamespace, nameWithNamespace, fullname, description, sentence, group, icon, smallicon);;
    
this.nameToActionInstructionMetadataMap!.put(nameWithNamespace, instructionMetadata);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instructionMetadata;
    
}


    public addExpression(name: string, fullname: string, description: string, group: string, smallicon: string): GDExpressionMetadata{

    var expressionMetadata: GDExpressionMetadata = new GDExpressionMetadata(this.parameterFactory!.NUMBER, this.extensionNamespace, name, fullname, description, group, smallicon);;
    
this.nameToExpressionMetadataMap!.put(name, expressionMetadata);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return expressionMetadata;
    
}


    public addStrExpression(name: string, fullname: string, description: string, group: string, smallicon: string): GDExpressionMetadata{

    var expressionMetadata: GDExpressionMetadata = new GDExpressionMetadata(this.parameterFactory!.STRING, this.extensionNamespace, name, fullname, description, group, smallicon);;
    
this.nameToStrExpressionMetadataMap!.put(name, expressionMetadata);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return expressionMetadata;
    
}


    public addExpressionAndConditionAndAction(type: string, name: string, fullname: string, descriptionSubject: string, sentenceName: string, group: string, icon: string): GDMultipleInstructionMetadata{

    var expression: GDExpressionMetadata = (type == this.parameterFactory!.NUMBER)
                        ?       
                                this.addExpression(name, fullname, new StringBuilder().append(GDBehaviorMetadata.RETURN_)!.append(descriptionSubject)!.append(this.commonSeps!.PERIOD)!.toString(), group, icon)
                                :

                            this.addStrExpression(name, fullname, new StringBuilder().append(GDBehaviorMetadata.RETURN_)!.append(descriptionSubject)!.append(this.commonSeps!.PERIOD)!.toString(), group, icon);

    ;;
    

    var conditionInstructionMetadata: GDInstructionMetadata = this.addScopedCondition(name, fullname, new StringBuilder().append(GDBehaviorMetadata.COMPARE_)!.append(descriptionSubject)!.append(this.commonSeps!.PERIOD)!.toString(), sentenceName, group, icon, icon)!;;
    

    var actionInstructionMetadata: GDInstructionMetadata = this.addScopedAction("Set" +name, fullname, new StringBuilder().append(GDBehaviorMetadata.COMPARE_)!.append(descriptionSubject)!.append(this.commonSeps!.PERIOD)!.toString(), sentenceName, group, icon, icon)!;;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDMultipleInstructionMetadata(expression, conditionInstructionMetadata, actionInstructionMetadata);
    
}


    getName(): string{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.behavior.type;
    
}


}



