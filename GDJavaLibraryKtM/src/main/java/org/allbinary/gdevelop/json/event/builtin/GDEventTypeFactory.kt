
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json.event.builtin




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.logic.string.StringUtil

open public class GDEventTypeFactory
            : Object
         {
        
companion object {
            
    private val instance: GDEventTypeFactory = GDEventTypeFactory()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDEventTypeFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDEventTypeFactory.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val COMMENT: String = "BuiltinCommonInstructions::Comment"

    val FOR_EACH: String = "BuiltinCommonInstructions::ForEach"

    val FOR_EACH_CHILD: String = "BuiltinCommonInstructions::ForEachChild"

    val GROUP: String = "BuiltinCommonInstructions::Group"

    val LINK: String = "BuiltinCommonInstructions::Link"

    val REPEAT: String = "BuiltinCommonInstructions::Repeat"

    val STANDARD: String = "BuiltinCommonInstructions::Standard"

    val WHILE: String = "BuiltinCommonInstructions::While"

    open fun get(type: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var type = type

    
                        if(type.compareTo(this.COMMENT) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.COMMENT

                                    }
                                
                             else 
    
                        if(type.compareTo(this.FOR_EACH) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.FOR_EACH

                                    }
                                
                             else 
    
                        if(type.compareTo(this.FOR_EACH_CHILD) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.FOR_EACH_CHILD

                                    }
                                
                             else 
    
                        if(type.compareTo(this.GROUP) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.GROUP

                                    }
                                
                             else 
    
                        if(type.compareTo(this.LINK) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.LINK

                                    }
                                
                             else 
    
                        if(type.compareTo(this.REPEAT) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.REPEAT

                                    }
                                
                             else 
    
                        if(type.compareTo(this.STANDARD) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.STANDARD

                                    }
                                
                             else 
    
                        if(type.compareTo(this.WHILE) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.WHILE

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return StringUtil.getInstance()!!.NULL_STRING
}


}
                
            

