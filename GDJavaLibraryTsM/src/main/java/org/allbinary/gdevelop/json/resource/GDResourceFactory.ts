
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../java/lang/Object.js';
        
            import { RuntimeException } from '../../../../../java/lang/RuntimeException.js';
        
import { GDProjectStrings } from '../../../../../org/allbinary/gdevelop/json/GDProjectStrings.js';
//not GWT import const GDProjectStrings

//not plain js import { CommonStrings } 
const CommonStrings = globalThis.org.allbinary.string.CommonStrings;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { JSONObject } from '../../../../../org/json/JSONObject.js';
//not GWT import const JSONObject

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { GDBitmapFontResource } from './GDBitmapFontResource.js';
//not GWT import - same folder const GDBitmapFontResource
import { GDJsonResource } from './GDJsonResource.js';
//not GWT import - same folder const GDJsonResource
import { GDVideoResource } from './GDVideoResource.js';
//not GWT import - same folder const GDVideoResource
import { GDFontResource } from './GDFontResource.js';
//not GWT import - same folder const GDFontResource
import { GDAudioResource } from './GDAudioResource.js';
//not GWT import - same folder const GDAudioResource
import { GDImageResource } from './GDImageResource.js';
//not GWT import - same folder const GDImageResource
import { GDResource } from './GDResource.js';
//not GWT import - same folder const GDResource

export class GDResourceFactory
            extends Object
         {
        

    private static readonly instance: GDResourceFactory = new GDResourceFactory();

    public static getInstance(): GDResourceFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDResourceFactory.instance;
    
}


    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    public readonly KIND: string = "kind";

    public readonly IMAGE: string = "image";

    public readonly AUDIO: string = "audio";

    public readonly FONT: string = "font";

    public readonly VIDEO: string = "video";

    public readonly JSON: string = "json";

    public readonly BITMAP_FONT: string = "bitmapFont";

    public readonly TILE_MAP: string = "tilemap";

    public readonly TILE_SET: string = "tileset";

    public get(kind: string): string{

                        if(kind.compareTo(this.IMAGE) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.IMAGE;
    

                                    }
                                
                             else 
                        if(kind.compareTo(this.AUDIO) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.AUDIO;
    

                                    }
                                
                             else 
                        if(kind.compareTo(this.FONT) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.FONT;
    

                                    }
                                
                             else 
                        if(kind.compareTo(this.VIDEO) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.VIDEO;
    

                                    }
                                
                             else 
                        if(kind.compareTo(this.JSON) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.JSON;
    

                                    }
                                
                             else 
                        if(kind.compareTo(this.TILE_MAP) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.TILE_MAP;
    

                                    }
                                
                             else 
                        if(kind.compareTo(this.TILE_SET) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.TILE_SET;
    

                                    }
                                
                             else 
                        if(kind.compareTo(this.BITMAP_FONT) == 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.BITMAP_FONT;
    

                                    }
                                
                        else {
                            
    var commonStrings: CommonStrings = CommonStrings.getInstance()!;;
    
this.logUtil!.putF(kind, this, commonStrings!.CONSTRUCTOR);
    



                            throw new RuntimeException(kind);
                    

                        }
                            
}


    public create(jsonObject: JSONObject): GDResource{

    var kind: string = this.get(jsonObject!.getString(this.KIND))!;;
    

                        if(kind == this.IMAGE)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDImageResource(kind, jsonObject);
    

                                    }
                                
                             else 
                        if(kind == this.AUDIO)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDAudioResource(kind, jsonObject);
    

                                    }
                                
                             else 
                        if(kind == this.FONT)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDFontResource(kind, jsonObject);
    

                                    }
                                
                             else 
                        if(kind == this.VIDEO)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDVideoResource(kind, jsonObject);
    

                                    }
                                
                             else 
                        if(kind == this.JSON)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDJsonResource(kind, jsonObject);
    

                                    }
                                
                             else 
                        if(kind == this.TILE_MAP)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDJsonResource(kind, jsonObject);
    

                                    }
                                
                             else 
                        if(kind == this.TILE_SET)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDJsonResource(kind, jsonObject);
    

                                    }
                                
                             else 
                        if(kind == this.BITMAP_FONT)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return new GDBitmapFontResource(kind, jsonObject);
    

                                    }
                                
                        else {
                            


                            throw new RuntimeException(kind);
                    

                        }
                            
}


}



