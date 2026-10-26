
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2026 AllBinary 
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
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        import java.lang.Math
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import java.io.File
import org.allbinary.logic.NullUtil
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringUtil

open public class GDPaths
            : Object
         {
        
companion object {
            
    val DEFAULT_PATH: String = "..\\"

    private var instance: Any = NullUtil.getInstance()!!.NULL_OBJECT

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDPaths{

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDPaths.instance as GDPaths
}


    open fun init()
        //nullable = true from not(false or (false and true)) = true
{
GDPaths.init(GDLanguageFactory.getInstance()!!.JAVA)
}


    open fun init(language: GDLanguage)
        //nullable = true from not(false or (false and false)) = true
{
    //var language = language
GDPaths.init(language, false)
}


                @Throws(Exception::class)
            
    open fun init(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var args = args

    var gdLanguageSelection: GDLanguageSelection = GDLanguageSelection.getInstance()!!


    var language: GDLanguage = gdLanguageSelection!!.select(args)!!


    var testExtension: Boolean = gdLanguageSelection!!.selectTestExtension(args)

GDPaths.init(language, testExtension)
}


    open fun init(language: GDLanguage, testExtension: Boolean)
        //nullable = true from not(false or (false and false)) = true
{
    //var language = language
    //var testExtension = testExtension
GDPaths.instance= GDPaths(GDPaths.DEFAULT_PATH, GDPaths.DEFAULT_PATH, GDPaths.DEFAULT_PATH, "Resources\\", "Resources\\", "2d\\res\\raw\\", "3d\\res\\raw\\", language, testExtension)
}


    open fun initGenPath(genPath: String, language: GDLanguage)
        //nullable = true from not(false or (false and false)) = true
{
    //var genPath = genPath
    //var language = language
GDPaths.instance= GDPaths(GDPaths.DEFAULT_PATH, genPath, GDPaths.DEFAULT_PATH, "Resources\\", "Resources\\", "2d\\res\\raw\\", "3d\\res\\raw\\", language)
}


    open fun init(xslPath: String, genPath: String, projectPath: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var xslPath = xslPath
    //var genPath = genPath
    //var projectPath = projectPath
GDPaths.init(xslPath, genPath, projectPath, GDLanguageFactory.getInstance()!!.JAVA)
}


    open fun init(xslPath: String, genPath: String, projectPath: String, language: GDLanguage)
        //nullable = true from not(false or (false and false)) = true
{
    //var xslPath = xslPath
    //var genPath = genPath
    //var projectPath = projectPath
    //var language = language
GDPaths.instance= GDPaths(xslPath, genPath, projectPath, "sounds\\", StringUtil.getInstance()!!.EMPTY_STRING, "2d\\Resources\\2d\\res\\raw\\", "3d\\Resources\\3d\\res\\raw\\", language)
}


        }
            
    private val XSL_EXTENSION: String = ".xsl"

    private val JAVA_EXTENSION: String = ".java"

    private val TEST_EXTENSION_SUFFIX: String = "t"

    private val MODULE_PREFIX: String = "GDGame"

    private val MODULE_SUFFIX_ARRAY: Array<String?> = arrayOf("Gradle","M")

    var ROOT_PATH: String

    var GEN_PATH: String

    var PROJECT_PATH: String

    val language: GDLanguage

    val testExtension: Boolean

    val outputExtensionArray: Array<String?>

    val GAME_XML_PATH: String

    val GAME_JSON_PATH: String

    val TWOD_RESOURCES_PATH: String

    val THREED_RESOURCES_PATH: String

    val ASSETS_PATH: String

    val ROTATION_ANIMATION_FILE_PATH: String

    val SOUND_RESOURCES_ROOT_PATH: String
public constructor (xslPath: String, genPath: String, projectPath: String, soundResourcesDirectory: String, assetsDirectory: String, twodPath: String, threedPath: String)                        

                            : this(xslPath, genPath, projectPath, soundResourcesDirectory, assetsDirectory, twodPath, threedPath, GDLanguageFactory.getInstance()!!.JAVA){
    //var xslPath = xslPath
    //var genPath = genPath
    //var projectPath = projectPath
    //var soundResourcesDirectory = soundResourcesDirectory
    //var assetsDirectory = assetsDirectory
    //var twodPath = twodPath
    //var threedPath = threedPath


                            //For kotlin this is before the body of the constructor.
                    
}

public constructor (xslPath: String, genPath: String, projectPath: String, soundResourcesDirectory: String, assetsDirectory: String, twodPath: String, threedPath: String, language: GDLanguage)                        

                            : this(xslPath, genPath, projectPath, soundResourcesDirectory, assetsDirectory, twodPath, threedPath, language, false){
    //var xslPath = xslPath
    //var genPath = genPath
    //var projectPath = projectPath
    //var soundResourcesDirectory = soundResourcesDirectory
    //var assetsDirectory = assetsDirectory
    //var twodPath = twodPath
    //var threedPath = threedPath
    //var language = language


                            //For kotlin this is before the body of the constructor.
                    
}

public constructor (xslPath: String, genPath: String, projectPath: String, soundResourcesDirectory: String, assetsDirectory: String, twodPath: String, threedPath: String, language: GDLanguage, testExtension: Boolean)
            : super()
        {
    //var xslPath = xslPath
    //var genPath = genPath
    //var projectPath = projectPath
    //var soundResourcesDirectory = soundResourcesDirectory
    //var assetsDirectory = assetsDirectory
    //var twodPath = twodPath
    //var threedPath = threedPath
    //var language = language
    //var testExtension = testExtension
this.language= language
this.testExtension= testExtension

    var size: Int = language.extensionArray!!.size
                

this.outputExtensionArray= arrayOfNulls(size)




                        for (index in 0 until size)

        {
this.outputExtensionArray[index]= if(testExtension) {
                            
                            language.extensionArray[index] +this.TEST_EXTENSION_SUFFIX
                        
                            } else {
                            language.extensionArray[index]=
                                    
                            }
    
}


    
                        if(testExtension)
                        
                                    {
                                    LogUtil.getInstance()!!.putF(StringBuilder().
                            append("Test extension: generated files end with ")!!.append(this.outputExtensionArray[0]!!)!!.toString(), this, "GDPaths")

                                    }
                                
this.ROOT_PATH= xslPath
this.GEN_PATH= genPath
this.PROJECT_PATH= projectPath
this.GAME_XML_PATH= this.PROJECT_PATH +"game.xml"
this.GAME_JSON_PATH= this.PROJECT_PATH +"game.json"
this.SOUND_RESOURCES_ROOT_PATH= this.PROJECT_PATH +soundResourcesDirectory
this.TWOD_RESOURCES_PATH= this.PROJECT_PATH +assetsDirectory +twodPath
this.THREED_RESOURCES_PATH= this.PROJECT_PATH +assetsDirectory +threedPath
this.ASSETS_PATH= this.PROJECT_PATH +assetsDirectory +"assets\\"
this.ROTATION_ANIMATION_FILE_PATH= this.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\animation\\GDRotationAnimation.txt"
}


    open fun getXslPath(javaXslPath: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var javaXslPath = javaXslPath

    
                        if(this.language.isJava() || !javaXslPath!!.endsWith(this.XSL_EXTENSION))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return javaXslPath

                                    }
                                

    var base: String = javaXslPath!!.substring(0, javaXslPath!!.length -this.XSL_EXTENSION.length)!!


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return StringBuilder().
                            append(base)!!.append(this.language.shortName)!!.append(this.XSL_EXTENSION)!!.toString()
}


    open fun getTemplatePath(javaTemplatePath: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var javaTemplatePath = javaTemplatePath

    
                        if(this.language.isJava())
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return javaTemplatePath

                                    }
                                

    var separatorIndex: Int = Math.max(javaTemplatePath!!.lastIndexOf('\\'), javaTemplatePath!!.lastIndexOf('/'))


    var extensionIndex: Int = javaTemplatePath!!.lastIndexOf('.')


    
                        if(extensionIndex <= separatorIndex)
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return javaTemplatePath

                                    }
                                

    var languageTemplatePath: String = StringBuilder().
                            append(javaTemplatePath!!.substring(0, extensionIndex))!!.append(this.language.shortName)!!.append(javaTemplatePath!!.substring(extensionIndex))!!.toString()!!


    
                        if(File(languageTemplatePath).
                            exists())
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return languageTemplatePath

                                    }
                                
