
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
        
import javax.microedition.lcdui.Graphics
import org.allbinary.game.gd.input.GDGameGameInputMappingFactory
import org.allbinary.animation.AnimationInterface
import org.allbinary.game.paint.help.HelpPaintable
import org.allbinary.game.paint.help.InputMappingHelpPaintable
import org.allbinary.graphics.color.BasicColorFactory

open public class GDGameInputMappingHelpPaintable : InputMappingHelpPaintable
                , AnimationInterface {
        
companion object {
            
    private var SINGLETON: HelpPaintable = GDGameInputMappingHelpPaintable()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: HelpPaintable{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDGameInputMappingHelpPaintable.SINGLETON
}


        }
            private constructor ()                        

                            : super(GDGameGameInputMappingFactory.getInstance()!!.get(), BasicColorFactory.getInstance()!!.BLACK, BasicColorFactory.getInstance()!!.YELLOW){


                            //For kotlin this is before the body of the constructor.
                    
}


    override fun paintXY(graphics: Graphics, x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
{
var graphics = graphics
var x = x
var y = y
}


    override fun paintThreedXYZ(graphics: Graphics, x: Int, y: Int, z: Int)
        //nullable = true from not(false or (false and false)) = true
{
var graphics = graphics
var x = x
var y = y
var z = z
}


                @Throws(Exception::class)
            
    override fun nextFrame()
        //nullable = true from not(false or (false and true)) = true
{
}


}
                
            

