/*
 * AllBinary Open License Version 1
 * Copyright (c) 2026 AllBinary
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
package org.allbinary.game.configuration.persistance;

/**
 *
 * @author User
 */
public class GDStructure {
    
    private static final GDStructure instance = new GDStructure();

    /**
     * @return the instance
     */
    public static GDStructure getInstance() {
        return instance;
    }
    
    public int Size = -1;

    public int getJSONType() {
        throw new RuntimeException();
    }
    
    public String toJSONAsString() {
        throw new RuntimeException();
    }
}
