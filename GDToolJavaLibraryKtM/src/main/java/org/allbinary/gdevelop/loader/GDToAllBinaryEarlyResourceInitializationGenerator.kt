
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
public constructor ()
            : super()
        {
}


                @Throws(Exception::class)
            
    open fun process(soundsGenerator: GDToAllBinarySoundsGenerator)
        //nullable = true from not(false or (false and false)) = true
{
    //var soundsGenerator = soundsGenerator

    var GD_KEY: String = "//GD"


    var RESOURCE_INITIALIZATION_ORIGINAL: String = this.gdPaths!!.ROOT_PATH +"platform\\android\\GDGameAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDGameAndroidEarlyResourceInitialization.origin"


    var RESOURCE_INITIALIZATION: String = this.gdPaths!!.GEN_PATH +"platform\\android\\GDGameAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDGameAndroidEarlyResourceInitialization.java"


    var stringMaker: StringMaker = StringMaker()

this.appendSounds(soundsGenerator, stringMaker)
this.appendMedia(stringMaker)

    var streamUtil: StreamUtil = StreamUtil.getInstance()!!


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!

sharedBytes!!.outputStream!!.reset()

    var fileInputStream: FileInputStream = FileInputStream(RESOURCE_INITIALIZATION_ORIGINAL)


    var androidRFileAsString: String = streamUtil!!.getByteArray.toCharArray()


    var replace: Replace = Replace(GD_KEY, stringMaker!!.toString())


    var newFileAsString: String = replace.all(androidRFileAsString)!!

this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +RESOURCE_INITIALIZATION, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(RESOURCE_INITIALIZATION, newFileAsString)
}


    open fun appendSounds(soundsGenerator: GDToAllBinarySoundsGenerator, stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var soundsGenerator = soundsGenerator
    //var stringMaker = stringMaker

    var stringUtil: StringUtil = StringUtil.getInstance()!!


    var playSoundResourceClassNameList: BasicArrayList = soundsGenerator!!.playSoundResourceClassNameList


    var playSoundAndroidResourceNameList: BasicArrayList = this.gdResources!!.playSoundAndroidResourceNameList


    var size: Int = playSoundResourceClassNameList!!.size()!!





                        for (index in 0 until size)

        {
stringMaker!!.append(this.gdToolStrings!!.RESOURCE_0)
stringMaker!!.append(stringUtil!!.toString(playSoundResourceClassNameList!!.get(index)))
stringMaker!!.append(this.gdToolStrings!!.SOUND_RESOURCE)
stringMaker!!.append(this.gdToolStrings!!.RESOURCE_1)
stringMaker!!.append(stringUtil!!.toString(playSoundAndroidResourceNameList!!.get(index)))
stringMaker!!.append(this.gdToolStrings!!.RESOURCE_2)
stringMaker!!.append(this.commonSeps!!.NEW_LINE)
}

}


    open fun appendMedia(stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var stringMaker = stringMaker

    var commonSeps: CommonSeps = CommonSeps.getInstance()!!


    var stringUtil: StringUtil = StringUtil.getInstance()!!


    var hasRotationImages: Boolean = this.gdResourceSelection!!.hasRotationImages()!!


    var resourceList: BasicArrayList = this.gdResources!!.resourceNameList


    var androidResourceList: BasicArrayList = this.gdResources!!.androidResourceList


    var size: Int = resourceList!!.size()!!


    var size2: Int = 100


    var resource: String





                        for (index in 0 until size)

        {
resource= resourceList!!.get(index) as String
stringMaker!!.append(this.commonSeps!!.NEW_LINE)

    
                        if(resource.endsWith(this.gdToolStrings!!.UNDERSCORE_0) && resource.indexOf(this.gdToolStrings!!._TOUCH_) < 0)
                        
                                    {
                                    stringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                

    
                        if(!hasRotationImages)
                        
                                    {
                                    



                        for (index2 in 2 until size2)

        {

    
                        if(resource.endsWith(commonSeps!!.UNDERSCORE +index2) && resource.indexOf(this.gdToolStrings!!._TOUCH_) < 0)
                        
                                    {
                                    stringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                
}


                                    }
                                
stringMaker!!.append(this.gdToolStrings!!.RESOURCE_0)
stringMaker!!.append(this.gdToolStrings!!.GD_RESOURCE)
stringMaker!!.append(resource)
stringMaker!!.append(this.gdToolStrings!!._RESOURCE)
stringMaker!!.append(this.gdToolStrings!!.RESOURCE_1)
stringMaker!!.append(stringUtil!!.toString(androidResourceList!!.get(index)))
stringMaker!!.append(this.gdToolStrings!!.RESOURCE_2)
stringMaker!!.append(this.commonSeps!!.NEW_LINE)
}

}


}
                
            

