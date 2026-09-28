
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

        


            import { Exception } from '../../../../../java/lang/Exception.js';
        
import { InputStream } from '../../../../../java/io/InputStream.js';
//not GWT import const InputStream

import { EGLConfig } from '../../../../../javax/microedition/khronos/egl/EGLConfig.js';
//not GWT import const EGLConfig

import { GL10 } from '../../../../../javax/microedition/khronos/opengles/GL10.js';
//not GWT import const GL10

import { Object3d } from '../../../../../min3d/core/Object3d.js';
//not GWT import const Object3d

import { SemanticStrings } from '../../../../../opengles/SemanticStrings.js';
//not GWT import const SemanticStrings

//not plain js import { ResourceUtil } 
const ResourceUtil = globalThis.org.allbinary.data.resource.ResourceUtil;

import { AppShaderResources } from '../../../../../org/allbinary/game/gd/layer/resources/AppShaderResources.js';
//not GWT import const AppShaderResources

import { NullOpenGLProcessorFactory } from '../../../../../org/allbinary/graphics/opengles/NullOpenGLProcessorFactory.js';
//not GWT import const NullOpenGLProcessorFactory

import { OpenGLCapabilities } from '../../../../../org/allbinary/graphics/opengles/OpenGLCapabilities.js';
//not GWT import const OpenGLCapabilities

import { OpenGLVersionValidator } from '../../../../../org/allbinary/graphics/opengles/OpenGLVersionValidator.js';
//not GWT import const OpenGLVersionValidator

import { RendererStrings } from '../../../../../org/allbinary/graphics/opengles/renderer/RendererStrings.js';
//not GWT import const RendererStrings

import { PlatformAppShaderResources } from '../../../../../org/allbinary/graphics/threed/min3d/PlatformAppShaderResources.js';
//not GWT import const PlatformAppShaderResources

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { SimpleFileUtil } from '../../../../../org/allbinary/logic/io/file/SimpleFileUtil.js';
//not GWT import const SimpleFileUtil

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { ShaderUpdater } from './ShaderUpdater.js';
//not GWT import - same folder const ShaderUpdater
import { ShaderManagerFactory } from './ShaderManagerFactory.js';
//not GWT import - same folder const ShaderManagerFactory
import { ShaderManager } from './ShaderManager.js';
//not GWT import - same folder const ShaderManager
import { PlatformShaderComposite } from './PlatformShaderComposite.js';
//not GWT import - same folder const PlatformShaderComposite
import { Shader } from './Shader.js';
//not GWT import - same folder const Shader
import { SimpleCompositeShaderUpdater } from './SimpleCompositeShaderUpdater.js';
//not GWT import - same folder const SimpleCompositeShaderUpdater
import { SimpleShaderInitializer } from './SimpleShaderInitializer.js';
//not GWT import - same folder const SimpleShaderInitializer
import { ModelViewProjection } from './ModelViewProjection.js';
//not GWT import - same folder const ModelViewProjection
import { ShaderComposite } from './ShaderComposite.js';
//not GWT import - same folder const ShaderComposite
import { UniformLightPositionOpenGLProcessor } from './UniformLightPositionOpenGLProcessor.js';
//not GWT import - same folder const UniformLightPositionOpenGLProcessor
import { UniformLightColorOpenGLProcessor } from './UniformLightColorOpenGLProcessor.js';
//not GWT import - same folder const UniformLightColorOpenGLProcessor
import { UniformCameraPositionOpenGLProcessor } from './UniformCameraPositionOpenGLProcessor.js';
//not GWT import - same folder const UniformCameraPositionOpenGLProcessor
import { UniformTextureOpenGLProcessor } from './UniformTextureOpenGLProcessor.js';
//not GWT import - same folder const UniformTextureOpenGLProcessor
import { ShaderOpenGLProcessor } from './ShaderOpenGLProcessor.js';
//not GWT import - same folder const ShaderOpenGLProcessor

export class AppRendererShaderUpdaterFactory extends ShaderUpdater {
        

    static readonly instance: AppRendererShaderUpdaterFactory = new AppRendererShaderUpdaterFactory();

