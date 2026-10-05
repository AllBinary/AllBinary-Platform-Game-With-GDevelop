
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
        
import org.allbinary.game.paint.help.HelpPaintable
import org.allbinary.graphics.color.BasicColorFactory

open public class GDGameHelpPaintable : HelpPaintable {
        
companion object {
            
    private var SINGLETON: HelpPaintable = GDGameHelpPaintable()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: HelpPaintable{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameHelpPaintable.SINGLETON
}


        }
            private constructor ()                        

                            : super("Help Screen", BasicColorFactory.getInstance()!!.BLACK, BasicColorFactory.getInstance()!!.RED){


                            //For kotlin this is before the body of the constructor.
                    
this.setInputInfoP(arrayOf("Line 1","Line 2"))
}


}
                
            

