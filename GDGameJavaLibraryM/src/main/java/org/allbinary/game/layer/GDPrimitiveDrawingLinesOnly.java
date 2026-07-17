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
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.layer.AllBinaryLayer;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

/**
 *
 * @author User
 */
public class GDPrimitiveDrawingLinesOnly extends Animation {
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final PointFactory pointFactory = PointFactory.getInstance();
    private final AllBinaryLayer NULL_ALLBINARY_LAYER = AllBinaryLayer.NULL_ALLBINARY_LAYER;
    
    private final Animation colorAnimation = new Animation() {};
    private final LinePathAnimation linePathAnimation = new LinePathAnimation();
    private final BasicArrayList pointList = new BasicArrayListD();
    //private final BasicArrayList strokeList = new BasicArrayListD();
    
    @Override
    public void nextFrame() {
        
    }
    
    public void clear() {
        this.pointList.clear();
    }

    public void addFillColor(final BasicColor basicColor) {
                
        this.colorAnimation.setBasicColorP(basicColor);
    }

    public void addLineV2(final int x, final int y, final int x2, final int y2, final int thickness) {

        this.pointList.add(this.pointFactory.createXY(x, y));
        this.pointList.add(this.pointFactory.createXY(x2, y2));
        //this.strokeList.add(Integer.valueOf(thickness));
        //logUtil.put(new StringMaker().append("addFillRectangle: ").append(x).append(CommonSeps.getInstance().COMMA).append(y).append(CommonSeps.getInstance().COMMA).append(x2).append(CommonSeps.getInstance().COMMA).append(y2).toString(), this, commonStrings.PROCESS);
        //logUtil.put("addFillRectangle: " + this.animationListArray[this.circularIndexUtil.getIndex()].size(), this, commonStrings.PROCESS);
    }

    @Override
    public void paintXY(final Graphics graphics, final int x, final int y)
    {
        this.colorAnimation.paintXY(graphics, x, y);

        final int size = this.pointList.size();
        GPoint point;
        GPoint nextPoint;
        //Integer thickness;
        for(int index = 1; index < size; index+=2) {

            point = (GPoint) this.pointList.get(index - 1);
            nextPoint = (GPoint) this.pointList.get(index);
            //thickness = (Integer) this.strokeList.get(index / 2);
            //Check if JSR 226 Graphics2D is available
            //(graphics instanceof Graphics2D)
            //graphics.setStroke(thickness);
            this.linePathAnimation.paint(graphics, point, nextPoint, this.NULL_ALLBINARY_LAYER);
        }

    }

    @Override
    public void paintThreedXYZ(final Graphics graphics, final int x, final int y, final int z)
    {
    }
        
}
