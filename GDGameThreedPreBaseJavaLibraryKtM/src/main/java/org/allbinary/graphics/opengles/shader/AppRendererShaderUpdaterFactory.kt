
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
        package org.allbinary.graphics.opengles.shader




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import java.io.InputStream
import javax.microedition.khronos.egl.EGLConfig
import javax.microedition.khronos.opengles.GL10
import min3d.core.Object3d
import opengles.SemanticStrings
import org.allbinary.data.resource.ResourceUtil
import org.allbinary.game.gd.layer.resources.AppShaderResources
import org.allbinary.graphics.opengles.NullOpenGLProcessorFactory
import org.allbinary.graphics.opengles.OpenGLCapabilities
import org.allbinary.graphics.opengles.OpenGLVersionValidator
import org.allbinary.graphics.opengles.renderer.RendererStrings
import org.allbinary.graphics.threed.min3d.PlatformAppShaderResources
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.io.file.SimpleFileUtil
import org.allbinary.logic.string.StringUtil
import org.allbinary.util.BasicArrayList

open public class AppRendererShaderUpdaterFactory : ShaderUpdater {
        
companion object {
            
    val instance: AppRendererShaderUpdaterFactory = AppRendererShaderUpdaterFactory()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: AppRendererShaderUpdaterFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return AppRendererShaderUpdaterFactory.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val renderStrings: RendererStrings = RendererStrings.getInstance()!!

    private val semanticStrings: SemanticStrings = SemanticStrings.getInstance()!!

    private val openGLCapabilities: OpenGLCapabilities = OpenGLCapabilities.getInstance()!!

    private var shaderManager: ShaderManager = ShaderManagerFactory.getInstance()!!.create()!!

    private val appShaderResources: AppShaderResources = AppShaderResources.getInstance()!!

    private val resourceUtil: ResourceUtil = ResourceUtil.getInstance()!!

    private val simpleFileUtil: SimpleFileUtil = SimpleFileUtil.getInstance()!!

    val shaderCompositeArray: Array<ShaderComposite?> = arrayOf(PlatformShaderComposite(this.openGLCapabilities!!.VERSION_3_0, arrayOf(Shader(),Shader()), SimpleCompositeShaderUpdater(StringUtil.getInstance()!!.getArrayInstance(), arrayOf("lightPos","lightColor","cameraPos","myTexture"), arrayOf(this.semanticStrings!!.POSITION,this.semanticStrings!!.COLOR,this.semanticStrings!!.NORMAL,this.semanticStrings!!.TEXCOORD), IntArray(4)), SimpleShaderInitializer.getInstance(), ModelViewProjection.getInstance(), 
                            null, 
                            null))

    override fun onSurfaceCreated(gl: GL10, eglConfig: EGLConfig)
        //nullable = true from not(false or (false and false)) = true
{
    //var gl = gl
    //var eglConfig = eglConfig
PlatformAppShaderResources.getInstance()!!.add()

    var max: Int = 1024 *32


    var byteArray1: ByteArray = ByteArray(max)


    var size: Int = this.shaderCompositeArray!!.size
                


    var shaderComposite: ShaderComposite = this.shaderCompositeArray[0]!!

shaderComposite!!.colorEnableVertexAttribArrayOpenGLProcessor= NullOpenGLProcessorFactory.getInstance()
shaderComposite!!.colorDisableVertexAttribArrayOpenGLProcessor= NullOpenGLProcessorFactory.getInstance()
shaderComposite!!.uniformLightPositionOpenGLProcessor= UniformLightPositionOpenGLProcessor(shaderComposite, 0)
shaderComposite!!.uniformLightColorOpenGLProcessor= UniformLightColorOpenGLProcessor(shaderComposite, 1)
shaderComposite!!.uniformCameraPositionOpenGLProcessor= UniformCameraPositionOpenGLProcessor(shaderComposite, 2)
shaderComposite!!.uniformTextureUnitOpenGLProcessor= UniformTextureOpenGLProcessor(shaderComposite, 3)

    
                        if(this.shaderManager == ShaderManager.getInstance())
                        
                                    {
                                    this.logUtil!!.putF("Shaders already loaded", this, this.renderStrings!!.ON_SURFACE_CREATED)

                                    }
                                
                        else {
                            
    var openGLVersionValidator: OpenGLVersionValidator = OpenGLVersionValidator.getInstance()!!





                        for (index in 0 until size)

        {
shaderComposite= this.shaderCompositeArray[index]!!

    
                        if(openGLVersionValidator!!.isAvailable(shaderComposite!!.requiresOpenGLVersion))
                        
                                    {
                                    
    var shader: Shader = shaderComposite!!.shaderArray[0]!!

shader.shaderName= this.appShaderResources!!.getVertexShader(index)
this.loadShader(gl, shader, this.shaderManager!!.GL_VERTEX_SHADER, max, byteArray1)
shader= shaderComposite!!.shaderArray[1]!!
shader.shaderName= this.appShaderResources!!.getFragmentShader(index)
this.loadShader(gl, shader, this.shaderManager!!.GL_FRAGMENT_SHADER, max, byteArray1)
shaderComposite!!.init(gl)
this.logUtil!!.putF("shader programHandle: " +shaderComposite!!.programHandle, this, this.rendererStrings!!.ON_SURFACE_CREATED)
shaderComposite!!.compositeShaderUpdater!!.onSurfaceCreated(gl, eglConfig, shaderComposite!!.programHandle)

                                    }
                                
                        else {
                            this.logUtil!!.putF("shader is not available: " +index, this, this.rendererStrings!!.ON_SURFACE_CREATED)

                        }
                            
}


                        }
                            
this.shaderManager= ShaderManager.getInstance()
}


    open fun loadShader(gl: GL10, shader: Shader, shaderType: Int, max: Int, byteArray1: ByteArray)
        //nullable = true from not(false or (false and false)) = true
{
    //var gl = gl
    //var shader = shader
    //var shaderType = shaderType
    //var max = max
    //var byteArray1 = byteArray1

    var resource: String = shader.shaderName


        try {
            this.logUtil!!.putF(resource, this, this.rendererStrings!!.ON_SURFACE_CREATED)

    var inputStream: InputStream = this.resourceUtil!!.getResourceAsStream(resource)!!


    var stringList: BasicArrayList = 
                //Otherwise - initializer - AssignExpr

                                                            
                                                                
                                                                
                                                                    
                                                                
                                                            
                                                            
                                                                
                                                                
                                                                    
                                                                    
                                                                
                                                                
                                                                    
                                                                        
                                                                    
                                                                    
                                                                        
                                                                    
                                                                    
                                                                        
                                                                    
                                                                    
                                                                
                                                            
                                                        


    var shaderAsStringArray: Array<String?> = stringList!!.toArrayType(arrayOfNulls(stringList!!.size())) as Array<String?>

shader.shaderAsString= this.simpleFileUtil!!.createStringFromArrayOfStrings(shaderAsStringArray)
shader.shaderHandle= this.shaderManager!!.loadShader(gl, resource, shader.shaderStringList, shaderType)
this.logUtil!!.putF("shaderHandle: " +shader.shaderHandle, this, this.rendererStrings!!.ON_SURFACE_CREATED)
} catch(e: Exception)
            {
this.logUtil!!.put(this.commonStrings!!.EXCEPTION +resource, this, this.rendererStrings!!.ON_SURFACE_CREATED, e)
}

}


    open fun getTestShaders()
        //nullable = true from not(false or (false and true)) = true
: Array<ShaderOpenGLProcessor?>{

    var shaderOpenGLProcessorArray: Array<ShaderOpenGLProcessor?> = arrayOf()




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return shaderOpenGLProcessorArray
}


    open fun setShaderComposite(anyType: Any)
        //nullable = true from not(false or (false and false)) = true
{
    //var anyType = anyType

    var object3d: Object3d = anyType as Object3d

OpenGLVersionValidator.getInstance()!!.setShaderComposite(this.shaderCompositeArray[0]!!, object3d)
}


}
                
            

