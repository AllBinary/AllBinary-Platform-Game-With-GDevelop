/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
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
