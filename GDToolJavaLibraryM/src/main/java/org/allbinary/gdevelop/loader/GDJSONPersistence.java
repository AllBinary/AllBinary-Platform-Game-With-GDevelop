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
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.nio.charset.CharacterCodingException;
import java.nio.charset.Charset;
import java.nio.charset.CharsetDecoder;
import java.nio.charset.CodingErrorAction;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.logic.java.characters.CharacterSetData;
import org.allbinary.logic.string.StringUtil;
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
    
    public void save(final String saveFilePath, final JSONObject gameAsConfigurationJSONObject) throws Exception {
        final String jsonAsString = gameAsConfigurationJSONObject.toString(2);
        this.save(saveFilePath, jsonAsString);
    }

    public void save(final String saveFilePath, final String jsonAsString) throws Exception {
        
        final byte[] byteArray = jsonAsString.getBytes();
        
        System.out.println("Saving bytes: " + byteArray.length);
        
        final FileOutputStream outputStream = new FileOutputStream(saveFilePath);
                
        outputStream.write(byteArray);
        
        outputStream.flush();
        
        outputStream.close();
    }

}
