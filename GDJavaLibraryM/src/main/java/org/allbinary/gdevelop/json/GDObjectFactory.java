/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.json;

import org.allbinary.gdevelop.extensions.builtin.sprite.GDParticleSystemParticleEmitterObject;
import org.allbinary.gdevelop.extensions.builtin.sprite.GDSpriteObject;
import org.allbinary.gdevelop.extensions.builtin.sprite.GDTileMapObject;
import org.json.JSONObject;

/**
 *
 * @author User
 */
public class GDObjectFactory
{
    private static final GDObjectFactory instance = new GDObjectFactory();

    /**
     * @return the instance
     */
    public static GDObjectFactory getInstance()
    {
        return instance;
    }
    
    private final String SPRITE = "Sprite";
    private final String TILE_MAP  = "TileMap::TileMap";
    private final String PARTICLE_SYSTEM_PARTICLE_EMITTER = "ParticleSystem::ParticleEmitter";
    
    public GDObject create(final JSONObject jsonObject) {
        
        final GDProjectStrings gdProjectStrings = GDProjectStrings.getInstance();
        
        final String type = jsonObject.getString(gdProjectStrings.TYPE);
        
        if(type.compareTo(SPRITE) == 0) {
            return new GDSpriteObject(SPRITE, jsonObject);
        } else if(type.compareTo(PARTICLE_SYSTEM_PARTICLE_EMITTER) == 0) {
            return new GDParticleSystemParticleEmitterObject(PARTICLE_SYSTEM_PARTICLE_EMITTER, jsonObject);
        } else if(type.compareTo(TILE_MAP) == 0) {
            return new GDTileMapObject(TILE_MAP, jsonObject);
        } else {
            return new GDObject(type, jsonObject);
        }

    }
}
