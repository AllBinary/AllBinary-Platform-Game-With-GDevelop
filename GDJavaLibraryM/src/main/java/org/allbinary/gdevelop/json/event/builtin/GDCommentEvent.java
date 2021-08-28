/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json.event.builtin;

import org.allbinary.gdevelop.json.GDProjectStrings;
import org.allbinary.gdevelop.json.event.GDEvent;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDCommentEvent extends GDEvent
{

    public final int r;
    public final int g;
    public final int b;

    public final int textR;
    public final int textG;
    public final int textB;

    public final String comment1;
    public final String comment2;

    public GDCommentEvent(final String type, final JSONObject jsonObject)
    {
        super(type, jsonObject);

        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();

        final JSONObject colorJSONObject = jsonObject.getJSONObject(gdProjectStrings.COLOR);

        this.r = colorJSONObject.getInt(gdProjectStrings.R);
        this.g = colorJSONObject.getInt(gdProjectStrings.G);
        this.b = colorJSONObject.getInt(gdProjectStrings.B);
        this.textR = colorJSONObject.getInt(gdProjectStrings.TEXT_R);
        this.textG = colorJSONObject.getInt(gdProjectStrings.TEXT_G);
        this.textB = colorJSONObject.getInt(gdProjectStrings.TEXT_B);

        this.comment1 = jsonObject.getString(gdProjectStrings.COMMENT);
        this.comment2 = jsonObject.getString(gdProjectStrings.COMMENT2);
    }
}
