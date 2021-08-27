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

import javax.microedition.lcdui.Graphics;

import org.allbinary.game.gd.input.GDGameGameInputMappingFactory;

import org.allbinary.animation.AnimationInterface;
import org.allbinary.game.paint.help.HelpPaintable;
import org.allbinary.game.paint.help.InputMappingHelpPaintable;
import org.allbinary.graphics.color.BasicColorFactory;

public class GDGameInputMappingHelpPaintable 
    extends InputMappingHelpPaintable
    implements AnimationInterface
{    
    private static HelpPaintable SINGLETON = new GDGameInputMappingHelpPaintable();
    
    public static HelpPaintable getInstance()
    {
        return SINGLETON;
    }
    
    private GDGameInputMappingHelpPaintable()
    {
        super(GDGameGameInputMappingFactory.getInstance().get(), 
                BasicColorFactory.getInstance().BLACK, 
                BasicColorFactory.getInstance().YELLOW);
    }

    //Remove hack after resource factory supports Paintable
    public void paint(Graphics graphics, int x, int y)
    {
        
    }

    public void paintThreed(Graphics graphics, int x, int y, int z)
    {
    }
    
    public void nextFrame() throws Exception
    {
        
    }
}
