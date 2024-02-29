/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
 * 
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 * 
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 * 
 * Created By: Travis Berthelot
 * 
 */
package org.allbinary.game.layer.special;

import javax.microedition.lcdui.Graphics;

import com.sun.lwuit.Label;
import com.sun.lwuit.Slider;

import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;

/**
 *
 * @author User
 */
public class GDSliderBehavior {

    private final Slider slider = new Slider() {
        public void setHandlesInput(boolean handlesInput) {
            super.setHandlesInput(true);
        }
    };

    public void build() {
        final GameTickDisplayInfoSingleton gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
        slider.initComponent();
        slider.setX(gameTickDisplayInfoSingleton.getLastWidth() / 4);
        slider.setMinValue(0);
        slider.setMaxValue(100);
        slider.setEditable(true);
        slider.setWidth(gameTickDisplayInfoSingleton.getLastWidth() / 2);
        slider.setHeight(gameTickDisplayInfoSingleton.getLastHeight() / 24);
        slider.setIncrements(gameTickDisplayInfoSingleton.getLastWidth() / 2 / 100);
        slider.setText("Audio");
        slider.setTextPosition(Label.LEFT);
        slider.setHandlesInput(true);
        slider.setRenderPercentageOnTop(true);
        //slider.setRenderValueOnTop(true);
        slider.setProgress(50);
        //slider.getStyle().setFgColor(0xFFFFFF);
        slider.getStyle().setBgColor(0x000000);
    }

    public void animate(final long timeDelta) throws Exception {
        slider.animate();
    }
    
    public void paint(final Graphics graphics)
    {
        com.sun.lwuit.Display.getInstance().lwuitGraphics.setGraphics(graphics);
        //slider.paint(com.sun.lwuit.Display.getInstance().lwuitGraphics);
        slider.paintComponent(com.sun.lwuit.Display.getInstance().lwuitGraphics);
    }

    public void keyPressed(int code) {

        slider.keyPressed(code);
    }

    protected void pointerDragged(int x, int y) {

        slider.pointerDragged(x, y);
    }

    protected void pointerPressed(int x, int y) {

        slider.pointerPressed(x, y);
    }

    protected void pointerReleased(int x, int y) {

        slider.pointerReleased(x, y);
    }

}
