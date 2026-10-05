
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
        package org.allbinary.game.layout




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDNodeUtil
            : Object
         {
        
companion object {
            
    private val instance: GDNodeUtil = GDNodeUtil()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDNodeUtil{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDNodeUtil.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val gdNodesList: BasicArrayList = BasicArrayListD()

    open fun getInstance(index: Int)
        //nullable =  from not(true or (false and false)) = 
: GDNodes{
    //var index = index

        while(index > this.gdNodesList!!.size() -1)
        {
this.gdNodesList!!.add(GDNodes())
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gdNodesList!!.get(index) as GDNodes
}


}
                
            

