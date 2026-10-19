
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
                    
        
import org.allbinary.animation.AnimationInterfaceFactoryInterface
import org.allbinary.animation.BasicAnimationInterfaceFactoryInterface
import org.allbinary.animation.NullRotationAnimationFactory
import org.allbinary.game.identification.GroupFactory
import org.allbinary.game.layout.GDObject
import org.allbinary.graphics.RectangleFactory
import org.allbinary.util.BasicArrayListUtil

open public class NullGDGameLayerFactory : GDGameLayerFactory {
        
companion object {
            
    val NULL_GD_GAME_LAYER_FACTORY: NullGDGameLayerFactory = NullGDGameLayerFactory()

        }
            private constructor ()                        

                            : super(BasicArrayListUtil.getInstance()!!.getImmutableInstance(), BasicArrayListUtil.getInstance()!!.getImmutableInstance(), GroupFactory.getInstance()!!.NULL_GROUP_ARRAY, BasicArrayListUtil.getInstance()!!.getImmutableInstance(), arrayOf(NullRotationAnimationFactory.getFactoryInstance()), arrayOf(NullRotationAnimationFactory.getFactoryInstance()), RectangleFactory.SINGLETON, RectangleFactory.ARRAY_OF_ARRAYS, false){


                            //For kotlin this is before the body of the constructor.
                    
}


    open fun create(gdObject: GDObject)
        //nullable = true from not(false or (false and false)) = true
: GDGameLayer{
    //var gdObject = gdObject



                            throw RuntimeException()
}


}
                
            

