/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
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
package org.allbinary.gdevelop.loader;

import java.io.FileInputStream;
import org.allbinary.logic.io.StreamUtil;
import org.json.JSONObject;
import org.json.JSONTokener;

/**
 *
 * @author User
 */
public class GDJSONLoader {
    
    private static final GDJSONLoader instance = new GDJSONLoader();

    /**
     * @return the instance
     */
    public static GDJSONLoader getInstance() {
        return instance;
    }
    
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
    
    public JSONObject load() throws Exception {
        
        final StreamUtil streamUtil = StreamUtil.getInstance();
        final SharedBytes sharedBytes = SharedBytes.getInstance();
        sharedBytes.outputStream.reset();
        
        final FileInputStream inputStream = new FileInputStream(gdToolStrings.GAME_JSON_PATH);
        final String gameAsConfiguration = new String(streamUtil.getByteArray(inputStream, sharedBytes.outputStream, sharedBytes.byteArray));

        final JSONTokener jsonTokener = new JSONTokener(gameAsConfiguration);
        final JSONObject gameAsConfigurationJSONObject = (JSONObject) jsonTokener.nextValue();
        
        return gameAsConfigurationJSONObject;
    }    
}
