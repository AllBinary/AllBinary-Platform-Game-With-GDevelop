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
import java.io.FileOutputStream;
import org.allbinary.logic.io.StreamUtil;
import org.json.JSONObject;
import org.json.JSONTokener;

/**
 *
 * @author User
 */
public class GDJSONPersistence {
    
    private static final GDJSONPersistence instance = new GDJSONPersistence();

    /**
     * @return the instance
     */
    public static GDJSONPersistence getInstance() {
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
    
    public void save(final JSONObject gameAsConfigurationJSONObject) throws Exception {
        
        final byte[] byteArray = gameAsConfigurationJSONObject.toString().getBytes();
        System.out.println("Saving bytes: " + byteArray.length);
        
        final FileOutputStream outputStream = new FileOutputStream(gdToolStrings.ROOT_PATH + "game_generated_collision_mask.json");
                
        outputStream.write(byteArray);
        
        outputStream.flush();
        
        outputStream.close();
    }

}
