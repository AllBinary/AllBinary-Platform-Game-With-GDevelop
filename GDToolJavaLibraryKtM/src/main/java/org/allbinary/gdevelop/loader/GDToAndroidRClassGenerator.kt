
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
                    
        
import org.allbinary.logic.io.BufferedWriterUtil
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil

open public class GDToAndroidRClassGenerator
            : Object
         {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val templateData: GDTemplateData = GDTemplateData()

    private val RESOURCE: String = "resource"

    private val EXPRESSION_PARAM: String = "expressionParam"

    private val NAME_ARRAY: Array<String?> = arrayOf("name")

    private val BLANK: String = "blank"

    private val SKIPPING: String = "Skipping: "
public constructor ()
            : super()
        {
}


    open fun processResource(fileAsString: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var fileAsString = fileAsString

    
                        if(fileAsString!!.compareTo(this.BLANK) == 0)
                        
                                    {
                                    this.logUtil!!.putF(this.SKIPPING +fileAsString, this, this.commonStrings!!.PROCESS)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                
this.templateData!!.add(this.RESOURCE, this.NAME_ARRAY, arrayOf(fileAsString))
}


    private val SELECT: String = "select"

    open fun processExpressionParam(param: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var param = param

    
                        if(param.compareTo(this.SELECT) != 0)
                        
                                    {
                                    this.templateData!!.add(this.EXPRESSION_PARAM, this.NAME_ARRAY, arrayOf(param))

                                    }
                                
}


                @Throws(Exception::class)
            
    open fun process()
        //nullable = true from not(false or (false and true)) = true
{

    var R_ORIGINAL: String = this.gdPaths!!.getTemplatePath(this.gdPaths!!.ROOT_PATH +"platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.xsl")!!


    var R: String = this.gdPaths!!.getOutputPath(this.gdPaths!!.GEN_PATH +"platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java")!!


    var newFileAsString: String = GDTemplateUtil.getInstance()!!.process(R_ORIGINAL, this.templateData)!!

this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +R, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(R, newFileAsString)
}


}
                
            

