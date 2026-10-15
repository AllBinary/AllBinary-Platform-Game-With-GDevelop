/*
 * AllBinary Open License Version 1
 * Copyright (c) 2026 AllBinary
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

import org.allbinary.logic.util.event.AllBinaryEventObject;

/**
 *
 * @author User
 */
public class GDMotionGestureEventListener implements BaseMotionGestureEventListener {

    public static final GDMotionGestureEventListener NULL_GD_MOTION_GESTURE_EVENT_LISTENER = new GDMotionGestureEventListener();
    
    public boolean initialized = false;

    @Override
    public void onEvent(final AllBinaryEventObject eventObject) {
    }

    @Override
    public void onMotionGestureEvent(final MotionGestureEvent motionGestureEvent) {
    }

    @Override
    public void onScrolledMotionGestureEvent(MotionGestureEvent motionGestureEvent) {
    }

}
