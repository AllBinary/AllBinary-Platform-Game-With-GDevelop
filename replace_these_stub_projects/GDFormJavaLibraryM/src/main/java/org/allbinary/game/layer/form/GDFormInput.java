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

import org.allbinary.game.input.KeyInterface;
import org.allbinary.game.input.event.DownGameKeyEventListenerInterface;
import org.allbinary.game.input.event.DownKeyEventListenerInterface;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.input.event.GameKeyEventListenerInterface;
import org.allbinary.game.input.event.RawKeyEventListener;
import org.allbinary.game.input.event.UpGameKeyEventListenerInterface;
import org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
import org.allbinary.logic.util.event.AllBinaryEventObject;

/**
 *
 * @author User
 */
public class GDFormInput
        implements KeyInterface, DownGameKeyEventListenerInterface, BaseMotionGestureEventListener, RawKeyEventListener, DownKeyEventListenerInterface //, UpGameKeyEventListenerInterface, GameKeyEventListenerInterface
{

    @Override
    public void onEventRaw(final int keyCode, final int deviceId, final boolean repeated) {

    }

    @Override
    public void onEvent(AllBinaryEventObject eventObject) {

    }

    //@Override
    public void onPressGameKeyEvent(GameKeyEvent gameKeyEvent) {

    }

    @Override
    public void onDownGameKeyEvent(GameKeyEvent gameKeyEvent) {

    }

    @Override
    public void onDownKeyEvent(final GameKeyEvent keyInteger) throws Exception {

    }

    @Override
    public void onDownKey(final Integer keyInteger) throws Exception {

    }

    public void onUpGameKeyEvent(GameKeyEvent gameKeyEvent) {

    }

    @Override
    public void onMotionGestureEvent(final MotionGestureEvent motionGestureEvent) {

    }

    @Override
    public void keyPressed(int keyCode) {

    }

    @Override
    public void keyReleased(int keyCode) {

    }

//    public void keyRepeated(int keyCode) {

//    }

    @Override
    public void keyPressedByDevice(int keyCode, int deviceId) {

    }

    @Override
    public void keyReleasedByDevice(int keyCode, int deviceId) {

    }

    //@Override
    public void reset() {

    }

}
