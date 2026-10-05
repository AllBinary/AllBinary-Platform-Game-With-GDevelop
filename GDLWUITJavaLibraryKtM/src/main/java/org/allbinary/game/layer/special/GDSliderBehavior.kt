
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
        package org.allbinary.game.layer.special




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import javax.microedition.lcdui.Graphics
import com.sun.lwuit.Label
import com.sun.lwuit.Slider
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton

open public class GDSliderBehavior
            : Object
         {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    private val slider: Slider = object: Slider()
                                {
                                
    open override fun setHandlesInput(handlesInput: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
var handlesInput = handlesInput
super.setHandlesInput(true)
}

                                }
                            

    open fun build()
        //nullable = true from not(false or (false and true)) = true
{

    var gameTickDisplayInfoSingleton: GameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance()!!

slider.initComponent()
slider.setX(gameTickDisplayInfoSingleton!!.getLastWidth() /4)
slider.setMinValue(0)
slider.setMaxValue(100)
slider.setEditable(true)
slider.setWidth(gameTickDisplayInfoSingleton!!.getLastWidth() /2)
slider.setHeight(gameTickDisplayInfoSingleton!!.getLastHeight() /24)
slider.setIncrements(gameTickDisplayInfoSingleton!!.getLastWidth() /2 /100)
slider.setText("Audio")
slider.setTextPosition(Label.LEFT)
slider.setHandlesInput(true)
slider.setRenderPercentageOnTop(true)
slider.setProgress(50)
slider.getStyle()!!.setBgColor(0x000000)
}


                @Throws(Exception::class)
            
    open fun animate(timeDelta: Long)
        //nullable = true from not(false or (false and false)) = true
{
    //var timeDelta = timeDelta
slider.animate()
}


    open fun paint(graphics: Graphics)
        //nullable = true from not(false or (false and false)) = true
{
    //var graphics = graphics
com.sun.lwuit.Display.getInstance()!!.lwuitGraphics!!.setGraphics(graphics)
slider.paintComponent(com.sun.lwuit.Display.getInstance()!!.lwuitGraphics)
}


    open fun keyPressed(code: Int)
        //nullable = true from not(false or (false and false)) = true
{
var code = code
slider.keyPressed(code)
}


    open fun pointerDragged(x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
{
var x = x
var y = y
slider.pointerDragged(x, y)
}


    open fun pointerPressed(x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
{
var x = x
var y = y
slider.pointerPressed(x, y)
}


    open fun pointerReleased(x: Int, y: Int)
        //nullable = true from not(false or (false and false)) = true
{
var x = x
var y = y
slider.pointerReleased(x, y)
}


}
                
            

