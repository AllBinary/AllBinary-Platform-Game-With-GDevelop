
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
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.logic.NullUtil
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
GDPaths.instance= GDPaths(GDPaths.DEFAULT_PATH, GDPaths.DEFAULT_PATH, GDPaths.DEFAULT_PATH, "Resources\\", "Resources\\", "2d\\res\\raw\\", "3d\\res\\raw\\")
}


    open fun init(xslPath: String, genPath: String, projectPath: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var xslPath = xslPath
    //var genPath = genPath
    //var projectPath = projectPath
GDPaths.instance= GDPaths(xslPath, genPath, projectPath, "sounds\\", StringUtil.getInstance()!!.EMPTY_STRING, "2d\\Resources\\2d\\res\\raw\\", "3d\\Resources\\3d\\res\\raw\\")
}


        }
            
    var ROOT_PATH: String

    var GEN_PATH: String

    var PROJECT_PATH: String

    val GAME_XML_PATH: String

    val GAME_JSON_PATH: String

    val TWOD_RESOURCES_PATH: String

    val THREED_RESOURCES_PATH: String

    val ASSETS_PATH: String

    val ROTATION_ANIMATION_FILE_PATH: String

    val SOUND_RESOURCES_ROOT_PATH: String
public constructor (xslPath: String, genPath: String, projectPath: String, soundResourcesDirectory: String, assetsDirectory: String, twodPath: String, threedPath: String)
            : super()
        {
    //var xslPath = xslPath
    //var genPath = genPath
    //var projectPath = projectPath
    //var soundResourcesDirectory = soundResourcesDirectory
    //var assetsDirectory = assetsDirectory
    //var twodPath = twodPath
    //var threedPath = threedPath
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


}
                
            

