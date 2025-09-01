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
import org.allbinary.game.layer.behavior.GDBehavior;
import org.allbinary.game.layer.behavior.GDBehaviorUtil;
import org.allbinary.graphics.GPoint;
import org.allbinary.graphics.GraphicsStrings;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.math.NoDecimalTrigTable;
import org.allbinary.math.PositionStrings;
import org.allbinary.string.CommonLabels;

/**
 *
 * @author User
 */
public class GDObject
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final NoDecimalTrigTable noDecimalTrigTable = NoDecimalTrigTable.getInstance();
    
    public GDInitialVariables initialVariables = GDInitialVariables.getInstance();

    //public boolean debug = false;
    
    public final String name;
    public final String type;
    
    public final GDBehavior[] behaviorArray = new GDBehavior[GDBehaviorUtil.getInstance().MAX];
    public final boolean[] isBehaviorEnabledArray = new boolean[10]; //BEHAVIOR_MAX
    public final boolean[] hasBehaviorArray = new boolean[10]; //BEHAVIOR_MAX
    
    public int x;
    public int y;

    public int zOrder;
    
    public int rotation;
    public int rotationZ;

    public short angle;
    public int movement_angle;
    
    public float scaleX = 1.0f;
    public float scaleY = 1.0f;
    public float initScaleX = 1.0f;
    public float initScaleY = 1.0f;
    
    public float customScale = 1.0f;

    public int animation;
    public float timeScale = 1.0f;
    
    public float opacity = 255;
    public BasicColor basicColor;

