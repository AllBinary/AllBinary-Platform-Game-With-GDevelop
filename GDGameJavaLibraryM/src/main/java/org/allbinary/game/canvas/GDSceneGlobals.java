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
package org.allbinary.game.canvas;

import org.allbinary.game.input.GameInputProcessor;
import org.allbinary.game.input.InputFactory;

/**
 *
 * @author User
 */
public class GDSceneGlobals {
    
    public final GameInputProcessor[] anyKeyProcessorArray = new GameInputProcessor[1];
    public final GameInputProcessor[] inputProcessorArray = new GameInputProcessor[InputFactory.getInstance().MAX];
    public final GameInputProcessor[] unmappedInputProcessorArray = new GameInputProcessor[InputFactory.getInstance().MAX];
    
}
