/*
 * AllBinary Open License Version 1
 * Copyright (c) 2025 AllBinary
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
package org.allbinary.game.gd.layer.resources;

/**
 *
 * @author User
 */
public class AppShaderResources {
    
    protected static final AppShaderResources instance = new AppShaderResources();

    /**
     * @return the instance
     */
    public static AppShaderResources getInstance() {
        return instance;
    }

    //public final String SIMPLE_VERTEX_SHADER = "simple_vertex_shader_mvp_glsl";
    //public final String SIMPLE_VERTEX_SHADER_2 = "simple_vertex_shader_glsl";
    //public final String SIMPLE_VERTEX_SHADER_110_COMPATIBILITY = "simple_vertex_shader_glsl_110_compatibility";    
    //public final String SIMPLE_VERTEX_SHADER_110 = "simple_vertex_shader_glsl_110";
    //public final String SIMPLE_VERTEX_SHADER_120 = "simple_vertex_shader_glsl_120";
    //public final String SIMPLE_VERTEX_SHADER_460 = "simple_vertex_shader_glsl_460";
    //public final String SIMPLE_VERTEX_SHADER_460_COMPATIBILITY = "simple_vertex_shader_glsl_460_compatibility";

    //public final String SIMPLE_FRAGMENT_SHADER = "simple_fragment_shader_glsl";
    //public final String SIMPLE_FRAGMENT_SHADER_110_COMPATIBILITY = "simple_vertex_shader_glsl_110_compatibility";
    //public final String SIMPLE_FRAGMENT_SHADER_110 = "simple_fragment_shader_glsl_110";
    //public final String SIMPLE_FRAGMENT_SHADER_120 = "simple_fragment_shader_glsl_120";
    //public final String SIMPLE_FRAGMENT_SHADER_460 = "simple_fragment_shader_glsl_460";
    //public final String SIMPLE_FRAGMENT_SHADER_460_COMPATIBILITY = "simple_vertex_shader_glsl_460_compatibility";
 
    //public final String SIMPLE_VERTEX_SHADER_3 = "screen_coords_vertex_shader_glsl";
    //public final String SIMPLE_VERTEX_SHADER_5 = "projection_vertex_shader_glsl";
//    public final String SIMPLE_VERTEX_SHADER_GSN = "simple_vertex_shader_gsn_glsl";
    public final String LIKE2_FIXED_PIPLINE_LIGHTING_VERTEX_SHADER = "like2_fixed_pipeline_lighting_vertex_shader_glsl";
    
//    public final String SIMPLE_TEXTURE_FRAGMENT_SHADER_3 = "simple_texture_no_gamma_fragment_shader_glsl";
//    public final String SIMPLE_TEXTURE_FRAGMENT_SHADER_4 = "simple_texture_gamma_fragment_shader_glsl";
//    public final String SIMPLE_TEXTURE_FRAGMENT_SHADER_GSN = "simple_texture_fragment_shader_gsn_glsl";
    public final String LIKE2_FIXED_PIPLINE_LIGHTING_FRAGMENT_SHADER = "like2_fixed_pipeline_lighting_fragment_shader_glsl";
    
//    public final String DEPTH_FRAGMENT_SHADER = "default_fragment_depth_shader_glsl";
//    public final String FOG_LIGHT0_FRAGMENT_SHADER = "default_fragment_foglight0_shader_glsl";
//    public final String FOG_FRAGMENT_SHADER = "default_fragment_fog_shader_glsl";
//    public final String DEFAULT_FRAGMENT_SHADER = "default_fragment_shader_glsl";
    
//    public final String TEX0AMB_FRAGMENT_SHADER = "default_fragment_tex0amb_shader_glsl";
//    public final String TEX0_FRAGMENT_SHADER = "default_fragment_tex0_shader_glsl";
//    public final String TEX1_FRAGMENT_SHADER = "default_fragment_tex1_shader_glsl";
//    public final String TEX0LIGHT0_FRAGMENT_SHADER = "default_fragmen_tex0light0_shader_glsl";
    
//    public final String DEPTH_VERTEX_SHADER = "default_vertex_depth_shader_glsl";
//    public final String FOG_LIGHT0_VERTEX_SHADER = "default_vertex_foglight0_shader_glsl";
//    public final String FOG_VERTEX_SHADER = "default_vertex_fog_shader_glsl";
//    public final String FOG_VIVANTE_VERTEX_SHADER = "default_vertex_fog_vivante_shader_glsl";
//    public final String TEX0_AMB_VERTEX_SHADER = "default_vertex_tex0amb_shader_glsl";
//    public final String TEX0_LIGHT0_VERTEX_SHADER = "default_vertex_tex0light0_shader_glsl";
//    public final String TEX0_VERTEX_SHADER = "default_vertex_tex0_shader_glsl";
//    public final String TEX0_VIVANTE_VERTEX_SHADER = "default_vertex_tex0_vivante_shader_glsl";
//    public final String TEX1_VERTEX_SHADER = "default_vertex_tex1_shader_glsl";
//    public final String TEX1_VIVANTE_VERTEX_SHADER = "default_vertex_tex1_vivante_shader_glsl";
//    public final String VIVANTE_VERTEX_SHADER = "default_vertex_vivante_shader_glsl";
    
//shadow_fragment_postef_shader_glsl
//shadow_fragment_postpcfef_shader_glsl
//shadow_fragment_postpcf_shader_glsl
//shadow_fragment_posttex0ef_shader_glsl
//shadow_fragment_posttex0_shader_glsl
//shadow_fragment_post_shader_glsl
//shadow_fragment_post_tex0pcfef_shader_glsl
//shadow_fragment_post_tex0pcf_shader_glsl
//shadow_fragment_preef_shader_glsl
//shadow_fragment_prepcfef_shader_glsl
//shadow_fragment_prepcf_shader_glsl
//shadow_fragment_pre_shader_glsl
//shadow_vertex_post_shader_glsl
//shadow_vertex_pre_shader_glsl
    
