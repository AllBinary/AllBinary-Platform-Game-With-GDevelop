
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.extensions.builtin.metadata




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        

open public class GDMultipleInstructionMetadata
            : Object
         {
        

    val expression: GDExpressionMetadata

    val conditionInstructionMetadata: GDInstructionMetadata

    val actionInstructionMetadata: GDInstructionMetadata
public constructor (expression: GDExpressionMetadata, conditionInstructionMetadata: GDInstructionMetadata, actionInstructionMetadata: GDInstructionMetadata)
            : super()
        {
    //var expression = expression
    //var conditionInstructionMetadata = conditionInstructionMetadata
    //var actionInstructionMetadata = actionInstructionMetadata
this.expression= expression
this.conditionInstructionMetadata= conditionInstructionMetadata
this.actionInstructionMetadata= actionInstructionMetadata
}


    open fun addParameter(type: String, label: String, optionalObjectType: String, parameterIsOptional: Boolean)
        //nullable = true from not(false or (false and false)) = true
: GDMultipleInstructionMetadata{
    //var type = type
    //var label = label
    //var optionalObjectType = optionalObjectType
    //var parameterIsOptional = parameterIsOptional

    
                        if(this.expression != 
                                    null
                                )
                        
                                    {
                                    this.expression.addParameter(type, label, optionalObjectType, parameterIsOptional)

                                    }
                                

    
                        if(this.conditionInstructionMetadata != 
                                    null
                                )
                        
                                    {
                                    this.conditionInstructionMetadata!!.addParameter(type, label, optionalObjectType, parameterIsOptional)

                                    }
                                

    
                        if(this.actionInstructionMetadata != 
                                    null
                                )
                        
                                    {
                                    this.actionInstructionMetadata!!.addParameter(type, label, optionalObjectType, parameterIsOptional)

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


    open fun useStandardParameters(type: String)
        //nullable = true from not(false or (false and false)) = true
: GDMultipleInstructionMetadata{
    //var type = type

    
                        if(this.conditionInstructionMetadata != 
                                    null
                                )
                        
                                    {
                                    this.conditionInstructionMetadata!!.useStandardRelationalOperatorParameters(type)

                                    }
                                

    
                        if(this.actionInstructionMetadata != 
                                    null
                                )
                        
                                    {
                                    this.actionInstructionMetadata!!.useStandardOperatorParameters(type)

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


}
                
            

