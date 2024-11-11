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
package org.allbinary.game.layer.behavior;

import javax.microedition.lcdui.Graphics;

import org.allbinary.game.layer.GDGameLayer;
import org.allbinary.game.layer.PathFindingLayerInterface;
import org.allbinary.game.layer.waypoint.GDWaypointBehavior2;
import org.allbinary.game.layout.GDObject;
import org.allbinary.math.LayerDistanceUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class PathFindingBehavior extends GDBehavior {
    
    private final LayerDistanceUtil layerDistanceUtil = LayerDistanceUtil.getInstance();
    
    private GDGameLayer targetGameLayer;
    private int x;
    private int y;
    
    public boolean process(final BasicArrayList gameLayerList, final int index, final Graphics graphics) {

        final GDGameLayer gameLayer = (GDGameLayer) gameLayerList.get(index);
        final GDObject gdObject = gameLayer.gdObject;

        if(gdObject == null) {
            return false;
        }

        return false;

    }
    
    public void setTarget(final GDGameLayer sourceGameLayer, final GDGameLayer targetGameLayer, final int x, final int y) throws Exception {
        
        if(this.targetGameLayer != targetGameLayer) {
            this.targetGameLayer = targetGameLayer;
            this.x = x;
            this.y = y;

            //TWB - remove me at some point
            targetGameLayer.setAllBinaryGameLayerManager(sourceGameLayer.allBinaryGameLayerManager);

            final int anotherTargetDistance = layerDistanceUtil.getDistance(
                sourceGameLayer, targetGameLayer);

            final PathFindingLayerInterface pathFindingLayerInterface = (PathFindingLayerInterface) sourceGameLayer;
            final GDWaypointBehavior2 gdWaypointBehavior2 = (GDWaypointBehavior2) pathFindingLayerInterface.getWaypointBehavior();
            gdWaypointBehavior2.setTarget((PathFindingLayerInterface) targetGameLayer, anotherTargetDistance);
        }
        
    }
    
}
