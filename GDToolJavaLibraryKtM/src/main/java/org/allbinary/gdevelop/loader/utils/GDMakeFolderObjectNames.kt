
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2025 AllBinary 
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
        package org.allbinary.gdevelop.loader.utils




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.loader.GDPaths
import org.allbinary.logic.string.StringMaker
//
open public class GDMakeFolderObjectNames
            : Object
         {
        
companion object {
            
                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
GDPaths.init()

    var RESOURCE_0: String = ",\n" +"              {\n" +"                \"objectName\": \""


    var RESOURCE_2: String = "\"\n" +"              }\n"


    var glbVisitor: GLBVisitor = object: GLBVisitor()
                                {
                                
    override fun append(fileNameAsString: String, name: String, stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var fileNameAsString = fileNameAsString
    //var name = name
    //var stringMaker = stringMaker
stringMaker!!.append(RESOURCE_0)
stringMaker!!.append(name)
stringMaker!!.append(RESOURCE_2)
}

                                }
                            

GLBProcessing().
                            process(glbVisitor)
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
}
                
            

