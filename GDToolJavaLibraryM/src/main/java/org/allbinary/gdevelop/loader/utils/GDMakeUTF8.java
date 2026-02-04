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
package org.allbinary.gdevelop.loader.utils;

import org.allbinary.gdevelop.loader.GDJSONGeneratorBase;
import org.allbinary.gdevelop.loader.GDJSONPersistence;
import org.allbinary.gdevelop.loader.GDToolStrings;
import org.allbinary.logic.io.file.FileUnamedUtil;

import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDMakeUTF8 extends GDJSONGeneratorBase {
    
    public static void main(String[] args) throws Exception
    {
        final GDJSONPersistence gdJSONPersistence = GDJSONPersistence.getInstance();
        final JSONObject gameAsConfigurationJSONObject = gdJSONPersistence.load();
        
        new GDMakeAllResourcesLowerCaseForAndroid().process(gameAsConfigurationJSONObject);
        final GDToolStrings gdToolStrings = GDToolStrings.getInstance();
        
        //Remove UTF-8
        final String jsonAsString = gameAsConfigurationJSONObject.toString(2);
        final String fixed = jsonAsString.replaceAll("[^\\x00-\\x7F]", "nonUTF-8char"); 
        
        gdJSONPersistence.save(gdToolStrings.ROOT_PATH + "game_updated.json", fixed);
    }
    
}
