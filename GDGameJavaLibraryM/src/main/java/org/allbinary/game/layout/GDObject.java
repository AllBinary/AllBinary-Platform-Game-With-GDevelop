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
package org.allbinary.game.layout;

import javax.microedition.lcdui.Graphics;
import org.allbinary.game.layer.GDGameLayer;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.SpacialStrings;
import org.allbinary.logic.basic.string.CommonSeps;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.math.NoDecimalTrigTable;
import org.allbinary.math.PositionStrings;

/**
 *
 * @author User
 */
public class GDObject
{
    private final NoDecimalTrigTable noDecimalTrigTable = NoDecimalTrigTable.getInstance();
    
    public final String name;
    
    public int x;
    public int y;

    public int zOrder;
    
    public int rotation;

    public short angle;
    public int movement_angle;
    
    public int animation;
    
    public int opacity;
    
    public int canvasWidth;
    public int canvasHeight;
    
    public int width;
    public int height;
    public int halfWidth;
    public int halfHeight;
        
    public boolean updateSinceSetAngle;
    
    public GDObject(final String unknown, final int x, final int y, final String name) {
        this.x = x;
        this.y = y;
        
        this.name = name;
    }

    public int Width(final Graphics graphics) {
        //return canvasWidth;
        return width;
    }
    
    public int Height(final Graphics graphics) {
        //return canvasHeight;
        return height;
    }
    
    public int X() {
        return this.x;
    }

    public int Y() {
        return this.y;
    }

    public int X2() {
        return this.x + this.width;
    }

    public int Y2() {
        return this.y + this.height;
    }
    
    //private final StringBuilder stringBuilder = new StringBuilder();
    public int PointX(final GPoint point) {
        
        final short angle = this.angle;

        int adjustedAngle = angle;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }
        
        final int x = (int) (noDecimalTrigTable.cos((short) adjustedAngle) * (point.getX() - this.halfWidth)) / noDecimalTrigTable.SCALE;

        //F <x>32</x>, <y>16</y>
        //E <x>0</x>, <y>16</y>        
        //final int y = (int) (noDecimalTrigTable.sin((short) adjustedAngle) * 16) / noDecimalTrigTable.SCALE;
        //final int x = (int) (noDecimalTrigTable.cos((short) adjustedAngle) * 16) / noDecimalTrigTable.SCALE;
        //final int x2 = (int) (noDecimalTrigTable.cos((short) adjustedAngle) * -16) / noDecimalTrigTable.SCALE;
        //final int y2 = (int) (noDecimalTrigTable.sin((short) adjustedAngle) * -16) / noDecimalTrigTable.SCALE;

        //final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
        //stringBuilder.delete(0, stringBuilder.length());
        //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, stringBuilder.append(CommonStrings.getInstance().EXCEPTION_LABEL).append('g').append(objectStrings.ANGLE).append(adjustedAngle).append(':').append(this.x).append(':').append(x).append(':').append(halfWidth).toString()));
        
        return this.x + x + this.halfWidth;
        //return this.x;
    }

    public int PointY(final GPoint point) {
        
        final short angle = this.angle;

        int adjustedAngle = angle;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }

        if(point.getX() > this.halfWidth) {
            final int y = (int) (noDecimalTrigTable.sin((short) adjustedAngle) * point.getY()) / noDecimalTrigTable.SCALE;
            return this.y + y + this.halfHeight;
        } else {
            final int y = (int) (noDecimalTrigTable.sin((short) adjustedAngle) * -point.getY()) / noDecimalTrigTable.SCALE;
            return this.y + y + this.halfHeight;
        }

        //return this.y;
    }

    public void setAngle(final short angle, final GDGameLayer gameLayer) {

        this.updateSinceSetAngle = false;
        
        //int adjustedAngle = angle - 270;
        short adjustedAngle = angle;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }
        
        //final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
        //LogUtil.put(LogFactory.getInstance(new StringBuilder()
            //.append(this.name)
            //.append(objectStrings.ANGLE).append(angle)
            //.append(objectStrings.ANGLE).append(adjustedAngle).toString(), this, objectStrings.ANGLE));

        this.angle = adjustedAngle;

        if (gameLayer != null) {
            gameLayer.setRotation(adjustedAngle);
        } else {
            final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
            LogUtil.put(LogFactory.getInstance(objectStrings.GD_GAME_LAYER_WAS_NULL, this, objectStrings.ANGLE));
        }
    }
         
    public short Angle(final GDGameLayer gameLayer) {
        return this.angle;
    }

    public short Angle() {
        
        //final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
        //LogUtil.put(LogFactory.getInstance(new StringBuilder()
                //.append(objectStrings.ANGLE).append(angle).toString(), this, objectStrings.ANGLE));
        
        return this.angle;
    }

    public int Variable(final int value)
    {
        return value;
    }
    

    public String toString() {
        final CommonSeps commonSeps = CommonSeps.getInstance();
        final GDObjectStrings gdObjectStrings = GDObjectStrings.getInstance();
        final PositionStrings positionStrings = PositionStrings.getInstance();
        final SpacialStrings spacialStrings = SpacialStrings.getInstance();

        final StringBuilder stringBuilder = new StringBuilder();
        return stringBuilder.append(gdObjectStrings.GDOBJECT).append(CommonSeps.getInstance().COLON)
                .append(this.name)
                .append(commonSeps.SPACE)
                .append(positionStrings.X_LABEL).append(this.x)
                .append(positionStrings.Y_LABEL).append(this.y)
                .append(commonSeps.SPACE)
                .append(positionStrings.Z_LABEL).append(this.zOrder)
                .append(commonSeps.SPACE)
                .append(spacialStrings.WIDTH_LABEL).append(this.canvasWidth)
                .append(commonSeps.SPACE)
                .append(spacialStrings.HEIGHT_LABEL).append(this.canvasHeight)
                .append(commonSeps.SPACE)
                .append(spacialStrings.WIDTH_LABEL).append(this.width)
                .append(commonSeps.SPACE)
                .append(spacialStrings.HEIGHT_LABEL).append(this.height)
                .append(commonSeps.SPACE)
                .append(spacialStrings.WIDTH_LABEL).append(this.halfWidth)
                .append(commonSeps.SPACE)
                .append(spacialStrings.HEIGHT_LABEL).append(this.halfHeight)
                .append(commonSeps.SPACE)
                .append(gdObjectStrings.ANIMATION).append(this.animation)
                .append(commonSeps.SPACE)
                .append(gdObjectStrings.ANGLE).append(commonSeps.COLON).append(this.angle)
                .append(commonSeps.SPACE)
                .append(gdObjectStrings.MOVEMENT_ANGLE).append(commonSeps.COLON).append(this.movement_angle)
                .append(commonSeps.SPACE)
                .append(gdObjectStrings.ROTATION).append(commonSeps.COLON).append(this.rotation)
                .toString();
    }
}
