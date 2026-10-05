
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
import org.allbinary.data.CamelCaseUtil
import org.allbinary.gdevelop.json.GDProject
import org.allbinary.logic.io.BufferedWriterUtil
import org.allbinary.logic.io.StreamUtil
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.regex.replace.Replace
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.string.CommonSeps

open public class GDToAndroidResourcesGradleGenerator
            : Object
         {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val commonSeps: CommonSeps = CommonSeps.getInstance()!!

    private val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val gdResources: GDResources = GDResources.getInstance()!!

    private val gdResourceSelection: GDResourceSelection = GDResourceSelection.getInstance()!!

    private val resourceStringMaker: StringMaker = StringMaker()

    private val GD_KEY: String = "//GD"

    private val PUBLIC_FINAL_STRING: String = "    public final int "

    private val VALUE_RESOURCE_START: String = " = R.raw."

    private val VALUE_RESOURCE_END: String = ";\n"

    private val BLANK_LINE: String = "public final int blank = R.raw.blank;\n"

    private val BLANK: String = "blank"

    private val GD_KEY_NAME: String = "<name>"

    private var packageName: String

    private var isBlank: Boolean= false
public constructor ()
            : super()
        {
this.resourceStringMaker!!.append(this.GD_KEY)
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
}


    open fun process(gdProject: GDProject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdProject = gdProject

    
                        if(gdProject!!.packageName != 
                                    null
                                )
                        
                                    {
                                    this.packageName= gdProject!!.packageName

                                    }
                                
                        else {
                            this.packageName= gdProject!!.name

                        }
                            
}


    open fun processResource(fileAsString: String, resourceString: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var fileAsString = fileAsString
    //var resourceString = resourceString

    var resource: String = resourceString!!.substring(0, resourceString!!.length -4)!!.lowercase()!!


    
                        if(resource.indexOf(this.BLANK) >= 0)
                        
                                    {
                                    this.isBlank= true

                                    }
                                

    var hasRotationImages: Boolean = this.gdResourceSelection!!.hasRotationImages()!!

this.gdResourceSelection!!.appendCommentIfNeeded2(resource.uppercase(), resource, this.resourceStringMaker, hasRotationImages)
this.resourceStringMaker!!.append(this.PUBLIC_FINAL_STRING)
this.resourceStringMaker!!.append(resource)
this.resourceStringMaker!!.append(this.VALUE_RESOURCE_START)
this.resourceStringMaker!!.append(resource)
this.resourceStringMaker!!.append(this.VALUE_RESOURCE_END)
}


                @Throws(Exception::class)
            
    open fun process()
        //nullable = true from not(false or (false and true)) = true
{

    var RESOURCE_ORIGINAL: String = this.gdPaths!!.ROOT_PATH +"platform\\android\\GDGameAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.original"


    var RESOURCE: String = this.gdPaths!!.GEN_PATH +"platform\\android\\GDGameAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.java"


    var camelCaseUtil: CamelCaseUtil = CamelCaseUtil.getInstance()!!


    var stringMaker: StringMaker = StringMaker()


    var streamUtil: StreamUtil = StreamUtil.getInstance()!!


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!

sharedBytes!!.outputStream!!.reset()

    var fileInputStream: FileInputStream = FileInputStream(RESOURCE_ORIGINAL)


    var androidRFileAsString: String = streamUtil!!.getByteArray.toCharArray()


    var replace2: Replace = Replace(this.GD_KEY_NAME, camelCaseUtil!!.getAsCamelCase(this.packageName, stringMaker)!!.lowercase())


    var newFileAsString2: String = replace2.all(androidRFileAsString)!!


    var size: Int = this.gdResources!!.playSoundAndroidResourceNameList!!.size()!!


    var resource: String





                        for (index in 0 until size)

        {
resource= this.gdResources!!.playSoundAndroidResourceNameList!!.get(index) as String
this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
this.resourceStringMaker!!.append(this.PUBLIC_FINAL_STRING)
this.resourceStringMaker!!.append(resource)
this.resourceStringMaker!!.append(this.VALUE_RESOURCE_START)
this.resourceStringMaker!!.append(resource)
this.resourceStringMaker!!.append(this.VALUE_RESOURCE_END)
}


    
                        if(!this.isBlank)
                        
                                    {
                                    this.resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
this.resourceStringMaker!!.append(this.BLANK_LINE)

                                    }
                                

    var replace: Replace = Replace(this.GD_KEY, this.resourceStringMaker!!.toString())


    var newFileAsString: String = replace.all(newFileAsString2)!!

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(RESOURCE)!!.toString(), this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(RESOURCE, newFileAsString)
}


}
                
            

