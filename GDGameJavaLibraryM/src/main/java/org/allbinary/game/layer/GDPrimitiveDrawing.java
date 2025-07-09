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
public class GDPrimitiveDrawing extends Animation {
    protected final LogUtil logUtil = LogUtil.getInstance();

    
    public final BasicArrayList[] animationListArray = {
        new BasicArrayList(), new BasicArrayList(), new BasicArrayList(), 
        new BasicArrayList(), new BasicArrayList(), new BasicArrayList(), 
        new BasicArrayList(), new BasicArrayList(), new BasicArrayList(), 
    };

    private final CircularIndexUtil circularIndexUtil = CircularIndexUtil.getInstance(animationListArray.length);

    public final BasicArrayList colorAnimationInUseList = new BasicArrayList();
    public final BasicArrayList colorAnimationCacheList = new BasicArrayList();
    
    public final BasicArrayList aRetangleFilledAnimationInUseList = new BasicArrayList();
    public final BasicArrayList aRetangleFilledAnimationCacheList = new BasicArrayList();

    public BasicArrayList animationList = animationListArray[animationListArray.length - 1];
    
    @Override
    public void nextFrame() {
        
        this.animationList = this.animationListArray[this.circularIndexUtil.getIndex()];
        this.circularIndexUtil.next();
        //logUtil.put("nextFrame: " + this.animationListArray[this.circularIndexUtil.getIndex()].size(), this, commonStrings.PROCESS);
        this.animationListArray[this.circularIndexUtil.getIndex()].clear();
        
        this.colorAnimationCacheList.addAll(this.colorAnimationInUseList);
        this.colorAnimationInUseList.clear();
        
        this.aRetangleFilledAnimationCacheList.addAll(this.aRetangleFilledAnimationInUseList);
        this.aRetangleFilledAnimationInUseList.clear();
    }

    public void addFillColor(final BasicColor basicColor) {
        
        if(this.colorAnimationCacheList.size() == 0) {
            final Animation colorAnimation = new Animation() {};
            colorAnimation.setBasicColor(basicColor);
            this.animationListArray[this.circularIndexUtil.getIndex()].add(colorAnimation);
            this.colorAnimationInUseList.add(colorAnimation);
        } else {
            final Animation colorAnimation = (Animation) colorAnimationCacheList.remove(colorAnimationCacheList.size() - 1);
            colorAnimation.setBasicColor(basicColor);
            this.animationListArray[this.circularIndexUtil.getIndex()].add(colorAnimation);
            this.colorAnimationInUseList.add(colorAnimation);
        }

    }

    public void addFillRectangle(final int x, final int y, final int x2, final int y2) {
        
        if(this.aRetangleFilledAnimationCacheList.size() == 0) {
            final ARectangleFilledAnimation rectangleFilledAnimation = new ARectangleFilledAnimation();
            rectangleFilledAnimation.x = x;
            rectangleFilledAnimation.y = y;
            rectangleFilledAnimation.width = x2 - x;
            rectangleFilledAnimation.height = y2 - y;
            this.animationListArray[this.circularIndexUtil.getIndex()].add(rectangleFilledAnimation);
            this.aRetangleFilledAnimationInUseList.add(rectangleFilledAnimation);
        } else {
            final ARectangleFilledAnimation rectangleFilledAnimation = (ARectangleFilledAnimation) aRetangleFilledAnimationCacheList.remove(aRetangleFilledAnimationCacheList.size() - 1);
            rectangleFilledAnimation.x = x;
            rectangleFilledAnimation.y = y;
            rectangleFilledAnimation.width = x2 - x;
            rectangleFilledAnimation.height = y2 - y;
            this.animationListArray[this.circularIndexUtil.getIndex()].add(rectangleFilledAnimation);
            this.aRetangleFilledAnimationInUseList.add(rectangleFilledAnimation);
        }
        
        //logUtil.put(new StringMaker().append("addFillRectangle: ").append(x).append(CommonSeps.getInstance().COMMA).append(y).append(CommonSeps.getInstance().COMMA).append(x2).append(CommonSeps.getInstance().COMMA).append(y2).toString(), this, commonStrings.PROCESS);
        //logUtil.put("addFillRectangle: " + this.animationListArray[this.circularIndexUtil.getIndex()].size(), this, commonStrings.PROCESS);
    }

//    private int lastSize;

    public void paint(final Graphics graphics, final int x, final int y)
    {
        final BasicArrayList animationList = this.animationList;
        final int size = animationList.size();
        
//        if(lastSize != size) {
//            lastSize = size;
//            logUtil.put("TWBpaint " + size, this, commonStrings.PROCESS);
//        }

        for (int index = 0; index < size; index++) {
            ((Animation) animationList.get(index)).paint(graphics, x, y);
        }
    }

    public void paintThreed(final Graphics graphics, final int x, final int y, final int z)
    {
        final BasicArrayList animationList = this.animationList;
        final int size = animationList.size();
        for (int index = 0; index < size; index++) {
            ((Animation) animationList.get(index)).paintThreed(graphics, x, y, z);
        }
    }
        
}
