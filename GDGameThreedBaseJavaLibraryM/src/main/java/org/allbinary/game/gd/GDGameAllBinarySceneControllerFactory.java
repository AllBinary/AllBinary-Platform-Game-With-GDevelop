package org.allbinary.game.gd;

import org.allbinary.graphics.threed.min3d.AllBinarySceneController;
import org.allbinary.graphics.threed.min3d.GDGameSceneController;

public class GDGameAllBinarySceneControllerFactory
{
    private static final AllBinarySceneController instance = 
            new GDGameSceneController();

    public static final AllBinarySceneController getInstance()
    {
        return instance;
    }
}
