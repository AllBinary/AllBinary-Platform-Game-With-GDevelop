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
package org.allbinary.game.resource;

import org.allbinary.media.audio.Sound;
import org.allbinary.media.audio.CompositeSound;


public class GDThrusterSound extends CompositeSound
{
   private static Sound soundInterface = new GDThrusterSound();
   
   private GDThrusterSound()
   {
       super("resource:/wav/Thruster.wav");
   }
   
   public static Sound getInstance()
   {
      return soundInterface;
   }
}

