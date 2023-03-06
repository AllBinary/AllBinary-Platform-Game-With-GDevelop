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
    private final GDNodeStatsFactory nodeStatsFactory = GDNodeStatsFactory.getInstance();
    
    public final CollidableCompositeLayer[] gameLayerArray = new CollidableCompositeLayer[5];

    private final int name;
    
    public GDNode(final int name) {
        this.name = name;
    }
    
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

    public void processStats() {
        this.nodeStatsFactory.push(0, name);
        //this.nodeStatsFactory.totalCalls[0][name]++;
    }
    
    public void processReleased() {
    }

    public void processReleasedStats() {
        this.nodeStatsFactory.push(1, name);
        //this.nodeStatsFactory.totalCalls[1][name]++;
    }
    
    public boolean process(final BasicArrayList gameLayerList, final int index) throws Exception {
        return false;
    }

    public boolean processStats(final BasicArrayList gameLayerList, final int index) throws Exception {
        this.nodeStatsFactory.push(2, name);
        //this.nodeStatsFactory.totalCalls[2][name]++;
        return false;
    }
    
    public boolean process(final int index) throws Exception {
        return false;
    }
    
    public boolean processStats(final int index) throws Exception {
        this.nodeStatsFactory.push(3, name);
        //this.nodeStatsFactory.totalCalls[3][name]++;
        return false;
    }
    
    public void processEnd(final int index) throws Exception {
    }

    public void processEndStats(final int index) throws Exception {
        this.nodeStatsFactory.push(4, name);
        //this.nodeStatsFactory.totalCalls[4][name]++;
    }
    
    public void processN(final GDNode gdNode, final BasicArrayList gdNodeList) {
    }

    public void processNStats(final GDNode gdNode, final BasicArrayList gdNodeList) {
        this.nodeStatsFactory.push(5, name);
        //this.nodeStatsFactory.totalCalls[5][name]++;
    }

    public boolean process(final GDObject gdObject) {
        return true;
    }

    public boolean processStats(final GDObject gdObject) {
        this.nodeStatsFactory.push(6, name);
        //this.nodeStatsFactory.totalCalls[6][name]++;
        return true;
    }

    public boolean processReleased(final GDObject gdObject) {
        return true;
    }

    public boolean processReleasedStats(final GDObject gdObject) {
        this.nodeStatsFactory.push(7, name);
        //this.nodeStatsFactory.totalCalls[7][name]++;
        return true;
    }

    public void processG(final GDObject gdObject, final Graphics graphics) {
    }

    public void processGStats(final GDObject gdObject, final Graphics graphics) {
        this.nodeStatsFactory.push(8, name);
        //this.nodeStatsFactory.totalCalls[8][name]++;
    }

    public void process(final MotionGestureEvent motionGestureEvent) {
    }

    public void processStats(final MotionGestureEvent motionGestureEvent) {
        this.nodeStatsFactory.push(9, name);
        //this.nodeStatsFactory.totalCalls[9][name]++;
    }

    public void processM(final CollidableCompositeLayer[] gameLayerArray, final GDNode gdNode, final BasicArrayList gdNodeList) {
    }

    public void processMStats(final CollidableCompositeLayer[] gameLayerArray, final GDNode gdNode, final BasicArrayList gdNodeList) {
        this.nodeStatsFactory.push(10, name);
        //this.nodeStatsFactory.totalCalls[10][name]++;
    }
    
    public void processGD(final GDGameLayer gameLayer, final GDObject gdObject) {
    }
    
    public void processGDStats(final GDGameLayer gameLayer, final GDObject gdObject) {
        this.nodeStatsFactory.push(11, name);
        //this.nodeStatsFactory.totalCalls[11][name]++;
    }

    public long getName() {
        return this.name;
    }    
}
