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
package org.allbinary.graphics.threed.min3d;

import org.allbinary.AndroidResources;
import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.game.gd.layer.resources.AppShaderResources;

/**
 *
 * @author User
 */
public class PlatformAppShaderResources {
    
    protected static final PlatformAppShaderResources instance = new PlatformAppShaderResources();

    /**
     * @return the instance
     */
    public static PlatformAppShaderResources getInstance() {
        return instance;
    }

    public void add() {
        final ResourceUtil resourceUtil = ResourceUtil.getInstance();
        final AndroidResources androidResources = AndroidResources.getInstance();
        
        final AppShaderResources appShaderResources = AppShaderResources.getInstance();        

        resourceUtil.addResource(
            appShaderResources.LIKE2_FIXED_PIPLINE_LIGHTING_VERTEX_SHADER,
            Integer.valueOf(androidResources.raw.simple_vertex_shader_gsn_glsl));

        resourceUtil.addResource(
            appShaderResources.LIKE2_FIXED_PIPLINE_LIGHTING_FRAGMENT_SHADER,
            Integer.valueOf(androidResources.raw.simple_texture_fragment_shader_gsn_glsl));
        
    }
        
}
