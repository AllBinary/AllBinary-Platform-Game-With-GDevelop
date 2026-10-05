
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
import org.allbinary.data.tree.dom.BasicUriResolver
import org.allbinary.data.tree.dom.XslHelper
import org.allbinary.data.tree.dom.document.DomDocumentHelper
import org.allbinary.logic.string.tokens.Tokenizer
import org.allbinary.string.CommonSeps
import org.allbinary.string.CommonStrings
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker

open public class GDGenerateGDGameInfo
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
GDGenerateGDGameInfo().
                            process()
}


        }
            
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val commonSeps: CommonSeps = CommonSeps.getInstance()!!

    private val xslHelper: XslHelper = XslHelper.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdData: GDData = GDData.getInstance()!!
public constructor ()
            : super()
        {
}


    open fun process()
        //nullable = true from not(false or (false and true)) = true
: GDGameInfo{

        try {
            
    var gdGameInfo: GDGameInfo = GDGameInfo()


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!


    var stringMaker: StringMaker = StringMaker()


    var gameXmlAsString: String = this.gdData!!.getAsString(this.gdPaths!!.GAME_XML_PATH, sharedBytes)!!


    var xslAsString: String = this.gdData!!.getAsString(this.gdData!!.GD_GAME_INFO, sharedBytes)!!


    var result: String = this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(xslAsString)), StreamSource(StringBufferInputStream(gameXmlAsString)))!!


    var resultPartList: BasicArrayList = Tokenizer(this.commonSeps!!.SPACE).
                            getTokensFromString(result, BasicArrayListD())!!

gdGameInfo!!.layoutTotal= Integer.parseInt(resultPartList!!.get(0) as String)

    var externalLayoutsTotalAsStringList: BasicArrayList = Tokenizer(this.commonSeps!!.COMMA).
                            getTokensFromString(resultPartList!!.get(1) as String, BasicArrayListD())!!





                        for (index in 0 until externalLayoutsTotalAsStringList!!.size()!!)

        {
gdGameInfo!!.externalLayoutsTotalPerLayoutPositionList!!.add(.parseInt())
}


    var externalLayoutsIndexGroupAsStringList: BasicArrayList = Tokenizer(this.commonSeps!!.SEMICOLON).
                            getTokensFromString(resultPartList!!.get(2) as String, BasicArrayListD())!!


    var externalLayoutsIndexAsStringList: BasicArrayList


    var externalLayoutIndexList: BasicArrayList





                        for (index in 0 until externalLayoutsIndexGroupAsStringList!!.size()!!)

        {
externalLayoutIndexList= BasicArrayListD()
externalLayoutsIndexAsStringList= Tokenizer(this.commonSeps!!.COMMA).
                            getTokensFromString(externalLayoutsIndexGroupAsStringList!!.get(index) as String, BasicArrayListD())




                        for (indexListIndex in 0 until externalLayoutsIndexAsStringList!!.size()!!)

        {
externalLayoutIndexList!!.add(.parseInt())
}

gdGameInfo!!.externalLayoutsIndexPerLayoutPositionList!!.add(externalLayoutIndexList)
}


    var instanceTotalPerLayoutAsStringList: BasicArrayList = Tokenizer(this.commonSeps!!.COMMA).
                            getTokensFromString(resultPartList!!.get(3) as String, BasicArrayListD())!!





                        for (index in 0 until instanceTotalPerLayoutAsStringList!!.size()!!)

        {
gdGameInfo!!.instanceTotalPerLayoutPositionList!!.add(.parseInt())
}


    var instanceTotalPerExternalLayoutAsStringList: BasicArrayList = Tokenizer(this.commonSeps!!.COMMA).
                            getTokensFromString(resultPartList!!.get(4) as String, BasicArrayListD())!!





                        for (index in 0 until instanceTotalPerExternalLayoutAsStringList!!.size()!!)

        {
gdGameInfo!!.instanceTotalPerExternalLayoutPositionList!!.add(.parseInt())
}

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append("result: ")!!.append(result)!!.toString(), this, this.commonStrings!!.PROCESS)
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append("gdGameInfo: ")!!.append(gdGameInfo!!.toString())!!.toString(), this, this.commonStrings!!.PROCESS)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return gdGameInfo
} catch(e: Exception)
            {
this.logUtil!!.put("Is the game xml formatted when it is not we get an error from: gglobals.dVersion", this, this.commonStrings!!.PROCESS, e)
}




                            throw RuntimeException()
}


}
                
            

