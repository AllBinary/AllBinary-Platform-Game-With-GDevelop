
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
import org.allbinary.data.tree.dom.document.XmlDocumentHelper
import org.allbinary.gdevelop.json.GDProject
import org.allbinary.gdevelop.json.GDProjectStrings
import org.allbinary.logic.io.StreamUtil
import org.allbinary.logic.io.file.AbFile
import org.allbinary.logic.io.file.FileWrapperUtil
import org.allbinary.logic.io.file.directory.DirectoryOrIncludeFileExtensionBooleanFileVisitor
import org.allbinary.logic.io.file.filter.VisitorFileFilter
import org.allbinary.string.CommonStrings
import org.allbinary.logic.string.regex.replace.Replace
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.string.CommonSeps
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD
import org.json.JSONObject
import org.json.JSONTokener
import org.json.XML

open public class GDTestLoadAll
            : Object
         {
        
companion object {
            
                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
GDPaths.init()
GDTestLoadAll().
                            process()
}


        }
            
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!
public constructor ()
            : super()
        {
}


                @Throws(Exception::class)
            
    open fun process()
        //nullable = true from not(false or (false and true)) = true
{

    var commonStrings: CommonStrings = CommonStrings.getInstance()!!


    var streamUtil: StreamUtil = StreamUtil.getInstance()!!


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!

sharedBytes!!.outputStream!!.reset()

    var stringMaker: StringMaker = StringMaker()


    var includeExtension: String = "json"


    var includeExtensionBasicArrayList: BasicArrayList = BasicArrayListD()

includeExtensionBasicArrayList!!.add(includeExtension)

    var visitorFileFilter: VisitorFileFilter = VisitorFileFilter(DirectoryOrIncludeFileExtensionBooleanFileVisitor(includeExtensionBasicArrayList))


    var files: Array<AbFile?> = FileWrapperUtil.wrapFiles(AbFile.createAbFileFromRawPath(this.gdPaths!!.ROOT_PATH)!!.listFilesFileFilter(visitorFileFilter))!!


    var size: Int = files.size
                


    var jsonFileName: String = this.gdPaths!!.GAME_JSON_PATH


    var abFile: AbFile


    var SINGLE_QUOTE_END: String = "'"


    var GIT: String = ".git"





                        for (index in 0 until size)

        {
abFile= (files[index]!! as AbFile)
jsonFileName= abFile!!.getAbsolutePath()

    
                        if(!abFile!!.isDirectory() && jsonFileName!!.indexOf(GIT) < 0)
                        
                                    {
                                    this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +jsonFileName, this, commonStrings!!.PROCESS)

    var inputStream: FileInputStream = FileInputStream(jsonFileName)

sharedBytes!!.outputStream!!.reset()

    var gameAsConfiguration: String = streamUtil!!.getByteArray.toCharArray()


    var jsonTokener: JSONTokener = JSONTokener(gameAsConfiguration)


    var gameAsConfigurationJSONObject: JSONObject = jsonTokener!!.nextValue() as JSONObject

stringMaker!!.delete(0, stringMaker!!.length())

    var xml: String = stringMaker!!.append("<game>")!!.append(XML.toString(gameAsConfigurationJSONObject))!!.append("<variables><value>movement_angle</value><value>angle</value></variables></game>\n")!!.toString()!!


    var formattedXml: String = XmlDocumentHelper.getInstance()!!.format(xml)!!


    var replace: Replace = Replace(CommonSeps.getInstance()!!.QUOTE, "&quot;")


    var replace2: Replace = Replace(SINGLE_QUOTE_END, "&apos;")


    var fixQuotes: String = replace.all(formattedXml)!!

fixQuotes= replace2.all(fixQuotes)

    
                        if(gameAsConfigurationJSONObject!!.has(GDProjectStrings.getInstance()!!.TYPE) && gameAsConfigurationJSONObject!!.getString(GDProjectStrings.getInstance()!!.TYPE)!!.compareTo("map") == 0)
                        
                                    {
                                    this.logUtil!!.put("Was a map and not a game", this, commonStrings!!.PROCESS, Exception())
break;

                    

                                    }
                                

    var gdProject: GDProject = GDProject()

gdProject!!.load(gameAsConfigurationJSONObject)

                                    }
                                
}

}


}
                
            

