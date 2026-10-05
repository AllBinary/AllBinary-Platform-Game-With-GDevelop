
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
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.data.tree.dom.document.XmlDocumentHelper

open public class GDSimpleTransformGenerator : GDTransformGenerator {
        

    private val xslFile: String

    private val outputFile: String
public constructor (xslFile: String, outputFile: String){
    //var xslFile = xslFile
    //var outputFile = outputFile
this.xslFile= xslFile
this.outputFile= outputFile
}


                @Throws(Exception::class)
            
    override fun process()
        //nullable = true from not(false or (false and true)) = true
{

    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!


    var xslFileAsString: String = this.gdData!!.getAsString(this.xslFile, sharedBytes)!!

this.process(xslFileAsString, this.outputFile, sharedBytes)
}


                @Throws(Exception::class)
            
    override fun format(result: String)
        //nullable = true from not(false or (false and false)) = true
: String{
var result = result

        try {
            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return XmlDocumentHelper.getInstance()!!.format(result)
} catch(e: Exception)
            {
this.logUtil!!.put("Unable to format XML", this, this.commonStrings!!.PROCESS, e)



                            throw e
}

}


}
                
            

