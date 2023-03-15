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
    
    public void process() throws Exception {
    }

    public void processStats() {
        this.nodeStatsFactory.push(2, name);
        //this.nodeStatsFactory.totalCalls[0][name]++;
    }

    public void processStatsE() {
        this.nodeStatsFactory.push(3, name);
        //this.nodeStatsFactory.totalCalls[0][name]++;
    }
    
    public void processReleased() throws Exception {
    }

    public void processReleasedStats() {
        this.nodeStatsFactory.push(4, name);
        //this.nodeStatsFactory.totalCalls[1][name]++;
    }
    
    public void process(final MotionGestureEvent motionGestureEvent) throws Exception {
    }

    public void processStats(final MotionGestureEvent motionGestureEvent) {
        this.nodeStatsFactory.push(5, name);
        //this.nodeStatsFactory.totalCalls[8][name]++;
    }
    
    public boolean process(final int index) throws Exception {
        return false;
    }
    
    public void processStats(final int index) throws Exception {
        this.nodeStatsFactory.push(6, name);
        //this.nodeStatsFactory.totalCalls[2][name]++;
    }
    
    public void processEnd(final int index) throws Exception {
    }

    public void processEndStats(final int index) throws Exception {
        this.nodeStatsFactory.push(7, name);
        //this.nodeStatsFactory.totalCalls[3][name]++;
    }
    
    public void processN(final GDNode gdNode, final BasicArrayList gdNodeList) {
    }

    public void processNStats(final GDNode gdNode, final BasicArrayList gdNodeList) {
        this.nodeStatsFactory.push(8, name);
        //this.nodeStatsFactory.totalCalls[4][name]++;
    }

    public void processNStatsE(final GDNode gdNode, final BasicArrayList gdNodeList) {
        this.nodeStatsFactory.push(9, name);
        //this.nodeStatsFactory.totalCalls[4][name]++;
    }

    public boolean processCreate(final GDObject gdObject) throws Exception {
        return true;
    }

    public void processCreateStats(final GDObject gdObject) {
        this.nodeStatsFactory.push(10, name);
        //this.nodeStatsFactory.totalCalls[5][name]++;
    }

    public boolean processReleased(final GDObject gdObject) {
        return true;
    }

    public void processReleasedStats(final GDObject gdObject) {
        this.nodeStatsFactory.push(11, name);
        //this.nodeStatsFactory.totalCalls[6][name]++;
    }

    public boolean processG(final GDObject gdObject, final Graphics graphics) {
        return false;
    }

    public void processGStats(final GDObject gdObject, final Graphics graphics) {
        this.nodeStatsFactory.push(12, name);
        //this.nodeStatsFactory.totalCalls[7][name]++;
    }

    public void processM(final CollidableCompositeLayer[] gameLayerArray, final GDNode gdNode, final BasicArrayList gdNodeList) {
    }

    public void processMStats(final CollidableCompositeLayer[] gameLayerArray, final GDNode gdNode, final BasicArrayList gdNodeList) {
        this.nodeStatsFactory.push(13, name);
        //this.nodeStatsFactory.totalCalls[9][name]++;
    }

    public void processMStatsE(final CollidableCompositeLayer[] gameLayerArray, final GDNode gdNode, final BasicArrayList gdNodeList) {
        this.nodeStatsFactory.push(14, name);
        //this.nodeStatsFactory.totalCalls[9][name]++;
    }
    
    public void processGD(final GDGameLayer gameLayer, final Graphics graphics) {
        this.processGDStats(gameLayer);
        this.processG(gameLayer.gdObject, graphics);
    }
    
    public void processGDStats(final GDGameLayer gameLayer) {
        this.nodeStatsFactory.push(15, name);
        //this.nodeStatsFactory.totalCalls[10][name]++;
    }

    public void addForDelete(final GDGameLayer gameLayer) {
        
    }

    public long getName() {
        return this.name;
    }    
}
