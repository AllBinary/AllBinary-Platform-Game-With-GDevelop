
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.extensions.builtin.sprite.GDParticleSystemParticleEmitterObject
import org.allbinary.gdevelop.extensions.builtin.sprite.GDSpriteObject
import org.allbinary.gdevelop.extensions.builtin.sprite.GDTileMapObject
import org.json.JSONObject

open public class GDObjectFactory
            : Object
         {
        
companion object {
            
    private val instance: GDObjectFactory = GDObjectFactory()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDObjectFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDObjectFactory.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    private val SPRITE: String = "Sprite"

    private val TILE_MAP: String = "TileMap::TileMap"

    private val PARTICLE_SYSTEM_PARTICLE_EMITTER: String = "ParticleSystem::ParticleEmitter"

    open fun create(jsonObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
: GDObject{
    //var jsonObject = jsonObject

    var gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()!!


    var type: String = jsonObject!!.getString(gdProjectStrings!!.TYPE)!!


    
                        if(type.compareTo(this.SPRITE) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDSpriteObject(this.SPRITE, jsonObject)

                                    }
                                
                             else 
    
                        if(type.compareTo(this.PARTICLE_SYSTEM_PARTICLE_EMITTER) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDParticleSystemParticleEmitterObject(this.PARTICLE_SYSTEM_PARTICLE_EMITTER, jsonObject)

                                    }
                                
                             else 
    
                        if(type.compareTo(this.TILE_MAP) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDTileMapObject(this.TILE_MAP, jsonObject)

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDObject(type, jsonObject)

                        }
                            
}


}
                
            

