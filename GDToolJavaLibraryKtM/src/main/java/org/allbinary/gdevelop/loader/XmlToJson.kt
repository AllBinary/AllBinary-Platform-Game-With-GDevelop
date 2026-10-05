
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        import java.lang.System
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.json.JSONObject
import org.json.XML
import java.nio.file.Files
import java.nio.file.Paths
import org.allbinary.logic.io.BufferedWriterUtil
import org.allbinary.logic.io.file.AbFile
import org.allbinary.logic.io.file.directory.Directory
import org.allbinary.logic.string.StringMaker
import org.allbinary.util.BasicArrayList

open public class XmlToJson
            : Object
         {
        
companion object {
            
    private val instance: XmlToJson = XmlToJson()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: XmlToJson{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance
}


                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args

    var svgPath: String = "G:\\mnt\\bc\\mydev\\abgdgames2\\action\\SnakeGame\\assets\\"


    var gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

XmlToJson.getInstance()!!.processAll(svgPath, gdToolStrings!!._SVG)
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    private val directory: Directory = Directory.getInstance()!!

    val bufferedWriterUtil: BufferedWriterUtil = BufferedWriterUtil.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

                @Throws(Exception::class)
            
    open fun processAll(path: String, extension: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var path = path
    //var extension = extension

    var list: BasicArrayList = this.directory.search(extension, AbFile.createAbFile(path), true)!!


    var size: Int = list.size()!!

System.out.println(StringMaker().
                            append("total ")!!.append(extension)!!.append(": ")!!.appendint(size)!!.toString())

    var abFile: AbFile





                        for (index in 0 until size)

        {
abFile= list.get(index) as AbFile
this.process(abFile!!.getAbsolutePath(), extension)
}

}


    open fun process(xmlFilePath: String, extension: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var xmlFilePath = xmlFilePath
    //var extension = extension

        try {
            
    var svgContent: String = Files.readAllBytes.toCharArray()


    var jsonObject: JSONObject = XML.toJSONObject(svgContent)!!


    var jsonString: String = jsonObject!!.toString(4)!!


    var jsonFilePath: String = xmlFilePath!!.replace(extension, gdToolStrings!!._JSON)!!

this.bufferedWriterUtil!!.overwrite(jsonFilePath, jsonString)
} catch(e: Exception)
            {
e.printStackTrace()
}

}


}
                
            

