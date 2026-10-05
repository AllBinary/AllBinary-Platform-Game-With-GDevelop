
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        import java.lang.Integer
        
        import java.lang.System
        
        import java.lang.Runnable
        
        import java.lang.Thread
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import java.io.StringBufferInputStream
import javax.xml.transform.stream.StreamSource
import org.allbinary.data.tree.dom.BasicUriResolver
import org.allbinary.data.tree.dom.XslHelper
import org.allbinary.data.tree.dom.document.DomDocumentHelper
import org.allbinary.data.tree.dom.document.XmlDocumentHelper
import org.allbinary.logic.io.BufferedWriterUtil
import org.allbinary.logic.io.StreamUtil
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.regex.replace.Replace
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.io.file.directory.Directory
import org.allbinary.logic.io.path.AbFilePath
import org.allbinary.logic.java.bool.BooleanUtil
import org.allbinary.logic.math.PrimitiveLongSingleton
import org.allbinary.logic.math.SmallIntegerSingletonFactory
import org.allbinary.string.CommonLabels
import org.allbinary.string.CommonSeps
import org.allbinary.logic.string.tokens.Tokenizer
import org.allbinary.time.TimeDelayHelper
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDLayoutsToAllBinaryLayoutGenerator
            : Object
         {
        
companion object {
            
                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
DomDocumentHelper.init()
GDPaths.init()

    var finished: BooleanArray = BooleanArray(6)


    var gdGameInfo: GDGameInfo = GDGenerateGDGameInfo().
                            process()!!

GDLayoutsToAllBinaryLayoutGenerator().
                            process(1, gdGameInfo, finished)
}


        }
            
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val commonSeps: CommonSeps = CommonSeps.getInstance()!!

    private val directory: Directory = Directory.getInstance()!!

    private val smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()!!

    private val streamUtil: StreamUtil = StreamUtil.getInstance()!!

    private val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    private val xslHelper: XslHelper = XslHelper.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdData: GDData = GDData.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val GAME_START: String = "<game>"

    private val GAME_END: String = "</game>"

    private val RESULT: String = "result: "

    private val GENERATED_START_WITH_ROOT_PATH: String = this.gdPaths!!.GEN_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas"

    private val GENERATED_START_WITH_PATH: String = this.GENERATED_START_WITH_ROOT_PATH +"\\GD"

    private val BUILTIN_GDNODE_START_WITH_PATH: String = this.GENERATED_START_WITH_ROOT_PATH +"\\node\\builtin\\GD"

    private val ACTION_GDNODE_START_WITH_PATH: String = this.GENERATED_START_WITH_ROOT_PATH +"\\node\\action\\GD"

    private val PACKAGE: String = "package org.allbinary.game.canvas.node."

    private val BUILT_IN: String = "BuiltIn"

    private val END2: String = "GDNodes.java"
public constructor ()
            : super()
        {
this.smallIntegerSingletonFactory!!.init()
}


                @Throws(Exception::class)
            
    open fun generateXMLAndGlobals(gameXmlAsString: String, finished: BooleanArray)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameXmlAsString = gameXmlAsString
    //var finished = finished

    var sharedBytes: SharedBytes = SharedBytes()


    var xmlStringArray0: Array<String?> = arrayOf(gameXmlAsString,gameXmlAsString,gameXmlAsString,gameXmlAsString,gameXmlAsString,gameXmlAsString,gameXmlAsString)


    var xslPathInputArray0: Array<String?> = arrayOf(this.gdData!!.GD_NON_LAYOUT_AS_XML,this.gdData!!.GD_GLOBALS_ANIMATION,this.gdData!!.GD_GLOBALS,this.gdData!!.GD_GLOBALS_GD_OBJECTS_FACTORY,this.gdData!!.GD_GLOBALS_GD_RESOURCES,this.gdData!!.GD_EXTENSION_GD_NODES,this.gdData!!.GD_GLOBAL_GAME_THREED_LEVEL_LOADER)


    var START0: Array<String?> = arrayOf(this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.gdPaths!!.GEN_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD")


    var END0: Array<String?> = arrayOf("NonLayout.xml","GlobalsSpecialAnimation.java","GameGlobals.java","GlobalsGDObjectsFactory.java","GlobalsGDResources.java","ExtensionGDNodes.java","GlobalGameThreedLevelBuilder.java")


    var xslTotal0: Int = xslPathInputArray0!!.size
                


    var xslDocumentAsString0: Array<String?> = arrayOfNulls(xslTotal0)





                        for (index in 0 until xslTotal0)

        {
xslDocumentAsString0[index]= this.gdData!!.getAsString(xslPathInputArray0[index]!!, sharedBytes)
}





                        for (index2 in 0 until xslTotal0)

        {

    var currentIndex: Int = index2


    var runnable: Runnable = object: Runnable()
                                {
                                
    open fun run()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            generateXMLAndGlobalsAt(xmlStringArray0, xslPathInputArray0, START0, END0, xslDocumentAsString0, currentIndex, StringMaker())
finished[0]= true
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, commonStrings!!.RUN, e)
System.exit(1)
}

}

                                }
                            

Thread(runnable).
                            start()
}

}


                @Throws(Exception::class)
            
    open fun generateXMLAndGlobalsAt(xmlStringArray0: Array<String?>, xslPathInputArray0: Array<String?>, START0: Array<String?>, END0: Array<String?>, xslDocumentAsString0: Array<String?>, index2: Int, stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var xmlStringArray0 = xmlStringArray0
    //var xslPathInputArray0 = xslPathInputArray0
    //var START0 = START0
    //var END0 = END0
    //var xslDocumentAsString0 = xslDocumentAsString0
    //var index2 = index2
    //var stringMaker = stringMaker

    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(Integer.MAX_VALUE)

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(xslPathInputArray0[index2]!!)!!.toString(), this, this.commonStrings!!.PROCESS)

    var updatedXslDocumentAsString: String = xslDocumentAsString0[index2]!!


    var result: String = this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentAsString)), StreamSource(StringBufferInputStream(xmlStringArray0[index2]!!)))!!

