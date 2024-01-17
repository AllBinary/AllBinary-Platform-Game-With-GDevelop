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

import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.string.StringMaker;

/**
 *
 * @author User
 */
public class CallCountGDNodeStats {

    private final String TOTAL_CALLS = "total calls: ";

    private final int SIZE = 16;
    private final long[][] totalCalls = new long[SIZE][15000];
    
    public void reset() {

        for(int index2 = 0; index2 < SIZE; index2++) {
            for (int index = 0; index < 15000; index++) {
                this.totalCalls[index2][index] = 0;
            }
        }

    }

    public void push(int index, int name) {
        this.totalCalls[index][name]++;
    }

    public void log(final StringMaker stringBuilder) {
        
        final CommonStrings commonStrings = CommonStrings.getInstance();
        
        stringBuilder.delete(0, stringBuilder.length());
        
        stringBuilder.append(TOTAL_CALLS);
        
        for(int index = 0; index < SIZE; index++) {
            for(int index2 = 0; index2 < 15000; index2++) {
                if(totalCalls[index][index2] > 20) {
                    stringBuilder.append(index);
                    stringBuilder.append(':');
                    stringBuilder.append(index2);
                    stringBuilder.append(':');
                    stringBuilder.append(totalCalls[index][index2]);
                }
            }
        }

        stringBuilder.append('\n');
        
        if(stringBuilder.length() > TOTAL_CALLS.length() + 1) {
            LogUtil.put(LogFactory.getInstance(stringBuilder.toString(), this, commonStrings.PROCESS));
        }
        
    }
}
