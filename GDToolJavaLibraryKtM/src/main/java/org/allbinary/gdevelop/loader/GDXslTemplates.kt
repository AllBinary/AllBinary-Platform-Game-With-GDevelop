
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2026 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        import java.lang.Math
        
        import java.lang.Runtime
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import java.io.ByteArrayOutputStream
import java.io.StringBufferInputStream
import java.util.Hashtable
import java.util.concurrent.Callable
import java.util.concurrent.ExecutionException
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors
import java.util.concurrent.Future
import javax.xml.transform.Templates
import javax.xml.transform.Transformer
import javax.xml.transform.stream.StreamResult
import javax.xml.transform.stream.StreamSource
import org.allbinary.data.tree.dom.BasicUriResolver
import org.allbinary.data.tree.dom.XslHelper
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.regex.replace.Replace
import org.allbinary.string.CommonStrings

open public class GDXslTemplates
            : Object
         {
        
companion object {
            
    private val instance: GDXslTemplates = GDXslTemplates()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDXslTemplates{

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance
}


        }
            
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val xslHelper: XslHelper = XslHelper.getInstance()!!

    private val gdXslTemplatesCache: GDXslTemplatesCache = GDXslTemplatesCache.getInstance()!!

    private val PLACEHOLDER_ARRAY: Array<String?> = arrayOf(this.gdToolStrings!!.GD_CURRENT_LAYOUT_INDEX,this.gdToolStrings!!.GD_EXTERNAL_LAYOUT_INDEX,this.gdToolStrings!!.GD_CREATE_INSTANCE_INDEX,this.gdToolStrings!!.GD_NODE_IDS)

    private val NUMBER_ARRAY: BooleanArray = 
                                //Otherwise - values - BooleanLiteralExpr

                                //Otherwise - values - BooleanLiteralExpr

                                //Otherwise - values - BooleanLiteralExpr

                                //Otherwise - values - BooleanLiteralExpr


    private val XSL_PREFIX: String = "xsl:"

    private val XSL_TEXT_START: String = "<xsl:text"

    private val XSL_TEXT_END: String = "</xsl:text>"

    private val XSL_TEXT_START_TAG: String = "<xsl:text>"

    private val COMMENT_START: String = "<!--"

    private val COMMENT_END: String = "-->"

    private val CDATA_START: String = "<![CDATA["

    private val CDATA_END: String = "]]>"

    private val STYLESHEET_END_ARRAY: Array<String?> = arrayOf("</xsl:stylesheet>","</xsl:transform>")

    private val TEST: String = "test"

    private val SELECT: String = "select"

    private val VALUE_OF_START: String = "<xsl:value-of select=\"$"

    private val VALUE_OF_END: String = "\" />"

    private val NUMBER_START: String = "number($"

    private val NUMBER_END: String = ")"

    private val VARIABLE: String = "$"

    private val PARAM_START: String = "<xsl:param name=\""

    private val PARAM_END: String = "\" />"

    private val COMPILED: String = "Compiled once: "

    private val NOT_PARAMETERIZED: String = "Placeholder can not be an xsl:param so the xsl is compiled for each value: "

    private val xslPathToTemplatesHolderHashtable: Hashtable<Any, Any> = Hashtable<Any, Any>()
private constructor ()
            : super()
        {
}


open public inner class TemplatesHolder
            : Object
         {
        
/*Static stuff is not allowed for Kotlin inner classescompanion object {
            *//*
        }
            */


            //Auto Generated
            public constructor() : super()
            {
            }            
        
    private var xslDocumentAsString: String

    private var templates: Templates

}
                
            
                @Throws(Exception::class)
            
    open fun translate(xslPath: String, xslDocumentAsString: String, placeholderArray: Array<String?>, valueArray: Array<String?>, xmlDocumentAsString: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var xslPath = xslPath
    //var xslDocumentAsString = xslDocumentAsString
    //var placeholderArray = placeholderArray
    //var valueArray = valueArray
    //var xmlDocumentAsString = xmlDocumentAsString

    var templates: Templates = this.getTemplates(xslPath, xslDocumentAsString)!!


    
                        if(templates == 
                                    null
                                )
                        
                                    {
                                    
    var updatedXslDocumentAsString: String = xslDocumentAsString


    var size: Int = placeholderArray!!.size
                





                        for (index in 0 until size)

        {
updatedXslDocumentAsString= Replace(placeholderArray[index]!!, valueArray[index]!!).
                            all(updatedXslDocumentAsString)!!
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.xslHelper!!.translate(BasicUriResolver(), StreamSource(StringBufferInputStream(updatedXslDocumentAsString)), StreamSource(StringBufferInputStream(xmlDocumentAsString)))

                                    }
                                

    var transformer: Transformer = templates.newTransformer()!!


    var size: Int = placeholderArray!!.size
                





                        for (index in 0 until size)

        {
transformer.setParameter(this.getParameterName(placeholderArray[index]!!), valueArray[index]!!)
}


    var outputStream: ByteArrayOutputStream = ByteArrayOutputStream()

transformer.transform(StreamSource(StringBufferInputStream(xmlDocumentAsString)), StreamResult(outputStream))

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return outputStream!!.toString()
}


                @Throws(Exception::class)
            
    open fun translate(xslPath: String, xslDocumentAsString: String, placeholder: String, value: String, xmlDocumentAsString: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var xslPath = xslPath
    //var xslDocumentAsString = xslDocumentAsString
    //var placeholder = placeholder
    //var value = value
    //var xmlDocumentAsString = xmlDocumentAsString

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.translate(xslPath, xslDocumentAsString, arrayOf(placeholder), arrayOf(value), xmlDocumentAsString)
}


                @Throws(Exception::class)
            
    open fun translate(xslPath: String, xslDocumentAsString: String, xmlDocumentAsString: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var xslPath = xslPath
    //var xslDocumentAsString = xslDocumentAsString
    //var xmlDocumentAsString = xmlDocumentAsString

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.translate(xslPath, xslDocumentAsString, arrayOfNulls(0), arrayOfNulls(0), xmlDocumentAsString)
}


                @Throws(Exception::class)
            
    open fun compile(xslPathArray: Array<String?>, xslDocumentAsStringArray: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var xslPathArray = xslPathArray
    //var xslDocumentAsStringArray = xslDocumentAsStringArray

    var size: Int = xslPathArray!!.size
                


    var executorService: ExecutorService = Executors.newFixedThreadPool(Math.min(size, Runtime.getRuntime()!!.availableProcessors()))!!


        try {
            
    var futureArray: Array<Future?> = arrayOfNulls(size)





                        for (index in 0 until size)

        {

    var xslPath: String = xslPathArray[index]!!


    var xslDocumentAsString: String = xslDocumentAsStringArray[index]!!

futureArray[index]= executorService!!.submit(object: Callable()
                                {
                                
                                
                @Throws(Exception::class)
            
    open override fun call()
        //nullable = true from not(false or (false and true)) = true
: Any{

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return getTemplates(xslPath, xslDocumentAsString)
}

                                }
                            )!!
}





                        for (index in 0 until size)

        {

        try {
            futureArray[index]!!.get()
} catch(e: ExecutionException)
            {



                            throw e.cause as Exception
}

}


         finally {
            executorService!!.shutdown()

         }
        
}


                @Throws(Exception::class)
            
    open fun getTemplates(xslPath: String, xslDocumentAsString: String)
        //nullable = true from not(false or (false and false)) = true
: Templates{
    //var xslPath = xslPath
    //var xslDocumentAsString = xslDocumentAsString

    var templatesHolder: TemplatesHolder


        
        //TWB - This is not allowed for Kotlin native. Instead use Coroutine logic instead.
        synchronized(this.xslPathToTemplatesHolderHashtable) 

        //mutex.withLock
        {
templatesHolder= this.xslPathToTemplatesHolderHashtable!!.get(xslPath as Object) as TemplatesHolder

    
                        if(templatesHolder == 
                                    null
                                )
                        
                                    {
                                    templatesHolder= TemplatesHolder()
this.xslPathToTemplatesHolderHashtable!!.put(xslPath, templatesHolder)

                                    }
                                
}


        
        //TWB - This is not allowed for Kotlin native. Instead use Coroutine logic instead.
        synchronized(templatesHolder) 

        //mutex.withLock
        {

    
                        if(!xslDocumentAsString!!.equals(templatesHolder!!.xslDocumentAsString))
                        
                                    {
                                    
    var parameterizedXslDocumentAsString: String = this.getParameterized(xslDocumentAsString)!!


    
                        if(parameterizedXslDocumentAsString == 
                                    null
                                )
                        
                                    {
                                    this.logUtil!!.putF(StringMaker().
                            append(this.NOT_PARAMETERIZED)!!.append(xslPath)!!.toString(), this, this.commonStrings!!.PROCESS)
templatesHolder!!.templates= 
                                        null
                                    

                                    }
                                
                        else {
                            
        try {
            templatesHolder!!.templates= this.gdXslTemplatesCache!!.newTemplates(parameterizedXslDocumentAsString)
this.logUtil!!.putF(StringMaker().
                            append(this.COMPILED)!!.append(xslPath)!!.toString(), this, this.commonStrings!!.PROCESS)
} catch(e: Exception)
            {
this.logUtil!!.put(StringMaker().
                            append(this.NOT_PARAMETERIZED)!!.append(xslPath)!!.toString(), this, this.commonStrings!!.PROCESS, e)
templatesHolder!!.templates= 
                                        null
                                    
}


                        }
                            
templatesHolder!!.xslDocumentAsString= xslDocumentAsString

                                    }
                                

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return templatesHolder!!.templates
}

}


    open fun getParameterName(placeholder: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var placeholder = placeholder

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return placeholder.substring(1, placeholder.length -1)
}


    open fun getPlaceholderIndex(xslDocumentAsString: String, index: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var xslDocumentAsString = xslDocumentAsString
    //var index = index

    var size: Int = this.PLACEHOLDER_ARRAY.size
                





                        for (placeholderIndex in 0 until size)

        {

    
                        if(xslDocumentAsString!!.startsWith(this.PLACEHOLDER_ARRAY[placeholderIndex]!!, index))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return placeholderIndex

                                    }
                                
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return  -1
}


    open fun getParameterized(xslDocumentAsString: String)
        //nullable = true from not(false or (false and false)) = true
: String?{
    //var xslDocumentAsString = xslDocumentAsString

    var maskedCharArray: CharArray = xslDocumentAsString!!.toCharArray()!!


    var length: Int = maskedCharArray!!.size
                


    var placeholderTotal: Int = this.PLACEHOLDER_ARRAY.size
                


    var usedArray: BooleanArray = BooleanArray(placeholderTotal)


    var found: Boolean = false





                        for (index in xslDocumentAsString!!.indexOf('<')!! && index < length)

        {

    var placeholderIndex: Int = this.getPlaceholderIndex(xslDocumentAsString, index)


    
                        if(placeholderIndex >= 0)
                        
                                    {
                                    maskedCharArray[index]= ' '
maskedCharArray[index +this.PLACEHOLDER_ARRAY[placeholderIndex]!!.length() -1]= ' '
usedArray[placeholderIndex]= true
found= true

                                    }
                                
}


    
                        if(!found)
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return xslDocumentAsString

                                    }
                                

    var masked: String = maskedCharArray.concatToString()


    var stringBuilder: StringBuilder = StringBuilder(length +1024)


    var copiedIndex: Int = 0





                        for (index in xslDocumentAsString!!.indexOf('<')!! downTo 0)

        {

    var placeholderIndex: Int = this.getPlaceholderIndex(xslDocumentAsString, index)


    
                        if(placeholderIndex < 0)
                        
                                    {
                                    index++


                        continue
                    

                                    }
                                

    var placeholder: String = this.PLACEHOLDER_ARRAY[placeholderIndex]!!


    var parameterName: String = this.getParameterName(placeholder)!!


    var endIndex: Int = index +placeholder.length

stringBuilder!!.append(xslDocumentAsString, copiedIndex, index)
copiedIndex= endIndex

    
                        if(this.isInside(masked, this.COMMENT_START, this.COMMENT_END, index))
                        
                                    {
                                    stringBuilder!!.append(parameterName)

                                    }
                                
                             else 
    
                        if(this.isInside(masked, this.CDATA_START, this.CDATA_END, index))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null

                                    }
                                
                             else 
    
                        if(masked.lastIndexOf('<', index) > masked.lastIndexOf('>', index))
                        
                                    {
                                    
    var tagIndex: Int = masked.lastIndexOf('<', index)


    var attributeName: String = this.getAttributeName(masked, tagIndex, index)!!


    
                        if(!masked.startsWith(this.XSL_PREFIX, tagIndex +1) || attributeName == 
                                    null
                                 || (!attributeName!!.equals(this.TEST) && !attributeName!!.equals(this.SELECT)))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null

                                    }
                                

    
                        if(this.NUMBER_ARRAY[placeholderIndex])
                        
                                    {
                                    stringBuilder!!.append(this.NUMBER_START)!!.append(parameterName)!!.append(this.NUMBER_END)

                                    }
                                
                        else {
                            stringBuilder!!.append(this.VARIABLE)!!.append(parameterName)

                        }
                            

                                    }
                                
                        else {
                            
    
                        if(this.isInside(masked, this.XSL_TEXT_START, this.XSL_TEXT_END, index))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null

                                    }
                                

    var textStartIndex: Int = masked.lastIndexOf('>', index) +1


    var previousEndIndex: Int = this.getPreviousPlaceholderEnd(xslDocumentAsString, textStartIndex, index)


    var beforeStartIndex: Int = if(previousEndIndex > textStartIndex) {
                            
                            previousEndIndex
                        
                            } else {
                            textStartIndex
                            }
    


    
                        if(this.isWhitespace(xslDocumentAsString, beforeStartIndex, index))
                        
                                    {
                                    stringBuilder!!.setLength(stringBuilder!!.length() -(index -beforeStartIndex))
stringBuilder!!.append(this.XSL_TEXT_START_TAG)!!.append(xslDocumentAsString, beforeStartIndex, index)!!.append(this.XSL_TEXT_END)

                                    }
                                
stringBuilder!!.append(this.VALUE_OF_START)!!.append(parameterName)!!.append(this.VALUE_OF_END)

    var afterEndIndex: Int = xslDocumentAsString!!.indexOf('<', endIndex)


    
                        if(afterEndIndex < 0)
                        
                                    {
                                    afterEndIndex= length

                                    }
                                

    
                        if(this.getPlaceholderIndex(xslDocumentAsString, afterEndIndex) < 0 && this.isWhitespace(xslDocumentAsString, endIndex, afterEndIndex))
                        
                                    {
                                    stringBuilder!!.append(this.XSL_TEXT_START_TAG)!!.append(xslDocumentAsString, endIndex, afterEndIndex)!!.append(this.XSL_TEXT_END)
copiedIndex= afterEndIndex

                                    }
                                

                        }
                            
index= endIndex
}

