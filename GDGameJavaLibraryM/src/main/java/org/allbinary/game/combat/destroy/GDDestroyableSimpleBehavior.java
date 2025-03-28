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
package org.allbinary.game.combat.destroy;

import org.allbinary.game.layer.CollidableCompositeLayer;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDDestroyableSimpleBehavior extends DestroyableSimpleBehavior {
    
    public GDDestroyableSimpleBehavior(CollidableCompositeLayer ownerLayer)
    {
        super(ownerLayer);
    }
    
    public void setDestroyed(boolean destroyed)
    {
        //LogUtil.put(LogFactory.getInstance("Adding: " + this.ownerLayer.getName(), this, CommonStrings.getInstance().ADD));
        super.setDestroyed(destroyed);
    }
    
}
