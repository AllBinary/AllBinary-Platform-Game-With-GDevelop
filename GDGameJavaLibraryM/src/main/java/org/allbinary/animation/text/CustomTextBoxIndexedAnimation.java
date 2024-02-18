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

import org.allbinary.graphics.form.item.CustomTextBox;
import javax.microedition.lcdui.Graphics;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;

/**
 *
 * @author User
 */
public class CustomTextBoxIndexedAnimation extends IndexedAnimation {
    
    private final CustomTextBox customTextBox;

    public CustomTextBoxIndexedAnimation(final CustomTextBox customTextBox) {
        super(AnimationBehavior.getInstance());
        
        this.customTextBox = customTextBox;
    }
    
    public void paint(Graphics graphics, int x, int y)
    {        
        this.customTextBox.paint(graphics, x, y);
    }

    public void paintThreed(Graphics graphics, int x, int y, int z)
    {

    }    
    
    public String Text() {
        return this.customTextBox.getTextFieldItem().getString();
    }
}
