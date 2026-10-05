
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.json.resource




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.gdevelop.json.GDProjectStrings
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.json.JSONObject

open public class GDResourceFactory
            : Object
         {
        
companion object {
            
    private val instance: GDResourceFactory = GDResourceFactory()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDResourceFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDResourceFactory.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    val KIND: String = "kind"

    val IMAGE: String = "image"

    val AUDIO: String = "audio"

    val FONT: String = "font"

    val VIDEO: String = "video"

    val JSON: String = "json"

    val BITMAP_FONT: String = "bitmapFont"

    val TILE_MAP: String = "tilemap"

    val TILE_SET: String = "tileset"

    open fun get(kind: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var kind = kind

    
                        if(kind.compareTo(this.IMAGE) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.IMAGE

                                    }
                                
                             else 
    
                        if(kind.compareTo(this.AUDIO) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.AUDIO

                                    }
                                
                             else 
    
                        if(kind.compareTo(this.FONT) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.FONT

                                    }
                                
                             else 
    
                        if(kind.compareTo(this.VIDEO) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.VIDEO

                                    }
                                
                             else 
    
                        if(kind.compareTo(this.JSON) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.JSON

                                    }
                                
                             else 
    
                        if(kind.compareTo(this.TILE_MAP) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.TILE_MAP

                                    }
                                
                             else 
    
                        if(kind.compareTo(this.TILE_SET) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.TILE_SET

                                    }
                                
                             else 
    
                        if(kind.compareTo(this.BITMAP_FONT) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.BITMAP_FONT

                                    }
                                
                        else {
                            
    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

this.logUtil!!.putF(kind, this, commonStrings!!.CONSTRUCTOR)



                            throw RuntimeException(kind)

                        }
                            
}


    open fun create(jsonObject: JSONObject)
        //nullable = true from not(false or (false and false)) = true
: GDResource{
    //var jsonObject = jsonObject

    var kind: String = this.get(jsonObject!!.getString(this.KIND))!!


    
                        if(kind == this.IMAGE)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDImageResource(kind, jsonObject)

                                    }
                                
                             else 
    
                        if(kind == this.AUDIO)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDAudioResource(kind, jsonObject)

                                    }
                                
                             else 
    
                        if(kind == this.FONT)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDFontResource(kind, jsonObject)

                                    }
                                
                             else 
    
                        if(kind == this.VIDEO)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDVideoResource(kind, jsonObject)

                                    }
                                
                             else 
    
                        if(kind == this.JSON)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDJsonResource(kind, jsonObject)

                                    }
                                
                             else 
    
                        if(kind == this.TILE_MAP)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDJsonResource(kind, jsonObject)

                                    }
                                
                             else 
    
                        if(kind == this.TILE_SET)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDJsonResource(kind, jsonObject)

                                    }
                                
                             else 
    
                        if(kind == this.BITMAP_FONT)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDBitmapFontResource(kind, jsonObject)

                                    }
                                
                        else {
                            


                            throw RuntimeException(kind)

                        }
                            
}


}
                
            

