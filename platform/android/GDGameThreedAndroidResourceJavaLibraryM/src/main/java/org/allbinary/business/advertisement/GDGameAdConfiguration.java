package org.allbinary.business.advertisement;

import org.allbinary.logic.string.StringUtil;
import org.allbinary.direction.Direction;
import org.allbinary.direction.DirectionFactory;

public class GDGameAdConfiguration extends AdConfiguration
{
    private final Direction[] directionArray = {
            DirectionFactory.getInstance().DOWN, DirectionFactory.getInstance().UP
    };

    public GDGameAdConfiguration()
    {
        super(new Object[]
                {
                "AllBinary_GDGame_Threed_Android",
                "",
                StringUtil.getInstance().EMPTY_STRING
                }
        );        
    }
    
    @Override
    public Direction[] getValidAdSpots()
    {
        return directionArray;
    }

    @Override
    public void processDemo(int state)
    {
    }
}
