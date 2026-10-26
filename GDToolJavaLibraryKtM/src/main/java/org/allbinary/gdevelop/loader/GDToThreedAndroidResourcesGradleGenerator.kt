
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
import org.allbinary.gdevelop.json.GDProject
import org.allbinary.logic.io.BufferedWriterUtil
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringMaker
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

    private val RESOURCE: String = "resource"

    private val SOUND: String = "sound"

    private val BLANK_RESOURCE: String = "blank"

    private val NAME_ARRAY: Array<String?> = arrayOf("name")

    private val RESOURCE_ATTRIBUTE_NAME_ARRAY: Array<String?> = arrayOf("name","prefix")

    private val NO_ATTRIBUTE_ARRAY: Array<String?> = arrayOf()

    private val NAME: String = "name"

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


    open fun processResource(threedFileList: BasicArrayList, templateData: GDTemplateData)
        //nullable = true from not(false or (false and false)) = true
{
    //var threedFileList = threedFileList
    //var templateData = templateData

    var stringUtil: StringUtil = StringUtil.getInstance()!!


    var size: Int = this.resourceList!!.size()


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


    var size3: Int = extensionList!!.size()


    var extension: String





                        for (index3 in 0 until size3)

        {
extension= extensionList!!.get(index3) as String

    var prefix: String = if(extension == stringUtil!!.NULL_STRING) {
                            
                            this.commonSeps!!.COMMENT +this.gdToolStrings!!.NOT_USED_FOR_THREED_GAMES
                        
                            } else {
                            stringUtil!!.EMPTY_STRING
                            }
    


    
                        if(resource.indexOf(this.gdToolStrings!!.BLANK) >= 0)
                        
                                    {
                                    this.isBlank= true

                                    }
                                
templateData!!.add(this.RESOURCE, this.RESOURCE_ATTRIBUTE_NAME_ARRAY, arrayOf(resource +extension,prefix))
}

}

}


                @Throws(Exception::class)
            
    open fun process(threedFileList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var threedFileList = threedFileList

    var templateData: GDTemplateData = GDTemplateData()

this.processResource(threedFileList, templateData)

    var RESOURCE_ORIGINAL: String = this.gdPaths!!.getTemplatePath(this.gdPaths!!.ROOT_PATH +"platform\\android\\GDGameThreedAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.xsl")!!


    var RESOURCE: String = this.gdPaths!!.getOutputPath(this.gdPaths!!.GEN_PATH +"platform\\android\\GDGameThreedAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.java")!!


    var camelCaseUtil: CamelCaseUtil = CamelCaseUtil.getInstance()!!


    var stringMaker: StringMaker = StringMaker()


    var name: String = camelCaseUtil!!.getAsCamelCase(this.packageName, stringMaker)!!.lowercase()!!


    var size: Int = this.gdResources!!.playSoundAndroidResourceNameList!!.size()


    var resource: String





                        for (index in 0 until size)

        {
resource= this.gdResources!!.playSoundAndroidResourceNameList!!.get(index) as String
templateData!!.add(this.SOUND, this.NAME_ARRAY, arrayOf(resource))
}


    
                        if(!this.isBlank)
                        
                                    {
                                    templateData!!.add(this.BLANK_RESOURCE, this.NO_ATTRIBUTE_ARRAY, this.NO_ATTRIBUTE_ARRAY)

                                    }
                                

    var newFileAsString: String = GDTemplateUtil.getInstance()!!.process(RESOURCE_ORIGINAL, templateData, arrayOf(this.NAME), arrayOf(name))!!

this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +RESOURCE, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(RESOURCE, newFileAsString)
}


}
                
            

