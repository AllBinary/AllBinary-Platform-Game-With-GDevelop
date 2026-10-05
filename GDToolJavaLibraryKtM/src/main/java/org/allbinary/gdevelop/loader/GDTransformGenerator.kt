
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
        
import java.io.StringBufferInputStream
import javax.xml.transform.stream.StreamSource
import org.allbinary.data.tree.dom.BasicUriResolver
import org.allbinary.data.tree.dom.XslHelper
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.io.BufferedWriterUtil
import org.allbinary.logic.io.StreamUtil
import org.allbinary.logic.string.regex.replace.Replace
import org.allbinary.string.CommonStrings

open public class GDTransformGenerator : GDNameGenerator {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    val streamUtil: StreamUtil = StreamUtil.getInstance()!!

    val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    val gdPaths: GDPaths = GDPaths.getInstance()!!

    val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    val gdData: GDData = GDData.getInstance()!!

    private val xslHelper: XslHelper = XslHelper.getInstance()!!

                @Throws(Exception::class)
            
    open fun process(updatedXslDocumentStr: String, outputFile: String, sharedBytes: SharedBytes)
        //nullable = true from not(false or (false and false)) = true
{
    //var updatedXslDocumentStr = updatedXslDocumentStr
    //var outputFile = outputFile
    //var sharedBytes = sharedBytes

    var xmlDocumentStr: String = this.gdData!!.getAsString(this.gdPaths!!.GAME_XML_PATH, sharedBytes)!!


    var result: String = this.process(updatedXslDocumentStr, xmlDocumentStr)!!


    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

result= replaceLT!!.all(result)
result= this.format(result)
this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +outputFile, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(outputFile, result)
}


                @Throws(Exception::class)
            
    open fun process(updatedXslDocumentStr: String, xmlDocumentStr: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var updatedXslDocumentStr = updatedXslDocumentStr
    //var xmlDocumentStr = xmlDocumentStr



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentStr)), StreamSource(StringBufferInputStream(xmlDocumentStr)))
}


                @Throws(Exception::class)
            
    open fun format(result: String)
        //nullable = true from not(false or (false and false)) = true
: String{
var result = result



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return result
}


}
                
            