stringMaker!!.delete(0, stringMaker!!.length())

    var fileName: String = 
                //Otherwise - initializer - AssignExpr

                                                
                                                    
                                                
                                                
                                                    
                                                    
                                                        
                                                        
                                                            
                                                            
                                                                
                                                            
                                                            
                                                                
                                                                    
                                                                        
                                                                    
                                                                    
                                                                        
                                                                    
                                                                
                                                            
                                                        
                                                        
                                                            
                                                                
                                                                    
                                                                
                                                                
                                                                    
                                                                
                                                            
                                                        
                                                    
                                                
                                            

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(fileName)!!.toString(), this, this.commonStrings!!.PROCESS)

    
                        if(index2 == 0)
                        
                                    {
                                    this.logUtil!!.putF(this.RESULT +result, this, this.commonStrings!!.PROCESS)
stringMaker!!.delete(0, stringMaker!!.length())

    var formattedXml: String = XmlDocumentHelper.getInstance()!!.format(stringMaker!!.append(this.GAME_START)!!.append(result)!!.append(this.GAME_END)!!.toString())!!


    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

formattedXml= replaceLT!!.all(formattedXml)
this.bufferedWriterUtil!!.overwrite(fileName, formattedXml)

                                    }
                                
                        else {
                            
    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

result= replaceLT!!.all(result)
this.bufferedWriterUtil!!.overwrite(fileName, result)

                        }
                            
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.appendint(index2)!!.append(this.commonSeps!!.SPACE)!!.append(xslPathInputArray0[index2]!!)!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString(), this, this.commonStrings!!.PROCESS)
}


                @Throws(Exception::class)
            
    open fun generateExternalLinkLayouts(startIndex: Int, size: Int, gameXmlAsString: String, layoutGameXmlAsString: String, gdGameInfo: GDGameInfo, stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var startIndex = startIndex
    //var size = size
    //var gameXmlAsString = gameXmlAsString
    //var layoutGameXmlAsString = layoutGameXmlAsString
    //var gdGameInfo = gdGameInfo
    //var stringMaker = stringMaker

    var sharedBytes: SharedBytes = SharedBytes()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(Integer.MAX_VALUE)


    var xmlStringArray: Array<String?> = arrayOf(layoutGameXmlAsString)


    var xslPathInputArray: Array<String?> = arrayOf(this.gdData!!.GD_EXTERNAL_LINK_LAYOUT_GD_NODE)


    var xslTotal: Int = xslPathInputArray!!.size
                


    var xslDocumentAsString: Array<String?> = arrayOfNulls(xslTotal)





                        for (index in 0 until xslTotal)

        {
xslDocumentAsString[index]= this.gdData!!.getAsString(xslPathInputArray[index]!!, sharedBytes)
}


    var START: Array<String?> = arrayOf(this.GENERATED_START_WITH_PATH)


    var MID: Array<String?> = arrayOf("Game")


    var END: Array<String?> = arrayOf("ExternalLinkLayoutGDNode.java")


    var indexAsString: String


    var index4AsString: String


    var externalLayoutTotalForSceneLayout: Int= 0





                        for (index in startIndex until size)

        {
externalLayoutTotalForSceneLayout= gdGameInfo!!.getExternalLayoutTotal(index)
indexAsString= index.toString()

    var replace: Replace = Replace(this.gdToolStrings!!.GD_CURRENT_LAYOUT_INDEX, indexAsString)





                        for (index2 in 0 until xslTotal)

        {




                        for (index4 in 0 until externalLayoutTotalForSceneLayout)

        {
index4AsString= index4.toString()

    var replace3: Replace = Replace(this.gdToolStrings!!.GD_EXTERNAL_LAYOUT_INDEX, index4AsString)

timeDelayHelper!!.setStartTimeTNT()
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(xslPathInputArray[index2]!!)!!.toString(), this, this.commonStrings!!.PROCESS)

    var updatedXslDocumentAsString: String = replace.all(xslDocumentAsString[index2]!!)!!

updatedXslDocumentAsString= replace3.all(updatedXslDocumentAsString)

    var result: String = this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentAsString)), StreamSource(StringBufferInputStream(xmlStringArray[index2]!!)))!!

stringMaker!!.delete(0, stringMaker!!.length())

    var fileName: String = stringMaker!!.append(START[index2]!!)!!.append(indexAsString)!!.append(MID[index2]!!)!!.appendint(index4)!!.append(END[index2]!!)!!.toString()!!

this.directory.create(AbFilePath(fileName))
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(fileName)!!.toString(), this, this.commonStrings!!.PROCESS)

    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

result= replaceLT!!.all(result)
this.bufferedWriterUtil!!.overwrite(fileName, result)
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.appendint(index)!!.append(this.commonSeps!!.COMMA)!!.appendint(index2)!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString(), this, this.commonStrings!!.PROCESS)
}

}

}

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.append("Finished")!!.toString(), this, this.commonStrings!!.PROCESS)
}


                @Throws(Exception::class)
            
    open fun generateExternalCreateInstances(startIndex: Int, size: Int, gameXmlAsString: String, layoutGameXmlAsString: String, gdGameInfo: GDGameInfo, stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var startIndex = startIndex
    //var size = size
    //var gameXmlAsString = gameXmlAsString
    //var layoutGameXmlAsString = layoutGameXmlAsString
    //var gdGameInfo = gdGameInfo
    //var stringMaker = stringMaker

    var sharedBytes: SharedBytes = SharedBytes()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(Integer.MAX_VALUE)


    var xmlStringArray: Array<String?> = arrayOf(layoutGameXmlAsString)


    var xslPathInputArray: Array<String?> = arrayOf(this.gdData!!.GD_EXTERNAL_CREATE_INSTANCE_GD_NODE)


    var xslTotal: Int = xslPathInputArray!!.size
                


    var xslDocumentAsString: Array<String?> = arrayOfNulls(xslTotal)





                        for (index in 0 until xslTotal)

        {
xslDocumentAsString[index]= this.gdData!!.getAsString(xslPathInputArray[index]!!, sharedBytes)
}


    var START: Array<String?> = arrayOf(this.GENERATED_START_WITH_PATH)


    var MID: Array<String?> = arrayOf("GameExternal")


    var END: Array<String?> = arrayOf("CreateInstance.java")


    var indexAsString: String


    var index4AsString: String


    var externalCreateInstanceTotal: Int= 0


    var externalLayoutTotalForSceneLayout: Int= 0


    var createInstanceIndexAsString: String





                        for (index in startIndex until size)

        {
externalLayoutTotalForSceneLayout= gdGameInfo!!.getExternalLayoutTotal(index)
indexAsString= index.toString()

    var replace: Replace = Replace(this.gdToolStrings!!.GD_CURRENT_LAYOUT_INDEX, indexAsString)





                        for (index2 in 0 until xslTotal)

        {




                        for (index4 in 0 until externalLayoutTotalForSceneLayout)

        {
externalCreateInstanceTotal= gdGameInfo!!.getExternalLayoutInstanceTotal(index4)
index4AsString= index4.toString()

    var replace3: Replace = Replace(this.gdToolStrings!!.GD_EXTERNAL_LAYOUT_INDEX, index4AsString)





                        for (index5 in 0 until externalCreateInstanceTotal)

        {
createInstanceIndexAsString= index5.toString()

    var replace4: Replace = Replace(this.gdToolStrings!!.GD_CREATE_INSTANCE_INDEX, createInstanceIndexAsString)

timeDelayHelper!!.setStartTimeTNT()
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(xslPathInputArray[index2]!!)!!.toString(), this, this.commonStrings!!.PROCESS)

    var updatedXslDocumentAsString: String = replace.all(xslDocumentAsString[index2]!!)!!

updatedXslDocumentAsString= replace3.all(updatedXslDocumentAsString)
updatedXslDocumentAsString= replace4.all(updatedXslDocumentAsString)

    var result: String = this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentAsString)), StreamSource(StringBufferInputStream(xmlStringArray[index2]!!)))!!

stringMaker!!.delete(0, stringMaker!!.length())

    var fileName: String = stringMaker!!.append(START[index2]!!)!!.append(indexAsString)!!.append(MID[index2]!!)!!.appendint(index5)!!.append(END[index2]!!)!!.toString()!!

this.directory.create(AbFilePath(fileName))
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(fileName)!!.toString(), this, this.commonStrings!!.PROCESS)

    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

