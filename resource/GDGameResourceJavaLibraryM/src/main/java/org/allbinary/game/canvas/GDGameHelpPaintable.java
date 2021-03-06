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
package org.allbinary.game.canvas;

import org.allbinary.game.paint.help.HelpPaintable;
import org.allbinary.graphics.color.BasicColorFactory;

public class GDGameHelpPaintable extends HelpPaintable
{
    private static HelpPaintable SINGLETON = new GDGameHelpPaintable();
    
    public static HelpPaintable getInstance()
    {
        return SINGLETON;
    }
    
    private GDGameHelpPaintable()
    {
        /*
Key Mappings:

Accelerate= Up, 2, or U
Turn= Left, 4, or H
Turn= Right, 6, or K
Reverse= Down, 8, or M
        */
        
    	super(BasicColorFactory.getInstance().RED);
        
        this.setInputInfo(new String[]
                         {"Line 1", "Line 2"});
    }
}
