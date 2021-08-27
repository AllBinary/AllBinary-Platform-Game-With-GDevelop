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
package org.allbinary.gdevelop.json.resource;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDAudioResource extends GDResource
{
  public final boolean preloadAsSound;
  public final boolean preloadAsMusic;
  
  public GDAudioResource(final String kind, final JSONObject jsonObject) {
      super(kind, jsonObject);
      
      final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();

      this.preloadAsSound = jsonObject.getBoolean(gdProjectStrings.PRELOAD_AS_SOUND);
      this.preloadAsMusic = jsonObject.getBoolean(gdProjectStrings.PRELOAD_AS_MUSIC);
  }
    
}
