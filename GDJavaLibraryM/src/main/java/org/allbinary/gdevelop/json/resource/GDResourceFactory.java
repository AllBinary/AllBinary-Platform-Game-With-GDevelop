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
public class GDResourceFactory
{

    private static final GDResourceFactory instance = new GDResourceFactory();

    /**
     * @return the instance
     */
    public static GDResourceFactory getInstance()
    {
        return instance;
    }

    public final String KIND = "kind";
    public final String IMAGE = "image";
    public final String AUDIO = "audio";
    public final String FONT = "font";
    public final String VIDEO = "video";
    public final String JSON = "json";
    public final String BITMAP_FONT = "bitmapFont";
    
    public String get(final String kind) {
        if (kind.compareTo(this.IMAGE) == 0)
        {
            return this.IMAGE;
        } else if (kind.compareTo(this.AUDIO) == 0)
        {
            return this.AUDIO;
        } else if (kind.compareTo(this.FONT) == 0)
        {
            return this.FONT;
        } else if (kind.compareTo(this.VIDEO) == 0)
        {
            return this.VIDEO;
        } else if (kind.compareTo(this.JSON) == 0)
        {
            return this.JSON;
        } else if (kind.compareTo(this.BITMAP_FONT) == 0)
        {
            return this.BITMAP_FONT;
        } else {
            return null;
        }        
    }
    
    public GDResource create(final JSONObject jsonObject)
    {
        final String kind = this.get(jsonObject.getString(this.KIND));

        if (kind == this.IMAGE)
        {
            return new GDImageResource(kind, jsonObject);
        } else if (kind == this.AUDIO)
        {
            return new GDAudioResource(kind, jsonObject);
        } else if (kind == this.FONT)
        {
            return new GDFontResource(kind, jsonObject);
        } else if (kind == this.VIDEO)
        {
            return new GDVideoResource(kind, jsonObject);
        } else if (kind == this.JSON)
        {
            return new GDJsonResource(kind, jsonObject);
        } else if (kind == this.BITMAP_FONT)
        {
            return new GDBitmapFontResource(kind, jsonObject);
        } else {
            return null;
        }
    }
    
}
