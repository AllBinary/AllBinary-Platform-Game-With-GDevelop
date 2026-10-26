
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
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.string.CommonSeps
import org.allbinary.logic.string.StringUtil
import org.allbinary.util.BasicArrayList

open public class GDToAllBinaryEarlyResourceInitializationGenerator
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

    private val SOUND: String = "sound"

    private val MEDIA: String = "media"

    private val SOUND_ATTRIBUTE_NAME_ARRAY: Array<String?> = arrayOf("className","androidResource")

    private val MEDIA_ATTRIBUTE_NAME_ARRAY: Array<String?> = arrayOf("name","androidResource","prefix")
public constructor ()
            : super()
        {
}


                @Throws(Exception::class)
            
    open fun process(soundsGenerator: GDToAllBinarySoundsGenerator)
        //nullable = true from not(false or (false and false)) = true
{
    //var soundsGenerator = soundsGenerator

    var RESOURCE_INITIALIZATION_ORIGINAL: String = this.gdPaths!!.getTemplatePath(this.gdPaths!!.ROOT_PATH +"platform\\android\\GDGameAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDGameAndroidEarlyResourceInitialization.xsl")!!


    var RESOURCE_INITIALIZATION: String = this.gdPaths!!.getOutputPath(this.gdPaths!!.GEN_PATH +"platform\\android\\GDGameAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDGameAndroidEarlyResourceInitialization.java")!!


    var templateData: GDTemplateData = GDTemplateData()

this.appendSounds(soundsGenerator, templateData)
this.appendMedia(templateData)

    var newFileAsString: String = GDTemplateUtil.getInstance()!!.process(RESOURCE_INITIALIZATION_ORIGINAL, templateData)!!

this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +RESOURCE_INITIALIZATION, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(RESOURCE_INITIALIZATION, newFileAsString)
}


    open fun appendSounds(soundsGenerator: GDToAllBinarySoundsGenerator, templateData: GDTemplateData)
        //nullable = true from not(false or (false and false)) = true
{
    //var soundsGenerator = soundsGenerator
    //var templateData = templateData

    var stringUtil: StringUtil = StringUtil.getInstance()!!


    var playSoundResourceClassNameList: BasicArrayList = soundsGenerator!!.playSoundResourceClassNameList


    var playSoundAndroidResourceNameList: BasicArrayList = this.gdResources!!.playSoundAndroidResourceNameList


    var size: Int = playSoundResourceClassNameList!!.size()





                        for (index in 0 until size)

        {
templateData!!.add(this.SOUND, this.SOUND_ATTRIBUTE_NAME_ARRAY, arrayOf(stringUtil!!.toString(playSoundResourceClassNameList!!.get(index)), stringUtil!!.toString(playSoundAndroidResourceNameList!!.get(index))))
}

}


    open fun appendMedia(templateData: GDTemplateData)
        //nullable = true from not(false or (false and false)) = true
{
    //var templateData = templateData

    var commonSeps: CommonSeps = CommonSeps.getInstance()!!


    var stringUtil: StringUtil = StringUtil.getInstance()!!


    var hasRotationImages: Boolean = this.gdResourceSelection!!.hasRotationImages()


    var resourceList: BasicArrayList = this.gdResources!!.resourceNameList


    var androidResourceList: BasicArrayList = this.gdResources!!.androidResourceList


    var prefixStringMaker: StringMaker = StringMaker()


    var size: Int = resourceList!!.size()


    var size2: Int = 100


    var resource: String





                        for (index in 0 until size)

        {
resource= resourceList!!.get(index) as String
prefixStringMaker!!.delete(0, prefixStringMaker!!.length())

    
                        if(resource.endsWith(this.gdToolStrings!!.UNDERSCORE_0) && resource.indexOf(this.gdToolStrings!!._TOUCH_) < 0)
                        
                                    {
                                    prefixStringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                

    
                        if(!hasRotationImages)
                        
                                    {
                                    



                        for (index2 in 2 until size2)

        {

    
                        if(resource.endsWith(commonSeps!!.UNDERSCORE +index2) && resource.indexOf(this.gdToolStrings!!._TOUCH_) < 0)
                        
                                    {
                                    prefixStringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                
}


                                    }
                                
templateData!!.add(this.MEDIA, this.MEDIA_ATTRIBUTE_NAME_ARRAY, arrayOf(resource,stringUtil!!.toString(androidResourceList!!.get(index)), prefixStringMaker!!.toString()))
}

}


}
                
            

