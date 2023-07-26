
        //game
        
                
package org.allbinary.media.audio;

import org.allbinary.util.BasicArrayList;
        
public class GDGameSounds
extends BaseSoundsFactory
{
    private Sound[] soundInterfaceArray = new Sound[0];
    
    public void init() 
    {
        //soundInterfaceArray = new Sound[1];
        int index = 0;

        final BasicArrayList list = new BasicArrayList();

    final GD0GameSoundsFactory gd0GameSoundsFactory = GD0GameSoundsFactory.getInstance();
    list.addAll(gd0GameSoundsFactory.soundList);


        soundInterfaceArray = (Sound[]) list.toArray(new Sound[list.size()]);
    }
    
    public Sound[] getSoundInterfaceArray() throws Exception
    {
        return soundInterfaceArray;
    }
}
    
