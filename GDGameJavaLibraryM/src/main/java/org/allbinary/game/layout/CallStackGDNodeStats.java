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

import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class CallStackGDNodeStats {
    
    private final int SIZE = 16;
    private final int[][] callStack = new int[SIZE][6000];
    private int total = 0;
    
    public void reset() {
        for(int index2 = 0; index2 < SIZE; index2++) {
            for (int index = 0; index < total; index++) {
                callStack[index2][index] = 0;
            }
        }

        total = 0;
    }

    public void push(int index, int name) {
        this.callStack[index][total++] = name;
    }

    public void log(final StringBuilder stringBuilder) {
        
        final CommonStrings commonStrings = CommonStrings.getInstance();
        
        stringBuilder.delete(0, stringBuilder.length());
        
        //stringBuilder.append(this.getClass().getName());
        //stringBuilder.append(':');

        for(int index2 = 0; index2 < total; index2++) {
            for(int index = 0; index < SIZE; index++) {
                if(callStack[index][index2] != 0) {
                    stringBuilder.append(index2);
                    stringBuilder.append(':');
                    stringBuilder.append(index);
                    stringBuilder.append(':');
                    stringBuilder.append(callStack[index][index2]);
                    stringBuilder.append(';');
                    if(stringBuilder.length() > 256) {
                        
                        LogUtil.put(LogFactory.getInstance(stringBuilder.toString(), this, commonStrings.PROCESS));
                        stringBuilder.delete(0, stringBuilder.length());
                    }
                }
            }
        }

        LogUtil.put(LogFactory.getInstance(stringBuilder.toString(), this, commonStrings.PROCESS));
        
    }
}
