
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

        


            import { Object } from '../../../../../java/lang/Object.js';
        
            import { Exception } from '../../../../../java/lang/Exception.js';
        
import { Graphics } from '../../../../../javax/microedition/lcdui/Graphics.js';
//not GWT import const Graphics

import { Label } from '../../../../../com/sun/lwuit/Label.js';
//not GWT import const Label

import { Slider } from '../../../../../com/sun/lwuit/Slider.js';
//not GWT import const Slider

import { GameTickDisplayInfoSingleton } from '../../../../../org/allbinary/graphics/displayable/GameTickDisplayInfoSingleton.js';
//not GWT import const GameTickDisplayInfoSingleton

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class GDSliderBehavior
            extends Object
         {
        

    private readonly slider: Slider = new class extends Slider
                                {
                                
    public setHandlesInput(handlesInput: boolean){
super.setHandlesInput(true);
    
}

                                }
                            ;

    public build(){

    var gameTickDisplayInfoSingleton: GameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance()!;;
    
slider.initComponent();
    
slider.setX(gameTickDisplayInfoSingleton!.getLastWidth() /4);
    
slider.setMinValue(0);
    
slider.setMaxValue(100);
    
slider.setEditable(true);
    
slider.setWidth(gameTickDisplayInfoSingleton!.getLastWidth() /2);
    
slider.setHeight(gameTickDisplayInfoSingleton!.getLastHeight() /24);
    
slider.setIncrements(gameTickDisplayInfoSingleton!.getLastWidth() /2 /100);
    
slider.setText("Audio");
    
slider.setTextPosition(Label.LEFT);
    
slider.setHandlesInput(true);
    
slider.setRenderPercentageOnTop(true);
    
slider.setProgress(50);
    
slider.getStyle()!.setBgColor(0x000000);
    
}


                //@Throws(Exception.constructor)
            
    public animate(timeDelta: number){
slider.animate();
    
}


    public paint(graphics: Graphics){
com.sun.lwuit.Display.getInstance()!.lwuitGraphics!.setGraphics(graphics);
    
slider.paintComponent(com.sun.lwuit.Display.getInstance()!.lwuitGraphics);
    
}


    public keyPressed(code: number){
slider.keyPressed(code);
    
}


    pointerDragged(x: number, y: number){
slider.pointerDragged(x, y);
    
}


    pointerPressed(x: number, y: number){
slider.pointerPressed(x, y);
    
}


    pointerReleased(x: number, y: number){
slider.pointerReleased(x, y);
    
}


}



