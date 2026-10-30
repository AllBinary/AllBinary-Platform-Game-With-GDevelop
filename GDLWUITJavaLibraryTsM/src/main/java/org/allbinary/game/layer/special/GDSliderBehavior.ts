
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

    let gameTickDisplayInfoSingleton: GameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance()!;;
    
this.slider.initComponent();
    
this.slider.setX(gameTickDisplayInfoSingleton!.getLastWidth() /4);
    
this.slider.setMinValue(0);
    
this.slider.setMaxValue(100);
    
this.slider.setEditable(true);
    
this.slider.setWidth(gameTickDisplayInfoSingleton!.getLastWidth() /2);
    
this.slider.setHeight(gameTickDisplayInfoSingleton!.getLastHeight() /24);
    
this.slider.setIncrements(gameTickDisplayInfoSingleton!.getLastWidth() /2 /100);
    
this.slider.setText("Audio");
    
this.slider.setTextPosition(Label.LEFT);
    
this.slider.setHandlesInput(true);
    
this.slider.setRenderPercentageOnTop(true);
    
this.slider.setProgress(50);
    
this.slider.getStyle()!.setBgColor(0x000000);
    
}


                //@Throws(Exception.constructor)
            
    public animate(timeDelta: number){
this.slider.animate();
    
}


    public paint(graphics: Graphics){
com.sun.lwuit.Display.getInstance()!.lwuitGraphics!.setGraphics(graphics);
    
this.slider.paintComponent(com.sun.lwuit.Display.getInstance()!.lwuitGraphics);
    
}


    public keyPressed(code: number){
this.slider.keyPressed(code);
    
}


    pointerDragged(x: number, y: number){
this.slider.pointerDragged(x, y);
    
}


    pointerPressed(x: number, y: number){
this.slider.pointerPressed(x, y);
    
}


    pointerReleased(x: number, y: number){
this.slider.pointerReleased(x, y);
    
}


}

