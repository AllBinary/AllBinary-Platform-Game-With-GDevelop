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
package org.allbinary.gdevelop.loader;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

/**
 *
 * @author User
 */
public class GDGameInfo {
    
    public int layoutTotal;
    public final BasicArrayList externalLayoutsTotalPerLayoutPositionList = new BasicArrayListD();
    public final BasicArrayList externalLayoutsIndexPerLayoutPositionList = new BasicArrayListD();
    
    public GDGameInfo() {
        
    }

    public int getExternalLayoutTotal(final int layoutIndex) {
        final Integer integer = (Integer) this.externalLayoutsTotalPerLayoutPositionList.get(layoutIndex);
        return integer.intValue();
    }
    
    public int getExternalLayoutIndex(final int layoutIndex, final int atIndex) {
        final BasicArrayList externalLayoutIndexList = (BasicArrayList) this.externalLayoutsIndexPerLayoutPositionList.get(layoutIndex);
        final Integer integer = (Integer) externalLayoutIndexList.get(atIndex);
        return integer.intValue();
    }
    
    public String toString() {
        final String LAYOUT = "layout at: ";
        final String WITH = " with externalLayouts: ";
        final String AT_INDEX = " at index: ";
        final CommonSeps commonSeps = CommonSeps.getInstance();
        final StringMaker stringMaker = new StringMaker();
        stringMaker.append("layoutTotal: ").appendint(this.layoutTotal);
        final int size = this.externalLayoutsTotalPerLayoutPositionList.size();
        Integer externalLayoutTotal;
        BasicArrayList externalLayoutIndexList;
        for(int index = 0; index < size; index++) {
            externalLayoutTotal = (Integer) this.externalLayoutsTotalPerLayoutPositionList.get(index);
            stringMaker.append(commonSeps.NEW_LINE).append(LAYOUT).appendint(index).append(WITH).append(externalLayoutTotal.toString());
            externalLayoutIndexList = (BasicArrayList) this.externalLayoutsIndexPerLayoutPositionList.get(index);
            final int size2 = externalLayoutIndexList.size();
            for(int indexListIndex = 0; indexListIndex < size2; indexListIndex++) {
                stringMaker.append(AT_INDEX).append(((Integer) externalLayoutIndexList.get(indexListIndex)).toString());
            }
        }
        
        return stringMaker.toString();
    }
}