result= replaceLT!!.all(result)
this.bufferedWriterUtil!!.overwrite(fileName, result)
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.appendint(index)!!.append(this.commonSeps!!.COMMA)!!.appendint(index2)!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString(), this, this.commonStrings!!.PROCESS)
}

}

}

}

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.append("Finished")!!.toString(), this, this.commonStrings!!.PROCESS)
}


                @Throws(Exception::class)
            
    open fun generateCreateInstances(startIndex: Int, size: Int, gameXmlAsString: String, layoutGameXmlAsString: String, gdGameInfo: GDGameInfo, stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var startIndex = startIndex
    //var size = size
    //var gameXmlAsString = gameXmlAsString
    //var layoutGameXmlAsString = layoutGameXmlAsString
    //var gdGameInfo = gdGameInfo
    //var stringMaker = stringMaker

    var sharedBytes: SharedBytes = SharedBytes()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(Integer.MAX_VALUE)


    var xmlStringArray: Array<String?> = arrayOf(layoutGameXmlAsString)


    var xslPathInputArray: Array<String?> = arrayOf(this.gdData!!.GD_CREATE_INSTANCE_GD_NODE)


    var xslTotal: Int = xslPathInputArray!!.size
                


    var xslDocumentAsString: Array<String?> = arrayOfNulls(xslTotal)





                        for (index in 0 until xslTotal)

        {
xslDocumentAsString[index]= this.gdData!!.getAsString(xslPathInputArray[index]!!, sharedBytes)
}


    var START: Array<String?> = arrayOf(this.GENERATED_START_WITH_PATH)


    var MID: Array<String?> = arrayOf("Game")


    var END: Array<String?> = arrayOf("CreateInstance.java")


    var indexAsString: String


    var createInstanceTotal: Int= 0


    var createInstanceIndexAsString: String





                        for (index in startIndex until size)

        {
createInstanceTotal= gdGameInfo!!.getLayoutInstanceTotal(index)
indexAsString= index.toString()

    var replace: Replace = Replace(this.gdToolStrings!!.GD_CURRENT_LAYOUT_INDEX, indexAsString)





                        for (index2 in 0 until xslTotal)

        {




                        for (index4 in 0 until createInstanceTotal)

        {
createInstanceIndexAsString= index4.toString()

    var replace3: Replace = Replace(this.gdToolStrings!!.GD_CREATE_INSTANCE_INDEX, createInstanceIndexAsString)

timeDelayHelper!!.setStartTimeTNT()
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(xslPathInputArray[index2]!!)!!.toString(), this, this.commonStrings!!.PROCESS)

    var updatedXslDocumentAsString: String = replace.all(xslDocumentAsString[index2]!!)!!

updatedXslDocumentAsString= replace3.all(updatedXslDocumentAsString)

    var result: String = this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentAsString)), StreamSource(StringBufferInputStream(xmlStringArray[index2]!!)))!!

stringMaker!!.delete(0, stringMaker!!.length())

    var fileName: String = stringMaker!!.append(START[index2]!!)!!.append(indexAsString)!!.append(MID[index2]!!)!!.appendint(index4)!!.append(END[index2]!!)!!.toString()!!

this.directory.create(AbFilePath(fileName))
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(fileName)!!.toString(), this, this.commonStrings!!.PROCESS)

    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

result= replaceLT!!.all(result)
this.bufferedWriterUtil!!.overwrite(fileName, result)
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.appendint(index)!!.append(this.commonSeps!!.COMMA)!!.appendint(index2)!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString(), this, this.commonStrings!!.PROCESS)
}

}

}

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.append("Finished")!!.toString(), this, this.commonStrings!!.PROCESS)
}


                @Throws(Exception::class)
            
    open fun generateLayouts(startIndex: Int, size: Int, gameXmlAsString: String, layoutGameXmlAsString: String, stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var startIndex = startIndex
    //var size = size
    //var gameXmlAsString = gameXmlAsString
    //var layoutGameXmlAsString = layoutGameXmlAsString
    //var stringMaker = stringMaker

    var sharedBytes: SharedBytes = SharedBytes()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(Integer.MAX_VALUE)


    var xmlStringArray: Array<String?> = arrayOf(layoutGameXmlAsString,layoutGameXmlAsString,layoutGameXmlAsString,layoutGameXmlAsString,layoutGameXmlAsString,layoutGameXmlAsString,layoutGameXmlAsString,layoutGameXmlAsString,layoutGameXmlAsString,layoutGameXmlAsString,layoutGameXmlAsString,layoutGameXmlAsString,layoutGameXmlAsString,layoutGameXmlAsString,gameXmlAsString,layoutGameXmlAsString,gameXmlAsString)


    var xslPathInputArray: Array<String?> = arrayOf(this.gdData!!.GD_LAYOUT_AS_XML,this.gdData!!.GD_LAYOUT,this.gdData!!.GD_LAYOUT_BUILDER,this.gdData!!.GD_LAYOUT_EXTERNAL_EVENT_GD_NODES,this.gdData!!.GD_LAYOUT_EXTERNAL_LAYOUT_GD_NODES,this.gdData!!.GD_LAYOUT_EXTERNAL_ACTION_GD_NODES,this.gdData!!.GD_LAYOUT_EXTERNAL_CONDITION_GD_NODES,this.gdData!!.GD_LAYOUT_EXTERNAL_OBJECT_EVENT_GD_NODES,this.gdData!!.GD_LAYOUT_EXTERNAL_OTHER_EVENT_GD_NODES,this.gdData!!.GD_LAYOUT_ACTION_GD_NODES,this.gdData!!.GD_LAYOUT_CONDITION_GD_NODES,this.gdData!!.GD_LAYOUT_OBJECT_EVENT_GD_NODES,this.gdData!!.GD_LAYOUT_OTHER_EVENT_GD_NODES,this.gdData!!.GD_LAYOUT_GD_RESOURCES,this.gdData!!.GD_LAYOUT_SCENE_AS_SPECIAL_ANIMATION_GLOBALS,this.gdData!!.GD_LAYOUT_GD_OBJECTS_FACTORY,this.gdData!!.GD_GAME_PLAYN_RESOURCES)


    var xslTotal: Int = xslPathInputArray!!.size
                


    var xslDocumentAsString: Array<String?> = arrayOfNulls(xslTotal)





                        for (index in 0 until xslTotal)

        {
xslDocumentAsString[index]= this.gdData!!.getAsString(xslPathInputArray[index]!!, sharedBytes)
}


    var START: Array<String?> = arrayOf(this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.GENERATED_START_WITH_PATH,this.gdPaths!!.GEN_PATH +"platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\res\\GD")


    var END: Array<String?> = arrayOf("SpecialAnimation.xml","SpecialAnimation.java","SpecialAnimationBuilder.java","SpecialAnimationExternalEventGDNodes.java","SpecialAnimationExternalLayoutGDNodes.java","SpecialAnimationExternalActionGDNodes.java","SpecialAnimationExternalConditionGDNodes.java","SpecialAnimationExternalObjectEventGDNodes.java","SpecialAnimationExternalOtherEventGDNodes.java","SpecialAnimationActionGDNodes.java","SpecialAnimationConditionGDNodes.java","SpecialAnimationObjectEventGDNodes.java","SpecialAnimationOtherEventGDNodes.java","SpecialAnimationGDResources.java","SpecialAnimationGlobals.java","GDObjectsFactory.java","GamePlaynResources.java")


    var indexAsString: String





                        for (index in startIndex until size)

        {
indexAsString= index.toString()

    var replace: Replace = Replace(this.gdToolStrings!!.GD_CURRENT_LAYOUT_INDEX, indexAsString)





                        for (index2 in 0 until xslTotal)

        {
timeDelayHelper!!.setStartTimeTNT()
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(xslPathInputArray[index2]!!)!!.toString(), this, this.commonStrings!!.PROCESS)

    var updatedXslDocumentAsString: String = replace.all(xslDocumentAsString[index2]!!)!!


    var result: String = this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentAsString)), StreamSource(StringBufferInputStream(xmlStringArray[index2]!!)))!!

