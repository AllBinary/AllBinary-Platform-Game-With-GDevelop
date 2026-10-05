
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
        
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.string.CommonStrings
import org.allbinary.thread.NullRunnable
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDNodes
            : Object
         {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val runnableList: BasicArrayList = BasicArrayListD()

    open fun process()
        //nullable = true from not(false or (false and true)) = true
{

    var gdNode: GDNode


    var size2: Int = this.runnableList!!.size()!!





                        for (index in 0 until size2)

        {
gdNode= this.runnableList!!.get(index) as GDNode
gdNode!!.currentRunnable!!.run()
}

}


    open fun clear()
        //nullable = true from not(false or (false and true)) = true
{

    var gdNode: GDNode


    var size2: Int = this.runnableList!!.size()!!





                        for (index in 0 until size2)

        {
gdNode= this.runnableList!!.get(index) as GDNode
gdNode!!.currentRunnable= NullRunnable.getInstance()
}

}


}
                
            

