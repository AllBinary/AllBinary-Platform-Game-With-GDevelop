
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
        package org.allbinary.graphics.threed.min3d




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.AndroidResources
import org.allbinary.data.resource.ResourceUtil
import org.allbinary.game.gd.layer.resources.AppShaderResources

open public class PlatformAppShaderResources
            : Object
         {
        
companion object {
            
    val instance: PlatformAppShaderResources = PlatformAppShaderResources()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: PlatformAppShaderResources{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return PlatformAppShaderResources.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    open fun add()
        //nullable = true from not(false or (false and true)) = true
{

    var resourceUtil: ResourceUtil = ResourceUtil.getInstance()!!


    var androidResources: AndroidResources = AndroidResources.getInstance()!!


    var appShaderResources: AppShaderResources = AppShaderResources.getInstance()!!

resourceUtil!!.addResource(appShaderResources!!.LIKE2_FIXED_PIPLINE_LIGHTING_VERTEX_SHADER, Integer(Integer.valueOf(androidResources!!.raw.like2_fixed_pipeline_lighting_vertex_shader_glsl)))
resourceUtil!!.addResource(appShaderResources!!.LIKE2_FIXED_PIPLINE_LIGHTING_FRAGMENT_SHADER, Integer(Integer.valueOf(androidResources!!.raw.like2_fixed_pipeline_lighting_fragment_shader_glsl)))
}


}
                
            