stringMaker!!.delete(0, stringMaker!!.length())

    var fileName: String = stringMaker!!.append(START[index2]!!)!!.append(indexAsString)!!.append(END[index2]!!)!!.toString()!!

this.directory.create(AbFilePath(fileName))
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(fileName)!!.toString(), this, this.commonStrings!!.PROCESS)

    
                        if(index2 == 0)
                        
                                    {
                                    stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.RESULT)!!.append(result)!!.toString(), this, this.commonStrings!!.PROCESS)
stringMaker!!.delete(0, stringMaker!!.length())

    var formattedXml: String = XmlDocumentHelper.getInstance()!!.format(stringMaker!!.append(this.GAME_START)!!.append(result)!!.append(this.GAME_END)!!.toString())!!


    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

formattedXml= replaceLT!!.all(formattedXml)
this.bufferedWriterUtil!!.overwrite(fileName, formattedXml)

                                    }
                                
                        else {
                            
    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

result= replaceLT!!.all(result)
this.bufferedWriterUtil!!.overwrite(fileName, result)

                        }
                            
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.appendint(index)!!.append(this.commonSeps!!.COMMA)!!.appendint(index2)!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString(), this, this.commonStrings!!.PROCESS)
}

}

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.append("Finished")!!.toString(), this, this.commonStrings!!.PROCESS)
}


    open fun getIndexAsString(list: BasicArrayList, fileIndex: Int)
        //nullable = true from not(false or (false and false)) = true
: String{
var list = list
var fileIndex = fileIndex

    var primitiveLongSingleton: PrimitiveLongSingleton = PrimitiveLongSingleton.getInstance()!!


    var charIndex: Int = 0


    var size: Int = list.size()!!


    var stringMaker: StringMaker = StringMaker()


    var indexAsString: String





                        for (index3 in 0 until size)

        {
indexAsString= list.get(index3) as String

    
                        if(fileIndex == 0)
                        
                                    {
                                    charIndex= 0

        while(charIndex <= 4)
        {

    
                        if(indexAsString[indexAsString!!.length -1] == primitiveLongSingleton!!.NUMBER_CHAR_ARRAY[charIndex])
                        
                                    {
                                    stringMaker!!.append(this.commonSeps!!.COMMA)!!.append(indexAsString)!!.append(this.commonSeps!!.COMMA)
break;

                    

                                    }
                                
charIndex++
}


                                    }
                                
                        else {
                            charIndex= 5

        while(charIndex < primitiveLongSingleton!!.NUMBER_CHAR_ARRAY.length)
        {

    
                        if(indexAsString[indexAsString!!.length -1] == primitiveLongSingleton!!.NUMBER_CHAR_ARRAY[charIndex])
                        
                                    {
                                    stringMaker!!.append(this.commonSeps!!.COMMA)!!.append(indexAsString)!!.append(this.commonSeps!!.COMMA)
break;

                    

                                    }
                                
charIndex++
}


                        }
                            
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringMaker!!.toString()
}


                @Throws(Exception::class)
            
    open fun getBuiltInGDNodeListAsString(gameXmlAsString: String, layoutIndex: Int, sharedBytes: SharedBytes)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var gameXmlAsString = gameXmlAsString
    //var layoutIndex = layoutIndex
    //var sharedBytes = sharedBytes

    var replace: Replace = Replace(this.gdToolStrings!!.GD_CURRENT_LAYOUT_INDEX, this.smallIntegerSingletonFactory!!.getString(layoutIndex))


    var xmlStringArray: Array<String?> = arrayOf(gameXmlAsString)


    var gdNodeXSLPathInputArray: Array<String?> = arrayOf(this.gdData!!.GD_OTHER_EVENT_GD_NODE_ID_LIST)


    var xslTotal: Int = gdNodeXSLPathInputArray!!.size
                


    var xslDocumentAsString: Array<String?> = arrayOfNulls(xslTotal)


    var updatedXslDocumentAsString: String = 
                null
            





                        for (index in 0 until xslTotal)

        {
xslDocumentAsString[index]= this.gdData!!.getAsString(gdNodeXSLPathInputArray[index]!!, sharedBytes)
updatedXslDocumentAsString= replace.all(xslDocumentAsString[index]!!)
}


    var result: String = this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentAsString)), StreamSource(StringBufferInputStream(xmlStringArray[0]!!)))!!


    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

result= replaceLT!!.all(result)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return result
}


                @Throws(Exception::class)
            
    open fun getBuiltInGDNodeList(gameXmlAsString: String, layoutIndex: Int, sharedBytes: SharedBytes)
        //nullable = true from not(false or (false and false)) = true
