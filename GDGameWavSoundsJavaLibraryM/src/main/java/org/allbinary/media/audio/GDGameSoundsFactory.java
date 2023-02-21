package org.allbinary.media.audio;

import org.allbinary.game.resource.GDExplosionSound;

public class GDGameSoundsFactory
extends BaseSoundsFactory
{
    private Sound[] soundInterfaceArray = new Sound[0];
    
    public void init() 
    {
        //soundInterfaceArray = new Sound[1];
        int index = 0;

        //soundInterfaceArray[index++] = new CompositeSound("resource:/wav/test.wav");
        final GD1GameSoundsFactory gd1GameSoundsFactory = GD1GameSoundsFactory.getInstance();
        soundInterfaceArray = (Sound[]) gd1GameSoundsFactory.soundList.toArray(new Sound[gd1GameSoundsFactory.soundList.size()]);
    }
    
    public Sound[] getSoundInterfaceArray() throws Exception
    {
        return soundInterfaceArray;
    }
}
