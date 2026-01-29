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

/**
 *
 * @author User
 */
public class GDBehaviorUtil {
 
    protected static final GDBehaviorUtil instance = new GDBehaviorUtil();

    /**
     * @return the behaviorTracker
     */
    public static GDBehaviorUtil getInstance() {
        return instance;
    }

    //Only GD instance specific behaviors
    //public final String PATHFINDING_BEHAVIOR = "PathfindingBehavior::PathfindingBehavior";

    public final int PATHFINDING_BEHAVIOR_INDEX = 0;
    public final int DRAGGABLE_BEHAVIOR_INDEX = 1;

    public final int MAX = DRAGGABLE_BEHAVIOR_INDEX + 1;

    public GDBehavior getInstance(final int index) {
        
        if(index == PATHFINDING_BEHAVIOR_INDEX) {
            return PathFindingBehavior.getInstance();
        } else if(index == DRAGGABLE_BEHAVIOR_INDEX) {
            return DraggableBehavior.getInstance();
        } else {
            throw new RuntimeException();
        }

    }

//    public int getIndex(final String behavior) {
//        
//        if(behavior == PATHFINDING_BEHAVIOR) {
//            return PATHFINDING_BEHAVIOR_INDEX;
//        } else {
//            throw new RuntimeException();
//        }
//   
//    }

}
