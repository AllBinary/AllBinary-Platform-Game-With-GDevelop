
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2026 AllBinary 
                *   
                *  By agreeing to this license you and any business entity you represent are 
                *  legally bound to the AllBinary Open License Version 1 legal agreement. 
                *   
                *  You may obtain the AllBinary Open License Version 1 legal agreement from 
                *  AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
                *   
                *  Created By: Travis Berthelot    
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        

open public class GDLanguage
            : Object
         {
        

    val name: String

    val shortName: String

    val extension: String

    val aliasArray: Array<String?>

    val extensionArray: Array<String?>
public constructor (name: String, shortName: String, extension: String, aliasArray: Array<String?>)                        

                            : this(name, shortName, extension, aliasArray, arrayOf()){
    //var name = name
    //var shortName = shortName
    //var extension = extension
    //var aliasArray = aliasArray


                            //For kotlin this is before the body of the constructor.
                    
}

public constructor (name: String, shortName: String, extension: String, aliasArray: Array<String?>, additionalExtensionArray: Array<String?>)
            : super()
        {
    //var name = name
    //var shortName = shortName
    //var extension = extension
    //var aliasArray = aliasArray
    //var additionalExtensionArray = additionalExtensionArray
this.name= name
this.shortName= shortName
this.extension= extension
this.aliasArray= aliasArray

    var size: Int = additionalExtensionArray!!.size
                

this.extensionArray= arrayOfNulls(size +1)
this.extensionArray[0]= extension




                        for (index in 0 until size)

        {
this.extensionArray[index +1]= additionalExtensionArray[index]!!
}

}


    open fun isJava()
        //nullable = true from not(false or (false and true)) = true
: Boolean{

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.shortName!!.length == 0
}


    open fun matches(value: String)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var value = value

    
                        if(value.equals(this.name, ignoreCase = true))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                

    
                        if(this.shortName!!.length > 0 && value.equals(this.shortName, ignoreCase = true))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                

    
                        if(value.equals(this.extension, ignoreCase = true) || value.equals(this.extension.substring(1), ignoreCase = true))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                

    var size: Int = this.aliasArray!!.size
                





                        for (index in 0 until size)

        {

    
                        if(value.equals(this.aliasArray[index]!!, ignoreCase = true))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


    override fun toString()
        //nullable =  from not(false or (true and true)) = 
: String{

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.name
}


}
                
            

