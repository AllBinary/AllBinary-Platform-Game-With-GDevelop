/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
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
package org.allbinary.animation.compound;

import javax.microedition.lcdui.Graphics;

import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.animation.text.CustomTextAnimation;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.HTMLFeatureFactory;
import org.allbinary.game.layer.SWTUtil;
import org.allbinary.logic.communication.log.LogUtil;

import org.allbinary.logic.math.PrimitiveIntUtil;

/**
 *
 * @author Berthelot, Travis
 * @version 1.0
 */
public class SliderAnimation 
    extends IndexedAnimation
    //implements IndexedAnimationInterface
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private IndexedAnimation[] animationInterfaceArray;

    private final int width;
    private final int height;
    
    private int dx;

    private int value;

    protected boolean hasFocus;

    public SliderAnimation(final IndexedAnimation[] animationInterfaceArray, final int width, final int height, final AnimationBehavior animationBehavior)
    {
        super(animationBehavior);
        
        this.animationInterfaceArray = animationInterfaceArray;
        
        this.dx = this.animationInterfaceArray[3].getDx();
        
        this.width = width;
        this.height = height;
        
        final CustomTextAnimation customTextAnimation = ((CustomTextAnimation) this.animationInterfaceArray[4]);
        if(SWTUtil.isSWT) {
            //customTextAnimation.setDy(-customTextAnimation.getSize());
            final int h = dxhack();
            customTextAnimation.setDy(-h / 3 * 2);
        } else {
            final int h = dxhack();
            customTextAnimation.setDy(-h + (h / 10));
        }
    }
    
    private int dxhack() {
        //TWB - Hack for HTML5 build
        final Features features = Features.getInstance();
        final boolean isHTML = features.isDefault(HTMLFeatureFactory.getInstance().HTML);
        if(isHTML) {
            return this.height * 2 / 3;
        } else {
            return this.height;
        }
    }
    
    public void setFrame(final int frameIndex)
    {
        for(int index = this.animationInterfaceArray.length; --index >= 0;)
        {
            this.animationInterfaceArray[index].setFrame(frameIndex);
        }
    }

    public int getFrame()
    {
        return this.animationInterfaceArray[0].getFrame();
    }

    public int getSize()
    {
        return this.animationInterfaceArray[0].getSize();
    }

    public void previousFrame()
    {
        for(int index = this.animationInterfaceArray.length; --index >= 0;)
        {
            this.animationInterfaceArray[index].previousFrame();
        }
    }

    public void setSequence(final int[] sequence)
    {
    }

    public int[] getSequence()
    {
        return PrimitiveIntUtil.getArrayInstance();
    }

    public void nextFrame() throws Exception
    {
        for(int index = this.animationInterfaceArray.length; --index >= 0;)
        {
            this.animationInterfaceArray[index].nextFrame();
        }
    }

    public void paint(final Graphics graphics, final int x, final int y)
    {
        int size = this.animationInterfaceArray.length;
        for(int index = 0; index < size; index++)
        {
            this.animationInterfaceArray[index].paint(graphics, x, y);
        }
        
//        if(this.hasFocus) {
//            graphics.setColor(BasicColorFactory.getInstance().YELLOW.intValue());
//            graphics.drawRect(x - 1, y - 1, width + 1, height + 1);
//        }
    }

    public void paintThreed(final Graphics graphics, final int x, final int y, final int z)
    {
        int size = this.animationInterfaceArray.length;
        for(int index = 0; index < size; index++)
        {
            this.animationInterfaceArray[index].paintThreed(graphics, x, y, z);
        }
    }
    
    /**
     * @return the animationInterfaceArray
     */
    public IndexedAnimation[] getAnimationInterfaceArray()
    {
        return animationInterfaceArray;
    }

    /**
     * @param animationInterfaceArray the animationInterfaceArray to set
     */
    public void setAnimationInterfaceArray(final IndexedAnimation[] animationInterfaceArray)
    {
        this.animationInterfaceArray = animationInterfaceArray;
    }
    
    public void setValue(final int value) {
        if(value >= 0 && value < 101) {
            this.value = value;
            //logUtil.put("new value: " + this.value, this, "onMotionGestureEvent");
            final int newDx = dx + (value * width / 100);
            this.animationInterfaceArray[3].setDx(newDx);
            
            final CustomTextAnimation customTextAnimation = ((CustomTextAnimation) this.animationInterfaceArray[4]);
            customTextAnimation.setText(Integer.toString(this.value));
            customTextAnimation.setDx(newDx + (this.getThumbWidth() / 2) - (customTextAnimation.getWidth() / 2));
        }
    }

    public void setValue2(final int thumbX) {
        //logUtil.put("old thumbX: " + this.animationInterfaceArray[3].getDx(), this, "onMotionGestureEvent");
        //logUtil.put("thumbX: " + thumbX, this, "onMotionGestureEvent");
        int usedThumbX = thumbX;
        final int maxX = width;
        if(thumbX >= dx && thumbX < dx + width) {
        } else if(thumbX < 0) {
            usedThumbX = 0;
            //logUtil.put("min thumbX: " + usedThumbX, this, "onMotionGestureEvent");
        } else if(thumbX > maxX) {
            usedThumbX = maxX;
            //logUtil.put("max thumbX: " + usedThumbX, this, "onMotionGestureEvent");
        }
        //logUtil.put("old value: " + this.value, this, "onMotionGestureEvent");
        int value = (100 * usedThumbX / width);
        if(value > 100) {
            value = 100;
        }

        this.setValue(value);
    }
    
    public int getThumbDx() {
        return this.animationInterfaceArray[3].getDx();
    }
    
    public int getThumbWidth() {
        //TWB - ImageBaseRotationAnimation only
        return this.animationInterfaceArray[3].getWidth();
    }
    
    public int getValue() {
        return value;
    }

    public void setFocus(final boolean hasFocus) {
        this.hasFocus = hasFocus;
    }
}
