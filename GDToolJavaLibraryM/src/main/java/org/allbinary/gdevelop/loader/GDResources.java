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

import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDResources {
    
    private static final GDResources instance = new GDResources();

    /**
     * @return the instance
     */
    public static GDResources getInstance() {
        return instance;
    }
    
    public final BasicArrayList androidResourceList = new BasicArrayListD();
    public final BasicArrayList resourceNameList = new BasicArrayListD();
    public final BasicArrayList resourceList = new BasicArrayListD();

    public final BasicArrayList playSoundAndroidResourceNameList = new BasicArrayListD();
    public final BasicArrayList playSoundResourcePathList = new BasicArrayListD();
    
}
