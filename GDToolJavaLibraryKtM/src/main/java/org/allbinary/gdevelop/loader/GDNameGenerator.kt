
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
        
import org.allbinary.canvas.Processor
import org.allbinary.gdevelop.json.GDProject
import org.allbinary.string.CommonStrings

open public class GDNameGenerator : Processor {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    val GD_KEY: String = "<name>"

    var packageName: String

    open fun process(gdProject: GDProject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdProject = gdProject

    
                        if(gdProject!!.packageName != 
                                    null
                                )
                        
                                    {
                                    this.packageName= gdProject!!.packageName

                                    }
                                
                        else {
                            this.packageName= gdProject!!.name

                        }
                            
}


                @Throws(Exception::class)
            
    override fun process()
        //nullable = true from not(false or (false and true)) = true
{
}


}
                
            

