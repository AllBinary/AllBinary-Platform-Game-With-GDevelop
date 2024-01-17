/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
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
package org.allbinary.game.layer.special;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDConditionWithGroupActions 
{
    public final BasicArrayList groupWithActionsList = new BasicArrayList();
    public final BasicArrayList actionForGroupsList = new BasicArrayList();
    
    public GDConditionWithGroupActions()
    {
    }
    
    public void append(final StringMaker stringBuilder) {
        
        stringBuilder.append("GDConditionWithGroupActions: ");
        
        final int size = this.groupWithActionsList.size();
        stringBuilder.append(size);
        stringBuilder.append(' ');
        for(int index = 0; index < size; index++) {
            stringBuilder.append(this.groupWithActionsList.get(index).toString());
        }

    }
}
