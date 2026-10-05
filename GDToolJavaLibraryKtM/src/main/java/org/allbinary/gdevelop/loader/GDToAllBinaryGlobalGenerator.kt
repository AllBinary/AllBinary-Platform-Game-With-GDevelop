
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import java.io.StringBufferInputStream
import javax.xml.transform.stream.StreamSource
import org.allbinary.data.CamelCaseUtil
import org.allbinary.data.tree.dom.BasicUriResolver
import org.allbinary.data.tree.dom.XslHelper
import org.allbinary.gdevelop.json.GDLayout
import org.allbinary.logic.io.BufferedWriterUtil
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.regex.replace.Replace
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.string.CommonLabels
import org.allbinary.time.TimeDelayHelper
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDToAllBinaryGlobalGenerator
            : Object
         {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val xslHelper: XslHelper = XslHelper.getInstance()!!

    private val camelCaseUtil: CamelCaseUtil = CamelCaseUtil.getInstance()!!

    private val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdData: GDData = GDData.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val timeDelayHelper: TimeDelayHelper = TimeDelayHelper(Integer.MAX_VALUE)

    private val stringMaker: StringMaker = StringMaker()

    private var layoutNameList: BasicArrayList = BasicArrayListD()

    private var nameList: BasicArrayList = BasicArrayListD()

    private var classNameList: BasicArrayList = BasicArrayListD()

                @Throws(Exception::class)
            
    open fun loadLayout(layout: GDLayout, index: Int, size: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var layout = layout
    //var index = index
    //var size = size

    var name: String = this.camelCaseUtil!!.getAsCamelCase(layout.name, this.stringMaker)!!

this.stringMaker!!.delete(0, this.stringMaker!!.length())

    var className: String

className= this.stringMaker!!.append("GDGame")!!.append(name)!!.append("Canvas")!!.toString()
this.logUtil!!.putF(className, this, "loadLayout")
this.layoutNameList!!.add(layout.name.uppercase())
this.nameList!!.add(name)
this.classNameList!!.add(className)
}


                @Throws(Exception::class)
            
    open fun process()
        //nullable = true from not(false or (false and true)) = true
{
this.timeDelayHelper!!.setStartTimeTNT()

    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!


    var xmlDocumentStr: String = this.gdData!!.getAsString(this.gdPaths!!.GAME_XML_PATH, sharedBytes)!!


    var xslPathInputArray: Array<String?> = arrayOf(this.gdData!!.GD_BASE_GAME_MIDLET,this.gdData!!.GD_THREED_GAME_MIDLET,this.gdData!!.GD_GAME_COMMAND_FACTORY,this.gdData!!.GD_THREED_LEVEL_BUILDER_FACTORY,this.gdData!!.GD_GAME_SOUNDS,this.gdData!!.GD_PLATFORM_ASSET_MANAGER,this.gdData!!.GD_CUSTOM_GAME_LAYER_FACTORY,this.gdData!!.GD_CUSTOM_GAME_LAYER,this.gdData!!.GD_CUSTOM_COLLIDABLE_BEHAVIOR,this.gdData!!.GD_CUSTOM_MASK_COLLIDABLE_BEHAVIOR,this.gdData!!.GD_PREBASE_GAME_SOFTWARE_INFO,this.gdData!!.GD_THREED_PREBASE_GAME_SOFTWARE_INFO,this.gdData!!.GD_THREED_ANIMATION_RESOURCES)


    var outputArray: Array<String?> = arrayOf(this.gdPaths!!.GEN_PATH +"GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java",this.gdPaths!!.GEN_PATH +"GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java",this.gdPaths!!.GEN_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameCommandFactory.java",this.gdPaths!!.GEN_PATH +"GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\graphics\\threed\\min3d\\GDGameThreedLevelBuilderFactory.java",this.gdPaths!!.GEN_PATH +"GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GDGameSounds.java",this.gdPaths!!.GEN_PATH +"platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\org\\allbinary\\logic\\system\\PlatformAssetManager.java",this.gdPaths!!.GEN_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\GDCustomGameLayerFactory.java",this.gdPaths!!.GEN_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\GDCustomGameLayer.java",this.gdPaths!!.GEN_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\special\\GDCustomCollidableBehavior.java",this.gdPaths!!.GEN_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\special\\GDCustomMaskCollidableBehavior.java",this.gdPaths!!.GEN_PATH +"GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameSoftwareInfo.java",this.gdPaths!!.GEN_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameSoftwareInfo.java",this.gdPaths!!.GEN_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameThreedAnimationResources.java")


    var size2: Int = xslPathInputArray!!.size
                





                        for (index2 in 0 until size2)

        {

    var xslFileAsString: String = this.gdData!!.getAsString(xslPathInputArray[index2]!!, sharedBytes)!!


    var newFileAsString: String = xslFileAsString


    var updatedXslDocumentStr: String = newFileAsString

this.logUtil!!.putF(updatedXslDocumentStr, this, this.commonStrings!!.PROCESS)

    var result: String = this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentStr)), StreamSource(StringBufferInputStream(xmlDocumentStr)))!!


    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

result= replaceLT!!.all(result)
this.stringMaker!!.delete(0, this.stringMaker!!.length())
this.logUtil!!.putF(this.stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(outputArray[index2]!!)!!.toString(), this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(outputArray[index2]!!, result)
}

this.stringMaker!!.delete(0, this.stringMaker!!.length())
this.logUtil!!.putF(this.stringMaker!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.appendlong(this.timeDelayHelper!!.getElapsedTNT())!!.toString(), this, this.commonStrings!!.PROCESS)
}


}
                
            

