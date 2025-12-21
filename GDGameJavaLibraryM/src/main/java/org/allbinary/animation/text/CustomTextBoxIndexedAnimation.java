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
package org.allbinary.animation.text;

import javax.microedition.lcdui.Graphics;

import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.game.input.event.RawKeyEventListener;
import org.allbinary.graphics.form.item.CustomTextBox;

/**
 *
 * @author User
 */
public class CustomTextBoxIndexedAnimation extends IndexedAnimation 
    implements RawKeyEventListener, GetTextInterface
               //GameKeyEventListenerInterface 
{
    
    private final CustomTextBox customTextBox;

    public CustomTextBoxIndexedAnimation(final CustomTextBox customTextBox) {
        super(AnimationBehavior.getInstance());
        
        this.customTextBox = customTextBox;
    }

    @Override    
    public void paint(Graphics graphics, int x, int y)
    {        
        this.customTextBox.paint(graphics, x, y);
    }

    @Override
    public void paintThreed(Graphics graphics, int x, int y, int z)
    {

    }    
    
    @Override
    public String getText() {
        return this.customTextBox.getTextFieldItem().getString();
    }

    @Override
    public void onEvent(final int keyCode, final int deviceId, final boolean repeated) {
        this.customTextBox.onEvent(keyCode, deviceId, repeated);
    }
    
}
