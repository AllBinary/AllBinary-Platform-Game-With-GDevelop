/*
        *
        *  GDevelop to AllBinary Core
        *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.
*/
/* Generated Code Do Not Modify */
import { Object } from '../../../../java/lang/Object.js';
import { GDParticleSystemParticleEmitterObject } from '../../../../org/allbinary/gdevelop/extensions/builtin/sprite/GDParticleSystemParticleEmitterObject.js';
//not GWT import const GDParticleSystemParticleEmitterObject
import { GDSpriteObject } from '../../../../org/allbinary/gdevelop/extensions/builtin/sprite/GDSpriteObject.js';
//not GWT import const GDSpriteObject
import { GDTileMapObject } from '../../../../org/allbinary/gdevelop/extensions/builtin/sprite/GDTileMapObject.js';
//not GWT import const JSONObject
//Current folder imports from return types, extended types, and scope (deduplicated)
import { GDProjectStrings } from './GDProjectStrings.js';
//not GWT import - same folder const GDProjectStrings
import { GDObject } from './GDObject.js';
//not GWT import - same folder const GDObject
export class GDObjectFactory extends Object {
    constructor() {
        super(...arguments);
        this.SPRITE = "Sprite";
        this.TILE_MAP = "TileMap::TileMap";
        this.PARTICLE_SYSTEM_PARTICLE_EMITTER = "ParticleSystem::ParticleEmitter";
    }
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return GDObjectFactory.instance;
    }
    create(jsonObject) {
        var gdProjectStrings = GDProjectStrings.getInstance();
        ;
        var type = jsonObject.getString(gdProjectStrings.TYPE);
        ;
        if (type.compareTo(this.SPRITE) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDSpriteObject(this.SPRITE, jsonObject);
        }
        else if (type.compareTo(this.PARTICLE_SYSTEM_PARTICLE_EMITTER) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDParticleSystemParticleEmitterObject(this.PARTICLE_SYSTEM_PARTICLE_EMITTER, jsonObject);
        }
        else if (type.compareTo(this.TILE_MAP) == 0) {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDTileMapObject(this.TILE_MAP, jsonObject);
        }
        else {
            //if statement needs to be on the same line and ternary does not work the same way.
            return new GDObject(type, jsonObject);
        }
    }
}
GDObjectFactory.instance = new GDObjectFactory();
