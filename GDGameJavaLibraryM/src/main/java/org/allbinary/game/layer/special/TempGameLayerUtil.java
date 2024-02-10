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
package org.allbinary.game.layer.special;

import org.allbinary.game.layer.CollidableCompositeLayer;

/**
 *
 * @author User
 */
public class TempGameLayerUtil {
    
    private static final TempGameLayerUtil instance = new TempGameLayerUtil();

    /**
     * @return the instance
     */
    public static TempGameLayerUtil getInstance() {
        return instance;
    }
    
    public final CollidableCompositeLayer[] gameLayerArray = new CollidableCompositeLayer[5];
    
    public void clear() {

        for (int index = 0; index < 5; index++) {
            gameLayerArray[index] = null;
        }

    }
    
    public void clear2() {
        this.clear();
    }
}
