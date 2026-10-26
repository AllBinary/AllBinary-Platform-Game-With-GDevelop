
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import org.allbinary.data.CamelCaseUtil
import org.allbinary.logic.io.BufferedWriterUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.communication.log.LogUtil

open public class GDNameFileGenerator : GDNameGenerator {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    val originalFilePath: String

    val newFilePath: String
public constructor (originalFilePath: String, newFilePath: String){
    //var originalFilePath = originalFilePath
    //var newFilePath = newFilePath

    var gdPaths: GDPaths = GDPaths.getInstance()!!

this.originalFilePath= gdPaths!!.getTemplatePath(originalFilePath)!!
this.newFilePath= gdPaths!!.getOutputPath(newFilePath)!!
}


                @Throws(Exception::class)
            
    override fun process()
        //nullable = true from not(false or (false and true)) = true
{

    var camelCaseUtil: CamelCaseUtil = CamelCaseUtil.getInstance()!!


    var stringMaker: StringMaker = StringMaker()


    var newFileAsString: String = GDTemplateUtil.getInstance()!!.process(this.originalFilePath, this.GD_KEY, this.NAME, camelCaseUtil!!.getAsCamelCase(this.packageName, stringMaker)!!.lowercase())!!

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(this.newFilePath)!!.toString(), this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(this.newFilePath, newFileAsString)
}


}
                
            

