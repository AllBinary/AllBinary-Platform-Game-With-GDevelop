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
package org.allbinary.game.layer;

import javax.microedition.lcdui.Graphics;

import org.allbinary.animation.Animation;
import org.allbinary.animation.vector.ARectangleFilledAnimation;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDRectOnlyPrimitiveDrawing extends Animation {
    protected final LogUtil logUtil = LogUtil.getInstance();

    
    //private final Animation colorAnimation = new Animation() {};
    private final ARectangleFilledAnimation rectangleFilledAnimation = new ARectangleFilledAnimation();
    
    public int x;
    public int y;
    
    @Override
    public void nextFrame() {
        
    }

    public void addFillColor(final BasicColor basicColor) {
                
        //this.colorAnimation.setBasicColorP(basicColor);
        this.rectangleFilledAnimation.setBasicColorP(basicColor);
    }

    public void addFillRectangle(final int x, final int y, final int x2, final int y2) {
        
        this.rectangleFilledAnimation.x = x;
        this.rectangleFilledAnimation.y = y;
        this.rectangleFilledAnimation.setWidth(x2 - x);
        this.rectangleFilledAnimation.setHeight(y2 - y);
        
        //logUtil.put(new StringMaker().append("addFillRectangle: ").append(x).append(CommonSeps.getInstance().COMMA).append(y).append(CommonSeps.getInstance().COMMA).append(x2).append(CommonSeps.getInstance().COMMA).append(y2).toString(), this, commonStrings.PROCESS);
        //logUtil.put("addFillRectangle: " + this.animationListArray[this.circularIndexUtil.getIndex()].size(), this, commonStrings.PROCESS);
    }

    @Override
    public void paintXY(final Graphics graphics, final int x, final int y)
    {
        //Primitive are not tied to the Game Object location.
        //this.colorAnimation.paintXY(graphics, this.x, this.y);
        this.rectangleFilledAnimation.paintXY(graphics, this.x, this.y);
    }

    @Override
    public void paintThreedXYZ(final Graphics graphics, final int x, final int y, final int z)
    {
    }
        
}
