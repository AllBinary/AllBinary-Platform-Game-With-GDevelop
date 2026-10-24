
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../../java/lang/Object.js';
        
















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDExpressionMetadata } from './GDExpressionMetadata.js';
//not GWT import - same folder const GDExpressionMetadata
import { GDInstructionMetadata } from './GDInstructionMetadata.js';
//not GWT import - same folder const GDInstructionMetadata

export class GDMultipleInstructionMetadata
            extends Object
         {
        

    public readonly expression: GDExpressionMetadata;

    public readonly conditionInstructionMetadata: GDInstructionMetadata;

    public readonly actionInstructionMetadata: GDInstructionMetadata;

public constructor (expression: GDExpressionMetadata, conditionInstructionMetadata: GDInstructionMetadata, actionInstructionMetadata: GDInstructionMetadata){

            super();
        this.expression= expression;
    
this.conditionInstructionMetadata= conditionInstructionMetadata;
    
this.actionInstructionMetadata= actionInstructionMetadata;
    
}


    public addParameter(type: string, label: string, optionalObjectType: string, parameterIsOptional: boolean): GDMultipleInstructionMetadata{
this.expression.addParameter(type, label, optionalObjectType, parameterIsOptional);
    
this.conditionInstructionMetadata!.addParameter(type, label, optionalObjectType, parameterIsOptional);
    
this.actionInstructionMetadata!.addParameter(type, label, optionalObjectType, parameterIsOptional);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


    public useStandardParameters(type: string): GDMultipleInstructionMetadata{
this.conditionInstructionMetadata!.useStandardRelationalOperatorParameters(type);
    
this.actionInstructionMetadata!.useStandardOperatorParameters(type);
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this;
    
}


}



