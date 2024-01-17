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
package org.allbinary.game.layout;

import org.allbinary.logic.string.StringMaker;

/**
 *
 * @author User
 */
public class GDNodeStatsFactory extends BaseGDNodeStats {
    
    private static final BaseGDNodeStats instance = 
            new BaseGDNodeStats();
            //new GDNodeStatsFactory();
            //

    /**
     * @return the instance
     */
    public static BaseGDNodeStats getInstance() {
        return instance;
    }
    
    private final CallCountGDNodeStats callCountGDNodeStats = new CallCountGDNodeStats();
    private final CallStackGDNodeStats callStackGDNodeStats = new CallStackGDNodeStats();
    
    public void reset() {
        this.callCountGDNodeStats.reset();
        this.callStackGDNodeStats.reset();
    }

    public void push(int index, int name) {
        this.callCountGDNodeStats.push(index, name);
        this.callStackGDNodeStats.push(index, name);
    }

    public void log(final StringMaker stringBuilder, final Object object) {
        this.callCountGDNodeStats.log(stringBuilder);
        this.callStackGDNodeStats.log(stringBuilder, object);
    }

}
