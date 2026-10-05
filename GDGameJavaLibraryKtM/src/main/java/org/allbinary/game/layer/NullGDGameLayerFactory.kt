
        /*
                * 
                *  AllBinary Open License Version 1
                *  Copyright (c) 2011 AllBinary
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
        package org.allbinary.game.layer




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.layout.GDObject

open public class NullGDGameLayerFactory : GDGameLayerFactory {
        
public constructor ()                        

                            : super(
                            null, 
                            null, 
                            null, 
                            null, 
                            null, 
                            null, 
                            null, 
                            null, false){


                            //For kotlin this is before the body of the constructor.
                    
}


    open fun create(gdObject: GDObject)
        //nullable = true from not(false or (false and false)) = true
: GDGameLayer{
    //var gdObject = gdObject



                            throw RuntimeException()
}


}
                
            

