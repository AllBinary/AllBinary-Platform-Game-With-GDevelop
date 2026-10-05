
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2025 AllBinary 
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
        package org.allbinary.gdevelop.loader.utils




        import java.lang.Object        
        
        import java.lang.System
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.logic.io.file.AbFile
import org.allbinary.logic.io.file.FileListFetcher
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.StringUtil
import org.allbinary.util.BasicArrayList

open public class GLBProcessing
            : Object
         {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    private val fileListFetcher: FileListFetcher = FileListFetcher.getInstance()!!

    private val stringMaker: StringMaker = StringMaker()

    open fun process(glbVisitor: GLBVisitor)
        //nullable = true from not(false or (false and false)) = true
{
var glbVisitor = glbVisitor

    var fileList: BasicArrayList = this.fileListFetcher!!.getFiles(GDGame0.getInstance()!!.PATH, arrayOf("glb"))!!


    var size: Int = fileList!!.size()!!

System.out.println("size: " +size)

    var file: AbFile





                        for (index in 0 until size)

        {
file= fileList!!.get(index) as AbFile

    
                        if(file.isDirectory())
                        
                                    {
                                    
    var path: String = file.getAbsolutePath()!!


                                    }
                                
                        else {
                            
    var path: String = file.getAbsolutePath()!!


    
                        if(path.indexOf(glbVisitor!!.STARTS_WITH) >= 0)
                        
                                    {
                                    
    var lastIndex: Int = path.lastIndexOf('\\') +1


    var endIndex: Int = path.lastIndexOf('.')!!


    var fileNameAsString: String = path.substring(lastIndex)!!


    var name: String = path.substring(lastIndex, endIndex)!!

glbVisitor!!.append(fileNameAsString, name, this.stringMaker)

                                    }
                                

                        }
                            
}

System.out.println(this.stringMaker!!.toString())
}


}
                
            

