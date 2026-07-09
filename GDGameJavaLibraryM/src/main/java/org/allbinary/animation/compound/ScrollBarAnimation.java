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

import org.allbinary.J2MEUtil;
import org.allbinary.animation.AnimationBehavior;
import org.allbinary.animation.IndexedAnimation;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.PrimitiveIntUtil;

/**
 *
 * @author Berthelot, Travis
 * @version 1.0
 */
//Similar to Slider
public class ScrollBarAnimation 
    extends IndexedAnimation
    //implements IndexedAnimationInterface
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private IndexedAnimation[] animationInterfaceArray;

    private final int width;
    private final int height;
    
    private int dy;

    private int value;

    protected boolean hasFocus;

    public ScrollBarAnimation(final IndexedAnimation[] animationInterfaceArray, final int width, final int height, final AnimationBehavior animationBehavior)
    {
        super(animationBehavior);
        
        this.animationInterfaceArray = animationInterfaceArray;
        
        this.dy = this.animationInterfaceArray[3].getDy();
        
        this.width = width;
        this.height = height;

    }
    
    private int dxhack() {
        //TWB - Hack for HTML5 build
        if(J2MEUtil.isHTML()) {
            return this.height * 2 / 3;
        } else {
            return this.height;
        }
    }

    @Override    
    public void setFrame(final int frameIndex)
    {
        for(int index = this.animationInterfaceArray.length; --index >= 0;)
        {
            this.animationInterfaceArray[index].setFrame(frameIndex);
        }
    }

    @Override
    public int getFrame()
    {
        return this.animationInterfaceArray[0].getFrame();
    }

    @Override
    public int getSize()
    {
        return this.animationInterfaceArray[0].getSize();
    }

    @Override
    public void previousFrame()
    {
        for(int index = this.animationInterfaceArray.length; --index >= 0;)
        {
            this.animationInterfaceArray[index].previousFrame();
        }
    }

    @Override
    public void setSequence(final int[] sequence)
    {
    }

    @Override
    public int[] getSequence()
    {
        return PrimitiveIntUtil.getArrayInstance();
    }

    @Override
    public void nextFrame() throws Exception
    {
        for(int index = this.animationInterfaceArray.length; --index >= 0;)
        {
            this.animationInterfaceArray[index].nextFrame();
        }
    }

    @Override
    public void paintXY(final Graphics graphics, final int x, final int y)
    {
        int size = this.animationInterfaceArray.length;
        for(int index = 0; index < size; index++)
        {
            this.animationInterfaceArray[index].paintXY(graphics, x, y);
        }
        
//        if(this.hasFocus) {
//            graphics.setColor(BasicColorFactory.getInstance().YELLOW.intValue());
//            graphics.drawRect(x - 1, y - 1, width + 1, height + 1);
//        }
    }

    @Override
    public void paintThreedXYZ(final Graphics graphics, final int x, final int y, final int z)
    {
        int size = this.animationInterfaceArray.length;
        for(int index = 0; index < size; index++)
        {
            this.animationInterfaceArray[index].paintThreedXYZ(graphics, x, y, z);
        }
    }
    
    /**
     * @return the animationInterfaceArray
     */
    public IndexedAnimation[] getAnimationInterfaceArray()
    {
        return this.animationInterfaceArray;
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
            final int newDy = this.dy + (value * this.height / 100);
            this.animationInterfaceArray[3].setDy(newDy);

        }
    }

    public void setValue2(final int thumbY) {
        //logUtil.put("old thumbX: " + this.animationInterfaceArray[3].getDy(), this, "onMotionGestureEvent");
        //logUtil.put("thumbX: " + thumbX, this, "onMotionGestureEvent");
        int usedThumbX = thumbY;
        final int maxY = this.height;
        if(thumbY >= this.dy && thumbY < this.dy + this.height) {
        } else if(thumbY < 0) {
            usedThumbX = 0;
            //logUtil.put("min thumbX: " + usedThumbX, this, "onMotionGestureEvent");
        } else if(thumbY > maxY) {
            usedThumbX = maxY;
            //logUtil.put("max thumbX: " + usedThumbX, this, "onMotionGestureEvent");
        }
        //logUtil.put("old value: " + this.value, this, "onMotionGestureEvent");
        int value = (100 * usedThumbX / this.height);
        if(value > 100) {
            value = 100;
        }

        this.setValue(value);
    }
    
    public int getThumbDy() {
        return this.animationInterfaceArray[3].getDy();
    }
    
    public int getThumbHeight() {
        //TWB - ImageBaseRotationAnimation only
        return this.animationInterfaceArray[3].getHeight();
    }
    
    public int getValue() {
        return this.value;
    }

    public void setFocus(final boolean hasFocus) {
        this.hasFocus = hasFocus;
    }
}
