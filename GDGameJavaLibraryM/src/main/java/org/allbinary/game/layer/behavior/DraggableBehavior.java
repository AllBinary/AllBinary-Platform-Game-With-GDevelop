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
package org.allbinary.game.layer.behavior;

import javax.microedition.lcdui.Graphics;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class DraggableBehavior extends GDBehavior {

    private static final DraggableBehavior instance = new DraggableBehavior();

    /**
     * @return the instance
     */
    public static DraggableBehavior getInstance() {
        return instance;
    }
    
    private DraggableBehavior() {
        
    }
    
    public boolean process(final BasicArrayList gameLayerList, final int index, final Graphics graphics) {
        return false;
    }

}
