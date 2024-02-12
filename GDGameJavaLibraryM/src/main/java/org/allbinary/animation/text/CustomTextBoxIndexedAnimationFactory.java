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

import javax.microedition.lcdui.Font;
import javax.microedition.lcdui.TextField;
import org.allbinary.graphics.form.item.CustomTextBox;
import org.allbinary.animation.Animation;
import org.allbinary.animation.AnimationInterfaceFactoryInterface;
import org.allbinary.game.canvas.ABToGBUtil;
import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.string.StringUtil;

/**
 *
 * @author User
 */
public class CustomTextBoxIndexedAnimationFactory
    implements AnimationInterfaceFactoryInterface {

    //private final CommonStrings commonStrings = CommonStrings.getInstance();

    private final int fontSize;

    public CustomTextBoxIndexedAnimationFactory(final int fontSize) {
        
        //LogUtil.put(LogFactory.getInstance(commonStrings.START + font.getSize(), this, commonStrings.CONSTRUCTOR));
        
        this.fontSize = fontSize;
    }

    public Animation getInstance() throws Exception {
        return this.getInstance(1);
    }
    
    public Animation getInstance(final int scale) throws Exception {

        //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, commonStrings.PROCESS));
        
        final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
        final AllBinaryGameCanvas abCanvas = (AllBinaryGameCanvas) abToGBUtil.abCanvas;
        
        final Font font = Font.getFont(Font.FACE_SYSTEM, Font.STYLE_PLAIN, fontSize);
        
        //this.getHighScoresArray(), highScore, 
        final CustomTextBox customTextBox = new CustomTextBox2(
            abCanvas.getCustomCommandListener(),
            StringUtil.getInstance().EMPTY_STRING,
            StringUtil.getInstance().EMPTY_STRING,
            12, TextField.ANY, font,
            abCanvas.getLayerManager().getBackgroundBasicColor(),
            abCanvas.getLayerManager().getForegroundBasicColor());

        return new CustomTextBoxIndexedAnimation(customTextBox);
    }

    public void setInitialSize(final int width, final int height) {

    }

}
