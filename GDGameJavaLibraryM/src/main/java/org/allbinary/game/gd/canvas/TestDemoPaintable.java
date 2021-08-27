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
package org.allbinary.game.gd.canvas;

import org.allbinary.game.paint.GameScrollMenuPaintable;
import org.allbinary.game.paint.MainGameDemoStatePaintable;
import org.allbinary.game.paint.OwnershipPaintable;
import org.allbinary.graphics.color.BasicColorFactory;
import org.allbinary.graphics.paint.Paintable;

/**
 *
 * @author Berthelot, Travis
 * @version 1.0
 */
public class TestDemoPaintable extends
GameScrollMenuPaintable
//BasicGameDemoPaintable
{

    public TestDemoPaintable(Paintable paintable)
        throws Exception
    {
        super(new MainGameDemoStatePaintable(OwnershipPaintable.getInstance(),
                paintable
        // new PressStartMenuPaintable()
                ),
                OwnershipPaintable.getInstance(),
                GDGameHelpPaintable.getInstance(),
                BasicColorFactory.getInstance().YELLOW);
    }
}
