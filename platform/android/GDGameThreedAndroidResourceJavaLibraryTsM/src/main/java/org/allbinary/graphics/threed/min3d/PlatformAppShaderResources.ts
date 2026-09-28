
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2025 AllBinary 
                *   
                *  By agreeing to this license you and any business entity you represent are 
                *  legally bound to the AllBinary Open License Version 1 legal agreement. 
                *   
                *  You may obtain the AllBinary Open License Version 1 legal agreement from 
                *  AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
                *   
                *  Created By: Travis Berthelot    
        */
        
        /* Generated Code Do Not Modify */

        


            import { Object } from '../../../../../java/lang/Object.js';
        
            import { Integer } from '../../../../../java/lang/Integer.js';
        
import { AndroidResources } from '../../../../../org/allbinary/AndroidResources.js';
//not GWT import const AndroidResources

//not plain js import { ResourceUtil } 
const ResourceUtil = globalThis.org.allbinary.data.resource.ResourceUtil;

import { AppShaderResources } from '../../../../../org/allbinary/game/gd/layer/resources/AppShaderResources.js';
//not GWT import const AppShaderResources

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class PlatformAppShaderResources
            extends Object
         {
        

    static readonly instance: PlatformAppShaderResources = new PlatformAppShaderResources();

    public static getInstance(): PlatformAppShaderResources{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return PlatformAppShaderResources.instance;
    
}


    public add(){

    var resourceUtil: ResourceUtil = ResourceUtil.getInstance()!;;
    

    var androidResources: AndroidResources = AndroidResources.getInstance()!;;
    

    var appShaderResources: AppShaderResources = AppShaderResources.getInstance()!;;
    
resourceUtil!.addResource(appShaderResources!.LIKE2_FIXED_PIPLINE_LIGHTING_VERTEX_SHADER, Integer.valueOf(androidResources!.raw.like2_fixed_pipeline_lighting_vertex_shader_glsl));
    
resourceUtil!.addResource(appShaderResources!.LIKE2_FIXED_PIPLINE_LIGHTING_FRAGMENT_SHADER, Integer.valueOf(androidResources!.raw.like2_fixed_pipeline_lighting_fragment_shader_glsl));
    
}


}