stringBuilder!!.append(xslDocumentAsString, copiedIndex, length)

    var stylesheetEndIndex: Int =  -1


    var size: Int = this.STYLESHEET_END_ARRAY.size
                





                        for (index in 0 until size)

        {

    var endIndex: Int = stringBuilder!!.lastIndexOf(this.STYLESHEET_END_ARRAY[index]!!)


    
                        if(endIndex > stylesheetEndIndex)
                        
                                    {
                                    stylesheetEndIndex= endIndex

                                    }
                                
}


    
                        if(stylesheetEndIndex < 0)
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null

                                    }
                                

    var paramStringBuilder: StringBuilder = StringBuilder()





                        for (index in 0 until placeholderTotal)

        {

    
                        if(usedArray[index])
                        
                                    {
                                    paramStringBuilder!!.append(this.PARAM_START)!!.append(this.getParameterName(this.PLACEHOLDER_ARRAY[index]!!))!!.append(this.PARAM_END)

                                    }
                                
}

stringBuilder!!.insert(stylesheetEndIndex, paramStringBuilder)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuilder!!.toString()
}


    open fun isInside(masked: String, start: String, end: String, index: Int)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var masked = masked
    //var start = start
    //var end = end
    //var index = index

    var startIndex: Int = masked.lastIndexOf(start, index)


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return startIndex >= 0 && startIndex > masked.lastIndexOf(end, index)
}


    open fun isWhitespace(text: String, startIndex: Int, endIndex: Int)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var text = text
    //var startIndex = startIndex
    //var endIndex = endIndex

    
                        if(startIndex >= endIndex)
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                                    }
                                

    var c: Char





                        for (index in startIndex until endIndex)

        {
c= text[index]

    
                        if(c != ' ' && c != '\t' && c != '\r' && c != '\n')
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                                    }
                                
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true
}


    open fun getPreviousPlaceholderEnd(xslDocumentAsString: String, startIndex: Int, index: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var xslDocumentAsString = xslDocumentAsString
    //var startIndex = startIndex
    //var index = index

    var endIndex: Int =  -1





                        for (previousIndex in xslDocumentAsString!!.indexOf('<', startIndex)!! && previousIndex < index)

        {

    var placeholderIndex: Int = this.getPlaceholderIndex(xslDocumentAsString, previousIndex)


    
                        if(placeholderIndex >= 0)
                        
                                    {
                                    endIndex= previousIndex +this.PLACEHOLDER_ARRAY[placeholderIndex]!!.length()

                                    }
                                
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return endIndex
}


    open fun getAttributeName(masked: String, tagIndex: Int, index: Int)
        //nullable = true from not(false or (false and false)) = true
: String?{
    //var masked = masked
    //var tagIndex = tagIndex
    //var index = index

    var position: Int = tagIndex +1


        while(position < index && !Character.isWhitespace(masked[position]))
        {
position++
}


        while(position < index)
        {

        while(position < index && Character.isWhitespace(masked[position]))
        {
position++
}


    var nameStartIndex: Int = position


        while(position < index && masked[position] != '=' && !Character.isWhitespace(masked[position]))
        {
position++
}


    var name: String = masked.substring(nameStartIndex, position)!!


        while(position < index && Character.isWhitespace(masked[position]))
        {
position++
}


    
                        if(position >= index || masked[position] != '=')
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null

                                    }
                                
position++

        while(position < index && Character.isWhitespace(masked[position]))
        {
position++
}


    
                        if(position >= index)
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null

                                    }
                                

    var quote: Char = masked[position]


    
                        if(quote != '"' && quote != '\'')
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null

                                    }
                                

    var valueEndIndex: Int = masked.indexOf(quote, position +1)


    
                        if(valueEndIndex < 0 || valueEndIndex > index)
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return name

                                    }
                                
position= valueEndIndex +1
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null
}


}
                
            