LogUtil.getInstance()!!.putF(StringBuilder().
                            append("No ")!!.append(this.language.name)!!.append(" template: ")!!.append(languageTemplatePath)!!.append(" using: ")!!.append(javaTemplatePath)!!.toString(), this, "getTemplatePath")

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return javaTemplatePath
}


    open fun getOutputPath(javaOutputPath: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var javaOutputPath = javaOutputPath

    var result: String = this.getTestPath(this.getLanguagePath(javaOutputPath))!!


    
                        if(!this.language.isJava())
                        
                                    {
                                    
    var parentFile: File = File(result).
                            getParentFile()!!


    
                        if(parentFile != 
                                    null
                                 && !parentFile!!.exists())
                        
                                    {
                                    parentFile!!.mkdirs()

                                    }
                                

                                    }
                                

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return result
}


    open fun getTestPath(languagePath: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var languagePath = languagePath

    
                        if(!this.testExtension)
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return languagePath

                                    }
                                

    var extensionArray: Array<String?> = this.language.extensionArray


    var size: Int = extensionArray!!.size
                





                        for (index in 0 until size)

        {

    
                        if(languagePath!!.endsWith(extensionArray[index]!!))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return StringBuilder().
                            append(languagePath)!!.append(this.TEST_EXTENSION_SUFFIX)!!.toString()

                                    }
                                
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return languagePath
}


    open fun getLanguagePath(javaOutputPath: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var javaOutputPath = javaOutputPath

    
                        if(this.language.isJava())
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return javaOutputPath

                                    }
                                

    var prefix: String = StringUtil.getInstance()!!.EMPTY_STRING


    var path: String = javaOutputPath


    
                        if(path.startsWith(this.GEN_PATH))
                        
                                    {
                                    prefix= this.GEN_PATH
path= path.substring(this.GEN_PATH.length)!!

                                    }
                                

    var stringBuilder: StringBuilder = StringBuilder()

