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
package org.allbinary.game.layer;

import org.allbinary.canvas.Processor;

/**
 *
 * @author User
 */
public class GDProcessor extends Processor {

    private final GDGameLayer gameLayer;
    
    public GDProcessor(final GDGameLayer gameLayer) {
        this.gameLayer = gameLayer;
    }
    
    public void process(final long timeDelta) throws Exception {
        this.gameLayer.updateGDObject(timeDelta);
    }

}
