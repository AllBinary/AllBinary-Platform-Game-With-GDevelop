
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2026 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        import java.lang.System
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.ObjectInputStream
import java.io.ObjectOutputStream
import java.io.StringBufferInputStream
import java.nio.charset.Charset
import java.nio.file.Files
import java.nio.file.StandardCopyOption
import java.security.MessageDigest
import java.util.ArrayList

//import java.util.List
import java.util.regex.Matcher
import java.util.regex.Pattern
import javax.xml.transform.Templates
import javax.xml.transform.TransformerFactory
import javax.xml.transform.stream.StreamSource
import org.allbinary.data.tree.dom.BasicUriResolver
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.string.CommonStrings

open public class GDXslTemplatesCache
            : Object
         {
        
companion object {
            
    private val instance: GDXslTemplatesCache = GDXslTemplatesCache()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDXslTemplatesCache{

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance
}


        }
            
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val BYTE_CHARSET: Charset = Charset.forName("ISO-8859-1").kotlin!!

    private val CACHE_DIRECTORY_PROPERTY: String = "gd.xsl.cache.dir"

    private val DEFAULT_CACHE_DIRECTORY: String = "gdxslcache"

    private val DESERIALIZE_PROPERTY: String = "jdk.xml.enableTemplatesImplDeserialization"

    private val TRUE: String = "true"

    private val EXTENSION: String = ".templates"

    private val TEMP_EXTENSION: String = ".tmp"

    private val SHA_256: String = "SHA-256"

    private val HEX_ARRAY: CharArray = "0123456789abcdef".toCharArray()!!

    private val LOADED: String = "Loaded compiled xsl: "

    private val SAVED: String = "Saved compiled xsl: "

    private val NOT_LOADED: String = "Compiling xsl again since the cached xsl was not loaded: "

    private val NOT_SAVED: String = "Unable to save compiled xsl: "

    private val IMPORT_PATTERN: Pattern = Pattern.compile("<xsl:(?:import|include)\\s+href=\"([^\"]+)\"")!!

    private val COMMENT_PATTERN: Pattern = Pattern.compile("<!--.*?-->", Pattern.DOTALL)!!

    private val cacheDirectory: File
private constructor ()
            : super()
        {

    var cacheDirectoryPath: String = System.getProperty(this.CACHE_DIRECTORY_PROPERTY)!!


    
                        if(cacheDirectoryPath == 
                                    null
                                )
                        
                                    {
                                    this.cacheDirectory= File(System.getProperty("java.io.tmpdir"), this.DEFAULT_CACHE_DIRECTORY)

                                    }
                                
                             else 
    
                        if(cacheDirectoryPath!!.length == 0)
                        
                                    {
                                    this.cacheDirectory= 
                                        null
                                    

                                    }
                                
                        else {
                            this.cacheDirectory= File(cacheDirectoryPath)

                        }
                            
}


                @Throws(Exception::class)
            
    open fun newTemplates(xslDocumentAsString: String)
        //nullable = true from not(false or (false and false)) = true
: Templates{
    //var xslDocumentAsString = xslDocumentAsString

    var file: File = this.getCacheFile(xslDocumentAsString)!!


    
                        if(file != 
                                    null
                                 && file.isFile())
                        
                                    {
                                    
        try {
            System.setProperty(this.DESERIALIZE_PROPERTY, this.TRUE)

    var objectInputStream: ObjectInputStream = ObjectInputStream(FileInputStream(file))


        try {
            
    var templates: Templates = objectInputStream!!.readObject() as Templates

this.logUtil!!.putF(StringMaker().
                            append(this.LOADED)!!.append(file.getName())!!.toString(), this, this.commonStrings!!.PROCESS)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return templates

         finally {
            objectInputStream!!.close()

         }
        
} catch(e: Exception)
            {
this.logUtil!!.put(StringMaker().
                            append(this.NOT_LOADED)!!.append(file.getPath())!!.toString(), this, this.commonStrings!!.PROCESS, e)
}


                                    }
                                

    var transformerFactory: TransformerFactory = TransformerFactory.newInstance()!!

transformerFactory!!.setURIResolver(BasicUriResolver())

    var templates: Templates = transformerFactory!!.newTemplates(StreamSource(StringBufferInputStream(xslDocumentAsString)))!!


    
                        if(file != 
                                    null
                                )
                        
                                    {
                                    this.save(templates, file)

                                    }
                                

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return templates
}


    open fun save(templates: Templates, file: File)
        //nullable = true from not(false or (false and false)) = true
{
    //var templates = templates
    //var file = file

        try {
            this.cacheDirectory!!.mkdirs()

    var tempFile: File = File.createTempFile(file.getName(), this.TEMP_EXTENSION, this.cacheDirectory)!!


    var objectOutputStream: ObjectOutputStream = ObjectOutputStream(FileOutputStream(tempFile))


        try {
            objectOutputStream!!.writeObject(templates)

         finally {
            objectOutputStream!!.close()

         }
        
Files.move(tempFile!!.toPath(), file.toPath(), StandardCopyOption.REPLACE_EXISTING, StandardCopyOption.ATOMIC_MOVE)
this.logUtil!!.putF(StringMaker().
                            append(this.SAVED)!!.append(file.getName())!!.toString(), this, this.commonStrings!!.PROCESS)
} catch(e: Exception)
            {
this.logUtil!!.put(StringMaker().
                            append(this.NOT_SAVED)!!.append(file.getPath())!!.toString(), this, this.commonStrings!!.PROCESS, e)
}

}


                @Throws(Exception::class)
            
    open fun getCacheFile(xslDocumentAsString: String)
        //nullable = true from not(false or (false and false)) = true
: File?{
    //var xslDocumentAsString = xslDocumentAsString

    
                        if(this.cacheDirectory == 
                                    null
                                )
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null

                                    }
                                

    var messageDigest: MessageDigest = MessageDigest.getInstance(this.SHA_256)!!

messageDigest!!.update(System.getProperty("java.version")!!.encodeToByteArray())
messageDigest!!.update(0.toByte())
messageDigest!!.update(xslDocumentAsString!!.encodeToByteArray())

    var currentDirectory: File = File(".").
                            getCanonicalFile()!!


    var importList: List = ArrayList()


    
                        if(!this.addImports(
                            null, xslDocumentAsString, currentDirectory, importList))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null

                                    }
                                

    var size: Int = importList!!.size





                        for (index in 0 until size)

        {

    var importFile: File = importList!!.get(index) as File

messageDigest!!.update(0.toByte())
messageDigest!!.update(importFile!!.getPath()!!.encodeToByteArray())
messageDigest!!.update(0.toByte())
messageDigest!!.update(Files.readAllBytes(importFile!!.toPath()))
}


    var hashArray: ByteArray = messageDigest!!.digest()!!


    var hexCharArray: CharArray = 
                                                        
                                                        CharArray(hashArray!!.size *2)
                                                    





                        for (index in 0 until hashArray!!.size)

        {
hexCharArray[index *2]= this.HEX_ARRAY[(hashArray[index] shr 4) and 0xF]!!
hexCharArray[index *2 +1]= this.HEX_ARRAY[hashArray[index] and 0xF]!!
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return File(this.cacheDirectory, StringMaker().
                            append(hexCharArray.concatToString())!!.append(this.EXTENSION)!!.toString())
}


                @Throws(Exception::class)
            
    open fun addImports(xslFile: File, xslDocumentAsString: String, currentDirectory: File, importList: List)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var xslFile = xslFile
    //var xslDocumentAsString = xslDocumentAsString
    //var currentDirectory = currentDirectory
    //var importList = importList

    var matcher: Matcher = this.IMPORT_PATTERN.matcher(this.COMMENT_PATTERN.matcher(xslDocumentAsString)!!.replaceAll(""))!!


        while(matcher.find())
        {

    var href: String = matcher.group(1)!!


    var file: File = 
                null
            


    
                        if(xslFile != 
                                    null
                                )
                        
                                    {
                                    file= File(xslFile!!.getParentFile(), href)

                                    }
                                

    
                        if(file == 
                                    null
                                 || !file.isFile())
                        
                                    {
                                    file= File(currentDirectory, href)

                                    }
                                

    
                        if(!file.isFile())
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                                    }
                                
file= file.getCanonicalFile()!!

    
                        if(!importList!!.contains(file))
                        
                                    {
                                    importList!!.add(file)

    
                        if(!this.addImports(file, Files.readAllBytes.toCharArray(), currentDirectory, importList))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                                    }
                                

                                    }
                                
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true
}


}
                
            

