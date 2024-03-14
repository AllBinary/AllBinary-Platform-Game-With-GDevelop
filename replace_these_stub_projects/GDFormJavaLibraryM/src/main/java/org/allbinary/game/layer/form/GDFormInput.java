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
package org.allbinary.game.layer.form;

import org.allbinary.game.input.event.DownGameKeyEventListenerInterface;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.input.event.RawKeyEventListener;
import org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
import org.allbinary.logic.util.event.AllBinaryEventObject;

/**
 *
 * @author User
 */
public class GDFormInput 
    implements DownGameKeyEventListenerInterface, BaseMotionGestureEventListener //, RawKeyEventListener, UpGameKeyEventListenerInterface, GameKeyEventListenerInterface 
{
    
    //@Override
    public void onEvent(final int keyCode, final int deviceId, final boolean repeated) {

    }

    //@Override
    public void onEvent(AllBinaryEventObject eventObject) {

    }
    
    public void onPressGameKeyEvent(GameKeyEvent gameKeyEvent) {

    }

    public void onDownGameKeyEvent(GameKeyEvent gameKeyEvent) {

    }

    public void onUpGameKeyEvent(GameKeyEvent gameKeyEvent) {

    }

    @Override
    public void onMotionGestureEvent(final MotionGestureEvent motionGestureEvent) {

    }
    
    public void keyPressed(int keyCode) {

    }

    public void keyReleased(int keyCode) {

    }

//    public void keyRepeated(int keyCode) {

//    }

    public void keyPressed(int keyCode, int deviceId) {

    }
    
    public void keyReleased(int keyCode, int deviceId) {

    }

    public void reset() {
        
    }    
}
