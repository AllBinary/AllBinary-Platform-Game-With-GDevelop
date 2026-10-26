
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

    private val templateData: GDTemplateData = GDTemplateData()

    private val RESOURCE: String = "resource"

    private val SOUND: String = "sound"

    private val BLANK_RESOURCE: String = "blank"

    private val NAME_ARRAY: Array<String?> = arrayOf("name")

    private val RESOURCE_ATTRIBUTE_NAME_ARRAY: Array<String?> = arrayOf("name","prefix")

    private val NO_ATTRIBUTE_ARRAY: Array<String?> = arrayOf()

    private val BLANK: String = "blank"

    private val NAME: String = "name"

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

    var resource: String = resourceString!!.substring(0, resourceString!!.length -4)!!.lowercase()!!


    
                        if(resource.indexOf(this.BLANK) >= 0)
                        
                                    {
                                    this.isBlank= true

                                    }
                                

    var hasRotationImages: Boolean = this.gdResourceSelection!!.hasRotationImages()


    var prefixStringMaker: StringMaker = StringMaker()

this.gdResourceSelection!!.appendCommentIfNeeded2(resource.uppercase(), resource, prefixStringMaker, hasRotationImages)
this.templateData!!.add(this.RESOURCE, this.RESOURCE_ATTRIBUTE_NAME_ARRAY, arrayOf(resource,prefixStringMaker!!.toString()))
}


                @Throws(Exception::class)
            
    open fun process()
        //nullable = true from not(false or (false and true)) = true
{

    var RESOURCE_ORIGINAL: String = this.gdPaths!!.getTemplatePath(this.gdPaths!!.ROOT_PATH +"platform\\android\\GDGameAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.xsl")!!


    var RESOURCE: String = this.gdPaths!!.getOutputPath(this.gdPaths!!.GEN_PATH +"platform\\android\\GDGameAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.java")!!


    var camelCaseUtil: CamelCaseUtil = CamelCaseUtil.getInstance()!!


    var stringMaker: StringMaker = StringMaker()


    var name: String = camelCaseUtil!!.getAsCamelCase(this.packageName, stringMaker)!!.lowercase()!!


    var size: Int = this.gdResources!!.playSoundAndroidResourceNameList!!.size()


    var resource: String





                        for (index in 0 until size)

        {
resource= this.gdResources!!.playSoundAndroidResourceNameList!!.get(index) as String
this.templateData!!.add(this.SOUND, this.NAME_ARRAY, arrayOf(resource))
}


    
                        if(!this.isBlank)
                        
                                    {
                                    this.templateData!!.add(this.BLANK_RESOURCE, this.NO_ATTRIBUTE_ARRAY, this.NO_ATTRIBUTE_ARRAY)

                                    }
                                

    var newFileAsString: String = GDTemplateUtil.getInstance()!!.process(RESOURCE_ORIGINAL, this.templateData, arrayOf(this.NAME), arrayOf(name))!!

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(RESOURCE)!!.toString(), this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(RESOURCE, newFileAsString)
}


}
                
            

