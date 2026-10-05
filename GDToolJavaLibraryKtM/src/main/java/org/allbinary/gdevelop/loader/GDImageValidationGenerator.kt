
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
        
        import java.lang.System
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import java.awt.image.BufferedImage
import java.io.IOException
import javax.imageio.ImageIO
import org.allbinary.logic.io.file.AbFile
import org.allbinary.logic.io.file.AbFileNativeUtil
import org.allbinary.logic.io.file.FileListFetcher
import org.allbinary.string.CommonSeps
import org.allbinary.logic.string.StringMaker
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDImageValidationGenerator
            : Object
         {
        
companion object {
            
                @Throws(IOException::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
GDPaths.init()

    var gdImageSizeGenerator: GDImageValidationGenerator = GDImageValidationGenerator()

gdImageSizeGenerator!!.process()
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    private val commonSeps: CommonSeps = CommonSeps.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

                @Throws(IOException::class)
            
    open fun process()
        //nullable = true from not(false or (false and true)) = true
: BasicArrayList{

    var fileListFetcher: FileListFetcher = FileListFetcher.getInstance()!!


    var files: BasicArrayList = fileListFetcher!!.getFiles(this.gdPaths!!.TWOD_RESOURCES_PATH)!!




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.process(files)
}


                @Throws(IOException::class)
            
    open fun process(files: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
: BasicArrayList{
    //var files = files

    var list: BasicArrayList = BasicArrayListD()


    var stringMaker: StringMaker = StringMaker()


    var abFile: AbFile


    var bufferedImage: BufferedImage


    var size: Int = files.size()!!


    var arrayIndex: Int = 0





                        for (index in 0 until size)

        {
abFile= files.get(index) as AbFile

    
                        if(abFile!!.isDirectory())
                        
                                    {
                                    
                                    }
                                
                        else {
                            
    
                        if(abFile!!.getAbsolutePath()!!.endsWith(this.gdToolStrings!!.PNG))
                        
                                    {
                                    bufferedImage= ImageIO.read(AbFileNativeUtil.get(abFile))

    var name: String = abFile!!.getName()!!.substring(0, abFile!!.getName()!!.length() -4)!!.uppercase()!!


    
                        if(bufferedImage!!.getWidth() % 16 != 0 || bufferedImage!!.getHeight() % 16 != 0)
                        
                                    {
                                    stringMaker!!.appendint(arrayIndex)!!.append(name)!!.append(this.commonSeps!!.SPACE)!!.appendint(bufferedImage!!.getWidth())!!.append(this.commonSeps!!.COMMA)!!.append(this.commonSeps!!.SPACE)!!.appendint(bufferedImage!!.getHeight())!!.append(this.commonSeps!!.NEW_LINE)

                                    }
                                
arrayIndex++

                                    }
                                

                        }
                            
}

System.out.println(stringMaker!!.toString())



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return list
}


}
                
            

