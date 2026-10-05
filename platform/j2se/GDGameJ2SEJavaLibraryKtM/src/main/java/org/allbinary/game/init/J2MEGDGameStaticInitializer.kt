
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
        package org.allbinary.game.init




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.animation.image.GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.animation.FeaturedAnimationInterfaceFactoryInterfaceFactory
import org.allbinary.game.resource.ResourceInitialization
import org.allbinary.game.init.GDGameStaticInitializer

open public class J2MEGDGameStaticInitializer : GDGameStaticInitializer {
        
public constructor (resourceInitializationArray: Array<ResourceInitialization?>, portion: Int)                        

                            : super(resourceInitializationArray, portion){
var resourceInitializationArray = resourceInitializationArray
var portion = portion


                            //For kotlin this is before the body of the constructor.
                    
}


                @Throws(Exception::class)
            
    open fun initFeatureResources()
        //nullable = true from not(false or (false and true)) = true
{
FeaturedAnimationInterfaceFactoryInterfaceFactory.getInstance()!!.add(GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory())
}


}
                
            

