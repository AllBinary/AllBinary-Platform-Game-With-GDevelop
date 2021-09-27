package org.allbinary.media.audio;


import org.allbinary.media.audio.BaseSoundsFactory;
import org.allbinary.media.audio.Sound;

public class GDGameSoundsFactory
extends BaseSoundsFactory
{
    private Sound[] soundInterfaceArray = new Sound[0];
    
    public void init() 
    {
        //soundInterfaceArray = new Sound[1];
        int index = 0;

        //soundInterfaceArray[index++] = new CompositeSound("resource:/wav/test.wav");
    }
    
    public Sound[] getSoundInterfaceArray() throws Exception
    {
        return soundInterfaceArray;
    }
}
