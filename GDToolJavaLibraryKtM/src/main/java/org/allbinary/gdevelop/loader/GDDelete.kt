
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2022 AllBinary 
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
                    
        
import java.io.File
import org.allbinary.logic.io.file.AbFile
import org.allbinary.logic.io.file.FileListFetcher
import org.allbinary.string.CommonStrings
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDDelete
            : Object
         {
        
companion object {
            
                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
GDPaths.init(args)
GDDelete().
                            process()
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val JAVA_EXTENSION: String = ".java"

                @Throws(Exception::class)
            
    open fun getFiles(javaPath: String, extension: String)
        //nullable = true from not(false or (false and false)) = true
: BasicArrayList{
    //var javaPath = javaPath
    //var extension = extension

    var path: String = this.gdPaths!!.getLanguagePath(javaPath)!!


    
                        if(!File(path).
                            exists())
                        
                                    {
                                    this.logUtil!!.putF(StringMaker().
                            append("Skipping missing: ")!!.append(path)!!.toString(), this, this.commonStrings!!.PROCESS)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return BasicArrayListD()

                                    }
                                

    
                        if(!extension.equals(this.gdToolStrings!!.JAVA))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return FileListFetcher.getInstance()!!.getFiles(path, extension)

                                    }
                                

    var languageExtensionArray: Array<String?> = this.gdPaths!!.outputExtensionArray


    var size: Int = languageExtensionArray!!.size
                


    var extensionArray: Array<String?> = arrayOfNulls(size)





                        for (index in 0 until size)

        {
extensionArray[index]= languageExtensionArray[index]!!.substring(1)!!
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return FileListFetcher.getInstance()!!.getFiles(path, extensionArray)
}


    open fun getLanguageExclusionList(exclusionList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
: BasicArrayList{
    //var exclusionList = exclusionList

    var languageExclusionList: BasicArrayList = BasicArrayListD()


    var languageExtensionArray: Array<String?> = this.gdPaths!!.outputExtensionArray


    var size: Int = exclusionList!!.size()


    var size2: Int = languageExtensionArray!!.size
                


    var exclusion: String





                        for (index in 0 until size)

        {
exclusion= exclusionList!!.get(index) as String

    
                        if(exclusion.endsWith(this.JAVA_EXTENSION))
                        
                                    {
                                    
    var base: String = exclusion.substring(0, exclusion.length -this.JAVA_EXTENSION.length)!!





                        for (index2 in 0 until size2)

        {
languageExclusionList!!.add(StringMaker().
                            append(base)!!.append(languageExtensionArray[index2]!!)!!.toString())
}


                                    }
                                
                        else {
                            languageExclusionList!!.add(this.gdPaths!!.getLanguagePath(exclusion))

                        }
                            
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return languageExclusionList
}


    open fun deleteFile(javaFilePath: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var javaFilePath = javaFilePath

    var languagePath: String = this.gdPaths!!.getLanguagePath(javaFilePath)!!


    var base: String = languagePath!!.substring(0, languagePath!!.lastIndexOf('.'))!!


    var languageExtensionArray: Array<String?> = this.gdPaths!!.outputExtensionArray


    var size: Int = languageExtensionArray!!.size
                


    var file: File





                        for (index in 0 until size)

        {
file= File(StringMaker().
                            append(base)!!.append(languageExtensionArray[index]!!)!!.toString())

    
                        if(file.exists())
                        
                                    {
                                    this.logUtil!!.putF(StringMaker().
                            append("Deleting: ")!!.append(file.getAbsolutePath())!!.toString(), this, this.commonStrings!!.PROCESS)
file.delete()

                                    }
                                
}

}


                @Throws(Exception::class)
            
    open fun process(fileBasicArrayList: BasicArrayList, exclusionList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
{
    //var fileBasicArrayList = fileBasicArrayList
    //var exclusionList = exclusionList

    var stringMaker: StringMaker = StringMaker()


    var languageExclusionList: BasicArrayList = this.getLanguageExclusionList(exclusionList)!!


    var size: Int = fileBasicArrayList!!.size()


    var size2: Int = languageExclusionList!!.size()


    var exclusion: String


    var abFile: AbFile





                        for (index in 0 until size)

        {
abFile= (fileBasicArrayList!!.get(index) as AbFile)

    
                        if(!abFile!!.isDirectory())
                        
                                    {
                                    
    var exclude: Boolean = false





                        for (index2 in 0 until size2)

        {
exclusion= languageExclusionList!!.get(index2) as String

    
                        if(abFile!!.getAbsolutePath()!!.indexOf(exclusion) >= 0)
                        
                                    {
                                    exclude= true
break;

                    

                                    }
                                
}


    
                        if(!exclude)
                        
                                    {
                                    stringMaker!!.delete(0, stringMaker!!.length())
this.logUtil!!.putF(stringMaker!!.append("Deleting: ")!!.append(abFile!!.getAbsolutePath())!!.toString(), this, this.commonStrings!!.PROCESS)
abFile!!.delete()

                                    }
                                

                                    }
                                
}

}


                @Throws(Exception::class)
            
    open fun process()
        //nullable = true from not(false or (false and true)) = true
{

    var gdPaths: GDPaths = GDPaths.getInstance()!!


    var fileListFetcher: FileListFetcher = FileListFetcher.getInstance()!!


    var exclusionList0: BasicArrayList = BasicArrayListD()


    var files0: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java", this.gdToolStrings!!.XML)!!

this.process(files0, exclusionList0)

    var exclusionList0b: BasicArrayList = BasicArrayListD()


    var files0b: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\res\\", this.gdToolStrings!!.JSON)!!

this.process(files0b, exclusionList0b)

    var exclusionList: BasicArrayList = BasicArrayListD()

exclusionList!!.add("TouchButtonAndroidResources.java")
exclusionList!!.add("StartRunnable.java")
exclusionList!!.add("GeographicMapTopViewMaskGameLayerBehavior.java")
exclusionList!!.add("GDGameInputProcessor.java")
exclusionList!!.add("GDGameResourceInitialization.java")
exclusionList!!.add("GDGlobals.java")
exclusionList!!.add("TempMovementBehaviorFactory.java")
exclusionList!!.add("TempNoMapMovementBehavior.java")
exclusionList!!.add("TempMapMovementBehavior.java")
exclusionList!!.add("TempMovementBehavior.java")

    var files: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java", this.gdToolStrings!!.JAVA)!!

this.process(files, exclusionList)

    var exclusionList2: BasicArrayList = BasicArrayListD()

exclusionList2!!.add("GDGameGameCanvas.java")
exclusionList2!!.add("GDGameStartCanvas.java")
exclusionList2!!.add("GDGameSoftwareInfo.java")
exclusionList2!!.add("GDTiledLayerFactory.java")
exclusionList2!!.add("PlacementAllBinaryJ2METiledLayer.java")
exclusionList2!!.add("GDTiledMapProperties")

    var files2: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"GDGameBaseJavaLibraryM\\src\\main\\java", this.gdToolStrings!!.JAVA)!!

this.process(files2, exclusionList2)

    var exclusionList3: BasicArrayList = BasicArrayListD()

exclusionList3!!.add("GDGameAllBinarySceneControllerFactory.java")
exclusionList3!!.add("GDGameSoftwareInfo.java")
exclusionList3!!.add("GDGameTitleAnimationFactory.java")
exclusionList3!!.add("GDGameResourceInitialization.java")
exclusionList3!!.add("GDThreedEarlyResourceInitializationFactory.java")
exclusionList3!!.add("GDGameAllBinarySceneControllerFactory.java")
exclusionList3!!.add("GDGameSceneController.java")
exclusionList3!!.add("GDCameraInputProcessor.java")
exclusionList3!!.add("RendererActivity.java")
exclusionList3!!.add("TitleThreedResources.java")
exclusionList3!!.add("TitleBasicArrayListData.java")
exclusionList3!!.add("GDGameCameraSetup.java")
exclusionList3!!.add("GDGameLevelBuilder.java")
exclusionList3!!.add("GDTiledLayerFactory.java")
exclusionList3!!.add("PlacementAllBinaryJ2METiledLayer.java")
exclusionList3!!.add("GDTiledMapProperties")
exclusionList3!!.add("TitleVectorData.java")

    var files3: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"GDGameThreedBaseJavaLibraryM\\src\\main\\java", this.gdToolStrings!!.JAVA)!!

this.process(files3, exclusionList3)

    var exclusionList3b: BasicArrayList = BasicArrayListD()


    var files3b: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java", this.gdToolStrings!!.JAVA)!!

this.process(files3b, exclusionList3b)

    var exclusionList4: BasicArrayList = BasicArrayListD()

exclusionList4!!.add("GDGameThreedLevelBuilder.java")
exclusionList4!!.add("AppRendererShaderUpdaterFactory.java")

    var files4: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java", this.gdToolStrings!!.JAVA)!!

this.process(files4, exclusionList4)

    var exclusionList5: BasicArrayList = BasicArrayListD()


    var files5: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"GDGamePreBaseJavaLibraryM\\src\\main\\java", this.gdToolStrings!!.JAVA)!!

this.process(files5, exclusionList5)

    var exclusionList20: BasicArrayList = BasicArrayListD()

exclusionList20!!.add("GDGameHelpPaintable.java")
exclusionList20!!.add("GDGameInputMappingHelpPaintable.java")
exclusionList20!!.add("GDGameGameInputMappingFactory.java")
exclusionList20!!.add("AppShaderResources.java")
exclusionList20!!.add("GDConfig.java")

    var files20: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\", this.gdToolStrings!!.JAVA)!!

this.process(files20, exclusionList20)

    var exclusionList21: BasicArrayList = BasicArrayListD()


    var files21: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"\\GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio", this.gdToolStrings!!.JAVA)!!

this.process(files21, exclusionList21)

    var exclusionList6: BasicArrayList = BasicArrayListD()

exclusionList6!!.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java")
exclusionList6!!.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java")

    var files6: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings!!.JAVA)!!

this.process(files6, exclusionList6)

    var files6b: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings!!.JAVA)!!