    public static getInstance(): AppRendererShaderUpdaterFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return AppRendererShaderUpdaterFactory.instance;
    
}


    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly renderStrings: RendererStrings = RendererStrings.getInstance()!;

    private readonly semanticStrings: SemanticStrings = SemanticStrings.getInstance()!;

    private readonly openGLCapabilities: OpenGLCapabilities = OpenGLCapabilities.getInstance()!;

    private shaderManager: ShaderManager = ShaderManagerFactory.getInstance()!.create()!;

    private readonly appShaderResources: AppShaderResources = AppShaderResources.getInstance()!;

    private readonly resourceUtil: ResourceUtil = ResourceUtil.getInstance()!;

    private readonly simpleFileUtil: SimpleFileUtil = SimpleFileUtil.getInstance()!;

    public readonly shaderCompositeArray: ShaderComposite[] = 
                                                        [
                                                            new PlatformShaderComposite(this.openGLCapabilities!.VERSION_3_0, 
                                                [
                                                    new Shader(),new Shader()
                                                ], new SimpleCompositeShaderUpdater(StringUtil.getInstance()!.getArrayInstance(), 
                                                [
                                                    "lightPos","lightColor","cameraPos","myTexture"
                                                ], 
                                                [
                                                    this.semanticStrings!.POSITION,this.semanticStrings!.COLOR,this.semanticStrings!.NORMAL,this.semanticStrings!.TEXCOORD
                                                ], new Array(4)), SimpleShaderInitializer.getInstance(), ModelViewProjection.getInstance(), 
                            null, 
                            null)
                                                        ];

    public onSurfaceCreated(gl: GL10, eglConfig: EGLConfig){
PlatformAppShaderResources.getInstance()!.add();
    

    var max: number = 1024 *32;;
    

    var byteArray1: number[] = new Array(max);;
    

    var size: number = this.shaderCompositeArray!.length
                ;;
    

    var shaderComposite: ShaderComposite = this.shaderCompositeArray[0]!;;
    
shaderComposite!.colorEnableVertexAttribArrayOpenGLProcessor= NullOpenGLProcessorFactory.getInstance();
    
shaderComposite!.colorDisableVertexAttribArrayOpenGLProcessor= NullOpenGLProcessorFactory.getInstance();
    
shaderComposite!.uniformLightPositionOpenGLProcessor= new UniformLightPositionOpenGLProcessor(shaderComposite, 0);
    
shaderComposite!.uniformLightColorOpenGLProcessor= new UniformLightColorOpenGLProcessor(shaderComposite, 1);
    
shaderComposite!.uniformCameraPositionOpenGLProcessor= new UniformCameraPositionOpenGLProcessor(shaderComposite, 2);
    
shaderComposite!.uniformTextureUnitOpenGLProcessor= new UniformTextureOpenGLProcessor(shaderComposite, 3);
    

                        if(this.shaderManager == ShaderManager.getInstance())
                        
                                    {
                                    this.logUtil!.putF("Shaders already loaded", this, this.renderStrings!.ON_SURFACE_CREATED);
    

                                    }
                                
                        else {
                            
    var openGLVersionValidator: OpenGLVersionValidator = OpenGLVersionValidator.getInstance()!;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
shaderComposite= this.shaderCompositeArray[index]!;
    

                        if(openGLVersionValidator!.isAvailable(shaderComposite!.requiresOpenGLVersion))
                        
                                    {
                                    
    var shader: Shader = shaderComposite!.shaderArray[0]!;;
    
shader.shaderName= this.appShaderResources!.getVertexShader(index);
    
this.loadShader(gl, shader, this.shaderManager!.GL_VERTEX_SHADER, max, byteArray1);
    
shader= shaderComposite!.shaderArray[1]!;
    
shader.shaderName= this.appShaderResources!.getFragmentShader(index);
    
this.loadShader(gl, shader, this.shaderManager!.GL_FRAGMENT_SHADER, max, byteArray1);
    
shaderComposite!.init(gl);
    
this.logUtil!.putF("shader programHandle: " +shaderComposite!.programHandle, this, this.rendererStrings!.ON_SURFACE_CREATED);
    
shaderComposite!.compositeShaderUpdater!.onSurfaceCreated(gl, eglConfig, shaderComposite!.programHandle);
    

                                    }
                                
                        else {
                            this.logUtil!.putF("shader is not available: " +index, this, this.rendererStrings!.ON_SURFACE_CREATED);
    

                        }
                            
}


                        }
                            
this.shaderManager= ShaderManager.getInstance();
    
}


    loadShader(gl: GL10, shader: Shader, shaderType: number, max: number, byteArray1: number[]){

    var resource: string = shader.shaderName;;
    

        try {
            this.logUtil!.putF(resource, this, this.rendererStrings!.ON_SURFACE_CREATED);
    

    var inputStream: InputStream = this.resourceUtil!.getResourceAsStream(resource)!;;
    

    var stringList: BasicArrayList = 
                //Otherwise - initializer - AssignExpr

                                                            
                                                                
                                                                
                                                                    
                                                                
                                                            
                                                            
                                                                
                                                                
                                                                    
                                                                    
                                                                
                                                                
                                                                    
                                                                        
                                                                    
                                                                    
                                                                        
                                                                    
                                                                    
                                                                        
                                                                    
                                                                    
                                                                
                                                            
                                                        ;;
    

    var shaderAsStringArray: string[] = stringList!.toArrayType(new Array(stringList!.size())) as string[];;
    
shader.shaderAsString= this.simpleFileUtil!.createStringFromArrayOfStrings(shaderAsStringArray);
    
shader.shaderHandle= this.shaderManager!.loadShader(gl, resource, shader.shaderStringList, shaderType);
    
this.logUtil!.putF("shaderHandle: " +shader.shaderHandle, this, this.rendererStrings!.ON_SURFACE_CREATED);
    

                //: 
} catch(e) 
            {
this.logUtil!.put(this.commonStrings!.EXCEPTION +resource, this, this.rendererStrings!.ON_SURFACE_CREATED, e);
    
}

}


    public getTestShaders(): ShaderOpenGLProcessor[]{

    var shaderOpenGLProcessorArray: ShaderOpenGLProcessor[] = 
                                                [
                                                    
                                                ];;
    



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return shaderOpenGLProcessorArray;
    
}


    public setShaderComposite(anyType: any = {}){

    var object3d: Object3d = anyType as Object3d;;
    
OpenGLVersionValidator.getInstance()!.setShaderComposite(this.shaderCompositeArray[0]!, object3d);
    
}


}



