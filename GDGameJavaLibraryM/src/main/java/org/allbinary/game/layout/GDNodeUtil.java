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

import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDNodeUtil {
    
    private static final GDNodeUtil instance = new GDNodeUtil();

    /**
     * @return the instance
     */
    public static GDNodeUtil getInstance() {
        return instance;
    }

    public final BasicArrayList gdNodesList = new BasicArrayList();    
    
    public GDNodes getInstance(final int index) {
        while(index > gdNodesList.size() - 1) {
            gdNodesList.add(new GDNodes());
        }
        
        return (GDNodes) gdNodesList.get(index);
    }
    
}
