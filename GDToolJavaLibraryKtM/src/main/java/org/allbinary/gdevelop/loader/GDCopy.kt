
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2022 AllBinary 
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
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.logic.io.file.AbFile
import org.allbinary.logic.io.file.FileListFetcher
import org.allbinary.logic.io.file.FileUtil
import org.allbinary.logic.io.path.AbPath
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.StringUtil
import org.allbinary.util.BasicArrayList

open public class GDCopy
            : Object
         {
        
companion object {
            
                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var args = args
GDPaths.init()
GDCopy().
                            copy()
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

                @Throws(Exception::class)
            
    open fun copy()
        //nullable = true from not(false or (false and true)) = true
{

        try {
            
    var gdPaths: GDPaths = GDPaths.getInstance()!!


    var gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!


    var fileUtil: FileUtil = FileUtil.getInstance()!!


    var files: BasicArrayList = FileListFetcher.getInstance()!!.getFiles(gdPaths!!.TWOD_RESOURCES_PATH, gdToolStrings!!.JSON)!!


    var stringMaker: StringMaker = StringMaker()


    var PATH: String = stringMaker!!.append(gdPaths!!.ROOT_PATH)!!.append("platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\res\\")!!.toString()!!


    var size: Int = files.size()!!

stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append("Total JSON Files for Copying: ")!!.appendint(size)!!.toString(), this, this.commonStrings!!.PROCESS)

    var file: AbFile


    var toAbPath: AbPath


    var fromAbPath: AbPath





                        for (index in 0 until size)

        {
file= files.get(index) as AbFile
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append("Copying From File: ")!!.append(file.getPath())!!.toString(), this, this.commonStrings!!.PROCESS)
stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append("Copying To File: ")!!.append(PATH)!!.append(file.getName())!!.toString(), this, this.commonStrings!!.PROCESS)
fromAbPath= AbPath(file.getPath(), StringUtil.getInstance()!!.EMPTY_STRING)
toAbPath= AbPath(PATH +file.getName(), StringUtil.getInstance()!!.EMPTY_STRING)
fileUtil!!.copy(fromAbPath, toAbPath)
}

} catch(e: Exception)
            {



                            throw e
}

}


}
                
            

