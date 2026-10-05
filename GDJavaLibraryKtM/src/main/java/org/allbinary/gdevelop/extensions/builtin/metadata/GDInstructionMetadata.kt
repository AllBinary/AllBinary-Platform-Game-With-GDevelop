
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
        
import org.allbinary.string.CommonSeps
import org.allbinary.logic.string.StringUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDInstructionMetadata
            : Object
         {
        
companion object {
            
    private val _PARAM: String = "_PARAM"

    private val _OF_PARAM0_: String = " of _PARAM0_ "

        }
            
    private val parameterFactory: GDParameterFactory = GDParameterFactory.getInstance()!!

    private val commonSeps: CommonSeps = CommonSeps.getInstance()!!

    private val stringUtil: StringUtil = StringUtil.getInstance()!!

    val name: String

    val fullname: String

    val description: String

    var sentence: String

    val group: String

    val icon: String

    val smallIcon: String

    val extensionNamespace: String

    val helpPath: String

    val canHaveSubInstructions: Boolean

    val isPrivate: Boolean

    val objectInstruction: Boolean

    val behaviorInstruction: Boolean

    val codeExtraInformation: GDExtraInformation = GDExtraInformation()

    val parameterList: BasicArrayList = BasicArrayListD()

    var hidden: Boolean

    var usageComplexity: Int = 5
public constructor (extensionNamespace: String, name: String, fullname: String, description: String, sentence: String, group: String, icon: String, smallIcon: String)
            : super()
        {
    //var extensionNamespace = extensionNamespace
    //var name = name
    //var fullname = fullname
    //var description = description
    //var sentence = sentence
    //var group = group
    //var icon = icon
    //var smallIcon = smallIcon
this.extensionNamespace= extensionNamespace
this.name= name
this.fullname= fullname
this.description= description
this.sentence= sentence
this.group= group
this.icon= icon
this.smallIcon= smallIcon
this.helpPath= this.stringUtil!!.EMPTY_STRING
this.canHaveSubInstructions= false
this.hidden= false
this.isPrivate= false
this.objectInstruction= false
this.behaviorInstruction= false
}


    open fun addParameter(type: String, description: String, optionalObjectType: String, parameterIsOptional: Boolean)
        //nullable = true from not(false or (false and false)) = true
: GDInstructionMetadata{
    //var type = type
    //var description = description
    //var optionalObjectType = optionalObjectType
    //var parameterIsOptional = parameterIsOptional

    var supplementaryInformation: String = if((this.parameterFactory!!.isObject(type) || this.parameterFactory!!.isBehavior(type))) {
                            
                            (if(optionalObjectType!!.isEmpty()) {
                            
                            this.stringUtil!!.EMPTY_STRING
                        
                            } else {
                            this.extensionNamespace +optionalObjectType
                            }
    )
                        
                            } else {
                            optionalObjectType
                            }
    


    var parameterMetadata: GDParameterMetadata = GDParameterMetadata(type, supplementaryInformation, parameterIsOptional, description, false)

this.parameterList!!.add(parameterMetadata)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


    open fun addCodeOnlyParameter(type: String, supplementaryInformation: String)
        //nullable = true from not(false or (false and false)) = true
: GDInstructionMetadata{
    //var type = type
    //var supplementaryInformation = supplementaryInformation

    var parameterMetadata: GDParameterMetadata = GDParameterMetadata(type, supplementaryInformation, false, this.stringUtil!!.EMPTY_STRING, false)

this.parameterList!!.add(parameterMetadata)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


    open fun useStandardRelationalOperatorParameters(type: String)
        //nullable = true from not(false or (false and false)) = true
: GDInstructionMetadata{
    //var type = type
this.codeExtraInformation!!.setManipulatedType(type)
this.addParameter(this.parameterFactory!!.RELATIONAL_OPERATOR, "Sign of the test", 
                            null, false)
this.addParameter(if(type == this.parameterFactory!!.NUMBER) {
                            
                            this.parameterFactory!!.EXPRESSION
                        
                            } else {
                            type
                            }
    , "Value to compare", 
                            null, false)

    var operatorParamIndex: Int = this.parameterList!!.size() -2


    var valueParamIndex: Int = this.parameterList!!.size() -1


    
                        if(this.objectInstruction || this.behaviorInstruction)
                        
                                    {
                                    
    var stringBuilder: StringBuilder = StringBuilder()

stringBuilder!!.append(this.sentence)
stringBuilder!!.append(GDInstructionMetadata._OF_PARAM0_)
stringBuilder!!.append(GDInstructionMetadata._PARAM)
stringBuilder!!.append(operatorParamIndex)
stringBuilder!!.append(this.commonSeps!!.UNDERSCORE)
stringBuilder!!.append(this.commonSeps!!.SPACE)
stringBuilder!!.append(GDInstructionMetadata._PARAM)
stringBuilder!!.append(valueParamIndex)
stringBuilder!!.append(this.commonSeps!!.UNDERSCORE)
this.sentence= stringBuilder!!.toString()

                                    }
                                
                        else {
                            
    var stringBuilder: StringBuilder = StringBuilder()

stringBuilder!!.append(this.sentence)
stringBuilder!!.append(this.commonSeps!!.SPACE)
stringBuilder!!.append(GDInstructionMetadata._PARAM)
stringBuilder!!.append(operatorParamIndex)
stringBuilder!!.append(this.commonSeps!!.UNDERSCORE)
stringBuilder!!.append(this.commonSeps!!.SPACE)
stringBuilder!!.append(GDInstructionMetadata._PARAM)
stringBuilder!!.append(valueParamIndex)
stringBuilder!!.append(this.commonSeps!!.UNDERSCORE)
this.sentence= stringBuilder!!.toString()

                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


    open fun setParameterLongDescription(longDescription: String)
        //nullable = true from not(false or (false and false)) = true
: GDInstructionMetadata{
    //var longDescription = longDescription

    
                        if(this.parameterList!!.size() > 0)
                        
                                    {
                                    get = this.parameterList!!.get(this.parameterList!!.size() -1)get as GDParameterMetadata
get.
                    setLongDescription(longDescription)

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


    open fun setDefaultValue(defaultValue: String)
        //nullable = true from not(false or (false and false)) = true
: GDInstructionMetadata{
    //var defaultValue = defaultValue

    
                        if(this.parameterList!!.size() > 0)
                        
                                    {
                                    get = this.parameterList!!.get(this.parameterList!!.size() -1)get as GDParameterMetadata
get.
                    setDefaultValue(defaultValue)

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


    open fun setHidden()
        //nullable = true from not(false or (false and true)) = true
: GDInstructionMetadata{
this.hidden= true



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


    open fun useStandardOperatorParameters(type: String)
        //nullable = true from not(false or (false and false)) = true
: GDInstructionMetadata{
    //var type = type
this.codeExtraInformation!!.setManipulatedType(type)
this.addParameter(this.parameterFactory!!.OPERATOR, "Modification's sign", 
                            null, false)
this.addParameter(if(type == this.parameterFactory!!.NUMBER) {
                            
                            this.parameterFactory!!.EXPRESSION
                        
                            } else {
                            type
                            }
    , "Value", 
                            null, false)

    var operatorParamIndex: Int = this.parameterList!!.size() -2


    var valueParamIndex: Int = this.parameterList!!.size() -1


    
                        if(this.objectInstruction || this.behaviorInstruction)
                        
                                    {
                                    
    var stringBuilder: StringBuilder = StringBuilder()

stringBuilder!!.append("Change ")
stringBuilder!!.append(this.sentence)
stringBuilder!!.append(" of _PARAM0_: ")
stringBuilder!!.append(GDInstructionMetadata._PARAM)
stringBuilder!!.append(operatorParamIndex)
stringBuilder!!.append(this.commonSeps!!.UNDERSCORE)
stringBuilder!!.append(this.commonSeps!!.SPACE)
stringBuilder!!.append(GDInstructionMetadata._PARAM)
stringBuilder!!.append(valueParamIndex)
stringBuilder!!.append(this.commonSeps!!.UNDERSCORE)
this.sentence= stringBuilder!!.toString()

                                    }
                                
                        else {
                            
    var stringBuilder: StringBuilder = StringBuilder()

stringBuilder!!.append("Change ")
stringBuilder!!.append(this.sentence)
stringBuilder!!.append(": ")
stringBuilder!!.append(GDInstructionMetadata._PARAM)
stringBuilder!!.append(operatorParamIndex)
stringBuilder!!.append(this.commonSeps!!.UNDERSCORE)
stringBuilder!!.append(this.commonSeps!!.SPACE)
stringBuilder!!.append(GDInstructionMetadata._PARAM)
stringBuilder!!.append(valueParamIndex)
stringBuilder!!.append(this.commonSeps!!.UNDERSCORE)
this.sentence= stringBuilder!!.toString()

                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


    open fun markAsSimple()
        //nullable = true from not(false or (false and true)) = true
: GDInstructionMetadata{
this.usageComplexity= 2



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


    open fun markAsAdvanced()
        //nullable = true from not(false or (false and true)) = true
: GDInstructionMetadata{
this.usageComplexity= 7



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


    open fun markAsComplex()
        //nullable = true from not(false or (false and true)) = true
: GDInstructionMetadata{
this.usageComplexity= 9



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


}
                
            

