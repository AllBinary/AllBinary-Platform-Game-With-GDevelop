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
    protected final LogUtil logUtil = LogUtil.getInstance();

    
    public GDDestroyableSimpleBehavior(CollidableCompositeLayer ownerLayer)
    {
        super(ownerLayer);
    }
    
    public void setDestroyed(boolean destroyed)
    {
        //logUtil.put("Adding: " + this.ownerLayer.getName(), this, commonStrings.ADD);
        super.setDestroyed(destroyed);
    }
    
}
