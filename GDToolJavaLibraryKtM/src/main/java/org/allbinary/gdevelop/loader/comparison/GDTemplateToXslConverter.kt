
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2026 AllBinary 
                *  
                *  By agreeing to this license you and any business entity you represent are 
                *  legally bound to the AllBinary Open License Version 1 legal agreement. 
                *  
                *  You may obtain the AllBinary Open License Version 1 legal agreement from 
                *  AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
                *  
                *  Created By: Travis Berthelot   
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader.comparison




        import java.lang.Object        
        
        import java.lang.System
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import java.io.File
import java.io.FileOutputStream
import java.nio.charset.StandardCharsets
import java.nio.file.Files

open public class GDTemplateToXslConverter
            : Object
         {
        
companion object {
            
    private val KEY_ARRAY: Array<String?> = arrayOf("<name>","//GD","<GDNAME>","<GD_FILE_NAME>","<GD_DURATION>")

    private val PARAMETER_NAME_ARRAY: Array<String?> = arrayOf("name","GD","GDNAME","GD_FILE_NAME","GD_DURATION")

    private val NEW_LINE: String = "\r\n"

                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var args = args

    
                        if(args.size < 1)
                        
                                    {
                                    System.out.println("Usage: GDTemplateToXslConverter templatePath...")
System.exit(1)

                                    }
                                

    var converter: GDTemplateToXslConverter = GDTemplateToXslConverter()





                        for (index in 0 until args.size)

        {
converter.process(File(args[index]!!))
}

}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
                @Throws(Exception::class)
            
    open fun process(templateFile: File)
        //nullable = true from not(false or (false and false)) = true
{
    //var templateFile = templateFile

    var name: String = templateFile!!.getName()!!


    var extensionIndex: Int = name.lastIndexOf('.')


    var extension: String = name.substring(extensionIndex)!!


    
                        if(!extension.equals(".original") && !extension.equals(".origin"))
                        
                                    {
                                    


                            throw IllegalArgumentException("Not a .original or .origin template: " +templateFile)

                                    }
                                

    var text: String = Files.readAllBytes.toCharArray()


    var usedArray: BooleanArray = BooleanArray(KEY_ARRAY.size)


    var body: StringBuilder = StringBuilder()


    var index: Int = 0


        while(index < text.length)
        {

    var foundIndex: Int =  -1


    var foundKey: Int =  -1





                        for (keyIndex in 0 until KEY_ARRAY.size)

        {

    var nextIndex: Int = text.indexOf(KEY_ARRAY[keyIndex]!!, index)


    
                        if(nextIndex >= 0 && (foundIndex < 0 || nextIndex < foundIndex))
                        
                                    {
                                    foundIndex= nextIndex
foundKey= keyIndex

                                    }
                                
}


    
                        if(foundIndex < 0)
                        
                                    {
                                    this.appendText(body, text.substring(index))
break;

                    

                                    }
                                
this.appendText(body, text.substring(index, foundIndex))
body.append("</xsl:text><xsl:value-of select=\"$")!!.append(PARAMETER_NAME_ARRAY[foundKey]!!)!!.append("\" /><xsl:text>")
usedArray[foundKey]= true
index= foundIndex +KEY_ARRAY[foundKey]!!.length()
}


    var xsl: StringBuilder = StringBuilder()

xsl.append("<?xml version=\"1.0\" encoding=\"UTF-8\" ?>")!!.append(NEW_LINE)
xsl.append(NEW_LINE)
xsl.append("<!--")!!.append(NEW_LINE)
xsl.append("AllBinary Open License Version 1")!!.append(NEW_LINE)
xsl.append("Copyright (c) 2026 AllBinary")!!.append(NEW_LINE)
xsl.append(NEW_LINE)
xsl.append("By agreeing to this license you and any business entity you represent are")!!.append(NEW_LINE)
xsl.append("legally bound to the AllBinary Open License Version 1 legal agreement.")!!.append(NEW_LINE)
xsl.append(NEW_LINE)
xsl.append("You may obtain the AllBinary Open License Version 1 legal agreement from")!!.append(NEW_LINE)
xsl.append("AllBinary or the root directory of AllBinary's AllBinary Platform repository.")!!.append(NEW_LINE)
xsl.append(NEW_LINE)
xsl.append("Created By: Travis Berthelot")!!.append(NEW_LINE)
xsl.append("-->")!!.append(NEW_LINE)
xsl.append(NEW_LINE)
xsl.append("<!-- File generation template (was ")!!.append(name)!!.append("). The text is output as is: &#13; keeps the windows line endings.")!!.append(NEW_LINE)
xsl.append("     The generator fills the parameters. -->")!!.append(NEW_LINE)
xsl.append("<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">")!!.append(NEW_LINE)
xsl.append(NEW_LINE)
xsl.append("    <xsl:output method=\"text\" encoding=\"UTF-8\" />")!!.append(NEW_LINE)
xsl.append(NEW_LINE)




                        for (keyIndex in 0 until KEY_ARRAY.size)

        {

    
                        if(usedArray[keyIndex])
                        
                                    {
                                    xsl.append("    <xsl:param name=\"")!!.append(PARAMETER_NAME_ARRAY[keyIndex]!!)!!.append("\" />")!!.append(NEW_LINE)

                                    }
                                
}

xsl.append(NEW_LINE)
xsl.append("    <xsl:template match=\"/\"><xsl:text>")!!.append(body)!!.append("</xsl:text></xsl:template>")!!.append(NEW_LINE)
xsl.append(NEW_LINE)
xsl.append("</xsl:stylesheet>")!!.append(NEW_LINE)

    var xslFile: File = File(templateFile!!.getParentFile(), name.substring(0, extensionIndex) +".xsl")


    var fileOutputStream: FileOutputStream = FileOutputStream(xslFile)


        try {
            fileOutputStream!!.write(xsl.toString()!!.encodeToByteArray())

         finally {
            fileOutputStream!!.close()

         }
        
System.out.println("Converted: " +templateFile +" -> " +xslFile)
}


    open fun appendText(body: StringBuilder, text: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var body = body
    //var text = text




                        for (index in 0 until text.length!!)

        {

    var c: Char = text[index]



        when (c) {
            '&' -> {body.append("&amp;")
//break;

                    
}
'<' -> {body.append("&lt;")
//break;

                    
}
'>' -> {body.append("&gt;")
//break;

                    
}
'\r' -> {body.append("&#13;")
//break;

                    
}
'\n' -> {body.append(NEW_LINE)
//break;

                    
}
else -> {
    
                        if(c > 127)
                        
                                    {
                                    body.append("&#")!!.append(c.code)!!.append(';')

                                    }
                                
                        else {
                            body.append(c)

                        }
                            
}

        }       
        
    
}

}


}
                
            

