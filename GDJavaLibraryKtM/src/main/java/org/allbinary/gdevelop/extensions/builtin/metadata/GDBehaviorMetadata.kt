
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
        
import org.allbinary.gdevelop.extensions.GDPlatformExtension
import org.allbinary.gdevelop.project.GDBehavior
import org.allbinary.gdevelop.project.GDBehaviorsSharedData
import org.allbinary.string.CommonSeps
import org.allbinary.util.ABHashMap
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDBehaviorMetadata
            : Object
         {
        
companion object {
            
    private var RETURN_: String = "Return "

    private var COMPARE_: String = "Compare "

        }
            
    private val commonSeps: CommonSeps = CommonSeps.getInstance()!!

    private val parameterFactory: GDParameterFactory = GDParameterFactory.getInstance()!!

    val extensionNamespace: String

    val name: String

    val fullname: String

    val defaultName: String

    val description: String

    val group: String

    val icon24x24: String

    val className: String

    val behavior: GDBehavior

    val behaviorsSharedData: GDBehaviorsSharedData

    val conditionInstructionMetadataList: BasicArrayList = BasicArrayListD()

    val actionInstructionMetadataList: BasicArrayList = BasicArrayListD()

    private val nameToConditionInstructionMetadataMap: ABHashMap<String, GDInstructionMetadata> = ABHashMap<String, GDInstructionMetadata>()

    private val nameToActionInstructionMetadataMap: ABHashMap<String, GDInstructionMetadata> = ABHashMap<String, GDInstructionMetadata>()

    private val nameToExpressionMetadataMap: ABHashMap<String, GDExpressionMetadata> = ABHashMap<String, GDExpressionMetadata>()

    private val nameToStrExpressionMetadataMap: ABHashMap<String, GDExpressionMetadata> = ABHashMap<String, GDExpressionMetadata>()
public constructor (extensionNamespace: String, name: String, fullname: String, defaultName: String, description: String, group: String, icon24x24: String, className: String, behavior: GDBehavior, behaviorsSharedData: GDBehaviorsSharedData)
            : super()
        {
    //var extensionNamespace = extensionNamespace
    //var name = name
    //var fullname = fullname
    //var defaultName = defaultName
    //var description = description
    //var group = group
    //var icon24x24 = icon24x24
    //var className = className
    //var behavior = behavior
    //var behaviorsSharedData = behaviorsSharedData
this.extensionNamespace= extensionNamespace
this.name= name
this.fullname= fullname
this.defaultName= defaultName
this.description= description
this.group= group
this.icon24x24= icon24x24
this.className= className
this.behavior= behavior
this.behaviorsSharedData= behaviorsSharedData
}


    open fun addCondition(name: String, fullname: String, description: String, sentence: String, group: String, icon: String, smallicon: String)
        //nullable = true from not(false or (false and false)) = true
: GDInstructionMetadata{
    //var name = name
    //var fullname = fullname
    //var description = description
    //var sentence = sentence
    //var group = group
    //var icon = icon
    //var smallicon = smallicon

    var nameWithNamespace: String = if(this.extensionNamespace!!.isEmpty()) {
                            
                            name
                        
                            } else {
                            this.extensionNamespace +name
                            }
    


    var instructionMetadata: GDInstructionMetadata = GDInstructionMetadata(this.extensionNamespace, nameWithNamespace, fullname, description, sentence, group, icon, smallicon)

this.conditionInstructionMetadataList!!.add(instructionMetadata)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instructionMetadata
}


    open fun addAction(name: String, fullname: String, description: String, sentence: String, group: String, icon: String, smallicon: String)
        //nullable = true from not(false or (false and false)) = true
: GDInstructionMetadata{
    //var name = name
    //var fullname = fullname
    //var description = description
    //var sentence = sentence
    //var group = group
    //var icon = icon
    //var smallicon = smallicon

    var nameWithNamespace: String = if(this.extensionNamespace!!.isEmpty()) {
                            
                            name
                        
                            } else {
                            this.extensionNamespace +name
                            }
    


    var instructionMetadata: GDInstructionMetadata = GDInstructionMetadata(this.extensionNamespace, nameWithNamespace, fullname, description, sentence, group, icon, smallicon)

this.actionInstructionMetadataList!!.add(instructionMetadata)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instructionMetadata
}


    open fun addScopedCondition(name: String, fullname: String, description: String, sentence: String, group: String, icon: String, smallicon: String)
        //nullable = true from not(false or (false and false)) = true
: GDInstructionMetadata{
    //var name = name
    //var fullname = fullname
    //var description = description
    //var sentence = sentence
    //var group = group
    //var icon = icon
    //var smallicon = smallicon

    var nameWithNamespace: String = StringBuilder().
                            append(this.getName())!!.append(GDPlatformExtension.getInstance()!!.NAMESPACE_SEP)!!.append(name)!!.toString()!!


    var instructionMetadata: GDInstructionMetadata = GDInstructionMetadata(this.extensionNamespace, nameWithNamespace, fullname, description, sentence, group, icon, smallicon)

this.nameToConditionInstructionMetadataMap!!.put(nameWithNamespace, instructionMetadata)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instructionMetadata
}


    open fun addScopedAction(name: String, fullname: String, description: String, sentence: String, group: String, icon: String, smallicon: String)
        //nullable = true from not(false or (false and false)) = true
: GDInstructionMetadata{
    //var name = name
    //var fullname = fullname
    //var description = description
    //var sentence = sentence
    //var group = group
    //var icon = icon
    //var smallicon = smallicon

    var nameWithNamespace: String = StringBuilder().
                            append(this.getName())!!.append(GDPlatformExtension.getInstance()!!.NAMESPACE_SEP)!!.append(name)!!.toString()!!


    var instructionMetadata: GDInstructionMetadata = GDInstructionMetadata(this.extensionNamespace, nameWithNamespace, fullname, description, sentence, group, icon, smallicon)

this.nameToActionInstructionMetadataMap!!.put(nameWithNamespace, instructionMetadata)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instructionMetadata
}


    open fun addExpression(name: String, fullname: String, description: String, group: String, smallicon: String)
        //nullable = true from not(false or (false and false)) = true
: GDExpressionMetadata{
    //var name = name
    //var fullname = fullname
    //var description = description
    //var group = group
    //var smallicon = smallicon

    var expressionMetadata: GDExpressionMetadata = GDExpressionMetadata(this.parameterFactory!!.NUMBER, this.extensionNamespace, name, fullname, description, group, smallicon)

this.nameToExpressionMetadataMap!!.put(name, expressionMetadata)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return expressionMetadata
}


    open fun addStrExpression(name: String, fullname: String, description: String, group: String, smallicon: String)
        //nullable = true from not(false or (false and false)) = true
: GDExpressionMetadata{
    //var name = name
    //var fullname = fullname
    //var description = description
    //var group = group
    //var smallicon = smallicon

    var expressionMetadata: GDExpressionMetadata = GDExpressionMetadata(this.parameterFactory!!.STRING, this.extensionNamespace, name, fullname, description, group, smallicon)

this.nameToStrExpressionMetadataMap!!.put(name, expressionMetadata)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return expressionMetadata
}


    open fun addExpressionAndConditionAndAction(type: String, name: String, fullname: String, descriptionSubject: String, sentenceName: String, group: String, icon: String)
        //nullable = true from not(false or (false and false)) = true
: GDMultipleInstructionMetadata{
    //var type = type
    //var name = name
    //var fullname = fullname
    //var descriptionSubject = descriptionSubject
    //var sentenceName = sentenceName
    //var group = group
    //var icon = icon

    var expression: GDExpressionMetadata = if((type == this.parameterFactory!!.NUMBER)) {
                            
                            this.addExpression(name, fullname, StringBuilder().
                            append(GDBehaviorMetadata.RETURN_)!!.append(descriptionSubject)!!.append(this.commonSeps!!.PERIOD)!!.toString(), group, icon)
                        
                            } else {
                            this.addStrExpression(name, fullname, StringBuilder().
                            append(GDBehaviorMetadata.RETURN_)!!.append(descriptionSubject)!!.append(this.commonSeps!!.PERIOD)!!.toString(), group, icon)
                            }
    


    var conditionInstructionMetadata: GDInstructionMetadata = this.addScopedCondition(name, fullname, StringBuilder().
                            append(GDBehaviorMetadata.COMPARE_)!!.append(descriptionSubject)!!.append(this.commonSeps!!.PERIOD)!!.toString(), sentenceName, group, icon, icon)!!


    var actionInstructionMetadata: GDInstructionMetadata = this.addScopedAction("Set" +name, fullname, StringBuilder().
                            append(GDBehaviorMetadata.COMPARE_)!!.append(descriptionSubject)!!.append(this.commonSeps!!.PERIOD)!!.toString(), sentenceName, group, icon, icon)!!




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDMultipleInstructionMetadata(expression, conditionInstructionMetadata, actionInstructionMetadata)
}


    open fun getName()
        //nullable = true from not(false or (false and true)) = true
: String{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.behavior.type
}


}
                
            