stringBuilder!!.append(prefix)

    var moduleFound: Boolean = false


    var start: Int = 0


    var length: Int = path.length





                        for (index in 0 until length)

        {

    
                        if(index == length || path[index] == '\\' || path[index] == '/')
                        
                                    {
                                    
    var segment: String = path.substring(start, index)!!


    
                        if(!moduleFound && index < length && this.isModuleSegment(segment))
                        
                                    {
                                    moduleFound= true
segment= this.getLanguageModuleSegment(segment)!!

                                    }
                                
stringBuilder!!.append(segment)

    
                        if(index < length)
                        
                                    {
                                    stringBuilder!!.append(path[index])

                                    }
                                
start= index +1

                                    }
                                
}


    var result: String = stringBuilder!!.toString()!!


    
                        if(result.endsWith(this.JAVA_EXTENSION))
                        
                                    {
                                    result= StringBuilder().
                            append(result.substring(0, result.length -this.JAVA_EXTENSION.length))!!.append(this.language.extension)!!.toString()!!

                                    }
                                

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return result
}


    open fun isModuleSegment(segment: String)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var segment = segment

    
                        if(!segment.startsWith(this.MODULE_PREFIX))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                                    }
                                

    var size: Int = this.MODULE_SUFFIX_ARRAY.size
                





                        for (index in 0 until size)

        {

    
                        if(segment.endsWith(this.MODULE_SUFFIX_ARRAY[index]!!))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


    open fun getLanguageModuleSegment(segment: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var segment = segment

    var size: Int = this.MODULE_SUFFIX_ARRAY.size
                





                        for (index in 0 until size)

        {

    var suffix: String = this.MODULE_SUFFIX_ARRAY[index]!!


    
                        if(segment.endsWith(suffix))
                        
                                    {
                                    
    var base: String = segment.substring(0, segment.length -suffix.length)!!


    
                        if(base.endsWith(this.language.shortName))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return segment

                                    }
                                

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return StringBuilder().
                            append(base)!!.append(this.language.shortName)!!.append(suffix)!!.toString()

                                    }
                                
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return segment
}


}
                
            

