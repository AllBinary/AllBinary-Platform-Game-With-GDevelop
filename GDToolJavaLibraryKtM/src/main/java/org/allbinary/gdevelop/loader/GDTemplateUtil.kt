
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2026 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import java.io.File
import java.io.FileInputStream
import java.io.StringReader
import java.util.Hashtable
import javax.xml.transform.Source
import javax.xml.transform.Templates
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.Transformer
import javax.xml.transform.TransformerFactory
import javax.xml.transform.sax.SAXResult
import javax.xml.transform.stream.StreamSource
import org.xml.sax.helpers.DefaultHandler
import org.allbinary.logic.io.StreamUtil
import org.allbinary.logic.string.regex.replace.Replace

open public class GDTemplateUtil
            : Object
         {
        
companion object {
            
    private val instance: GDTemplateUtil = GDTemplateUtil()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDTemplateUtil{

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance
}


        }
            
    private val XSL_EXTENSION: String = ".xsl"

    private val EMPTY_DOCUMENT: String = "<template/>"

    private val templatesHashtable: Hashtable<Any, Any> = Hashtable<Any, Any>()
private constructor ()
            : super()
        {
}


                @Throws(Exception::class)
            
    open fun process(templatePath: String, keyArray: Array<String?>, parameterNameArray: Array<String?>, valueArray: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var templatePath = templatePath
    //var keyArray = keyArray
    //var parameterNameArray = parameterNameArray
    //var valueArray = valueArray

    
                        if(templatePath!!.endsWith(this.XSL_EXTENSION))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.transform(templatePath, StreamSource(StringReader(this.EMPTY_DOCUMENT)), parameterNameArray, valueArray)

                                    }
                                

    var streamUtil: StreamUtil = StreamUtil.getInstance()!!


    var sharedBytes: SharedBytes = SharedBytes.getInstance()!!

sharedBytes!!.outputStream!!.reset()

    var fileInputStream: FileInputStream = FileInputStream(templatePath)


    var result: String = streamUtil!!.getByteArray.toCharArray()


    var size: Int = keyArray!!.size
                





                        for (index in 0 until size)

        {
result= Replace(keyArray[index]!!, valueArray[index]!!).
                            all(result)!!
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return result
}


                @Throws(Exception::class)
            
    open fun process(templatePath: String, key: String, parameterName: String, value: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var templatePath = templatePath
    //var key = key
    //var parameterName = parameterName
    //var value = value

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.process(templatePath, arrayOf(key), arrayOf(parameterName), arrayOf(value))
}


                @Throws(Exception::class)
            
    open fun process(templatePath: String, templateData: GDTemplateData, parameterNameArray: Array<String?>, valueArray: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var templatePath = templatePath
    //var templateData = templateData
    //var parameterNameArray = parameterNameArray
    //var valueArray = valueArray

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.transform(templatePath, DOMSource(templateData!!.getDocument()), parameterNameArray, valueArray)
}


                @Throws(Exception::class)
            
    open fun process(templatePath: String, templateData: GDTemplateData)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var templatePath = templatePath
    //var templateData = templateData

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.process(templatePath, templateData, arrayOfNulls(0), arrayOfNulls(0))
}


                @Throws(Exception::class)
            
    open fun transform(templatePath: String, source: Source, parameterNameArray: Array<String?>, valueArray: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var templatePath = templatePath
    //var source = source
    //var parameterNameArray = parameterNameArray
    //var valueArray = valueArray

    var transformer: Transformer = this.getTemplates(templatePath)!!.newTransformer()!!


    var size: Int = parameterNameArray!!.size
                





                        for (index in 0 until size)

        {
transformer.setParameter(parameterNameArray[index]!!, valueArray[index]!!)
}


    var stringBuilder: StringBuilder = StringBuilder()


    var textHandler: DefaultHandler = object: DefaultHandler()
                                {
                                
                                
    override fun characters(charArray: CharArray, start: Int, length: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var charArray = charArray
    //var start = start
    //var length = length
stringBuilder!!.append(charArray, start, length)
}

    override fun ignorableWhitespace(charArray: CharArray, start: Int, length: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var charArray = charArray
    //var start = start
    //var length = length
stringBuilder!!.append(charArray, start, length)
}

                                }
                            

transformer.transform(source, SAXResult(textHandler))

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuilder!!.toString()
}


                @Throws(Exception::class)
            @Synchronized //TWB - This is not allowed for Kotlin native. Instead use Coroutine logic instead.

    open fun getTemplates(templatePath: String)
        //nullable = true from not(false or (false and false)) = true
: Templates{
    //var templatePath = templatePath

    var templates: Templates = this.templatesHashtable!!.get(templatePath as Object) as Templates


    
                        if(templates == 
                                    null
                                )
                        
                                    {
                                    templates= TransformerFactory.newInstance()!!.newTemplates(StreamSource(File(templatePath)))!!
this.templatesHashtable!!.put(templatePath, templates)

                                    }
                                

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return templates
}


}
                
            

