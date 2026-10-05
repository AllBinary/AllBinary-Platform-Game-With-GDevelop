
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
        
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDResources
            : Object
         {
        
companion object {
            
    private val instance: GDResources = GDResources()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDResources{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDResources.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val androidResourceList: BasicArrayList = BasicArrayListD()

    val resourceNameList: BasicArrayList = BasicArrayListD()

    val resourceList: BasicArrayList = BasicArrayListD()

    val playSoundAndroidResourceNameList: BasicArrayList = BasicArrayListD()

    val playSoundResourcePathList: BasicArrayList = BasicArrayListD()

}
                
            

