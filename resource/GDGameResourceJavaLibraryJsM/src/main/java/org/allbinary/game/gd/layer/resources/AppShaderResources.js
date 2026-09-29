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
import { Object } from '../../../../../../java/lang/Object.js';
//Current folder imports from return types, extended types, and scope (deduplicated)
export class AppShaderResources extends Object {
    constructor() {
        super(...arguments);
        this.LIKE2_FIXED_PIPLINE_LIGHTING_VERTEX_SHADER = "like2_fixed_pipeline_lighting_vertex_shader_glsl";
        this.LIKE2_FIXED_PIPLINE_LIGHTING_FRAGMENT_SHADER = "like2_fixed_pipeline_lighting_fragment_shader_glsl";
        this.VERTEX_ARRAY = [
            this.LIKE2_FIXED_PIPLINE_LIGHTING_VERTEX_SHADER
        ];
        this.FRAGMENT_ARRAY = [
            this.LIKE2_FIXED_PIPLINE_LIGHTING_FRAGMENT_SHADER
        ];
    }
    static getInstance() {
        //if statement needs to be on the same line and ternary does not work the same way.
        return AppShaderResources.instance;
    }
    getVertexShader(shaderIndex) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.VERTEX_ARRAY[shaderIndex];
    }
    getFragmentShader(shaderIndex) {
        //if statement needs to be on the same line and ternary does not work the same way.
        return this.FRAGMENT_ARRAY[shaderIndex];
    }
}
AppShaderResources.instance = new AppShaderResources();
