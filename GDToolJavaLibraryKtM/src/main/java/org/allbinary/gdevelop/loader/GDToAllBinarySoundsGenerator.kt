
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
        
import java.io.File
import java.io.FileInputStream
import javax.microedition.media.Player
import org.allbinary.data.CamelCaseUtil
import org.allbinary.data.resource.ResourceUtil
import org.allbinary.game.configuration.feature.Features
import org.allbinary.game.configuration.feature.GameFeatureFactory
import org.allbinary.logic.io.BufferedWriterUtil
import org.allbinary.logic.io.StreamUtil
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.regex.replace.Replace
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.media.audio.AllBinaryMediaManager
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDToAllBinarySoundsGenerator
            : Object
         {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val camelCaseUtil: CamelCaseUtil = CamelCaseUtil.getInstance()!!

    private val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val gdResources: GDResources = GDResources.getInstance()!!

    val playSoundResourceClassNameList: BasicArrayList = BasicArrayListD()

    private val GD_NAME: String = "<GDNAME>"

    private val GD_FILE_NAME: String = "<GD_FILE_NAME>"

    private val GD_DURATION: String = "<GD_DURATION>"

    private val SOUND_ORIGINAL: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDSound.origin"

    private val SOUND_PATH: String = this.gdPaths!!.GEN_PATH +"resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\"

    private val GD: String = "GD"

    private val SOUND: String = "Sound"

    private val _JAVA: String = ".java"

    private val SKIPPING_SOUND: String = "Skpping Sound: "

    private val SELECT: String = "select"

    private val ERROR: String = "error"

    open fun processExpressionParam(param: String, resourceString: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var param = param
    //var resourceString = resourceString
this.logUtil!!.putF(this.SOUND +param, this, this.commonStrings!!.PROCESS)

    var startIndex: Int = param.lastIndexOf('/')!!


    
                        if(startIndex < 0)
                        
                                    {
                                    startIndex= param.lastIndexOf('\\')

                                    }
                                

    
                        if(startIndex < 0)
                        
                                    {
                                    startIndex= 0

                                    }
                                
                        else {
                            startIndex++

                        }
                            

    var fileAsString: String = param.substring(startIndex)!!


    
                        if(fileAsString!!.compareTo(this.SELECT) == 0)
                        
                                    {
                                    this.logUtil!!.putF(this.SKIPPING_SOUND +fileAsString, this, this.commonStrings!!.PROCESS)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(fileAsString!!.compareTo(this.ERROR) == 0)
                        
                                    {
                                    this.logUtil!!.putF(this.SKIPPING_SOUND +fileAsString, this, this.commonStrings!!.PROCESS)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                
this.logUtil!!.putF(this.SOUND +fileAsString, this, this.commonStrings!!.PROCESS)
this.gdResources!!.playSoundAndroidResourceNameList!!.add(fileAsString)
this.gdResources!!.playSoundResourcePathList!!.add(resourceString)
}


                @Throws(Exception::class)
            
    open fun process()
        //nullable = true from not(false or (false and true)) = true
{

    var file: File = File(this.gdPaths!!.ROOT_PATH)

ResourceUtil.getInstance()!!.setLoadingPaths(file.getAbsolutePath() +this.gdPaths!!.SOUND_RESOURCES_ROOT_PATH +"sounds\\release\\wav\\", ".wav")
Features.getInstance()!!.add(GameFeatureFactory.getInstance()!!.SOUND)

    var streamUtil: StreamUtil = StreamUtil.getInstance()!!


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!

sharedBytes!!.outputStream!!.reset()

    var stringMaker: StringMaker = StringMaker()


    var fileInputStream: FileInputStream = FileInputStream(this.SOUND_ORIGINAL)


    var androidRFileAsString: String = streamUtil!!.getByteArray.toCharArray()


    var size: Int = this.gdResources!!.playSoundAndroidResourceNameList!!.size()!!

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append("Sound Total: ")!!.appendint(size)!!.toString(), this, this.commonStrings!!.PROCESS)

    var resource: String





                        for (index in 0 until size)

        {
resource= this.gdResources!!.playSoundAndroidResourceNameList!!.get(index) as String
this.logUtil!!.putF(resource, this, this.commonStrings!!.PROCESS)

    var player: Player = AllBinaryMediaManager.createPlayer(resource)!!


    var duration: Long = player.getDuration()!!


    var name: String = this.camelCaseUtil!!.getAsCamelCase(resource, stringMaker)!!


    var replace: Replace = Replace(this.GD_NAME, name)


    var newFileAsString: String = replace.all(androidRFileAsString)!!


    var replace2: Replace = Replace(this.GD_FILE_NAME, resource)

newFileAsString= replace2.all(newFileAsString)

    var replace3: Replace = Replace(this.GD_DURATION, (duration).toString())

newFileAsString= replace3.all(newFileAsString)
stringMaker!!.delete(0, stringMaker!!.length())
stringMaker!!.append(this.GD)!!.append(name)!!.append(this.SOUND)
this.playSoundResourceClassNameList!!.add(stringMaker!!.toString())
stringMaker!!.append(this._JAVA)

    var fileName: String = stringMaker!!.toString()!!

stringMaker!!.delete(0, stringMaker!!.length())

    var fileName2: String = stringMaker!!.append(this.SOUND_PATH)!!.append(fileName)!!.toString()!!

this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +fileName2, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(fileName2, newFileAsString)
}

}


}
                
            

