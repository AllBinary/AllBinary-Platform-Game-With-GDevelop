
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
        package org.allbinary.gdevelop.loader.comparison




        import java.lang.Object        
        
        import java.lang.System
        
        import java.lang.Thread
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import org.allbinary.data.tree.dom.document.DomDocumentHelper
import org.allbinary.gdevelop.loader.GDGameInfo
import org.allbinary.gdevelop.loader.GDGenerateGDGameInfo
import org.allbinary.gdevelop.loader.GDLanguage
import org.allbinary.gdevelop.loader.GDLanguageSelection
import org.allbinary.gdevelop.loader.GDLayoutsToAllBinaryLayoutGenerator
import org.allbinary.gdevelop.loader.GDPaths
import org.allbinary.gdevelop.loader.GDToAllBinaryGenerationTool

open public class GDLanguageGenerationHarness
            : Object
         {
        
companion object {
            
                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var args = args

    
                        if(args.size < 1)
                        
                                    {
                                    System.out.println("Usage: GDLanguageGenerationHarness genPath [-language=Kotlin]")
System.exit(1)

                                    }
                                

    var genPath: String = args[0]!!


    
                        if(!genPath!!.endsWith("\\") && !genPath!!.endsWith("/"))
                        
                                    {
                                    genPath= genPath +"\\"

                                    }
                                
DomDocumentHelper.init()

    var language: GDLanguage = GDLanguageSelection.getInstance()!!.select(args)!!

GDPaths.initGenPath(genPath, language)
GDToAllBinaryGenerationTool().
                            process()

    var gdGameInfo: GDGameInfo = GDGenerateGDGameInfo().
                            process()!!


    var finished: BooleanArray = BooleanArray(9)

GDLayoutsToAllBinaryLayoutGenerator().
                            process(0, gdGameInfo, finished)

    var done: Boolean = false


        while(!done)
        {
Thread.sleep(250)
done= true




                        for (index in 0 until finished.size)

        {

    
                        if(!finished[index]!!)
                        
                                    {
                                    done= false

                                    }
                                
}

}

System.out.println("GDLanguageGenerationHarness finished: " +genPath)
System.exit(0)
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
}
                
            

