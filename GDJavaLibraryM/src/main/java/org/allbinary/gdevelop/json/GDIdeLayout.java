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
