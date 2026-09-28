
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

export class GDInstructionMetadata
            extends Object
         {
        

    private static readonly _PARAM: string = "_PARAM";

    private static readonly _OF_PARAM0_: string = " of _PARAM0_ ";

    private readonly parameterFactory: GDParameterFactory = GDParameterFactory.getInstance()!;

    private readonly commonSeps: CommonSeps = CommonSeps.getInstance()!;

    private readonly stringUtil: StringUtil = StringUtil.getInstance()!;

    public readonly name: string;

    public readonly fullname: string;

    public readonly description: string;

    public sentence: string;

    public readonly group: string;

    public readonly icon: string;

    public readonly smallIcon: string;

    public readonly extensionNamespace: string;

    public readonly helpPath: string;

    public readonly canHaveSubInstructions: boolean;

    public readonly isPrivate: boolean;

    public readonly objectInstruction: boolean;

    public readonly behaviorInstruction: boolean;

    public readonly codeExtraInformation: GDExtraInformation = new GDExtraInformation();

    public readonly parameterList: BasicArrayList = new BasicArrayListD();

    public hidden: boolean;

    public usageComplexity: number = 5;

public constructor (extensionNamespace: string, name: string, fullname: string, description: string, sentence: string, group: string, icon: string, smallIcon: string){

            super();
        this.extensionNamespace= extensionNamespace;
    
this.name= name;
    
this.fullname= fullname;
    
this.description= description;
    
this.sentence= sentence;
    
this.group= group;
    
this.icon= icon;
    
this.smallIcon= smallIcon;
    
this.helpPath= this.stringUtil!.EMPTY_STRING;
    
this.canHaveSubInstructions= false;
    
this.hidden= false;
    
this.isPrivate= false;
    
this.objectInstruction= false;
    
this.behaviorInstruction= false;
    
}


    public addParameter(type: string, description: string, optionalObjectType: string, parameterIsOptional: boolean): GDInstructionMetadata{

    var supplementaryInformation: string = (this.parameterFactory!.isObject(type) || this.parameterFactory!.isBehavior(type))
                        ?       
                                (optionalObjectType!.isEmpty()
                        ?       
                                this.stringUtil!.EMPTY_STRING
                                :

                            this.extensionNamespace +optionalObjectType;

    )
                                :

                            optionalObjectType;

    ;;
    

    var parameterMetadata: GDParameterMetadata = new GDParameterMetadata(type, supplementaryInformation, parameterIsOptional, description, false);;
    
this.parameterList!.add(parameterMetadata);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


    public addCodeOnlyParameter(type: string, supplementaryInformation: string): GDInstructionMetadata{

    var parameterMetadata: GDParameterMetadata = new GDParameterMetadata(type, supplementaryInformation, false, this.stringUtil!.EMPTY_STRING, false);;
    
this.parameterList!.add(parameterMetadata);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


    public useStandardRelationalOperatorParameters(type: string): GDInstructionMetadata{
this.codeExtraInformation!.setManipulatedType(type);
    
this.addParameter(this.parameterFactory!.RELATIONAL_OPERATOR, "Sign of the test", 
                            null, false);
    
this.addParameter(type == this.parameterFactory!.NUMBER
                        ?       
                                this.parameterFactory!.EXPRESSION
                                :

                            type;

    , "Value to compare", 
                            null, false);
    

    var operatorParamIndex: number = this.parameterList!.size() -2;;
    

    var valueParamIndex: number = this.parameterList!.size() -1;;
    

                        if(this.objectInstruction || this.behaviorInstruction)
                        
                                    {
                                    
    var stringBuilder: StringBuilder = new StringBuilder();;
    
stringBuilder!.append(this.sentence);
    
stringBuilder!.append(GDInstructionMetadata._OF_PARAM0_);
    
stringBuilder!.append(GDInstructionMetadata._PARAM);
    
stringBuilder!.append(operatorParamIndex);
    
stringBuilder!.append(this.commonSeps!.UNDERSCORE);
    
stringBuilder!.append(this.commonSeps!.SPACE);
    
stringBuilder!.append(GDInstructionMetadata._PARAM);
    
stringBuilder!.append(valueParamIndex);
    
stringBuilder!.append(this.commonSeps!.UNDERSCORE);
    
this.sentence= stringBuilder!.toString();
    

                                    }
                                
                        else {
                            
    var stringBuilder: StringBuilder = new StringBuilder();;
    
stringBuilder!.append(this.sentence);
    
stringBuilder!.append(this.commonSeps!.SPACE);
    
stringBuilder!.append(GDInstructionMetadata._PARAM);
    
stringBuilder!.append(operatorParamIndex);
    
stringBuilder!.append(this.commonSeps!.UNDERSCORE);
    
stringBuilder!.append(this.commonSeps!.SPACE);
    
stringBuilder!.append(GDInstructionMetadata._PARAM);
    
stringBuilder!.append(valueParamIndex);
    
stringBuilder!.append(this.commonSeps!.UNDERSCORE);
    
this.sentence= stringBuilder!.toString();
    

                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


    public setParameterLongDescription(longDescription: string): GDInstructionMetadata{

                        if(this.parameterList!.size() > 0)
                        
                                    {
                                    get = this.parameterList!.get(this.parameterList!.size() -1)get as GDParameterMetadata
get.
                    setLongDescription(longDescription);
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


    public setDefaultValue(defaultValue: string): GDInstructionMetadata{

                        if(this.parameterList!.size() > 0)
                        
                                    {
                                    get = this.parameterList!.get(this.parameterList!.size() -1)get as GDParameterMetadata
get.
                    setDefaultValue(defaultValue);
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


    public setHidden(): GDInstructionMetadata{
this.hidden= true;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


    public useStandardOperatorParameters(type: string): GDInstructionMetadata{
this.codeExtraInformation!.setManipulatedType(type);
    
this.addParameter(this.parameterFactory!.OPERATOR, "Modification's sign", 
                            null, false);
    
this.addParameter(type == this.parameterFactory!.NUMBER
                        ?       
                                this.parameterFactory!.EXPRESSION
                                :

                            type;

    , "Value", 
                            null, false);
    

    var operatorParamIndex: number = this.parameterList!.size() -2;;
    

    var valueParamIndex: number = this.parameterList!.size() -1;;
    

                        if(this.objectInstruction || this.behaviorInstruction)
                        
                                    {
                                    
    var stringBuilder: StringBuilder = new StringBuilder();;
    
stringBuilder!.append("Change ");
    
stringBuilder!.append(this.sentence);
    
stringBuilder!.append(" of _PARAM0_: ");
    
stringBuilder!.append(GDInstructionMetadata._PARAM);
    
stringBuilder!.append(operatorParamIndex);
    
stringBuilder!.append(this.commonSeps!.UNDERSCORE);
    
stringBuilder!.append(this.commonSeps!.SPACE);
    
stringBuilder!.append(GDInstructionMetadata._PARAM);
    
stringBuilder!.append(valueParamIndex);
    
stringBuilder!.append(this.commonSeps!.UNDERSCORE);
    
this.sentence= stringBuilder!.toString();
    

                                    }
                                
                        else {
                            
    var stringBuilder: StringBuilder = new StringBuilder();;
    
stringBuilder!.append("Change ");
    
stringBuilder!.append(this.sentence);
    
stringBuilder!.append(": ");
    
stringBuilder!.append(GDInstructionMetadata._PARAM);
    
stringBuilder!.append(operatorParamIndex);
    
stringBuilder!.append(this.commonSeps!.UNDERSCORE);
    
stringBuilder!.append(this.commonSeps!.SPACE);
    
stringBuilder!.append(GDInstructionMetadata._PARAM);
    
stringBuilder!.append(valueParamIndex);
    
stringBuilder!.append(this.commonSeps!.UNDERSCORE);
    
this.sentence= stringBuilder!.toString();
    

                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


    public markAsSimple(): GDInstructionMetadata{
this.usageComplexity= 2;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


    public markAsAdvanced(): GDInstructionMetadata{
this.usageComplexity= 7;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


    public markAsComplex(): GDInstructionMetadata{
this.usageComplexity= 9;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


}



