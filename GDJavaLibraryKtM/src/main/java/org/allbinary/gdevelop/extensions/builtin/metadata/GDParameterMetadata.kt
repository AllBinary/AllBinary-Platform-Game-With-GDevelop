
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
        

open public class GDParameterMetadata
            : Object
         {
        

    val type: String

    val supplementaryInformation: String

    val optional: Boolean

    val description: String

    val codeOnly: Boolean

    private var longDescription: String

    private var defaultValue: String

    private var name: String
public constructor (type: String, supplementaryInformation: String, optional: Boolean, description: String, codeOnly: Boolean)
            : super()
        {
    //var type = type
    //var supplementaryInformation = supplementaryInformation
    //var optional = optional
    //var description = description
    //var codeOnly = codeOnly
this.type= type
this.supplementaryInformation= supplementaryInformation
this.optional= optional
this.description= description
this.codeOnly= codeOnly
}


    open fun setLongDescription(longDescription: String)
        //nullable = true from not(false or (false and false)) = true
: GDParameterMetadata{
    //var longDescription = longDescription
this.longDescription= longDescription



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


    open fun setDefaultValue(defaultValue: String)
        //nullable = true from not(false or (false and false)) = true
: GDParameterMetadata{
    //var defaultValue = defaultValue
this.defaultValue= defaultValue



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this
}


}
                
            

