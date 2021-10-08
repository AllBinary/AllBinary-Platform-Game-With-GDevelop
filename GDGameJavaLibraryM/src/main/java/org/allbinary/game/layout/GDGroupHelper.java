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
package org.allbinary.game.layout;

import java.util.HashMap;
import java.util.Map;
import org.allbinary.game.identification.Group;
import org.allbinary.game.identification.GroupFactory;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;

/**
 *
 * @author User
 */
public class GDGroupHelper
{
    private final GroupFactory groupFactory = GroupFactory.getInstance();
    
    public final Map<String, Group> map = new HashMap();
    
    public Group get(final String name) {
        
        Group group = map.get(name);
        
        if(group != null) {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().GET, this, "objectGroup"));
            return group;
        }
        
        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().GET, this, "newGroup"));
        
        group = this.groupFactory.getNextGroup();
        map.put(name, group);
        
        return group;
    }
}
