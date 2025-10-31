/*
 * AllBinary Open License Version 1
 * Copyright (c) 2025 AllBinary
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

/**
 *
 * @author User
 */
public class OffsetBehavior extends BaseOffsetBehavior {

    /**
     * @return the instance
     */
    public static OffsetBehavior getInstance() {
        return instance;
    }
    
    private static final OffsetBehavior instance = new OffsetBehavior();
    
    @Override
    public int PointX(final int value) {
        return value;
    }

    @Override
    public int PointY(final int value) {
        return value;
    }

}
