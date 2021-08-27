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
package org.allbinary.gdevelop.json;

import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDCamera
{
    public final boolean defaultSize;
    public final boolean defaultViewport;

    public final double x1;
    public final double y1;
    public final double x2;
    public final double y2;
    
    public final double width;
    public final double height;
    
    public GDCamera(final JSONObject jsonObject) {

        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.defaultSize = jsonObject.getBoolean(gdProjectStrings.DEFAULT_SIZE);
        this.defaultViewport = jsonObject.getBoolean(gdProjectStrings.DEFAULT_VIEWPORT);

        this.width = jsonObject.getDouble(gdProjectStrings.WIDTH);
        this.height = jsonObject.getDouble(gdProjectStrings.HEIGHT);
        
        this.x1 = jsonObject.getDouble(gdProjectStrings.VIEWPORT_LEFT);
        this.y1 = jsonObject.getDouble(gdProjectStrings.VIEWPORT_TOP);
        this.x2 = jsonObject.getDouble(gdProjectStrings.VIEWPORT_RIGHT);
        this.y2 = jsonObject.getDouble(gdProjectStrings.VIEWPORT_BOTTOM);

    }
}
