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

import javax.microedition.lcdui.CommandListener;
import javax.microedition.lcdui.Font;

import org.allbinary.game.input.event.RawKeyEventListener;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.form.item.CustomTextBox;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class CustomTextBox2 extends CustomTextBox 
    implements RawKeyEventListener
               //GameKeyEventListenerInterface 
{        
    public CustomTextBox2(final CommandListener cmdListener, final String label, final String text, 
        final int maxSize, final int constraints, final Font font, 
        final BasicColor backgroundBasicColor, final BasicColor foregroundBasicColor)
        throws Exception
    {
        super(cmdListener, label, text, maxSize, constraints, font, backgroundBasicColor, foregroundBasicColor);

//        this.initMenu2();
        
        this.getTextFieldItem().setFocus(true);
        
    }
    
//    protected void initMenu() throws Exception
//    {        
//    }
//    
//    protected void initMenu2() throws Exception
//    {
//        super.initMenu();
//        //this.getMenuForm().setSelectedIndex(0);
//    }


//    public ScrollSelectionForm createForm() throws Exception {
//        
//        final CustomItem[] items = {
//            this.textFieldItem
//        };
//
//        final DisplayInfoSingleton displayInfo = DisplayInfoSingleton.getInstance();
//
//        final Rectangle rectangle = new Rectangle(
//            PointFactory.getInstance().getInstance(30, 30 + displayInfo.getLastHalfHeight()),
//            displayInfo.getLastWidth() - 30,
//            displayInfo.getLastHalfHeight() - 30);
//        
//            return CommandCurrentSelectionFormFactory.getInstance(
//            //"Menu",
//            StringUtil.getInstance().EMPTY_STRING,
//            items,
//            rectangle,
//            FormTypeFactory.getInstance().VERTICAL_CENTER_FORM,
//            15, false,
//            this.backgroundBasicColor, this.foregroundBasicColor
//            );
//    }

    @Override
    public void onEvent(final int keyCode, final int deviceId, final boolean repeated) {
        LogUtil.put(LogFactory.getInstance("keyPressed: " + Integer.toString(keyCode), this, "onEvent"));
        super.keyPressed(keyCode);        
    }
    
//    @Override
//    public void onUpGameKeyEvent(final GameKeyEvent gameKeyEvent) throws Exception {
//        LogUtil.put(LogFactory.getInstance(gameKeyEvent.toString(), this, "onUpGameKeyEvent"));
//    }
//
//    @Override
//    public void onDownGameKeyEvent(final GameKeyEvent gameKeyEvent) throws Exception {
//        LogUtil.put(LogFactory.getInstance(gameKeyEvent.toString(), this, "onDownGameKeyEvent"));
//        this.keyPressed(gameKeyEvent.getKey());
//    }
//
//    @Override
//    public void onPressGameKeyEvent(final GameKeyEvent gameKeyEvent) throws Exception {
//        LogUtil.put(LogFactory.getInstance(gameKeyEvent.toString(), this, "onPressedGameKeyEvent"));
//    }

}
