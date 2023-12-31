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
package org.allbinary.game.input;

import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.layer.AllBinaryLayerManager;

/**
 *
 * @author User
 */
public class GDRGameInputProcessor extends GameInputProcessor {
    
    public GameInputProcessor releasedGameInputProcessor = GameInputProcessor.getInstance();
    
    public void processReleased(final AllBinaryLayerManager allbinaryLayerManager, final GameKeyEvent gameKeyEvent) 
    throws Exception
    {
        
    }
    
}