    private final String[] VERTEX_ARRAY = {
//        SIMPLE_VERTEX_SHADER,
//        SIMPLE_VERTEX_SHADER_2,
//        //SIMPLE_VERTEX_SHADER_3,
//        //SIMPLE_VERTEX_SHADER_3,
//        SIMPLE_VERTEX_SHADER_5,
        //SIMPLE_VERTEX_SHADER_GSN
        LIKE2_FIXED_PIPLINE_LIGHTING_VERTEX_SHADER
    };
    
    private final String[] FRAGMENT_ARRAY = {
//        SIMPLE_FRAGMENT_SHADER,
//        SIMPLE_FRAGMENT_SHADER,
//        //SIMPLE_TEXTURE_FRAGMENT_SHADER_3,
//        //SIMPLE_TEXTURE_FRAGMENT_SHADER_4,
//        SIMPLE_TEXTURE_FRAGMENT_SHADER_4,
        //SIMPLE_TEXTURE_FRAGMENT_SHADER_GSN
        LIKE2_FIXED_PIPLINE_LIGHTING_FRAGMENT_SHADER
    };
    
    public String getVertexShader(final int shaderIndex) {
//        final OpenGLCapabilities openGLCapabilities = OpenGLCapabilities.getInstance();
//        if (openGLCapabilities.shaderVersion == 110) {
//            return this.SIMPLE_VERTEX_SHADER_110;
//        } else if (openGLCapabilities.shaderVersion == 120) {
//            return this.SIMPLE_VERTEX_SHADER_120;
//        } else if (openGLCapabilities.shaderVersion == 460) {
//            return this.SIMPLE_VERTEX_SHADER_460;
//        }
        
//        return this.SIMPLE_VERTEX_SHADER_110_COMPATIBILITY;

        return this.VERTEX_ARRAY[shaderIndex];
        
    }

    public String getFragmentShader(final int shaderIndex) {
//        final OpenGLCapabilities openGLCapabilities = OpenGLCapabilities.getInstance();
//        if (openGLCapabilities.shaderVersion == 110) {
//            return this.SIMPLE_FRAGMENT_SHADER_110;
//        } else if (openGLCapabilities.shaderVersion == 120) {
//            return this.SIMPLE_FRAGMENT_SHADER_120;
//        } else if (openGLCapabilities.shaderVersion == 460) {
//            return this.SIMPLE_FRAGMENT_SHADER_460;
//        } else if (openGLCapabilities.shaderVersion > 460) {
//            return this.SIMPLE_FRAGMENT_SHADER_460_COMPATIBILITY;
//        }
        
//        return this.SIMPLE_FRAGMENT_SHADER_110_COMPATIBILITY;

        return this.FRAGMENT_ARRAY[shaderIndex];
    }
    
}