this.process(files6b, exclusionList6)

    var exclusionList7: BasicArrayList = BasicArrayListD()

exclusionList7!!.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java")
exclusionList7!!.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java")

    var files7: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings!!.JAVA)!!

this.process(files7, exclusionList7)

    var files17: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings!!.JAVA)!!

this.process(files17, exclusionList7)

    var exclusionList8: BasicArrayList = BasicArrayListD()

exclusionList8!!.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java")
exclusionList8!!.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java")

    var files8: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings!!.JAVA)!!

this.process(files8, exclusionList8)

    var exclusionList9: BasicArrayList = BasicArrayListD()

exclusionList9!!.add("GDGameEarlyResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java")
exclusionList9!!.add("GDGameImageBasedAnimationInterfaceFactoryInterfaceFactory.java")

    var files9: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings!!.JAVA)!!

this.process(files9, exclusionList9)

    var files19: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings!!.JAVA)!!

this.process(files19, exclusionList9)

    var files19b: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings!!.JAVA)!!

this.process(files19b, exclusionList9)

    var files19c: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings!!.JAVA)!!

this.process(files19c, exclusionList9)

    var files29: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings!!.JAVA)!!

this.process(files29, exclusionList9)

    var exclusionList10: BasicArrayList = BasicArrayListD()

