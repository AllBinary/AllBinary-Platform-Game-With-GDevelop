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

import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.game.layer.GDGameLayer;
import org.allbinary.input.motion.gesture.MotionGestureInput;
import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
import org.allbinary.thread.NullRunnable;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDNode
{
    private final BaseGDNodeStats nodeStatsFactory = GDNodeStatsFactory.getInstance();
    
    protected Runnable currentRunnable = NullRunnable.getInstance();

    private final int name;
        
    public GDNode(final int name) {
        
        //LogUtil.put(LogFactory.getInstance(commonStrings.START + name, this, commonStrings.CONSTRUCTOR));
        
        this.name = name;
        
        this.init();
    }
    
    public void init() {
        
    }
    
    public void reset() {
        this.currentRunnable = NullRunnable.getInstance();
    }

    public boolean process() throws Exception {
        return true;
    }
    
    protected void processStats() {
        this.nodeStatsFactory.push(2, name);
    }

    protected void processStatsE() {
        this.nodeStatsFactory.push(3, name);
    }
    
    public void processReleased() throws Exception {
        this.processReleasedStats();
        this.process();
    }

    protected void processReleasedStats() {
        this.nodeStatsFactory.push(4, name);
    }

    public boolean process(final GameKeyEvent gameKeyEvent) throws Exception {
        return false;
    }
    public boolean processReleased(final GameKeyEvent gameKeyEvent) throws Exception {
        return false;
    }
    public boolean process(final Integer keyAsInteger) throws Exception {
        return false;
    }
    public boolean processReleased(final Integer keyAsInteger) throws Exception {
        return false;
    }
    
    public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
        return false;
    }

    protected void processStats(final MotionGestureEvent motionGestureEvent) {
        this.nodeStatsFactory.push(5, name);
    }

    public boolean processU(final int index) throws Exception {
        return false;
    }

    public boolean process(final int index) throws Exception {
        return false;
    }
    
    protected void processStats(final int index) throws Exception {
        this.nodeStatsFactory.push(6, name);
    }
    
    public void processEnd(final int index) throws Exception {
    }

    public void processEnd(final int index, final int createIndex) throws Exception {
        
    }

    protected void processEndStats(final int index) throws Exception {
        this.nodeStatsFactory.push(7, name);
    }
    
    public boolean processCreate(final GDObject gdObject, final String createString, final int createIndex) throws Exception {
        return true;
    }
    
    public boolean processCreate(final GDObject gdObject) throws Exception {
        return true;
    }

    protected void processCreateStats(final GDObject gdObject) {
        this.nodeStatsFactory.push(10, name);
    }

    public boolean processReleased(final GDObject gdObject) {
        return true;
    }

    protected void processReleasedStats(final GDObject gdObject) {
        this.nodeStatsFactory.push(11, name);
    }

    public boolean processG(final GDObject gdObject, final BasicArrayList gdGameLayerList, final int gdObjectIndex, final Graphics graphics) throws Exception {
        return false;
    }
    
    public boolean processGPaint(final GDObject gdObject, final Graphics graphics) {
        return false;
    }
    
    protected void processGStats(final GDObject gdObject, final Graphics graphics) {
        this.nodeStatsFactory.push(12, name);
    }

    public void processM(final CollidableCompositeLayer[] gameLayerArray) {
    }

    protected void processMStats(final CollidableCompositeLayer[] gameLayerArray) {
        this.nodeStatsFactory.push(13, name);
    }

    protected void processMStatsE(final CollidableCompositeLayer[] gameLayerArray) {
        this.nodeStatsFactory.push(14, name);
    }
    
    public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
        this.processGDStats(gameLayer);
        return false;
    }
    
    protected void processGDStats(final GDGameLayer gameLayer) {
        this.nodeStatsFactory.push(15, name);
    }

    public void addForDelete(final GDGameLayer gameLayer) {
        
    }

    public long getName() {
        return this.name;
    }    
}
