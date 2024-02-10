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

import org.allbinary.thread.NullRunnable;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDNodes {
    
    public final BasicArrayList runnableList = new BasicArrayList();
    
    public void process() {

        GDNode gdNode;
        final int size2 = runnableList.size();
        for (int index = 0; index < size2; index++) {
            gdNode = (GDNode) runnableList.get(index);
            gdNode.currentRunnable.run();
        }

    }

    public void clear() {

        GDNode gdNode;
        final int size2 = runnableList.size();
        for (int index = 0; index < size2; index++) {
            gdNode = (GDNode) runnableList.get(index);
            gdNode.currentRunnable = NullRunnable.getInstance();
        }

    }
    
}