: BasicArrayList{
    //var gameXmlAsString = gameXmlAsString
    //var layoutIndex = layoutIndex
    //var sharedBytes = sharedBytes

    var nodeListAsString: String = this.getBuiltInGDNodeListAsString(gameXmlAsString, layoutIndex, sharedBytes)!!


    var tokenizer: Tokenizer = Tokenizer(this.commonSeps!!.SPACE)




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return tokenizer.getTokensFromString(nodeListAsString, BasicArrayListD())
}


                @Throws(Exception::class)
            
    open fun generateBuiltInGDNodes(gameXmlAsString: String, layoutGameXmlAsString2: String, layoutTotal: Int, stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameXmlAsString = gameXmlAsString
    //var layoutGameXmlAsString2 = layoutGameXmlAsString2
    //var layoutTotal = layoutTotal
    //var stringMaker = stringMaker

    var sharedBytes: SharedBytes = SharedBytes()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(Integer.MAX_VALUE)





                        for (layoutIndex in 0 until layoutTotal)

        {

    var list: BasicArrayList = this.getBuiltInGDNodeList(gameXmlAsString, layoutIndex, sharedBytes)!!


    var xmlStringArray: Array<String?> = arrayOf(layoutGameXmlAsString2)


    var gdNodeXSLPathInputArray: Array<String?> = arrayOf(this.gdData!!.GD_OTHER_EVENT_GD_NODES)


    var END: Array<String?> = arrayOf(this.END2)


    var xslTotal: Int = gdNodeXSLPathInputArray!!.size
                


    var xslDocumentAsString: Array<String?> = arrayOfNulls(xslTotal)





                        for (index in 0 until xslTotal)

        {
xslDocumentAsString[index]= this.gdData!!.getAsString(gdNodeXSLPathInputArray[index]!!, sharedBytes)
}


    var START: Array<String?> = arrayOf(this.BUILTIN_GDNODE_START_WITH_PATH)


    var MIDDLE: Array<String?> = arrayOf(this.BUILT_IN)


    var indexAsString: String





                        for (fileIndex in 0 until 2)

        {
indexAsString= this.getIndexAsString(list, fileIndex)

    
                        if(indexAsString!!.isEmpty())
                        
                                    {
                                    stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append("skipping indexAsString:")!!.append(indexAsString)!!.toString(), this, this.commonStrings!!.PROCESS)


                        continue
                    

                                    }
                                

    var replace: Replace = Replace(this.gdToolStrings!!.GD_NODE_IDS, indexAsString)


    var replace2: Replace = Replace(this.gdToolStrings!!.GD_CURRENT_LAYOUT_INDEX, this.smallIntegerSingletonFactory!!.getString(layoutIndex))





                        for (index2 in 0 until xslTotal)

        {
timeDelayHelper!!.setStartTimeTNT()

    var updatedXslDocumentAsString: String = replace.all(xslDocumentAsString[index2]!!)!!

updatedXslDocumentAsString= replace2.all(updatedXslDocumentAsString)

    var result: String = this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentAsString)), StreamSource(StringBufferInputStream(xmlStringArray[index2]!!)))!!


    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

result= replaceLT!!.all(result)
stringMaker!!.delete(0, stringMaker!!.length())

    var fileName: String = stringMaker!!.append(START[index2]!!)!!.appendint(layoutIndex)!!.append(MIDDLE[index2]!!)!!.appendint(fileIndex)!!.append(END[index2]!!)!!.toString()!!


    
                        if(result.indexOf(this.PACKAGE) < 0)
                        
                                    {
                                    stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append("No GDNode: ")!!.append(this.gdToolStrings!!.FILENAME)!!.append(fileName)!!.toString(), this, this.commonStrings!!.PROCESS)


                        continue
                    

                                    }
                                
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(gdNodeXSLPathInputArray[index2]!!)!!.toString(), this, this.commonStrings!!.PROCESS)
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(fileName)!!.toString(), this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(fileName, result)
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.appendint(fileIndex)!!.append(this.commonSeps!!.COMMA)!!.appendint(index2)!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString(), this, this.commonStrings!!.PROCESS)
}

}

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.append("Finished")!!.toString(), this, this.commonStrings!!.PROCESS)
}

}


                @Throws(Exception::class)
            
    open fun getActionGDNodeListAsString(gameXmlAsString: String, layoutIndex: Int, sharedBytes: SharedBytes)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var gameXmlAsString = gameXmlAsString
    //var layoutIndex = layoutIndex
    //var sharedBytes = sharedBytes

    var replace: Replace = Replace(this.gdToolStrings!!.GD_CURRENT_LAYOUT_INDEX, this.smallIntegerSingletonFactory!!.getString(layoutIndex))


    var xmlStringArray: Array<String?> = arrayOf(gameXmlAsString)


    var gdNodeXSLPathInputArray: Array<String?> = arrayOf(this.gdData!!.GD_ACTION_GD_NODE_ID_LIST)


    var xslTotal: Int = gdNodeXSLPathInputArray!!.size
                


    var xslDocumentAsString: Array<String?> = arrayOfNulls(xslTotal)


    var updatedXslDocumentAsString: String = 
                null
            





                        for (index in 0 until xslTotal)

        {
xslDocumentAsString[index]= this.gdData!!.getAsString(gdNodeXSLPathInputArray[index]!!, sharedBytes)
updatedXslDocumentAsString= replace.all(xslDocumentAsString[index]!!)
}


    var result: String = this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentAsString)), StreamSource(StringBufferInputStream(xmlStringArray[0]!!)))!!


    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

result= replaceLT!!.all(result)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return result
}


                @Throws(Exception::class)
            
    open fun getActionGDNodeList(gameXmlAsString: String, layoutIndex: Int, sharedBytes: SharedBytes)
        //nullable = true from not(false or (false and false)) = true
