
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
        package org.allbinary.game.gd.layer.resources




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        

open public class AppShaderResources
            : Object
         {
        
companion object {
            
    val instance: AppShaderResources = AppShaderResources()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: AppShaderResources{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return AppShaderResources.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val LIKE2_FIXED_PIPLINE_LIGHTING_VERTEX_SHADER: String = "like2_fixed_pipeline_lighting_vertex_shader_glsl"

    val LIKE2_FIXED_PIPLINE_LIGHTING_FRAGMENT_SHADER: String = "like2_fixed_pipeline_lighting_fragment_shader_glsl"

    private val VERTEX_ARRAY: Array<String?> = arrayOf(this.LIKE2_FIXED_PIPLINE_LIGHTING_VERTEX_SHADER)

    private val FRAGMENT_ARRAY: Array<String?> = arrayOf(this.LIKE2_FIXED_PIPLINE_LIGHTING_FRAGMENT_SHADER)

    open fun getVertexShader(shaderIndex: Int)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var shaderIndex = shaderIndex



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.VERTEX_ARRAY[shaderIndex]!!
}


    open fun getFragmentShader(shaderIndex: Int)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var shaderIndex = shaderIndex



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.FRAGMENT_ARRAY[shaderIndex]!!
}


}
                
            

