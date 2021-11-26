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
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layer.GDGameLayer;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;

/**
 *
 * @author User
 */
public class GDAction
{
    public void process() {
        
    }

    public void process(final GDObject gdObject) {
        
    }

    public void processG(final GDObject gdObject, final Graphics graphics) {
        
    }

    public void process(final MotionGestureEvent motionGestureEvent) {
        
    }

    public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2, final CollidableCompositeLayer gameLayer3) {
        this.process(gameLayer, gameLayer2);
    }

    public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2) {
        
    }

    public void processGD(final GDGameLayer gameLayer, final GDObject gdObject) {
        
    }
    
}
