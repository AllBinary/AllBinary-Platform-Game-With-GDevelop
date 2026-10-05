
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
        package org.allbinary.game.canvas




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.paint.GameScrollMenuPaintable
import org.allbinary.game.paint.MainGameDemoStatePaintable
import org.allbinary.game.paint.OwnershipPaintable
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.graphics.paint.Paintable

open public class GDGameMenuPaintable : GameScrollMenuPaintable {
        
public constructor (paintable: Paintable)                        

                            : super(MainGameDemoStatePaintable(OwnershipPaintable.getInstance(), paintable), OwnershipPaintable.getInstance(), GDGameHelpPaintable.getInstance(), BasicColorFactory.getInstance()!!.YELLOW){
var paintable = paintable


                            //For kotlin this is before the body of the constructor.
                    
}


}
                
            

