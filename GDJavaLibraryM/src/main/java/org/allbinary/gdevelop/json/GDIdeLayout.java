/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import org.allbinary.gdevelop.json.event.GDEvent;
import org.allbinary.gdevelop.json.event.builtin.GDEventFactory;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDIdeLayout
{
    public final GDEditorSettings editorSettings;

    public final JSONArray objectsGroups;

    public GDIdeLayout(final JSONObject jsonObject) {

        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();

        this.editorSettings = new GDEditorSettings(jsonObject.getJSONObject(gdProjectStrings.EDITOR_SETTINGS));

        this.objectsGroups = jsonObject.getJSONArray(gdProjectStrings.OBJECT_GROUPS);
    }
}
