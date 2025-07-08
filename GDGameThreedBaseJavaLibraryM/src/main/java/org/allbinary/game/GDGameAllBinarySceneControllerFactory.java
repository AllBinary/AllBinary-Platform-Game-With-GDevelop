package org.allbinary.game;

import org.allbinary.graphics.threed.min3d.AllBinarySceneController;
import org.allbinary.graphics.threed.min3d.GDGameSceneController;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.PreLogUtil;

public class GDGameAllBinarySceneControllerFactory
{
    protected final LogUtil logUtil = LogUtil.getInstance();

    private static final AllBinarySceneController instance = 
            new GDGameSceneController();

    public static final AllBinarySceneController getInstance()
    {
        //PreLogUtil.put(commonStrings.START, instance, commonStrings.CONSTRUCTOR, new Exception());
        return instance;
    }
}
