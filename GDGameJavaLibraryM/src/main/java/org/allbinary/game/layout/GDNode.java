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
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDNode
{
    public final CollidableCompositeLayer[] gameLayerArray = new CollidableCompositeLayer[5];

    public void clear() {
        for(int index = 0; index < 5; index++) {
            gameLayerArray[index] = null;
        }
    }
    
    public void clear2() {
        this.clear();
    }
    
    public void process() {
        
    }

    public void processReleased() {
        
    }
    
    public boolean process(final BasicArrayList gameLayerList, final int index) throws Exception {
        return false;
    }

    public boolean process(final int index) throws Exception {
        return false;
    }
    
    public void processEnd(final int index) throws Exception {
    }
    
    public void processN(final GDNode gdNode, final BasicArrayList gdNodeList) {
        
    }

    public boolean process(final GDObject gdObject) {
        return true;
    }

    public boolean processReleased(final GDObject gdObject) {
        return true;
    }
    
    public void processG(final GDObject gdObject, final Graphics graphics) {
        
    }

    public void process(final MotionGestureEvent motionGestureEvent) {
        
    }

    public void processM(final CollidableCompositeLayer[] gameLayerArray, final GDNode gdNode, final BasicArrayList gdNodeList) {
        
    }
    
    public void processGD(final GDGameLayer gameLayer, final GDObject gdObject) {
        
    }
    
}
