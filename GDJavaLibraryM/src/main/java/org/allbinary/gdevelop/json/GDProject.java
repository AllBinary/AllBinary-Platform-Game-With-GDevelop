/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

import org.allbinary.graphics.PointFactory;
import org.allbinary.graphics.Rectangle;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;
import org.json.JSONArray;
import org.json.JSONException;

import org.json.JSONObject;
import org.json.JSONTokener;
import org.json.XML;

/**
 *
 * @author User
 */
public class GDProject
{   
    private final String LOAD = "load";
    private final String OBJECTS = "GDObjects: ";
    private final String VARIABLES = "GDVariables: ";
    private final String LAYOUTS = "GDLayouts: ";
    private final String EXTERNAL_LAYOUT = "GDExternalLayouts: ";
    
    public final GDIde gdIde = new GDIde();
    
    public String name;
    public String version;
    public Rectangle gameResolutionSize;
    public int maxFPS;
    public int minFPS;
    public boolean verticalSyncActivatedByDefault;
    public String scaleMode;
    public boolean adaptGameResolutionAtRuntime;
    public String sizeOnStartupMode;
    public String projectUuid;

    public GDResourcesManager resourcesManager;

    public final BasicArrayList objectList = new BasicArrayList();
    
    public final BasicArrayList variableList = new BasicArrayList();
    
    public final BasicArrayList layoutList = new BasicArrayList();
    public final BasicArrayList externalLayoutList = new BasicArrayList();
    
    public void load(final JSONObject gameAsConfiguration) throws JSONException {
 
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        this.gdIde.load(gameAsConfiguration);
        
        final JSONObject properties = gameAsConfiguration.getJSONObject(gdProjectStrings.PROPERTIES);

        this.name = properties.getString(gdProjectStrings.NAME);
        this.version = properties.getString(gdProjectStrings.VERSION);
        
        final int width = properties.getInt(gdProjectStrings.WINDOW_WIDTH);
        final int height = properties.getInt(gdProjectStrings.WINDOW_HEIGHT);
        this.gameResolutionSize = new Rectangle(PointFactory.getInstance().ZERO_ZERO, width, height);
        
        this.maxFPS = properties.getInt(gdProjectStrings.MAX_FPS);
        this.minFPS = properties.getInt(gdProjectStrings.MIN_FPS);
        
        this.verticalSyncActivatedByDefault = properties.getBoolean(gdProjectStrings.VERTICAL_SYNC);

        this.scaleMode = properties.getString(gdProjectStrings.SCALE_MODE);
        this.adaptGameResolutionAtRuntime = properties.getBoolean(gdProjectStrings.ADAPT_GAME_RESOLUTION_AT_RUNTIME);
        
        this.sizeOnStartupMode = properties.getString(gdProjectStrings.SIZE_ON_STARTUP_MODE);
        
        this.projectUuid = properties.getString(gdProjectStrings.PROJECT_UUID);
        
        final JSONObject resourceJSONObject = gameAsConfiguration.getJSONObject(gdProjectStrings.RESOURCES);
        this.resourcesManager = new GDResourcesManager(resourceJSONObject);
        
        final JSONArray objectJSONArray = gameAsConfiguration.getJSONArray(gdProjectStrings.OBJECTS);
        int size = objectJSONArray.length();
        JSONObject objectJSONObject;
        for(int index = 0; index < size; index++) {
            objectJSONObject = objectJSONArray.getJSONObject(index);
            this.objectList.add(new GDObject(objectJSONObject));
        }
        
        LogUtil.put(LogFactory.getInstance(OBJECTS + this.objectList.size(), this, LOAD));
        
        final JSONArray variableJSONArray = gameAsConfiguration.getJSONArray(gdProjectStrings.VARIABLES);
        size = variableJSONArray.length();
        for(int index = 0; index < size; index++) {
            this.variableList.add(new GDVariable(variableJSONArray.getJSONObject(index)));
        }
        
        LogUtil.put(LogFactory.getInstance(VARIABLES + this.variableList.size(), this, LOAD));
        
        final JSONArray layoutsJSONArray = gameAsConfiguration.getJSONArray(gdProjectStrings.LAYOUTS);
        size = layoutsJSONArray.length();
        for(int index = 0; index < size; index++) {
            objectJSONObject = layoutsJSONArray.getJSONObject(index);
            this.layoutList.add(new GDLayout(objectJSONObject));
        }

        LogUtil.put(LogFactory.getInstance(LAYOUTS + this.layoutList.size(), this, LOAD));
        
        final JSONArray externalLayoutsJSONArray = gameAsConfiguration.getJSONArray(gdProjectStrings.EXTERNAL_LAYOUTS);
        size = externalLayoutsJSONArray.length();
        for(int index = 0; index < size; index++) {
            objectJSONObject = externalLayoutsJSONArray.getJSONObject(index);
            this.externalLayoutList.add(new GDExternalLayout(objectJSONObject));
        }
        
        LogUtil.put(LogFactory.getInstance(EXTERNAL_LAYOUT + this.externalLayoutList.size(), this, LOAD));        
    }
        
}
