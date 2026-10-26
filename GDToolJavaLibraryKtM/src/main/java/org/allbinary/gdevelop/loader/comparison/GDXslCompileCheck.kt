
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
                    
        
import java.io.ByteArrayInputStream
import java.io.File
import java.io.FileInputStream
import java.util.ArrayList
import java.util.Collections

//import java.util.List
import javax.xml.transform.ErrorListener
import javax.xml.transform.TransformerException
import javax.xml.transform.TransformerFactory
import javax.xml.transform.stream.StreamSource
import org.allbinary.data.tree.dom.BasicUriResolver

open public class GDXslCompileCheck
            : Object
         {
        
companion object {
            
    private val PLACEHOLDER_ARRAY: Array<String?> = arrayOf("<GD_CURRENT_INDEX>","<GD_EXTERNAL_LAYOUT_INDEX>","<GD_CREATE_INSTANCE_INDEX>")

                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var args = args

    
                        if(args.size < 2)
                        
                                    {
                                    System.out.println("Usage: GDXslCompileCheck suffix directory...")
System.exit(1)

                                    }
                                

    var suffix: String = args[0]!!


    var fileList: List<File> = ArrayList<File>()





                        for (index in 1 until args.size)

        {
collect(File(args[index]!!), suffix, fileList)
}

Collections.sort(fileList)

    var failed: Int = 0


                    //Otherwise - statement - ForEachStmt

System.out.println("checked=" +fileList!!.size +" failed=" +failed)
System.exit(if(failed > 0) {
                            
                            2
                        
                            } else {
                            0
                            }
    )
}


    open fun getMessage(error: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var error = error

    var message: String = error.replaceFirst("^line [0-9]+: ", "")!!

message= message.replaceAll("[0-9]+", "#")!!

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return message
}


    open fun compile(file: File)
        //nullable = true from not(false or (false and false)) = true
: List<String>{
    //var file = file

    var errorList: List<String> = ArrayList<String>()


        try {
            
    var xsl: String = read(file)!!


                    //Otherwise - statement - ForEachStmt


    var transformerFactory: TransformerFactory = TransformerFactory.newInstance()!!

transformerFactory!!.setURIResolver(BasicUriResolver())
transformerFactory!!.setErrorListener(object: ErrorListener()
                                {
                                
                                
    open override fun warning(exception: TransformerException)
        //nullable = true from not(false or (false and false)) = true
{
    //var exception = exception
}

    open override fun error(exception: TransformerException)
        //nullable = true from not(false or (false and false)) = true
{
    //var exception = exception
errorList!!.add(exception.getMessageAndLocation())
}

    open override fun fatalError(exception: TransformerException)
        //nullable = true from not(false or (false and false)) = true
{
    //var exception = exception
errorList!!.add(exception.getMessageAndLocation())
}

                                }
                            )

    var streamSource: StreamSource = StreamSource(ByteArrayInputStream(xsl.encodeToByteArray()))

transformerFactory!!.newTemplates(streamSource)
} catch(e: Exception)
            {

    
                        if(errorList!!.isEmpty())
                        
                                    {
                                    errorList!!.add(e.toString())

                                    }
                                
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return errorList
}


    open fun collect(directory: File, suffix: String, fileList: List<File>)
        //nullable = true from not(false or (false and false)) = true
{
    //var directory = directory
    //var suffix = suffix
    //var fileList = fileList

    var fileArray: Array<File?> = directory.listFiles()!!


    
                        if(fileArray == 
                                    null
                                )
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

                    //Otherwise - statement - ForEachStmt

}


                @Throws(Exception::class)
            
    open fun read(file: File)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var file = file

    var inputStream: FileInputStream = FileInputStream(file)


        try {
            
    var byteArray: ByteArray = ByteArray(file.length().toInt())


    var offset: Int = 0


        while(offset < byteArray!!.size)
        {

    var read: Int = inputStream!!.read(byteArray, offset, byteArray!!.size -offset)


    
                        if(read < 0)
                        
                                    {
                                    break;

                    

                                    }
                                
offset += read
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return byteArray.decodeToString()""

         finally {
            inputStream!!.close()

         }
        
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
}
                
            

