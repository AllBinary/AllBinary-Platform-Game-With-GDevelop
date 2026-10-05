
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
import org.allbinary.logic.string.StringUtil
import org.allbinary.string.CommonSeps
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDToThreedAndroidResourcesGradleGenerator
            : Object
         {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val commonSeps: CommonSeps = CommonSeps.getInstance()!!

    private val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val gdResources: GDResources = GDResources.getInstance()!!

    private val GD_KEY: String = "//GD"

    private val PUBLIC_FINAL_STRING: String = "    public final int "

    private val VALUE_RESOURCE_START: String = " = R.raw."

    private val VALUE_RESOURCE_END: String = ";\n"

    private val GD_KEY_NAME: String = "<name>"

    private val BLANK_LINE: String = "public final int blank = R.raw.blank;\n"

    private val resourceList: BasicArrayList = BasicArrayListD()

    private var packageName: String

    private var isBlank: Boolean= false
public constructor ()
            : super()
        {
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
this.resourceList!!.add(resourceString)
}


    open fun processResource(threedFileList: BasicArrayList, stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var threedFileList = threedFileList
    //var stringMaker = stringMaker

    var stringUtil: StringUtil = StringUtil.getInstance()!!


    var size: Int = this.resourceList!!.size()!!


    var resourceString: String





                        for (index in 0 until size)

        {
resourceString= this.resourceList!!.get(index) as String

    var beginIndex: Int = if(Character.isAlphabetic(resourceString[0])) {
                            
                            0
                        
                            } else {
                            1
                            }
    


    var resource: String = resourceString!!.substring(beginIndex, resourceString!!.length -4)!!.lowercase()!!


    var extensionList: BasicArrayList = this.gdToolStrings!!.getExtensions(threedFileList, resource)!!


    var size3: Int = extensionList!!.size()!!


    var extension: String





                        for (index3 in 0 until size3)

        {
extension= extensionList!!.get(index3) as String

    
                        if(extension == stringUtil!!.NULL_STRING)
                        
                                    {
                                    stringMaker!!.append(this.commonSeps!!.COMMENT)
stringMaker!!.append(this.gdToolStrings!!.NOT_USED_FOR_THREED_GAMES)

                                    }
                                

    
                        if(resource.indexOf(this.gdToolStrings!!.BLANK) >= 0)
                        
                                    {
                                    this.isBlank= true

                                    }
                                
stringMaker!!.append(this.PUBLIC_FINAL_STRING)
stringMaker!!.append(resource)
stringMaker!!.append(extension)
stringMaker!!.append(this.VALUE_RESOURCE_START)
stringMaker!!.append(resource)
stringMaker!!.append(extension)
stringMaker!!.append(this.VALUE_RESOURCE_END)
}

}

}


                @Throws(Exception::class)
            
    open fun process(threedFileList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var threedFileList = threedFileList

    var resourceStringMaker: StringMaker = StringMaker()

resourceStringMaker!!.append(this.GD_KEY)
resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
this.processResource(threedFileList, resourceStringMaker)

    var RESOURCE_ORIGINAL: String = this.gdPaths!!.ROOT_PATH +"platform\\android\\GDGameThreedAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.original"


    var RESOURCE: String = this.gdPaths!!.GEN_PATH +"platform\\android\\GDGameThreedAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.java"


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
resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
resourceStringMaker!!.append(this.PUBLIC_FINAL_STRING)
resourceStringMaker!!.append(resource)
resourceStringMaker!!.append(this.VALUE_RESOURCE_START)
resourceStringMaker!!.append(resource)
resourceStringMaker!!.append(this.VALUE_RESOURCE_END)
}


    
                        if(!this.isBlank)
                        
                                    {
                                    resourceStringMaker!!.append(this.commonSeps!!.NEW_LINE)
resourceStringMaker!!.append(this.BLANK_LINE)

                                    }
                                

    var replace: Replace = Replace(this.GD_KEY, resourceStringMaker!!.toString())


    var newFileAsString: String = replace.all(newFileAsString2)!!

this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +RESOURCE, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(RESOURCE, newFileAsString)
}


}
                
            

