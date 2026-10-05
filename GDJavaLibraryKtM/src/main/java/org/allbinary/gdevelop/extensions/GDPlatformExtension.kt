
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.extensions




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.extensions.builtin.metadata.GDBehaviorMetadata
import org.allbinary.logic.string.StringUtil

open public class GDPlatformExtension : GDBehaviorMetadata {
        
companion object {
            
    private val instance: GDPlatformExtension = GDPlatformExtension()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDPlatformExtension{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDPlatformExtension.instance
}


        }
            
    val NAMESPACE_SEP: String = "::"
private constructor ()                        

                            : super(StringUtil.getInstance()!!.EMPTY_STRING, StringUtil.getInstance()!!.EMPTY_STRING, StringUtil.getInstance()!!.EMPTY_STRING, StringUtil.getInstance()!!.EMPTY_STRING, StringUtil.getInstance()!!.EMPTY_STRING, StringUtil.getInstance()!!.EMPTY_STRING, StringUtil.getInstance()!!.EMPTY_STRING, StringUtil.getInstance()!!.EMPTY_STRING, 
                            null, 
                            null){


                            //For kotlin this is before the body of the constructor.
                    
}


}
                
            

