package org.allbinary.media.audio;

import org.allbinary.media.audio.SoundsFactoryInterface;

public class GDGameSoundsFactoryFactory
{
    private static SoundsFactoryInterface STATIC = new GDGameSoundsFactory();
    
    public static SoundsFactoryInterface getInstance()
    {
        return STATIC;
    }
}
