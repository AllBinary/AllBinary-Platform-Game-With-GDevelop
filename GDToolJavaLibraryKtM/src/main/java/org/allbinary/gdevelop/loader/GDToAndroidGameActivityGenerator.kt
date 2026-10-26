
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

open public class GDToAndroidGameActivityGenerator : GDNameGenerator {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!
public constructor (){
}


                @Throws(Exception::class)
            
    override fun process()
        //nullable = true from not(false or (false and true)) = true
{

    var camelCaseUtil: CamelCaseUtil = CamelCaseUtil.getInstance()!!


    var stringMaker: StringMaker = StringMaker()


    var name: String = camelCaseUtil!!.getAsCamelCase(this.packageName, stringMaker)!!.lowercase()!!


    var R_ORIGINAL: String = this.gdPaths!!.getTemplatePath(this.gdPaths!!.ROOT_PATH +"platform\\android\\GDGameAndroidActivityJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\GDGameAndroidActivity.xsl")!!

stringMaker!!.delete(0, stringMaker!!.length())
stringMaker!!.append(this.gdPaths!!.GEN_PATH +"platform\\android\\GDGameAndroidActivityJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\")!!.append(name)

    var R: String = this.gdPaths!!.getOutputPath(stringMaker!!.append("\\GDGameAndroidActivity.java")!!.toString())!!


    var newFileAsString: String = GDTemplateUtil.getInstance()!!.process(R_ORIGINAL, this.GD_KEY, this.NAME, name)!!

this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +R, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(R, newFileAsString)
}


}
                
            

