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
import org.allbinary.graphics.SpacialStrings;
import org.allbinary.logic.basic.string.CommonSeps;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.math.FrameUtil;
import org.allbinary.math.PositionStrings;

/**
 *
 * @author User
 */
public class GDObject
{
    public final String name;
    
    public int x;
    public int y;
    public int zOrder;
    
    public int rotation;

    public short angle;
    public int movement_angle;
    
    public int animation;
    
    public int opacity;
    
    public int width;
    public int height;
    
    public GDObject(final String unknown, final int x, final int y, final String name) {
        this.x = x;
        this.y = y;
        
        this.name = name;
    }

    public int Width(final Object nullObject) {
        return width;
    }
    
    public int Width(final Graphics graphics) {
        return width;
    }

    public int Height(final Object nullObject) {
        return height;
    }
    
    public int Height(final Graphics graphics) {
        return height;
    }
    
    public int X() {
        return this.x;
    }

    public int Y() {
        return this.y;
    }
    
    public int PointX(final String name) {
        return this.x;
    }

    public int PointY(final String name) {
        return this.y;
    }
    
    public void setAngle(final short angle, final GDGameLayer gameLayer) {
        
        //int adjustedAngle = angle - 270;
        int adjustedAngle = angle;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }

        //final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
        //LogUtil.put(LogFactory.getInstance(new StringBuilder()
                //.append(objectStrings.ANGLE).append(angle)
                //.append(objectStrings.ANGLE).append(adjustedAngle).toString(), this, objectStrings.ANGLE));

        this.angle = (short) adjustedAngle;
        
        if(gameLayer != null) {
            gameLayer.setAngle(angle);
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
        final GDObjectStrings gdObjectStrings = GDObjectStrings.getInstance();
        final PositionStrings positionStrings = PositionStrings.getInstance();
        final SpacialStrings spacialStrings = SpacialStrings.getInstance();

        final StringBuilder stringBuilder = new StringBuilder();
        return stringBuilder.append(gdObjectStrings.GDOBJECT).append(CommonSeps.getInstance().COLON)
                .append(gdObjectStrings.NAME).append(this.name)
                .append(positionStrings.X_LABEL).append(this.x)
                .append(positionStrings.Y_LABEL).append(this.y)
                .append(positionStrings.Z_LABEL).append(this.zOrder)
                .append(spacialStrings.WIDTH_LABEL).append(this.width)
                .append(spacialStrings.HEIGHT_LABEL).append(this.height)
                .append(gdObjectStrings.ANIMATION).append(this.animation)
                .append(gdObjectStrings.ANGLE).append(this.angle)
                .append(gdObjectStrings.MOVEMENT_ANGLE).append(this.movement_angle)
                .append(gdObjectStrings.ROTATION).append(this.rotation)
                .toString();
    }
}
