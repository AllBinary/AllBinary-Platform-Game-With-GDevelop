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
package org.allbinary.gdevelop.loader;

/**
 *
 * @author User
 */
public class GDResource {
 
    public final String name;
    
    public final int width;
    public final int height;
    
    public GDResource(final String name, final int width, final int height) {
        this.name = name;
        
        this.width = width;
        this.height = height;
    }
}
