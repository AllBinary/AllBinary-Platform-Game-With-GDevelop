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

    public int angle;
    public int movement_angle;
    
    public int animation;
    
    public int opacity;
    
    public GDObject(final String unknown, final int x, final int y, final String name) {
        this.x = x;
        this.y = y;
        
        this.name = name;
    }

    public int Width(final Object nullObject) {
        return 0;
    }
    
    public int Width(final Graphics graphics) {
        return 0;
    }

    public int Height(final Object nullObject) {
        return 0;
    }
    
    public int Height(final Graphics graphics) {
        return 0;
    }
    
    public int X() {
        return this.x;
    }

    public int Y() {
        return this.y;
    }
    
    public int PointX(String name) {
        return 0;
    }

    public int PointY(String name) {
        return 0;
    }
    
    public int Angle() {
        return this.angle;
    }
    
    public String toString() {
        final GDObjectStrings gdObjectStrings = GDObjectStrings.getInstance();

        final StringBuilder stringBuilder = new StringBuilder();
        return stringBuilder.append(gdObjectStrings.NAME).append(this.name)
                .append(gdObjectStrings.ANIMATION).append(this.animation)
                .append(gdObjectStrings.ANGLE).append(this.angle)
                .append(gdObjectStrings.MOVEMENT_ANGLE).append(this.movement_angle)
                .append(gdObjectStrings.ROTATION).append(this.rotation)
                .toString();
    }
}
