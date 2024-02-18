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

import java.io.ByteArrayOutputStream;

/**
 *
 * @author User
 */
public class SharedBytes {

    private static final SharedBytes instance = new SharedBytes();

    /**
     * @return the instance
     */
    public static SharedBytes getInstance() {
        return instance;
    }
    
    public final ByteArrayOutputStream outputStream = new ByteArrayOutputStream(256000);
    public final byte[] byteArray = new byte[256000];
    
}
