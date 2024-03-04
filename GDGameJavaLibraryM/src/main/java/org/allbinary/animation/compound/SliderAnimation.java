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
import org.allbinary.animation.image.ImageBaseRotationAnimation;
import org.allbinary.animation.text.CustomTextAnimation;
import org.allbinary.logic.communication.log.LogFactory;
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
    private IndexedAnimation[] animationInterfaceArray;

    private final int width;
    private final int height;
    
    private int dx;

    private int value;
    
    public SliderAnimation(final IndexedAnimation[] animationInterfaceArray, final int width, final int height, final AnimationBehavior animationBehavior)
    {
        super(animationBehavior);
        
        this.animationInterfaceArray = animationInterfaceArray;
        
        this.dx = this.animationInterfaceArray[3].getDx();
        
        this.width = width;
        this.height = height;
        
        ((CustomTextAnimation) this.animationInterfaceArray[4]).setDy(-height / 4);
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
        if(value >= 0 && value < 100) {
            this.value = value;
            final int newDx = dx + (value * width / 100);
            this.animationInterfaceArray[3].setDx(newDx);
            
            final CustomTextAnimation customTextAnimation = ((CustomTextAnimation) this.animationInterfaceArray[4]);
            customTextAnimation.setDx(newDx + this.getThumbWidth() / 2 - customTextAnimation.getWidth() / 2);
            customTextAnimation.setText(Integer.toString(this.value - 1));
        
        }
    }

    public void setValue2(final int thumbX) {
        LogUtil.put(LogFactory.getInstance("old thumbX: " + this.animationInterfaceArray[3].getDx(), this, "onMotionGestureEvent"));
        LogUtil.put(LogFactory.getInstance("thumbX: " + thumbX, this, "onMotionGestureEvent"));
        int usedThumbX = thumbX;
        int maxX = dx + width - (width / 100);
        if(thumbX >= dx && thumbX < dx + width) {
        } else if(thumbX < dx) {
            usedThumbX = dx;
            LogUtil.put(LogFactory.getInstance("min thumbX: " + usedThumbX, this, "onMotionGestureEvent"));
        } else if(thumbX > maxX) {
            usedThumbX = maxX;
            LogUtil.put(LogFactory.getInstance("max thumbX: " + usedThumbX, this, "onMotionGestureEvent"));
        }
        LogUtil.put(LogFactory.getInstance("old value: " + this.value, this, "onMotionGestureEvent"));
        this.value = (100 * usedThumbX / width);
        LogUtil.put(LogFactory.getInstance("new value: " + this.value, this, "onMotionGestureEvent"));
        this.animationInterfaceArray[3].setDx(usedThumbX);

        final CustomTextAnimation customTextAnimation = ((CustomTextAnimation) this.animationInterfaceArray[4]);
        customTextAnimation.setDx(usedThumbX + this.getThumbWidth() / 2 - customTextAnimation.getWidth() / 2);
        customTextAnimation.setText(Integer.toString(this.value - 1));
    }
    
    public int getThumbDx() {
        return this.animationInterfaceArray[3].getDx();
    }
    
    public int getThumbWidth() {
        return ((ImageBaseRotationAnimation) this.animationInterfaceArray[3]).getWidth();
    }
    
    public int getValue() {
        return value;
    }

}