exclusionList10!!.add("GDGameEarlyResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory.java")
exclusionList10!!.add("GDGameGameResourcesOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory.java")
exclusionList10!!.add("GDGameOpenGLThreedBasedAnimationInterfaceFactoryInterfaceFactory.java")
exclusionList10!!.add("GDGameThreedTitleAnimation.java")
exclusionList10!!.add("GDGameThreedTitleAnimationFactory.java")

    var files10: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image", this.gdToolStrings!!.JAVA)!!

this.process(files10, exclusionList10)

    var exclusionList11: BasicArrayList = BasicArrayListD()

exclusionList11!!.add("GDGameAndroidResourceInitialization.java")

    var files11: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"platform\\android\\GDGameThreedAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\", this.gdToolStrings!!.JAVA)!!

this.process(files11, exclusionList11)

    var exclusionList12: BasicArrayList = BasicArrayListD()

exclusionList12!!.add("GDGameMIDletFactory.java")
exclusionList12!!.add("GDGameAndroidActivityBase.java")

    var files12: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"platform\\android\\GDGameAndroidActivityJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\", this.gdToolStrings!!.JAVA)!!

this.process(files12, exclusionList12)

    var exclusionList13: BasicArrayList = BasicArrayListD()


    var files13: BasicArrayList = this.getFiles(gdPaths!!.GEN_PATH +"platform\\android\\GDGameThreedAndroidActivityJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\", this.gdToolStrings!!.JAVA)!!

this.process(files13, exclusionList13)
this.deleteFile(gdPaths!!.GEN_PATH +"platform\\android\\GDGameAndroidJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDGameAndroidEarlyResourceInitialization.java")
this.deleteFile(gdPaths!!.GEN_PATH +"platform\\android\\GDGameAndroidM\\src\\main\\other\\org\\allbinary\\AndroidResources.java")
this.deleteFile(gdPaths!!.GEN_PATH +"platform\\android\\GDGameThreedAndroidM\\src\\main\\other\\org\\allbinary\\AndroidResources.java")
this.deleteFile(gdPaths!!.GEN_PATH +"platform\\android\\GDGameAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.java")
this.deleteFile(gdPaths!!.GEN_PATH +"platform\\android\\GDGameThreedAndroidGradleM\\src\\main\\other\\org\\allbinary\\AndroidResources.java")
this.deleteFile(gdPaths!!.GEN_PATH +"platform\\android\\GDGameAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java")
this.deleteFile(gdPaths!!.GEN_PATH +"platform\\android\\GDGameThreedAndroidResourcesTempJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\R.java")
}


}
                
            

