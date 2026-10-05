
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
        
import java.io.FileInputStream
import org.allbinary.logic.io.BufferedWriterUtil
import org.allbinary.logic.io.StreamUtil
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.regex.replace.Replace
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

    private val GD_KEY: String = "//GD"

    private val PUBLIC_STATIC_FINAL_INT: String = "        public static final int "

    private val VALUE: String = " = 0x7f060007;\n"

    private val RESOURCE: String = "        //Resource - "

    private val EXPRESSION_PARAM: String = "        //Expression Param\n"

    private val FILE: String = "        //File - "

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


    open fun processResource(threedFileList: BasicArrayList, stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var threedFileList = threedFileList
    //var stringMaker = stringMaker

    var size: Int = this.fileAsStringList!!.size()!!


    var fileAsString: String





                        for (index in 0 until size)

        {
fileAsString= this.fileAsStringList!!.get(index) as String
stringMaker!!.append(this.FILE)
stringMaker!!.append(this.commonSeps!!.QUOTE)
stringMaker!!.append(fileAsString)
stringMaker!!.append(this.commonSeps!!.QUOTE)
stringMaker!!.append(this.commonSeps!!.NEW_LINE)

    var extensionList: BasicArrayList = this.gdToolStrings!!.getExtensions(threedFileList, fileAsString)!!


    var size3: Int = extensionList!!.size()!!


    var extension: String


    var list: BasicArrayList = BasicArrayListD()





                        for (index3 in 0 until size3)

        {
extension= extensionList!!.get(index3) as String

    
                        if(!list.contains(extension))
                        
                                    {
                                    list.add(extension)
stringMaker!!.append(this.RESOURCE)
stringMaker!!.append(this.commonSeps!!.QUOTE)
stringMaker!!.append(extension)
stringMaker!!.append(this.commonSeps!!.QUOTE)
stringMaker!!.append(this.commonSeps!!.NEW_LINE)

    
                        if(extension == StringUtil.getInstance()!!.NULL_STRING)
                        
                                    {
                                    stringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                
stringMaker!!.append(this.PUBLIC_STATIC_FINAL_INT)
stringMaker!!.append(fileAsString)
stringMaker!!.append(extension)
stringMaker!!.append(this.VALUE)

                                    }
                                
}

}

}


    open fun processExpressionParam(threedFileList: BasicArrayList, stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var threedFileList = threedFileList
    //var stringMaker = stringMaker

    var size: Int = this.paramList!!.size()!!


    var param: String





                        for (index in 0 until size)

        {
param= this.paramList!!.get(index) as String
stringMaker!!.append(this.EXPRESSION_PARAM)
stringMaker!!.append(this.PUBLIC_STATIC_FINAL_INT)
stringMaker!!.append(param)
stringMaker!!.append(this.VALUE)
}

}


                @Throws(Exception::class)
            
    open fun process(threedFileList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var threedFileList = threedFileList

    var stringMaker: StringMaker = StringMaker()

stringMaker!!.append(this.GD_KEY)
stringMaker!!.append(this.commonSeps!!.NEW_LINE)
this.processResource(threedFileList, stringMaker)
this.processExpressionParam(threedFileList, stringMaker)

    var R_ORIGINAL: String = this.gdPaths!!.ROOT_PATH +"platform\\android\\GDGameThreedAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.original"


    var R: String = this.gdPaths!!.GEN_PATH +"platform\\android\\GDGameThreedAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java"


    var streamUtil: StreamUtil = StreamUtil.getInstance()!!


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!

sharedBytes!!.outputStream!!.reset()

    var fileInputStream: FileInputStream = FileInputStream(R_ORIGINAL)


    var androidRFileAsString: String = streamUtil!!.getByteArray.toCharArray()


    var replace: Replace = Replace(this.GD_KEY, stringMaker!!.toString())


    var newFileAsString: String = replace.all(androidRFileAsString)!!

this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +R, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(R, newFileAsString)
}


}
                
            

