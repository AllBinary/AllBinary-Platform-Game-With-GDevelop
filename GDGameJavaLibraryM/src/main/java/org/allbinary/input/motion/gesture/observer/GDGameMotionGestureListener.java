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
package org.allbinary.input.motion.gesture.observer;

import org.allbinary.game.canvas.ABToGBUtil;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
import org.allbinary.graphics.GPoint;
import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
import org.allbinary.logic.communication.log.ForcedLogUtil;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.util.event.AllBinaryEventObject;
import org.allbinary.math.RectangleCollisionUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;

public class GDGameMotionGestureListener implements MotionGestureEventListener
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final RectangleCollisionUtil rectangleCollisionUtil = RectangleCollisionUtil.getInstance();

    private BasicArrayList gameLayerDraggedList = new BasicArrayList();

    public GDGameMotionGestureListener()
    {
        logUtil.put(commonStrings.START, this, commonStrings.CONSTRUCTOR);
    }

    @Override
    public void onEvent(AllBinaryEventObject eventObject)
    {
        ForcedLogUtil.log(commonStrings.NOT_IMPLEMENTED, this);
    }

    @Override
    public void onUpMotionGestureEvent(MotionGestureEvent ev)
    {
        onMotionGestureEvent(ev);
    }

    @Override
    public void onDownMotionGestureEvent(MotionGestureEvent ev)
    {
        onMotionGestureEvent(ev);
    }

    @Override
    public void onLeftMotionGestureEvent(MotionGestureEvent ev)
    {
        onMotionGestureEvent(ev);
    }

    @Override
    public void onRightMotionGestureEvent(MotionGestureEvent ev)
    {
        onMotionGestureEvent(ev);
    }

    @Override
    public void onDiagonalDownRightMotionGestureEvent(MotionGestureEvent ev)
    {
        onMotionGestureEvent(ev);
    }

    @Override
    public void onDiagonalDownLeftMotionGestureEvent(MotionGestureEvent ev)
    {
        onMotionGestureEvent(ev);
    }

    @Override
    public void onDiagonalUpRightMotionGestureEvent(MotionGestureEvent ev)
    {
        onMotionGestureEvent(ev);
    }

    @Override
    public void onDiagonalUpLeftMotionGestureEvent(MotionGestureEvent ev)
    {
        onMotionGestureEvent(ev);
    }

    @Override
    public void onPressedMotionGestureEvent(MotionGestureEvent ev)
    {   
        final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
        final AllBinaryGameLayerManager allBinaryGameLayerManager = abToGBUtil.allBinaryGameLayerManager;
     
        final GPoint point = ev.getCurrentPoint();
        //logUtil.put(point.toString(), this, "press");
        
        final int size = allBinaryGameLayerManager.getSize();
        
        CollidableDestroyableDamageableLayer draggableGameLayer;
        for(int index = 0; index < size; index++) {
            draggableGameLayer = (CollidableDestroyableDamageableLayer) allBinaryGameLayerManager.getLayerAt(index);
            
            if(gameLayerDraggedList.size() == 0) {
                if (draggableGameLayer.isDraggable) {
                    //logUtil.put(draggableGameLayer.toString(), this, "press");

                    if (rectangleCollisionUtil.isInside(draggableGameLayer.getXP(), draggableGameLayer.getYP(), draggableGameLayer.getX2(), draggableGameLayer.getY2(), point.getX(), point.getY())) {
                        //logUtil.put(draggableGameLayer.toString(), this, "press");
                        draggableGameLayer.isDragged = true;
                        gameLayerDraggedList.add(draggableGameLayer);
                    }
                }
            }

        }
        
    }
    
    @Override
    public void released(MotionGestureEvent ev)
    {
        try
        {
            //logUtil.put(commonStrings.START, this, "release");

            final int size = gameLayerDraggedList.size();
            
            CollidableDestroyableDamageableLayer draggableGameLayer;
            for(int index = 0; index < size; index++) {
                draggableGameLayer = (CollidableDestroyableDamageableLayer) gameLayerDraggedList.get(index);
                draggableGameLayer.isDragged = false;
            }
            gameLayerDraggedList.clear();
        }
        catch (Exception e)
        {
           final StringMaker stringBuffer = new StringMaker();

           stringBuffer.append(commonStrings.EXCEPTION_LABEL);
           stringBuffer.append(StringUtil.getInstance().toString(ev.getMotionGesture()));

           logUtil.put(stringBuffer.toString(), this, "release", e);
        }
    }

    @Override
    public void onMotionGestureEvent(MotionGestureEvent ev)
    {
        try
        {
            final MotionGestureInput motionGestureInput = ev.getMotionGesture();
            if (motionGestureInput == TouchMotionGestureFactory.getInstance().PRESSED)
            {
                this.onPressedMotionGestureEvent(ev);
            }
            else if (motionGestureInput == TouchMotionGestureFactory.getInstance().RELEASED)
            {
                this.released(ev);
            }
        }
        catch (Exception e)
        {
            final StringMaker stringBuffer = new StringMaker();

            stringBuffer.append(commonStrings.EXCEPTION_LABEL);
            stringBuffer.append(StringUtil.getInstance().toString(ev.getMotionGesture()));

            logUtil.put(stringBuffer.toString(), this, "onMotionGestureEvent", e);
        }
    }
}
