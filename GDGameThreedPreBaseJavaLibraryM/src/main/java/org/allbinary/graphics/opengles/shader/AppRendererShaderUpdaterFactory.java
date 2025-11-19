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
package org.allbinary.graphics.opengles.shader;

import java.io.InputStream;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;
import min3d.core.Object3d;
import opengles.SemanticStrings;

import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.game.gd.layer.resources.AppShaderResources;
import org.allbinary.graphics.opengles.NullOpenGLProcessorFactory;
import org.allbinary.graphics.opengles.OpenGLCapabilities;
import org.allbinary.graphics.opengles.OpenGLVersionValidator;
import org.allbinary.graphics.opengles.renderer.RendererStrings;
import org.allbinary.graphics.threed.min3d.PlatformAppShaderResources;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.SimpleFileUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class AppRendererShaderUpdaterFactory extends ShaderUpdater {
    protected final LogUtil logUtil = LogUtil.getInstance();


    protected static final AppRendererShaderUpdaterFactory instance = new AppRendererShaderUpdaterFactory();

    /**
     * @return the instance
     */
    public static AppRendererShaderUpdaterFactory getInstance() {
        return instance;
    }

    private final RendererStrings renderStrings = RendererStrings.getInstance();
    private final SemanticStrings semanticStrings = SemanticStrings.getInstance();
    
    private final OpenGLCapabilities openGLCapabilities = OpenGLCapabilities.getInstance();
    
    private ShaderManager shaderManager = ShaderManagerFactory.getInstance().create();
    private final AppShaderResources appShaderResources = AppShaderResources.getInstance();

    private final ResourceUtil resourceUtil = ResourceUtil.getInstance();
    private final SimpleFileUtil simpleFileUtil = SimpleFileUtil.getInstance();
    
    //private IntBuffer samplerName = GLBuffers.newDirectIntBuffer(1);
    
    public final ShaderComposite[] shaderCompositeArray = {
//        new PlatformShaderComposite(openGLCapabilities.VERSION_2_0, 
//        new int[2],
//        new SimpleCompositeShaderUpdater(StringUtil.getInstance().getArrayInstance(), new String[]{"u_MVPMatrix"}, new String[]{"a_Position", "a_Color"}),
//        SimpleShaderInitializer.getInstance(),
//        SimpleExampleShaderModelViewProjection.getInstance(),
//        null,
//        null
//        ),
//
//        new PlatformShaderComposite(openGLCapabilities.VERSION_2_0, 
//        new int[2],
//        new SimpleCompositeShaderUpdater(StringUtil.getInstance().getArrayInstance(), StringUtil.getInstance().getArrayInstance(), new String[]{"a_Position", "a_Color"}),
//        SimpleShaderInitializer.getInstance(),
//        ModelViewProjection.getInstance(),
//        null,
//        null
//        ),
        
//        new ShaderComposite(openGLCapabilities.VERSION_2_0, 
//        new int[2],
//        new SimpleCompositeShaderUpdater(StringUtil.getInstance().getArrayInstance(), new String[]{"u_MVPMatrixArray0", "u_MVPMatrixArray1", "u_ActiveTexture"}, new String[]{"a_Vertex", "a_MultiTexCoord0"}),
//        SimpleShaderInitializer.getInstance(),
//        SimpleShaderModelViewProjection.getInstance(),
//        null,
//        null),
        
//        new PlatformShaderComposite(
//            openGLCapabilities.VERSION_3_0, 
//        new int[2],
//        new SimpleCompositeShaderUpdater(new String[]{"Projection"}, new String[]{"colorTexture"}, StringUtil.getInstance().getArrayInstance(), new int[]{Semantic.getInstance().Attr.POSITION, Semantic.getInstance().Attr.COLOR, Semantic.getInstance().Attr.NORMAL, Semantic.getInstance().Attr.TEX_COORD}),
//        SimpleShaderInitializer.getInstance(),
//        ModelViewProjection.getInstance(),
//        null,
//        null) {
//            public void init(GL10 gl) {
//                super.init(gl);
//                
//                final UniformShaderOpenGLProcessor uniformShaderOpenGLProcessor = new UniformShaderOpenGLProcessor(this);
//                uniformShaderOpenGLProcessor.process(gl, null, 0);
//            }
//        },
//
//        new PlatformShaderComposite(
//            openGLCapabilities.VERSION_3_0, 
//        new int[2],
//        new SimpleCompositeShaderUpdater(new String[]{"Projection"}, new String[]{"colorTexture"}, StringUtil.getInstance().getArrayInstance(), new int[]{Semantic.getInstance().Attr.POSITION, Semantic.getInstance().Attr.COLOR, Semantic.getInstance().Attr.NORMAL, Semantic.getInstance().Attr.TEX_COORD}),
//        SimpleShaderInitializer.getInstance(),
//        ModelViewProjection.getInstance(),
//        null,
//        null) {
//            public void init(GL10 gl) {
//                super.init(gl);
//                
//                final UniformShaderOpenGLProcessor uniformShaderOpenGLProcessor = new UniformShaderOpenGLProcessor(this); 
//                uniformShaderOpenGLProcessor.process(gl, null, 0);
//            }
//        },
        
//        new PlatformShaderComposite(
//            openGLCapabilities.VERSION_3_0, 
//        new int[2],
//        new SimpleCompositeShaderUpdater(StringUtil.getInstance().getArrayInstance(), new String[]{"colorTexture"}, StringUtil.getInstance().getArrayInstance(), new int[]{Semantic.getInstance().Attr.POSITION, Semantic.getInstance().Attr.COLOR, Semantic.getInstance().Attr.NORMAL, Semantic.getInstance().Attr.TEX_COORD}),
//        SimpleShaderInitializer.getInstance(),
//        ModelViewProjection.getInstance(),
//        null,
//        null) {
//            
//            public void init(GL10 gl) {
//                super.init(gl);
//
////                final com.jogamp.opengl.GL3 joglGL3 = (com.jogamp.opengl.GL3) ((JOGL11) gl).getJOGLGL();
////                joglGL3.glGenSamplers(1, samplerName);
////                joglGL3.glSamplerParameteri(samplerName.get(0), GL.GL_TEXTURE_WRAP_S, GL.GL_CLAMP_TO_EDGE);
////                joglGL3.glSamplerParameteri(samplerName.get(0), GL.GL_TEXTURE_WRAP_T, GL.GL_CLAMP_TO_EDGE);
////                joglGL3.glSamplerParameteri(samplerName.get(0), GL.GL_TEXTURE_MAG_FILTER, GL.GL_NEAREST);
////                joglGL3.glSamplerParameteri(samplerName.get(0), GL.GL_TEXTURE_MIN_FILTER, GL.GL_NEAREST);
//                
//            }
//                        
//        },        

//        new PlatformShaderComposite(
//            openGLCapabilities.VERSION_3_0, 
//        new Shader[]{ new Shader(), new Shader()},
//        new SimpleCompositeShaderUpdater(StringUtil.getInstance().getArrayInstance(), new String[]{"myTexture"}, new String[] { semanticStrings.POSITION, semanticStrings.COLOR, semanticStrings.NORMAL, semanticStrings.TEXCOORD}),
//        SimpleShaderInitializer.getInstance(),
//        ModelViewProjection.getInstance(),
//        null,
//        null),

        new PlatformShaderComposite(
            openGLCapabilities.VERSION_3_0, 
        new Shader[]{ new Shader(), new Shader()},

        new SimpleCompositeShaderUpdater(StringUtil.getInstance().getArrayInstance(), new String[]{"lightPos", "lightColor", "cameraPos", "myTexture"}, new String[] { semanticStrings.POSITION, semanticStrings.COLOR, semanticStrings.NORMAL, semanticStrings.TEXCOORD}),
        SimpleShaderInitializer.getInstance(),
        ModelViewProjection.getInstance(),
        null,
        null),
        
        };

    public void onSurfaceCreated(final GL10 gl, final EGLConfig eglConfig) {
        
        PlatformAppShaderResources.getInstance().add();
        
        final int max = 1024 * 32;
        final byte[] byteArray1 = new byte[max];
        
        final int size = shaderCompositeArray.length;
        
        //logUtil.put("Load Shaders: " + size, this, renderStrings.ON_SURFACE_CREATED);

//        shaderCompositeArray[0].textureEnableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
//        shaderCompositeArray[0].textureDisableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
//        shaderCompositeArray[0].shaderMatrixOpenGLProcessor = new ShaderMatrixOpenGLProcessor(shaderCompositeArray[0]);
//
//        shaderCompositeArray[1].textureEnableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
//        shaderCompositeArray[1].textureDisableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
//
//        shaderCompositeArray[2].colorEnableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
//        shaderCompositeArray[2].colorDisableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
//        shaderCompositeArray[2].uniformTextureUnitOpenGLProcessor = new UniformShaderOpenGLProcessor(shaderCompositeArray[2]);

        ShaderComposite shaderComposite = shaderCompositeArray[0];
        //shaderComposite.colorEnableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
        //shaderComposite.colorDisableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
        //shaderComposite.uniformTextureUnitOpenGLProcessor = new UniformShaderOpenGLProcessor(shaderComposite, 0);

        shaderComposite.colorEnableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
        shaderComposite.colorDisableVertexAttribArrayOpenGLProcessor = NullOpenGLProcessorFactory.getInstance();
        shaderComposite.uniformLightPositionOpenGLProcessor = new UniformLightPositionOpenGLProcessor(shaderComposite, 0);
        shaderComposite.uniformLightColorOpenGLProcessor = new UniformLightColorOpenGLProcessor(shaderComposite, 1);
        shaderComposite.uniformCameraPositionOpenGLProcessor = new UniformCameraPositionOpenGLProcessor(shaderComposite, 2);
        shaderComposite.uniformTextureUnitOpenGLProcessor = new UniformTextureOpenGLProcessor(shaderComposite, 3);

        if (shaderManager == ShaderManager.getInstance()) {
            logUtil.put("Shaders already loaded", this, renderStrings.ON_SURFACE_CREATED);
        } else {

            final OpenGLVersionValidator openGLVersionValidator = OpenGLVersionValidator.getInstance();
            for (int index = 0; index < size; index++) {
                shaderComposite = shaderCompositeArray[index];

                if (openGLVersionValidator.isAvailable(shaderComposite.requiresOpenGLVersion)) {
                    Shader shader = shaderComposite.shaderArray[0];
                    shader.shaderName = appShaderResources.getVertexShader(index);
                    this.loadShader(gl, shader, shaderManager.GL_VERTEX_SHADER, max, byteArray1);
                    shader = shaderComposite.shaderArray[1];
                    shader.shaderName = appShaderResources.getFragmentShader(index);
                    this.loadShader(gl, shader, shaderManager.GL_FRAGMENT_SHADER, max, byteArray1);
                    shaderComposite.init(gl);
                    logUtil.put("shader programHandle: " + shaderComposite.programHandle, this, this.rendererStrings.ON_SURFACE_CREATED);

                    shaderComposite.compositeShaderUpdater.onSurfaceCreated(gl, eglConfig, shaderComposite.programHandle);
                } else {
                    logUtil.put("shader is not available: " + index, this, this.rendererStrings.ON_SURFACE_CREATED);
                }
            }
        }
        
        shaderManager = ShaderManager.getInstance();
    }

    private void loadShader(final GL10 gl, final Shader shader, final int shaderType, final int max, final byte[] byteArray1) {
                    
        String resource = shader.shaderName;
        try {
            logUtil.put(resource, this, this.rendererStrings.ON_SURFACE_CREATED);
            final InputStream inputStream = resourceUtil.getResourceAsStream(resource);
            final BasicArrayList stringList = shader.shaderStringList = simpleFileUtil.loadFileAsList(inputStream, max, byteArray1, 1);
            String[] shaderAsStringArray = (String[]) stringList.toArray(new String[stringList.size()]);
            shader.shaderAsString = this.simpleFileUtil.createStringFromArrayOfStrings(shaderAsStringArray);
            //logUtil.put("shaderAsString: " + shader.shaderAsString, this, this.rendererStrings.ON_SURFACE_CREATED);
            shader.shaderHandle = shaderManager.loadShader(gl, resource, shader.shaderStringList, shaderType);
            logUtil.put("shaderHandle: " + shader.shaderHandle, this, this.rendererStrings.ON_SURFACE_CREATED);
        } catch (Exception e) {
            logUtil.put(commonStrings.EXCEPTION + resource, this, this.rendererStrings.ON_SURFACE_CREATED, e);
        }
    }
    
    public ShaderOpenGLProcessor[] getTestShaders() {
        
        //final PlayerVehicleResources playerVehicleResources = PlayerVehicleResources.getInstance();
        
        final ShaderOpenGLProcessor[] shaderOpenGLProcessorArray = new ShaderOpenGLProcessor[]{
            //new SimpleExampleTextureShaderOpenGLProcessor(this.shaderCompositeArray[0], playerVehicleResources.BODY),
            //new SimpleExampleShaderOpenGLProcessor(this.shaderCompositeArray[0]),
            //new SimpleShaderWithTextureExampleOpenGLProcessor(0),
            //new GammaExampleTextureShaderOpenGLProcessor(this.shaderCompositeArray[1], this.shaderCompositeArray[2])
            //new SimpleExampleTextureShaderOpenGLProcessor(this.shaderCompositeArray[3])
        };
        
        return shaderOpenGLProcessorArray;
    }

    public void setShaderComposite(final Object object) {
        final Object3d object3d = (Object3d) object;
        OpenGLVersionValidator.getInstance().setShaderComposite(this.shaderCompositeArray[0], object3d);
    }
    
}
