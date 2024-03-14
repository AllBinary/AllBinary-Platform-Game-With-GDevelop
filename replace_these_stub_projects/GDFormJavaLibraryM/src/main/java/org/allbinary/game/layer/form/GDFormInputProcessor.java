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
package org.allbinary.game.layer.form;

/**
 *
 * @author User
 */
public class GDFormInputProcessor 
{

    private static final GDFormInputProcessor instance = new GDFormInputProcessor();
    
    /**
     * @return the instance
     */
    public static GDFormInputProcessor getInstance() {
        return instance;
    }
    
    public void append(final GDFormInput gdFormInput) {
    }
    
    public void open() {
    }

    public void close() {
    }
    
    public void reset() {
    }
    
}
