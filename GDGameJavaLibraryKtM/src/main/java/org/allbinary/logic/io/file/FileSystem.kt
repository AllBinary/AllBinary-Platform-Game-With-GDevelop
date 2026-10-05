
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
        package org.allbinary.logic.io.file




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.io.path.AbPathData
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.string.StringUtil
import org.allbinary.logic.system.os.SystemProperties
import org.allbinary.string.CommonSeps
import org.allbinary.string.CommonStrings

open public class FileSystem
            : Object
         {
        
companion object {
            
    open fun PathExists(path: String)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var path = path



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return AbFileSystem.getInstance()!!.isDirectoryOrFile(path)
}


    open fun LoadStringFromFileSync(path: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var path = path

    var logUtil: LogUtil = LogUtil.getInstance()!!


    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

logUtil!!.putF(path, commonStrings, commonStrings!!.PROCESS)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return AbFileSystem.getInstance()!!.readAsString(path)
}


    open fun DirectoryName(currentDirPath: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var currentDirPath = currentDirPath

    var name: String = AbPathData.getInstance()!!.removeNameFromPath(currentDirPath)!!




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return name
}


    open fun ReadDirectory(currentDirPath: String, fileList: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
: Array<String?>{
    //var currentDirPath = currentDirPath
var fileList = fileList

    var PAGE_SIZE: Int = 15


    var logUtil: LogUtil = LogUtil.getInstance()!!


    var commonStrings: CommonStrings = CommonStrings.getInstance()!!


    var stringUtil: StringUtil = StringUtil.getInstance()!!


    var path: String = FileSystem.FixPath(currentDirPath)!!


    var realFilePathAsStringArray: Array<String?> = AbFileSystem.getInstance()!!.getFilesAsStringArrayForPath(path)!!


    
                        if(realFilePathAsStringArray == 
                                    null
                                )
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return arrayOfNulls(PAGE_SIZE)

                                    }
                                

    var totalPages: Int = (realFilePathAsStringArray!!.size /PAGE_SIZE) +1

fileList= arrayOfNulls(totalPages *PAGE_SIZE)

    var size: Int = realFilePathAsStringArray!!.size
                

logUtil!!.putF(StringMaker().
                            append("FileSystem::ReadDirectory - total files: ")!!.appendint(size)!!.toString(), currentDirPath, commonStrings!!.PROCESS)

    var remainingPageSize: Int = fileList!!.size -realFilePathAsStringArray!!.size





                        for (index in size until remainingPageSize)

        {
fileList[index]= stringUtil!!.EMPTY_STRING
}





                        for (index in 0 until size)

        {
fileList[index]= realFilePathAsStringArray[index]!!
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return fileList
}


    open fun FixPath(path: String)
        //nullable = true from not(false or (false and false)) = true
: String{
var path = path

    
                        if(path.endsWith(CommonSeps.getInstance()!!.COLON))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return path +FilePathData.getInstance()!!.SEPARATORCHAR

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return path
}


    open fun UserHomePath()
        //nullable = true from not(false or (false and true)) = true
: String{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return SystemProperties.getInstance()!!.getUserHomePath()
}


    open fun PathDelimiter()
        //nullable = true from not(false or (false and true)) = true
: Char{

    var SEPARATOR: Char = FilePathData.getInstance()!!.SEPARATORCHAR




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return SEPARATOR
}


    open fun ExtensionName(fullPath: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var fullPath = fullPath

    var pathData: AbPathData = AbPathData.getInstance()!!


    var name: String = pathData!!.getNameFromPath(fullPath)!!


    
                        if(name.startsWith(pathData!!.EXTENSION_SEP))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return StringUtil.getInstance()!!.EMPTY_STRING

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return pathData!!.getExtensionWithDot(name)

                        }
                            
}


    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
}
                
            

