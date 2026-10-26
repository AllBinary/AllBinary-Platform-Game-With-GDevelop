
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
import org.w3c.dom.Element
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringUtil
import org.allbinary.string.CommonSeps
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDToThreedAndroidRClassGenerator
            : Object
         {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val commonSeps: CommonSeps = CommonSeps.getInstance()!!

    private val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val FILE: String = "file"

    private val RESOURCE: String = "resource"

    private val EXPRESSION_PARAM: String = "expressionParam"

    private val NAME_ARRAY: Array<String?> = arrayOf("name")

    private val RESOURCE_ATTRIBUTE_NAME_ARRAY: Array<String?> = arrayOf("extension","prefix")

    private val SKIPPING: String = "Skipping: "

    private val SELECT: String = "select"

    private val fileAsStringList: BasicArrayList = BasicArrayListD()

    private val paramList: BasicArrayList = BasicArrayListD()
public constructor ()
            : super()
        {
}


    open fun processResource(fileAsString: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var fileAsString = fileAsString

    
                        if(fileAsString!!.compareTo(this.gdToolStrings!!.BLANK) == 0)
                        
                                    {
                                    this.logUtil!!.putF(this.SKIPPING +fileAsString, this, this.commonStrings!!.PROCESS)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                
this.fileAsStringList!!.add(fileAsString)
}


    open fun processExpressionParam(param: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var param = param

    
                        if(param.compareTo(this.SELECT) != 0)
                        
                                    {
                                    this.paramList!!.add(param)

                                    }
                                
}


    open fun processResource(threedFileList: BasicArrayList, templateData: GDTemplateData)
        //nullable = true from not(false or (false and false)) = true
{
    //var threedFileList = threedFileList
    //var templateData = templateData

    var stringUtil: StringUtil = StringUtil.getInstance()!!


    var size: Int = this.fileAsStringList!!.size()


    var fileAsString: String





                        for (index in 0 until size)

        {
fileAsString= this.fileAsStringList!!.get(index) as String

    var fileElement: Element = templateData!!.add(this.FILE, this.NAME_ARRAY, arrayOf(fileAsString))!!


    var extensionList: BasicArrayList = this.gdToolStrings!!.getExtensions(threedFileList, fileAsString)!!


    var size3: Int = extensionList!!.size()


    var extension: String


    var list: BasicArrayList = BasicArrayListD()





                        for (index3 in 0 until size3)

        {
extension= extensionList!!.get(index3) as String

    
                        if(!list.contains(extension))
                        
                                    {
                                    list.add(extension)

    var prefix: String = if(extension == stringUtil!!.NULL_STRING) {
                            
                            this.commonSeps!!.COMMENT
                        
                            } else {
                            stringUtil!!.EMPTY_STRING
                            }
    

templateData!!.add(fileElement, this.RESOURCE, this.RESOURCE_ATTRIBUTE_NAME_ARRAY, arrayOf(extension,prefix))

                                    }
                                
}

}

}


    open fun processExpressionParam(threedFileList: BasicArrayList, templateData: GDTemplateData)
        //nullable = true from not(false or (false and false)) = true
{
    //var threedFileList = threedFileList
    //var templateData = templateData

    var size: Int = this.paramList!!.size()


    var param: String





                        for (index in 0 until size)

        {
param= this.paramList!!.get(index) as String
templateData!!.add(this.EXPRESSION_PARAM, this.NAME_ARRAY, arrayOf(param))
}

}


                @Throws(Exception::class)
            
    open fun process(threedFileList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var threedFileList = threedFileList

    var templateData: GDTemplateData = GDTemplateData()

this.processResource(threedFileList, templateData)
this.processExpressionParam(threedFileList, templateData)

    var R_ORIGINAL: String = this.gdPaths!!.getTemplatePath(this.gdPaths!!.ROOT_PATH +"platform\\android\\GDGameThreedAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.xsl")!!


    var R: String = this.gdPaths!!.getOutputPath(this.gdPaths!!.GEN_PATH +"platform\\android\\GDGameThreedAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java")!!


    var newFileAsString: String = GDTemplateUtil.getInstance()!!.process(R_ORIGINAL, templateData)!!

this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +R, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(R, newFileAsString)
}


}
                
            