: BasicArrayList{
    //var gameXmlAsString = gameXmlAsString
    //var layoutIndex = layoutIndex
    //var sharedBytes = sharedBytes

    var nodeListAsString: String = this.getActionGDNodeListAsString(gameXmlAsString, layoutIndex, sharedBytes)!!


    var tokenizer: Tokenizer = Tokenizer(this.commonSeps!!.SPACE)




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return tokenizer.getTokensFromString(nodeListAsString, BasicArrayListD())
}


                @Throws(Exception::class)
            
    open fun generateActionGDNodes(gameXmlAsString: String, layoutGameXmlAsString2: String, layoutTotal: Int, stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var gameXmlAsString = gameXmlAsString
    //var layoutGameXmlAsString2 = layoutGameXmlAsString2
    //var layoutTotal = layoutTotal
    //var stringMaker = stringMaker

    var sharedBytes: SharedBytes = SharedBytes()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(Integer.MAX_VALUE)





                        for (layoutIndex in 0 until layoutTotal)

        {

    var list: BasicArrayList = this.getActionGDNodeList(gameXmlAsString, layoutIndex, sharedBytes)!!

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.appendint(layoutIndex)!!.append(" action list:")!!.appendint(list.size())!!.toString(), this, this.commonStrings!!.PROCESS)

    var xmlStringArray: Array<String?> = arrayOf(layoutGameXmlAsString2,layoutGameXmlAsString2)


    var gdNodeXSLPathInputArray: Array<String?> = arrayOf(this.gdData!!.GD_LAYOUT_N_EXTERNAL_ACTION_GD_NODES,this.gdData!!.GD_LAYOUT_N_ACTION_GD_NODES)


    var END2: String = "GDNodes.java"


    var END: Array<String?> = arrayOf(END2,END2)


    var xslTotal: Int = gdNodeXSLPathInputArray!!.size
                


    var xslDocumentAsString: Array<String?> = arrayOfNulls(xslTotal)





                        for (index in 0 until xslTotal)

        {
xslDocumentAsString[index]= this.gdData!!.getAsString(gdNodeXSLPathInputArray[index]!!, sharedBytes)
}


    var START: Array<String?> = arrayOf(this.ACTION_GDNODE_START_WITH_PATH,this.ACTION_GDNODE_START_WITH_PATH)


    var MIDDLE: Array<String?> = arrayOf("ExternalAction","Action")


    var indexAsString: String





                        for (fileIndex in 0 until 2)

        {
indexAsString= this.getIndexAsString(list, fileIndex)

    
                        if(indexAsString!!.isEmpty())
                        
                                    {
                                    stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append("skipping indexAsString:")!!.append(indexAsString)!!.toString(), this, this.commonStrings!!.PROCESS)


                        continue
                    

                                    }
                                

    var replace: Replace = Replace(this.gdToolStrings!!.GD_NODE_IDS, indexAsString)


    var replace2: Replace = Replace(this.gdToolStrings!!.GD_CURRENT_LAYOUT_INDEX, this.smallIntegerSingletonFactory!!.getString(layoutIndex))





                        for (index2 in 0 until xslTotal)

        {
timeDelayHelper!!.setStartTimeTNT()

    var updatedXslDocumentAsString: String = replace.all(xslDocumentAsString[index2]!!)!!

updatedXslDocumentAsString= replace2.all(updatedXslDocumentAsString)

    var result: String = this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentAsString)), StreamSource(StringBufferInputStream(xmlStringArray[index2]!!)))!!


    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

result= replaceLT!!.all(result)
stringMaker!!.delete(0, stringMaker!!.length())

    var fileName: String = stringMaker!!.append(START[index2]!!)!!.appendint(layoutIndex)!!.append(MIDDLE[index2]!!)!!.appendint(fileIndex)!!.append(END[index2]!!)!!.toString()!!


    
                        if(result.indexOf(this.PACKAGE) < 0)
                        
                                    {
                                    stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append("No GDNode: ")!!.append(this.gdToolStrings!!.FILENAME)!!.append(fileName)!!.toString(), this, this.commonStrings!!.PROCESS)


                        continue
                    

                                    }
                                
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(gdNodeXSLPathInputArray[index2]!!)!!.toString(), this, this.commonStrings!!.PROCESS)
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(fileName)!!.toString(), this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(fileName, result)
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.appendint(fileIndex)!!.append(this.commonSeps!!.COMMA)!!.appendint(index2)!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString(), this, this.commonStrings!!.PROCESS)
}

}

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.append("Finished")!!.toString(), this, this.commonStrings!!.PROCESS)
}

}


                @Throws(Exception::class)
            
    open fun generateResourcesLoadersSetup(startIndex: Int, size: Int, gameXmlAsString: String, stringMaker: StringMaker)
        //nullable = true from not(false or (false and false)) = true
{
    //var startIndex = startIndex
    //var size = size
    //var gameXmlAsString = gameXmlAsString
    //var stringMaker = stringMaker

    var sharedBytes: SharedBytes = SharedBytes()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(Integer.MAX_VALUE)


    var xslPathInputArray2: Array<String?> = arrayOf(this.gdData!!.GD_ANDROID_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_LAZY_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_HTML_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_LAZY_HTML_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_LAZY_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_OPENGL_TWO_D_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_OPENGL_TWO_D_LAZY_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_OPENGL_TWO_D_ANDROID_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_OPENGL_THREED_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_GLOBAL_RESOURCES,this.gdData!!.GD_THREED_GLOBAL_RESOURCES,this.gdData!!.GD_GLOBAL_IMAGE_RESOURCES,this.gdData!!.GD_THREED_GLOBAL_IMAGE_RESOURCES,this.gdData!!.GD_GAME_MUSIC_FACTORY,this.gdData!!.GD_ANDROID_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_LAZY_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_HTML_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_LAZY_HTML_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_LAZY_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_OPENGL_TWO_D_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_OPENGL_TWO_D_LAZY_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_OPENGL_TWO_D_ANDROID_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_OPENGL_THREED_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_ANDROID_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_J2SE_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_LAZY_J2SE_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_HTML_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_LAZY_HTML_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_LAZY_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_OPENGL_THREED_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,this.gdData!!.GD_GAME_SOUNDS_FACTORY,this.gdData!!.GD_LAYOUT_RESOURCES,this.gdData!!.GD_THREED_LAYOUT_RESOURCES,this.gdData!!.GD_LAYOUT_IMAGE_RESOURCES,this.gdData!!.GD_THREED_LAYOUT_IMAGE_RESOURCES,this.gdData!!.GD_LAYOUT_TOUCH_IMAGE_RESOURCES,this.gdData!!.GD_THREED_LAYOUT_TOUCH_IMAGE_RESOURCES,this.gdData!!.GD_LAYOUT_GAME_THREED_LEVEL_LOADER,this.gdData!!.GD_GAME_CAMERA_SETUP,this.gdData!!.GD_LAYOUT_UTIL)


    var OUTPUT_FILE_PATHS: Array<String?> = arrayOf(this.gdPaths!!.GEN_PATH +"resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",this.gdPaths!!.GEN_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",this.gdPaths!!.GEN_PATH +"GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",this.gdPaths!!.GEN_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",this.gdPaths!!.GEN_PATH +"GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",this.gdPaths!!.GEN_PATH +"GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GD",this.gdPaths!!.GEN_PATH +"GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",this.gdPaths!!.GEN_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",this.gdPaths!!.GEN_PATH +"GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",this.gdPaths!!.GEN_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",this.gdPaths!!.GEN_PATH +"GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",this.gdPaths!!.GEN_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",this.gdPaths!!.GEN_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",this.gdPaths!!.GEN_PATH +"GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\graphics\\threed\\min3d\\GD",this.gdPaths!!.GEN_PATH +"resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD")


    var OUTPUT_FILE_PATH_END_ARRAY: Array<String?> = arrayOf("GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GlobalSpecialAnimationResources.java","GlobalSpecialAnimationResources.java","GlobalSpecialAnimationImageResources.java","GlobalSpecialAnimationImageResources.java","GameMusicFactory.java","GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java","GameSoundsFactory.java","SpecialAnimationResources.java","SpecialAnimationResources.java","SpecialAnimationImageResources.java","SpecialAnimationImageResources.java","SpecialAnimationTouchImageResources.java","SpecialAnimationTouchImageResources.java","GameThreedLevelBuilder.java","GameCameraSetup.java","LayoutUtil.java")


    var xslTotal2: Int = OUTPUT_FILE_PATHS.size
                


    var xslDocumentAsString2: Array<String?> = arrayOfNulls(xslTotal2)





                        for (index in 0 until xslTotal2)

        {
xslDocumentAsString2[index]= this.gdData!!.getAsString(xslPathInputArray2[index]!!, sharedBytes)
}


    var indexAsString: String





                        for (index in startIndex until size)

        {
timeDelayHelper!!.setStartTimeTNT()
indexAsString= index.toString()

    var replace: Replace = Replace(this.gdToolStrings!!.GD_CURRENT_LAYOUT_INDEX, indexAsString)





                        for (index2 in 0 until xslTotal2)

        {

    var updatedXslDocumentStr: String = replace.all(xslDocumentAsString2[index2]!!)!!


    var result: String = this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentStr)), StreamSource(StringBufferInputStream(gameXmlAsString)))!!


    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

