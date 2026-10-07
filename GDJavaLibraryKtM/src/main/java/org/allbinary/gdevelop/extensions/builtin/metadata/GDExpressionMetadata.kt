
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
        
import org.allbinary.logic.string.StringUtil
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDExpressionMetadata
            : Object
         {
        

    private val stringUtil: StringUtil = StringUtil.getInstance()!!

    private val parameterFactory: GDParameterFactory = GDParameterFactory.getInstance()!!

    val returnType: String

    val fullname: String

    val description: String

    val group: String

    val smallIconFilename: String

    val extensionNamespace: String

    val isPrivate: Boolean

    val parameterMetadataList: BasicArrayList = BasicArrayListD()

    var shown: Boolean

    var helpPath: String = StringUtil.getInstance()!!.EMPTY_STRING
public constructor (returnType: String, extensionNamespace: String, name: String, fullname: String, description: String, group: String, smallicon: String)
            : super()
        {
    //var returnType = returnType
    //var extensionNamespace = extensionNamespace
    //var name = name
    //var fullname = fullname
    //var description = description
    //var group = group
    //var smallicon = smallicon
this.returnType= returnType
this.extensionNamespace= extensionNamespace
this.fullname= fullname
this.description= description
this.group= group
this.shown= true
this.smallIconFilename= smallicon
this.isPrivate= false
}


    open fun addParameter(type: String, description: String, optionalObjectType: String, parameterIsOptional: Boolean)
        //nullable = true from not(false or (false and false)) = true
: GDExpressionMetadata{
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

this.parameterMetadataList!!.add(parameterMetadata)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


    open fun addCodeOnlyParameter(type: String, supplementaryInformation: String)
        //nullable = true from not(false or (false and false)) = true
: GDExpressionMetadata{
    //var type = type
    //var supplementaryInformation = supplementaryInformation

    var parameterMetadata: GDParameterMetadata = GDParameterMetadata(type, supplementaryInformation, false, this.stringUtil!!.EMPTY_STRING, true)

this.parameterMetadataList!!.add(parameterMetadata)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


    open fun setHidden()
        //nullable = true from not(false or (false and true)) = true
: GDExpressionMetadata{
this.shown= false



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


}
                
            