//    public int canvasWidth;
//    public int canvasHeight;
    
    public int width;
    public int height;
    private int halfWidth;
    private int halfHeight;
        
    public boolean updateSinceSetAngle;
    
    public GDObject(final String unknown, final int x, final int y, final int zOrder, final int width, final int height, final String name, final String type) {
        this.x = x;
        this.y = y;
        this.zOrder = zOrder;
        
        this.name = name;
        this.type = type;
        
        this.updateSize(width, height);
        
        //TWB - validate name only occurs 1 time here
//            final org.allbinary.game.canvas.GD1SpecialAnimationGlobals globals1 = 
//                org.allbinary.game.canvas.GD1SpecialAnimationGlobals.getInstance();
//            if(name.compareTo(globals1.NAME) == 0) {
//                if(name != globals1._NAME) {
//                    throw new RuntimeException();
//                }
//            }

    }

    public void updateScale(final float scaleX, final float scaleY) {
        this.initScaleX = scaleX;
        this.initScaleY = scaleY;
        this.updateSize((int) (this.width * scaleX), (int) (this.height * scaleY));
    }
    
    public void updateSize(final int width, final int height) {
        this.width = width;
        this.height = height;
        this.halfWidth = width / 2;
        this.halfHeight = height / 2;
    }

    public String getAnimationFromIndex(final int index) {
        return null;
    }

    public String getAnimation(final String animationName) {
        throw new RuntimeException();
    }

    public boolean setAnimation(final String animationName) {
        return false;
    }

    public int Width(final Graphics graphics) {
        //return canvasWidth;
        return width;
    }
    
    public int Height(final Graphics graphics) {
        //return canvasHeight;
        return height;
    }
   
    public void setX(final double x) {
        this.setX((int) x);
    }
    
    //private static final String MAP = "Map";

    public void setX(final int x) {
        //final int lastWidth = GameTickDisplayInfoSingleton.getInstance().getLastWidth();
//        if(x > lastWidth) {
//            logUtil.put("GameTickDisplayInfoSingleton lastWidth: " + lastWidth, this, "setX", new Exception());
//            this.x = lastWidth;
//        } else {
           this.x = x;
//        }

//        if(this.name.indexOf(MAP) >= 0) {
//            logUtil.put("GDGameLevelLevelBuilder x: " + this.x, this, "setX");
//        }
    }

    public void setY(final double y) {
        this.setY((int) y);
    }

    public void setY(final int y) {
        //final int lastHeight = GameTickDisplayInfoSingleton.getInstance().getLastHeight();
//        if(y > lastHeight) {
//            logUtil.put("GameTickDisplayInfoSingleton lastHeight: " + lastHeight, this, "setX", new Exception());
//            this.y = lastHeight;
//        } else {
           this.y = y;
//        }

//        if(this.name.indexOf(MAP) >= 0) {
//            logUtil.put("GDGameLevelLevelBuilder y: " + this.y, this, "setY");
//        }
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
    
    //private final StringMaker stringBuilder = new StringMaker();
    public int PointX(final GPoint point) {
        
        int adjustedAngle = angle;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }

        final int x = (int) (noDecimalTrigTable.cos((short) adjustedAngle) * (point.getX() - this.halfWidth - (this.halfWidth / 2))) / noDecimalTrigTable.SCALE;

        //F <x>32</x>, <y>16</y>
        //E <x>0</x>, <y>16</y>        
        //final int y = (int) (noDecimalTrigTable.sin((short) adjustedAngle) * 16) / noDecimalTrigTable.SCALE;
        //final int x = (int) (noDecimalTrigTable.cos((short) adjustedAngle) * 16) / noDecimalTrigTable.SCALE;
        //final int x2 = (int) (noDecimalTrigTable.cos((short) adjustedAngle) * -16) / noDecimalTrigTable.SCALE;
        //final int y2 = (int) (noDecimalTrigTable.sin((short) adjustedAngle) * -16) / noDecimalTrigTable.SCALE;

        //final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
        //stringBuilder.delete(0, stringBuilder.length());
        //logUtil.put(commonStrings.PROCESS, this, stringBuilder.append(commonStrings.EXCEPTION_LABEL).append('g').append(objectStrings.ANGLE).append(adjustedAngle).append(':').append(this.x).append(':').append(x).append(':').append(halfWidth).toString());

        // + this.width
        return (int) (this.x + (x * 0.75f) + this.halfWidth);
        //return this.x;
    }

    public int PointY(final GPoint point) {
        
        int adjustedAngle = angle;
        while (adjustedAngle > 359) {
            adjustedAngle -= 360;
        }
        while (adjustedAngle < 0) {
            adjustedAngle += 360;
        }

        if(point.getX() > this.halfWidth) {
            final int y = (int) (noDecimalTrigTable.sin((short) adjustedAngle) * (point.getY() - (this.halfHeight / 2))) / noDecimalTrigTable.SCALE;
            return this.y + y + this.halfHeight;
        } else {
            final int y = (int) (noDecimalTrigTable.sin((short) adjustedAngle) * -(point.getY() - (this.halfHeight / 2))) / noDecimalTrigTable.SCALE;
            return this.y + y + this.halfHeight;
        }

        //return this.y;
    }

    public void setAngle(final short angle) {
//        if(debug) {
//            logUtil.put("setAngle: " + angle, this, "setAngle");
//        }
        this.angle = angle;
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
        
//        final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
//        logUtil.put(new StringMaker()
//            .append(gameLayer.getName())
//            .append(objectStrings.ANGLE).append(angle)
//            .append(objectStrings.ANGLE).append(adjustedAngle).toString(), this, objectStrings.ANGLE);

        //this.setAngle(adjustedAngle);
        this.angle = adjustedAngle;

        if (gameLayer != null) {
            gameLayer.setRotation(adjustedAngle);
        } else {
            final GraphicsStrings graphicsStrings = GraphicsStrings.getInstance();
            final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
            logUtil.put(objectStrings.GD_GAME_LAYER_WAS_NULL, this, graphicsStrings.ANGLE);
        }
    }
         
    public short Angle(final GDGameLayer gameLayer) {
        return this.angle;
    }

    public short Angle() {
        
        //final GDObjectStrings objectStrings = GDObjectStrings.getInstance();
        //logUtil.put(new StringMaker()
                //.append(objectStrings.ANGLE).append(angle).toString(), this, objectStrings.ANGLE);
        
        return this.angle;
    }
    
    public int Variable(final int value)
    {
        return value;
    }

    public float Variable(final float value)
    {
        return value;
    }

    public int VariableChildCount(final int[] array) {
        return array.length;
    }

    public int VariableChildCount(final String[] array) {
        return array.length;
    }

    public String ObjectName() {
        return this.name;
    }
    
    public void reset() {
        
    }

    public GDBehavior getBehavior(final int index) {
        return (GDBehavior) this.behaviorArray[index];
    }

    public String toShortString() {
        final CommonSeps commonSeps = CommonSeps.getInstance();
        final GDObjectStrings gdObjectStrings = GDObjectStrings.getInstance();
        final PositionStrings positionStrings = PositionStrings.getInstance();
        final CommonLabels commonLabels = CommonLabels.getInstance();

        final StringMaker stringBuilder = new StringMaker();
        return stringBuilder.append(gdObjectStrings.GDOBJECT).append(CommonSeps.getInstance().COLON)
                .append(this.name)
                .append(commonSeps.SPACE)
                .append(positionStrings.X_LABEL).append(this.x)
                .append(positionStrings.Y_LABEL).append(this.y)
                .append(commonLabels.WIDTH_LABEL).append(this.width)
                .append(commonLabels.HEIGHT_LABEL).append(this.height)
                .toString();
    }

    public String toString() {
        final CommonSeps commonSeps = CommonSeps.getInstance();
        final GraphicsStrings graphicsStrings = GraphicsStrings.getInstance();
        final PositionStrings positionStrings = PositionStrings.getInstance();
        final CommonLabels commonLabels = CommonLabels.getInstance();
        final GDObjectStrings gdObjectStrings = GDObjectStrings.getInstance();

        final StringMaker stringBuilder = new StringMaker();
        return stringBuilder.append(gdObjectStrings.GDOBJECT).append(CommonSeps.getInstance().COLON)
                .append(this.name).append(this.hashCode())
                .append(commonSeps.SPACE)
                .append(positionStrings.X_LABEL).append(this.x)
                .append(positionStrings.Y_LABEL).append(this.y)
                .append(commonSeps.SPACE)
                .append(positionStrings.Z_LABEL).append(this.zOrder)
//                .append(commonSeps.SPACE)
//                .append(commonLabels.WIDTH_LABEL).append(this.canvasWidth)
//                .append(commonSeps.SPACE)
//                .append(commonLabels.HEIGHT_LABEL).append(this.canvasHeight)
                .append(commonSeps.SPACE)
                .append(commonLabels.WIDTH_LABEL).append(this.width)
                .append(commonSeps.SPACE)
                .append(commonLabels.HEIGHT_LABEL).append(this.height)
                .append(commonSeps.SPACE)
                .append(commonLabels.WIDTH_LABEL).append(this.halfWidth)
                .append(commonSeps.SPACE)
                .append(commonLabels.HEIGHT_LABEL).append(this.halfHeight)
                .append(commonSeps.SPACE)
                .append(graphicsStrings.ANIMATION).append(this.animation)
                .append(commonSeps.SPACE)
                .append(graphicsStrings.ANGLE).append(commonSeps.COLON).append(this.angle)
                .append(commonSeps.SPACE)
                .append(graphicsStrings.MOVEMENT_ANGLE).append(commonSeps.COLON).append(this.movement_angle)
                .append(commonSeps.SPACE)
                .append(graphicsStrings.ROTATION).append(commonSeps.COLON).append(this.rotation)
                .append(commonSeps.SPACE)
                .append(graphicsStrings.OPACITY).append(commonSeps.COLON).append(this.opacity)
                .toString();
    }
}
