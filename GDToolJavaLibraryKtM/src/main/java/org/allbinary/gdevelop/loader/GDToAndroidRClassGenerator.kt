
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
import org.allbinary.string.CommonSeps

open public class GDToAndroidRClassGenerator
            : Object
         {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val commonSeps: CommonSeps = CommonSeps.getInstance()!!

    private val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val androidRFileStringMaker: StringMaker = StringMaker()

    val GD_KEY: String = "//GD"

    private val PUBLIC_STATIC_FINAL_INT: String = "        public static final int "

    private val VALUE: String = " = 0x7f060007;\n"

    private val RESOURCE: String = "        //Resource\n"

    private val EXPRESSION_PARAM: String = "        //Expression Param\n"

    private val BLANK: String = "blank"

    private val SKIPPING: String = "Skipping: "
public constructor ()
            : super()
        {
this.androidRFileStringMaker!!.append(this.GD_KEY)
this.androidRFileStringMaker!!.append(this.commonSeps!!.NEW_LINE)
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
                                
this.androidRFileStringMaker!!.append(this.RESOURCE)
this.androidRFileStringMaker!!.append(this.PUBLIC_STATIC_FINAL_INT)
this.androidRFileStringMaker!!.append(fileAsString)
this.androidRFileStringMaker!!.append(this.VALUE)
this.androidRFileStringMaker!!.append(this.commonSeps!!.NEW_LINE)
}


    private val SELECT: String = "select"

    open fun processExpressionParam(param: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var param = param

    
                        if(param.compareTo(this.SELECT) != 0)
                        
                                    {
                                    this.androidRFileStringMaker!!.append(this.EXPRESSION_PARAM)
this.androidRFileStringMaker!!.append(this.PUBLIC_STATIC_FINAL_INT)
this.androidRFileStringMaker!!.append(param)
this.androidRFileStringMaker!!.append(this.VALUE)

                                    }
                                
}


                @Throws(Exception::class)
            
    open fun process()
        //nullable = true from not(false or (false and true)) = true
{

    var R_ORIGINAL: String = this.gdPaths!!.ROOT_PATH +"platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.original"


    var R: String = this.gdPaths!!.GEN_PATH +"platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java"


    var streamUtil: StreamUtil = StreamUtil.getInstance()!!


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!

sharedBytes!!.outputStream!!.reset()

    var fileInputStream: FileInputStream = FileInputStream(R_ORIGINAL)


    var androidRFileAsString: String = streamUtil!!.getByteArray.toCharArray()


    var replace: Replace = Replace(this.GD_KEY, this.androidRFileStringMaker!!.toString())


    var newFileAsString: String = replace.all(androidRFileAsString)!!

this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +R, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(R, newFileAsString)
}


}
                
            