result= replaceLT!!.all(result)
stringMaker!!.delete(0, stringMaker!!.length())

    var outputFilePath: String = stringMaker!!.append(OUTPUT_FILE_PATHS[index2]!!)!!.appendint(index)!!.append(OUTPUT_FILE_PATH_END_ARRAY[index2]!!)!!.toString()!!


    
                        if(index2 < 15)
                        
                                    {
                                    stringMaker!!.delete(0, stringMaker!!.length())
outputFilePath= stringMaker!!.append(OUTPUT_FILE_PATHS[index2]!!)!!.append(OUTPUT_FILE_PATH_END_ARRAY[index2]!!)!!.toString()

                                    }
                                
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append(this.gdToolStrings!!.FILENAME)!!.append(outputFilePath)!!.toString(), this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(outputFilePath, result)
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.appendint(index)!!.append(this.commonSeps!!.COMMA)!!.appendint(index2)!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString(), this, this.commonStrings!!.PROCESS)
}

}

}


    open fun process(startIndex: Int, gdGameInfo: GDGameInfo, finished: BooleanArray)
        //nullable = true from not(false or (false and false)) = true
{
    //var startIndex = startIndex
    //var gdGameInfo = gdGameInfo
    //var finished = finished

        try {
            
    var layoutTotal: Int = gdGameInfo!!.layoutTotal


    var sharedBytes: SharedBytes = SharedBytes()


    var stringMaker: StringMaker = StringMaker()


    var gameXmlAsString: String = this.gdData!!.getAsString(this.gdPaths!!.GAME_XML_PATH, sharedBytes)!!


    var replace2: Replace = Replace(".Width()", ".Width(null)")

gameXmlAsString= replace2.all(gameXmlAsString)

    var replace3: Replace = Replace(".Height()", ".Height(null)")

gameXmlAsString= replace3.all(gameXmlAsString)

    var replace4: Replace = Replace("GlobalVariable(", "GlobalVariable(gameGlobals.")

gameXmlAsString= replace4.all(gameXmlAsString)

    var replace5: Replace = Replace("GlobalVariableString(", "GlobalVariableString(gameGlobals.")

gameXmlAsString= replace5.all(gameXmlAsString)

    var replace6: Replace = Replace("GlobalVariableChildCount(", "GlobalVariableChildCount(gameGlobals.")

gameXmlAsString= replace6.all(gameXmlAsString)

    var replace9: Replace = Replace("Time(&quot;timestamp&quot;)", "gameTickTimeDelayHelper.startTime")

gameXmlAsString= replace9.all(gameXmlAsString)

    var replace10: Replace = Replace("GlobalVarToJSON(", "GlobalVarToJSON(gameGlobals.")

gameXmlAsString= replace10.all(gameXmlAsString)

    var replace11: Replace = Replace("Text::Value()", "Text()")

gameXmlAsString= replace11.all(gameXmlAsString)

    var replace1: Replace = Replace("FileSystem::", "FileSystem.")

gameXmlAsString= replace1.all(gameXmlAsString)

    var replaceRevert: Replace = Replace("FileSystem.ReadDirectory", "FileSystem::ReadDirectory")

gameXmlAsString= replaceRevert!!.all(gameXmlAsString)

    var replaceHTTP: Replace = Replace("AdvancedHTTP::ResponseStatusText", "AdvancedHTTP.ResponseStatusText")

gameXmlAsString= replaceHTTP!!.all(gameXmlAsString)

    var replaceText: Replace = Replace(".Text()", "GDGameLayer.Text()")

gameXmlAsString= replaceText!!.all(gameXmlAsString)

    var layoutGameXmlAsString: String = gameXmlAsString.toCharArray().concatToString()


    var VARIABLE_ARRAY: Array<String?> = arrayOf("ToJSON(","Variable(","VariableString(","VariableChildCount(")


    var GLOBALS: String = "globals."


    var size2: Int = VARIABLE_ARRAY.size
                





                        for (index2 in 0 until size2)

        {

    var VARIABLE: String = VARIABLE_ARRAY[index2]!!





                        for (index in 0 downTo 0)

        {
index= layoutGameXmlAsString!!.indexOf(VARIABLE, index +VARIABLE.length)

    
                        if(Character.isDigit(layoutGameXmlAsString[index +VARIABLE.length]))
                        
                                    {
                                    
                                    }
                                
                             else 
    
                        if(index >= 1 && layoutGameXmlAsString[index -1] == '.')
                        
                                    {
                                    
                                    }
                                
                             else 
    
                        if(layoutGameXmlAsString[index +VARIABLE.length] == 'g')
                        
                                    {
                                    
                                    }
                                
                        else {
                            stringMaker!!.delete(0, stringMaker!!.length())
layoutGameXmlAsString= stringMaker!!.append(layoutGameXmlAsString!!.substring(0, index +VARIABLE.length))!!.append(GLOBALS)!!.append(layoutGameXmlAsString!!.substring(index +VARIABLE.length))!!.toString()

                        }
                            
}

}


    var replace7: Replace = Replace("PointX(&quot;", "PointX(&quot;globals.")

layoutGameXmlAsString= replace7.all(layoutGameXmlAsString)

    var replace8: Replace = Replace("PointY(&quot;", "PointY(&quot;globals.")

layoutGameXmlAsString= replace8.all(layoutGameXmlAsString)

    var replace12: Replace = Replace("MouseX(&quot;&quot;", "MouseX(EMPTY_STRING")

layoutGameXmlAsString= replace12.all(layoutGameXmlAsString)

    var replace13: Replace = Replace("MouseY(&quot;&quot;", "MouseY(EMPTY_STRING")

layoutGameXmlAsString= replace13.all(layoutGameXmlAsString)

    var replace14: Replace = Replace("CameraX(&quot;&quot;", "CameraX(EMPTY_STRING")

layoutGameXmlAsString= replace14.all(layoutGameXmlAsString)

    var replace15: Replace = Replace("CameraY(&quot;&quot;", "CameraY(EMPTY_STRING")

layoutGameXmlAsString= replace15.all(layoutGameXmlAsString)

    var replace16: Replace = Replace("CameraWidth(&quot;&quot;", "CameraWidth(EMPTY_STRING")

layoutGameXmlAsString= replace16.all(layoutGameXmlAsString)

    var replace17: Replace = Replace("\"value\": \" V\"", "\"value\": \" &#8595;\"")

layoutGameXmlAsString= replace17.all(layoutGameXmlAsString)

    var replace18: Replace = Replace("\"value\": \"V \"", "\"value\": \"&#8595; \"")

layoutGameXmlAsString= replace18.all(layoutGameXmlAsString)

    var gameXmlAsString2: String = gameXmlAsString


    var layoutGameXmlAsString2: String = layoutGameXmlAsString


    var runnable: Runnable = object: Runnable()
                                {
                                
    open fun run()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            
    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(0)

generateXMLAndGlobals(gameXmlAsString2, finished)
System.out.println(StringMaker().
                            append("generateXMLAndGlobals (Takes a long time and has little output) ElapsedTime: ")!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString())
finished[1]= true
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, commonStrings!!.RUN, e)
System.exit(1)
}

}

                                }
                            


    var ELAPSED_TIME: String = "ElapsedTime: "


    var CURRENT_STATE_ELAPSED_TIME: String = "Current State ElapsedTime: "

