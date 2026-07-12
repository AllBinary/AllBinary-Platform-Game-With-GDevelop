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

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonStrings;
import org.allbinary.thread.NullRunnable;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

/**
 *
 * @author User
 */
public class GDNodes {
    
    public final BasicArrayList runnableList = new BasicArrayListD();
    
    public void process() {

        //final LogUtil logUtil = LogUtil.getInstance();
        //final CommonStrings commonStrings = CommonStrings.getInstance();
        GDNode gdNode;
        final int size2 = this.runnableList.size();
        for (int index = 0; index < size2; index++) {
            gdNode = (GDNode) this.runnableList.get(index);
            //logUtil.putF(new StringMaker().appendlong(gdNode.getName()).toString(), this, commonStrings.PROCESS);
            gdNode.currentRunnable.run();
        }

    }

    public void clear() {

        GDNode gdNode;
        final int size2 = this.runnableList.size();
        for (int index = 0; index < size2; index++) {
            gdNode = (GDNode) this.runnableList.get(index);
            gdNode.currentRunnable = NullRunnable.getInstance();
        }

    }
    
}
