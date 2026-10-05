
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
import org.allbinary.logic.string.StringUtil
import org.allbinary.time.TimeDelayHelper
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDLayoutsToAllBinaryGenerator
            : Object
         {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    private val camelCaseUtil: CamelCaseUtil = CamelCaseUtil.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val gdData: GDData = GDData.getInstance()!!

    private val timeDelayHelper: TimeDelayHelper = TimeDelayHelper(Integer.MAX_VALUE)

    private val stringMaker: StringMaker = StringMaker()

    private val xslHelper: XslHelper = XslHelper.getInstance()!!

    private val xslPath: String

    private val start: String

    private val end: String
public constructor (xslPath: String, start: String, end: String)
            : super()
        {
    //var xslPath = xslPath
    //var start = start
    //var end = end
this.xslPath= xslPath
this.start= start
this.end= end
}


    private var nameList: BasicArrayList = BasicArrayListD()

                @Throws(Exception::class)
            
    open fun loadLayout(layout: GDLayout, index: Int, size: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var layout = layout
    //var index = index
    //var size = size

    var name: String = this.camelCaseUtil!!.getAsCamelCase(layout.name, this.stringMaker)!!

this.stringMaker!!.delete(0, this.stringMaker!!.length())
this.nameList!!.add(name)
}


                @Throws(Exception::class)
            
    open fun process()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            this.timeDelayHelper!!.setStartTimeTNT()

    var RESULT: String = "result: "


    var gdPaths: GDPaths = GDPaths.getInstance()!!


    var stringUtil: StringUtil = StringUtil.getInstance()!!


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!


    var xmlDocumentStr: String = this.gdData!!.getAsString(gdPaths!!.GAME_XML_PATH, sharedBytes)!!


    var xslPath: String = this.xslPath


    var xslDocumentStr: String = this.gdData!!.getAsString(xslPath, sharedBytes)!!


    var START: String = gdPaths!!.GEN_PATH +this.start


    var END: String = this.end


    var size: Int = this.nameList!!.size()!!





                        for (index in 0 until size)

        {

    var replace: Replace = Replace(this.gdToolStrings!!.GD_CURRENT_LAYOUT_INDEX, index.toString())


    var updatedXslDocumentStr: String = replace.all(xslDocumentStr)!!


    var result: String = this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentStr)), StreamSource(StringBufferInputStream(xmlDocumentStr)))!!


    var replaceLT: Replace = Replace(this.gdToolStrings!!.LESS_THAN_ESCAPE_CODE, this.gdToolStrings!!.LESS_THAN)

result= replaceLT!!.all(result)
stringMaker!!.delete(0, stringMaker!!.length())

    var fileName: String = stringMaker!!.append(START)!!.append(stringUtil!!.toString(this.nameList!!.get(index)))!!.append(END)!!.toString()!!

this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +fileName, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(fileName, result)
this.logUtil!!.putF(RESULT +result, this, this.commonStrings!!.PROCESS)
}

} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION, this, this.commonStrings!!.PROCESS, e)



                            throw e
}

this.stringMaker!!.delete(0, this.stringMaker!!.length())
this.logUtil!!.putF(this.stringMaker!!.append(CommonLabels.getInstance()!!.ELAPSED)!!.appendlong(this.timeDelayHelper!!.getElapsedTNT())!!.toString(), this, this.commonStrings!!.PROCESS)
}


}
                
            

