/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json.resource;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDResourceFactory
{
    protected final LogUtil logUtil = LogUtil.getInstance();


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
    public final String TILE_MAP = "tilemap";
    public final String TILE_SET = "tileset";
    
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
        } else if (kind.compareTo(this.TILE_MAP) == 0)
        {
            return this.TILE_MAP;
        } else if (kind.compareTo(this.TILE_SET) == 0)
        {
            return this.TILE_SET;
        } else if (kind.compareTo(this.BITMAP_FONT) == 0)
        {
            return this.BITMAP_FONT;
        } else {
            final CommonStrings commonStrings = CommonStrings.getInstance();
            LogUtil.put(LogFactory.getInstance(kind, this, commonStrings.CONSTRUCTOR));
            throw new RuntimeException(kind);
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
        } else if (kind == this.TILE_MAP)
        {
            return new GDJsonResource(kind, jsonObject);
        } else if (kind == this.TILE_SET)
        {
            return new GDJsonResource(kind, jsonObject);
        } else if (kind == this.BITMAP_FONT)
        {
            return new GDBitmapFontResource(kind, jsonObject);
        } else {
            throw new RuntimeException(kind);
        }
    }
    
}
