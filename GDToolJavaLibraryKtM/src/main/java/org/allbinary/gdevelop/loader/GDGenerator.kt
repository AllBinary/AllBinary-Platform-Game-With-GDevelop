
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
        
import org.allbinary.data.tree.dom.document.DomDocumentHelper
import org.allbinary.time.TimeDelayHelper

open public class GDGenerator
            : Object
         {
        
companion object {
            
                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
GDPaths.init()

    var finished: BooleanArray = BooleanArray(9)

GDGenerator().
                            process(finished)
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
                @Throws(Exception::class)
            
    open fun process(finished: BooleanArray)
        //nullable = true from not(false or (false and false)) = true
{
    //var finished = finished
DomDocumentHelper.init()

    var timeDelayHelper: TimeDelayHelper = TimeDelayHelper(0)

GDResourceProcessing().
                            process()
GDDelete().
                            process()
GDCopy().
                            copy()
GDToAllBinaryGenerationTool().
                            process()

    var gdGameInfo: GDGameInfo = GDGenerateGDGameInfo().
                            process()!!

GDLayoutsToAllBinaryLayoutGenerator().
                            process(0, gdGameInfo, finished)
System.out.println("Delete, Copy, GDToAllBinaryGenerationTool, GDLayoutsToAllBinaryLayoutGenerator ElapsedTime: " +timeDelayHelper!!.getElapsedTNT())
timeDelayHelper!!.setStartTimeTNT()
}


}
                
            