Thread(runnable).
                            start()

    var runnable2a: Runnable = object: Runnable()
                                {
                                
    open fun run()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            
    var stringMaker: StringMaker = StringMaker()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(0)

generateLayouts(startIndex, layoutTotal, gameXmlAsString2, layoutGameXmlAsString2, stringMaker)
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append("generateLayouts ")!!.append(ELAPSED_TIME)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString())
finished[2]= true
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append(CURRENT_STATE_ELAPSED_TIME)!!.append(BooleanUtil.getInstance()!!.toStringFromBooleanArray(finished))!!.toString())
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, commonStrings!!.RUN, e)
System.exit(1)
}

}

                                }
                            

Thread(runnable2a).
                            start()

    var runnable2b: Runnable = object: Runnable()
                                {
                                
    open fun run()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            
    var stringMaker: StringMaker = StringMaker()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(0)

generateCreateInstances(startIndex, layoutTotal, gameXmlAsString2, layoutGameXmlAsString2, gdGameInfo, StringMaker())
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append("generateCreateInstances ")!!.append(ELAPSED_TIME)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString())
finished[3]= true
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append(CURRENT_STATE_ELAPSED_TIME)!!.append(BooleanUtil.getInstance()!!.toStringFromBooleanArray(finished))!!.toString())
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, commonStrings!!.RUN, e)
System.exit(1)
}

}

                                }
                            

Thread(runnable2b).
                            start()

    var runnable2c: Runnable = object: Runnable()
                                {
                                
    open fun run()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            
    var stringMaker: StringMaker = StringMaker()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(0)

generateExternalLinkLayouts(startIndex, layoutTotal, gameXmlAsString2, layoutGameXmlAsString2, gdGameInfo, StringMaker())
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append("generateExternalLinkLayouts ")!!.append(ELAPSED_TIME)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString())
finished[4]= true
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append(CURRENT_STATE_ELAPSED_TIME)!!.append(BooleanUtil.getInstance()!!.toStringFromBooleanArray(finished))!!.toString())
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, commonStrings!!.RUN, e)
System.exit(1)
}

}

                                }
                            

Thread(runnable2c).
                            start()

    var runnable2d: Runnable = object: Runnable()
                                {
                                
    open fun run()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            
    var stringMaker: StringMaker = StringMaker()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(0)

generateExternalCreateInstances(startIndex, layoutTotal, gameXmlAsString2, layoutGameXmlAsString2, gdGameInfo, StringMaker())
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append("generateExternalCreateInstances ")!!.append(ELAPSED_TIME)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString())
finished[5]= true
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append(CURRENT_STATE_ELAPSED_TIME)!!.append(BooleanUtil.getInstance()!!.toStringFromBooleanArray(finished))!!.toString())
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, commonStrings!!.RUN, e)
System.exit(1)
}

}

                                }
                            

Thread(runnable2d).
                            start()

    var runnable3: Runnable = object: Runnable()
                                {
                                
    open fun run()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            
    var stringMaker: StringMaker = StringMaker()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(0)

generateActionGDNodes(gameXmlAsString2, layoutGameXmlAsString2, layoutTotal, StringMaker())
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append("generateActionGDNodes ")!!.append(ELAPSED_TIME)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString())
finished[6]= true
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append(CURRENT_STATE_ELAPSED_TIME)!!.append(BooleanUtil.getInstance()!!.toStringFromBooleanArray(finished))!!.toString())
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, commonStrings!!.RUN, e)
System.exit(1)
}

}

                                }
                            

Thread(runnable3).
                            start()

    var runnable4: Runnable = object: Runnable()
                                {
                                
    open fun run()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            
    var stringMaker: StringMaker = StringMaker()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(0)

generateBuiltInGDNodes(gameXmlAsString2, layoutGameXmlAsString2, layoutTotal, StringMaker())
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append("generateBuiltInGDNodes ")!!.append(ELAPSED_TIME)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString())
finished[7]= true
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append(CURRENT_STATE_ELAPSED_TIME)!!.append(BooleanUtil.getInstance()!!.toStringFromBooleanArray(finished))!!.toString())
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, commonStrings!!.RUN, e)
System.exit(1)
}

}

                                }
                            

Thread(runnable4).
                            start()

    var runnable5: Runnable = object: Runnable()
                                {
                                
    open fun run()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            
    var stringMaker: StringMaker = StringMaker()


    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(0)

generateResourcesLoadersSetup(startIndex, layoutTotal, gameXmlAsString2, StringMaker())
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append("generateResourcesLoadersSetup ")!!.append(ELAPSED_TIME)!!.appendlong(timeDelayHelper!!.getElapsedTNT())!!.toString())
finished[8]= true
stringMaker!!.delete(0, stringMaker!!.length())
System.out.println(stringMaker!!.append(CURRENT_STATE_ELAPSED_TIME)!!.append(BooleanUtil.getInstance()!!.toStringFromBooleanArray(finished))!!.toString())
} catch(e: Exception)
            {
logUtil!!.put(commonStrings!!.EXCEPTION, this, commonStrings!!.RUN, e)
System.exit(1)
}

}

                                }
                            

Thread(runnable5).
                            start()
} catch(e: Exception)
            {
this.logUtil!!.put("Is the game xml formatted when it is not we get an error from: gglobals.dVersion", this, this.commonStrings!!.PROCESS, e)
}

}


}
                
            

