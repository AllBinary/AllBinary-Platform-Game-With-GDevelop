
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
        
import java.io.FileInputStream
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.io.StreamUtil
import org.allbinary.string.CommonStrings
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDData
            : Object
         {
        
companion object {
            
    private val instance: GDData = GDData()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDData{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonStrings: CommonStrings = CommonStrings.getInstance()!!

    private val streamUtil: StreamUtil = StreamUtil.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    val GD_GAME_INFO: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameInfo.xsl"

    val GD_NON_LAYOUT_AS_XML: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDNonLayoutAsXml.xsl"

    val GD_GLOBALS_ANIMATION: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalsAnimation.xsl"

    val GD_GLOBALS: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobals.xsl"

    val GD_GLOBALS_GD_OBJECTS_FACTORY: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalsGDObjectsFactory.xsl"

    val GD_GLOBALS_GD_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalsGDResources.xsl"

    val GD_EXTENSION_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDExtensionGDNodes.xsl"

    val GD_GLOBAL_GAME_THREED_LEVEL_LOADER: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalGameThreedLevelLoader.xsl"

    val GD_EXTERNAL_LINK_LAYOUT_GD_NODE: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDExternalLinkLayoutGDNode.xsl"

    val GD_EXTERNAL_CREATE_INSTANCE_GD_NODE: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDExternalCreateInstanceGDNode.xsl"

    val GD_CREATE_INSTANCE_GD_NODE: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDCreateInstanceGDNode.xsl"

    val GD_LAYOUT_AS_XML: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutAsXml.xsl"

    val GD_LAYOUT: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayout.xsl"

    val GD_LAYOUT_BUILDER: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutBuilder.xsl"

    val GD_LAYOUT_EXTERNAL_EVENT_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalEventGDNodes.xsl"

    val GD_LAYOUT_EXTERNAL_LAYOUT_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalLayoutGDNodes.xsl"

    val GD_LAYOUT_EXTERNAL_ACTION_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalActionGDNodes.xsl"

    val GD_LAYOUT_EXTERNAL_CONDITION_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalConditionGDNodes.xsl"

    val GD_LAYOUT_EXTERNAL_OBJECT_EVENT_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalObjectEventGDNodes.xsl"

    val GD_LAYOUT_EXTERNAL_OTHER_EVENT_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalOtherEventGDNodes.xsl"

    val GD_LAYOUT_ACTION_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutActionGDNodes.xsl"

    val GD_LAYOUT_CONDITION_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutConditionGDNodes.xsl"

    val GD_LAYOUT_OBJECT_EVENT_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutObjectEventGDNodes.xsl"

    val GD_LAYOUT_OTHER_EVENT_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutOtherEventGDNodes.xsl"

    val GD_LAYOUT_GD_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutGDResources.xsl"

    val GD_LAYOUT_SCENE_AS_SPECIAL_ANIMATION_GLOBALS: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutSceneAsSpecialAnimationGlobals.xsl"

    val GD_LAYOUT_GD_OBJECTS_FACTORY: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutGDObjectsFactory.xsl"

    val GD_GAME_PLAYN_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\GDGamePlaynResources.xsl"

    val GD_OTHER_EVENT_GD_NODE_ID_LIST: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDOtherEventGDNodeIdList.xsl"

    val GD_OTHER_EVENT_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDOtherEventGDNodes.xsl"

    val GD_ACTION_GD_NODE_ID_LIST: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDActionGDNodeIdList.xsl"

    val GD_LAYOUT_N_EXTERNAL_ACTION_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutNExternalActionGDNodes.xsl"

    val GD_LAYOUT_N_ACTION_GD_NODES: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutNActionGDNodes.xsl"

    val GD_ANDROID_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_LAZY_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_HTML_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_LAZY_HTML_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_LAZY_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_OPENGL_TWO_D_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_OPENGL_TWO_D_LAZY_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_OPENGL_TWO_D_ANDROID_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_OPENGL_THREED_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_GLOBAL_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalResources.xsl"

    val GD_THREED_GLOBAL_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalResources.xsl"

    val GD_GLOBAL_IMAGE_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalImageResources.xsl"

    val GD_THREED_GLOBAL_IMAGE_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalImageResources.xsl"

    val GD_GAME_MUSIC_FACTORY: String = this.gdPaths!!.ROOT_PATH +"GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GameMusicFactory.xsl"

    val GD_ANDROID_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_LAZY_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_HTML_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_LAZY_HTML_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_LAZY_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_OPENGL_TWO_D_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_OPENGL_TWO_D_LAZY_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_OPENGL_TWO_D_ANDROID_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_OPENGL_THREED_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_ANDROID_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_J2SE_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_LAZY_J2SE_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_HTML_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_LAZY_HTML_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_LAZY_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_OPENGL_THREED_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl"

    val GD_GAME_SOUNDS_FACTORY: String = this.gdPaths!!.ROOT_PATH +"GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GameSoundsFactory.xsl"

    val GD_LAYOUT_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutResources.xsl"

    val GD_THREED_LAYOUT_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutResources.xsl"

    val GD_LAYOUT_IMAGE_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutImageResources.xsl"

    val GD_THREED_LAYOUT_IMAGE_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutImageResources.xsl"

    val GD_LAYOUT_TOUCH_IMAGE_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutTouchImageResources.xsl"

    val GD_THREED_LAYOUT_TOUCH_IMAGE_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutTouchImageResources.xsl"

    val GD_LAYOUT_GAME_THREED_LEVEL_LOADER: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutGameThreedLevelLoader.xsl"

    val GD_GAME_CAMERA_SETUP: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\graphics\\threed\\min3d\\GDGameCameraSetup.xsl"

    val GD_LAYOUT_UTIL: String = this.gdPaths!!.ROOT_PATH +"resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutUtil.xsl"

    val GD_BASE_GAME_MIDLET: String = this.gdPaths!!.ROOT_PATH +"GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.xsl"

    val GD_THREED_GAME_MIDLET: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.xsl"

    val GD_GAME_COMMAND_FACTORY: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameCommandFactory.xsl"

    val GD_THREED_LEVEL_BUILDER_FACTORY: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\graphics\\threed\\min3d\\GDGameThreedLevelBuilderFactory.xsl"

    val GD_GAME_SOUNDS: String = this.gdPaths!!.ROOT_PATH +"GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GDGameSounds.xsl"

    val GD_PLATFORM_ASSET_MANAGER: String = this.gdPaths!!.ROOT_PATH +"platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\org\\allbinary\\logic\\system\\PlatformAssetManager.xsl"

    val GD_CUSTOM_GAME_LAYER_FACTORY: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\GDCustomGameLayerFactory.xsl"

    val GD_CUSTOM_GAME_LAYER: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\GDCustomGameLayer.xsl"

    val GD_CUSTOM_COLLIDABLE_BEHAVIOR: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\special\\GDCustomCollidableBehavior.xsl"

    val GD_CUSTOM_MASK_COLLIDABLE_BEHAVIOR: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\special\\GDCustomMaskCollidableBehavior.xsl"

    val GD_PREBASE_GAME_SOFTWARE_INFO: String = this.gdPaths!!.ROOT_PATH +"GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameSoftwareInfo.xsl"

    val GD_THREED_PREBASE_GAME_SOFTWARE_INFO: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameSoftwareInfo.xsl"

    val GD_THREED_ANIMATION_RESOURCES: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameThreedAnimationResources.xsl"

    val GD_ROTATION_ANIMATION: String = this.gdPaths!!.ROOT_PATH +"GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\animation\\GDRotationAnimation.xsl"

    val GD_BASE_LEVEL_BUILDER: String = this.gdPaths!!.ROOT_PATH +"GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\level\\GDGameLevelBuilder.xsl"

    val GD_BASE_LAYOUT_RUNNABLE: String = this.gdPaths!!.ROOT_PATH +"GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\midlet\\GDLayoutRunnable.xsl"

    val GD_THREED_LEVEL_BUILDER: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\level\\GDGameLevelBuilder.xsl"

    val GD_THREED_LAYOUT_RUNNABLE: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\midlet\\GDLayoutRunnable.xsl"

    val GD_BASE_CANVAS: String = this.gdPaths!!.ROOT_PATH +"GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameGDLayoutCanvas.xsl"

    val GD_THREED_CANVAS: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameGDLayoutCanvas.xsl"

    val GD_GAME_START_LAYOUT_CANVAS: String = this.gdPaths!!.ROOT_PATH +"GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameStartGDLayoutCanvas.xsl"

    val GD_BASE_LAYOUT_START_RUNNABLE: String = this.gdPaths!!.ROOT_PATH +"GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDLayoutStartRunnable.xsl"

    val GD_THREED_LAYOUT_START_RUNNABLE: String = this.gdPaths!!.ROOT_PATH +"GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDLayoutStartRunnable.xsl"

    val GD_ANDROID_MANIFEST: String = this.gdPaths!!.ROOT_PATH +"platformx\\android\\GDGameAndroidApplicationM\\src\\main\\AndroidManifest.xsl"

    val GD_ANDROID_GRADLE_MANIFEST: String = this.gdPaths!!.ROOT_PATH +"platformx\\android\\GDGameAndroidApplicationNoLicensingGradle\\app\\src\\main\\AndroidManifest.xsl"

    val GD_THREED_ANDROID_MANIFEST: String = this.gdPaths!!.ROOT_PATH +"platformx\\android\\GDGameThreedAndroidApplicationM\\src\\main\\AndroidManifest.xsl"

    val GD_THREED_ANDROID_GRADLE_MANIFEST: String = this.gdPaths!!.ROOT_PATH +"platformx\\android\\GDGameThreedAndroidApplicationNoLicensingGradle\\app\\src\\main\\AndroidManifest.xsl"

    private val xslPathList: BasicArrayList = BasicArrayListD()

    private val xslDataList: BasicArrayList = BasicArrayListD()

                @Throws(Exception::class)
            
    open fun getAsString(xslPath: String, sharedBytes: SharedBytes)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var xslPath = xslPath
    //var sharedBytes = sharedBytes

    var index: Int = this.xslPathList!!.indexOf(xslPath)!!


    
                        if(index ==  -1)
                        
                                    {
                                    this.logUtil!!.putF(xslPath, this, this.commonStrings!!.PROCESS)

    var fileInputStream: FileInputStream = FileInputStream(xslPath)

sharedBytes!!.outputStream!!.reset()

    var xslAsString: String = this.streamUtil!!.getByteArray.toCharArray()

this.xslPathList!!.add(xslPath)
this.xslDataList!!.add(xslAsString)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return xslAsString

                                    }
                                
                        else {
                            


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.xslDataList!!.get(index) as String

                        }
                            
}


}
                
            

