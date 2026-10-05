
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        

open public class GDTypeFactory
            : Object
         {
        
companion object {
            
    private val instance: GDTypeFactory = GDTypeFactory()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDTypeFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDTypeFactory.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val STRING: String = "String"

    val NUMBER: String = "Number"

    val BOOLEAN: String = "Boolean"

    val STRUCTURE: String = "Structure"

    val ARRAY: String = "Array"

    open fun get(type: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var type = type

    
                        if(this.STRING.compareTo(type) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.STRING

                                    }
                                
                             else 
    
                        if(this.NUMBER.compareTo(type) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.NUMBER

                                    }
                                
                             else 
    
                        if(this.BOOLEAN.compareTo(type) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.BOOLEAN

                                    }
                                
                             else 
    
                        if(this.STRUCTURE.compareTo(type) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.STRUCTURE

                                    }
                                
                             else 
    
                        if(this.ARRAY.compareTo(type) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.ARRAY

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return null
}


    open fun isPrimitive(type: String)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var type = type

    
                        if(this.STRING == type)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                
                             else 
    
                        if(this.NUMBER == type)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                
                             else 
    
                        if(this.BOOLEAN == type)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


}
                
            

