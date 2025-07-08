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
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.string.CommonSeps;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.CircularIndexUtil;

/**
 *
 * @author User
 */
public class GDRectOnlyPrimitiveDrawing extends Animation {
    protected final LogUtil logUtil = LogUtil.getInstance();

    
    private final Animation colorAnimation = new Animation() {};
    private final ARectangleFilledAnimation rectangleFilledAnimation = new ARectangleFilledAnimation();
    
    @Override
    public void nextFrame() {
        
    }

    public void addFillColor(final BasicColor basicColor) {
                
        colorAnimation.setBasicColor(basicColor);
    }

    public void addFillRectangle(final int x, final int y, final int x2, final int y2) {
        
        rectangleFilledAnimation.x = x;
        rectangleFilledAnimation.y = y;
        rectangleFilledAnimation.width = x2 - x;
        rectangleFilledAnimation.height = y2 - y;
        
        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("addFillRectangle: ").append(x).append(CommonSeps.getInstance().COMMA).append(y).append(CommonSeps.getInstance().COMMA).append(x2).append(CommonSeps.getInstance().COMMA).append(y2).toString(), this, commonStrings.PROCESS));
        //LogUtil.put(LogFactory.getInstance("addFillRectangle: " + this.animationListArray[this.circularIndexUtil.getIndex()].size(), this, commonStrings.PROCESS));
    }

    public void paint(final Graphics graphics, final int x, final int y)
    {
        colorAnimation.paint(graphics, x, y);
        rectangleFilledAnimation.paint(graphics, x, y);
    }

    public void paintThreed(final Graphics graphics, final int x, final int y, final int z)
    {
    }
        
}
