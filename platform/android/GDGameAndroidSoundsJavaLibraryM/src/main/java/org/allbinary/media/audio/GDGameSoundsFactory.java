package org.allbinary.media.audio;

import org.allbinary.media.audio.SoundsFactoryInterface;

public class GDGameSoundsFactory
{
    private static SoundsFactoryInterface STATIC = new GDGameSounds();
    
    public static SoundsFactoryInterface getInstance()
    {
        return STATIC;
    }
}
