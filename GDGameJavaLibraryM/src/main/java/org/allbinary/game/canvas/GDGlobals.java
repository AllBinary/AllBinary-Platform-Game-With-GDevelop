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
package org.allbinary.game.canvas;

import org.allbinary.game.identification.GroupFactory;
import org.allbinary.logic.string.CommonStrings;
import org.allbinary.util.ArrayUtil;

/**
 *
 * @author User
 */
public class GDGlobals {
    
    protected final ArrayUtil arrayUtil = ArrayUtil.getInstance();
    protected final GroupFactory groupFactory = GroupFactory.getInstance();
    protected final CommonStrings commonStrings = CommonStrings.getInstance();

}
