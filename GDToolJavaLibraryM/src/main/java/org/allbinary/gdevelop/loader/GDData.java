/*
 * AllBinary Open License Version 1
 * Copyright (c) 2026 AllBinary
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
package org.allbinary.gdevelop.loader;

import java.io.FileInputStream;

import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

/**
 *
 * @author User
 */
public class GDData {

    private static final GDData instance = new GDData();

    /**
     * @return the instance
     */
    public static GDData getInstance() {
        return instance;
    }

    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final StreamUtil streamUtil = StreamUtil.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();

    public final String GD_GAME_INFO = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameInfo.xsl";

    public final String GD_NON_LAYOUT_AS_XML = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDNonLayoutAsXml.xsl";
    public final String GD_GLOBALS_ANIMATION = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalsAnimation.xsl";
    public final String GD_GLOBALS = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobals.xsl";
    public final String GD_GLOBALS_GD_OBJECTS_FACTORY = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalsGDObjectsFactory.xsl";
    public final String GD_GLOBALS_GD_RESOURCES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalsGDResources.xsl";
    public final String GD_EXTENSION_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDExtensionGDNodes.xsl";
    public final String GD_GLOBAL_GAME_THREED_LEVEL_LOADER = this.gdPaths.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalGameThreedLevelLoader.xsl";

    public final String GD_EXTERNAL_LINK_LAYOUT_GD_NODE = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDExternalLinkLayoutGDNode.xsl";
    public final String GD_EXTERNAL_CREATE_INSTANCE_GD_NODE = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDExternalCreateInstanceGDNode.xsl";
    public final String GD_CREATE_INSTANCE_GD_NODE = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDCreateInstanceGDNode.xsl";

    public final String GD_LAYOUT_AS_XML = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutAsXml.xsl";
    public final String GD_LAYOUT = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayout.xsl";
    public final String GD_LAYOUT_BUILDER = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutBuilder.xsl";
    public final String GD_LAYOUT_EXTERNAL_EVENT_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalEventGDNodes.xsl";
    public final String GD_LAYOUT_EXTERNAL_LAYOUT_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalLayoutGDNodes.xsl";
    public final String GD_LAYOUT_EXTERNAL_ACTION_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalActionGDNodes.xsl";
    public final String GD_LAYOUT_EXTERNAL_CONDITION_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalConditionGDNodes.xsl";
    public final String GD_LAYOUT_EXTERNAL_OBJECT_EVENT_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalObjectEventGDNodes.xsl";
    public final String GD_LAYOUT_EXTERNAL_OTHER_EVENT_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutExternalOtherEventGDNodes.xsl";
    public final String GD_LAYOUT_ACTION_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutActionGDNodes.xsl";
    public final String GD_LAYOUT_CONDITION_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutConditionGDNodes.xsl";
    public final String GD_LAYOUT_OBJECT_EVENT_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutObjectEventGDNodes.xsl";
    public final String GD_LAYOUT_OTHER_EVENT_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutOtherEventGDNodes.xsl";
    public final String GD_LAYOUT_GD_RESOURCES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutGDResources.xsl";
    public final String GD_LAYOUT_SCENE_AS_SPECIAL_ANIMATION_GLOBALS = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutSceneAsSpecialAnimationGlobals.xsl";
    public final String GD_LAYOUT_GD_OBJECTS_FACTORY = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutGDObjectsFactory.xsl";
    public final String GD_GAME_PLAYN_RESOURCES = this.gdPaths.ROOT_PATH + "platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\GDGamePlaynResources.xsl";

    public final String GD_OTHER_EVENT_GD_NODE_ID_LIST = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDOtherEventGDNodeIdList.xsl";
    public final String GD_OTHER_EVENT_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDOtherEventGDNodes.xsl";
    public final String GD_ACTION_GD_NODE_ID_LIST = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDActionGDNodeIdList.xsl";
    public final String GD_LAYOUT_N_EXTERNAL_ACTION_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutNExternalActionGDNodes.xsl";
    public final String GD_LAYOUT_N_ACTION_GD_NODES = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutNActionGDNodes.xsl";

    public final String GD_ANDROID_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_LAZY_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_HTML_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_LAZY_HTML_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_LAZY_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_OPENGL_TWO_D_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_OPENGL_TWO_D_LAZY_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_OPENGL_TWO_D_ANDROID_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_OPENGL_THREED_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_GLOBAL_RESOURCES = this.gdPaths.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalResources.xsl";
    public final String GD_THREED_GLOBAL_RESOURCES = this.gdPaths.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalResources.xsl";
    public final String GD_GLOBAL_IMAGE_RESOURCES = this.gdPaths.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalImageResources.xsl";
    public final String GD_THREED_GLOBAL_IMAGE_RESOURCES = this.gdPaths.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalImageResources.xsl";
    public final String GD_GAME_MUSIC_FACTORY = this.gdPaths.ROOT_PATH + "GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GameMusicFactory.xsl";
    public final String GD_ANDROID_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_LAZY_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_HTML_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_LAZY_HTML_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_LAZY_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_OPENGL_TWO_D_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_OPENGL_TWO_D_LAZY_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_OPENGL_TWO_D_ANDROID_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_OPENGL_THREED_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_ANDROID_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_J2SE_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_LAZY_J2SE_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_HTML_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_LAZY_HTML_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_LAZY_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_OPENGL_THREED_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY = this.gdPaths.ROOT_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GDGameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.xsl";
    public final String GD_GAME_SOUNDS_FACTORY = this.gdPaths.ROOT_PATH + "GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GameSoundsFactory.xsl";
    public final String GD_LAYOUT_RESOURCES = this.gdPaths.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutResources.xsl";
    public final String GD_THREED_LAYOUT_RESOURCES = this.gdPaths.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutResources.xsl";
    public final String GD_LAYOUT_IMAGE_RESOURCES = this.gdPaths.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutImageResources.xsl";
    public final String GD_THREED_LAYOUT_IMAGE_RESOURCES = this.gdPaths.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutImageResources.xsl";
    public final String GD_LAYOUT_TOUCH_IMAGE_RESOURCES = this.gdPaths.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutTouchImageResources.xsl";
    public final String GD_THREED_LAYOUT_TOUCH_IMAGE_RESOURCES = this.gdPaths.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutTouchImageResources.xsl";
    public final String GD_LAYOUT_GAME_THREED_LEVEL_LOADER = this.gdPaths.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutGameThreedLevelLoader.xsl";
    public final String GD_GAME_CAMERA_SETUP = this.gdPaths.ROOT_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\graphics\\threed\\min3d\\GDGameCameraSetup.xsl";
    public final String GD_LAYOUT_UTIL = this.gdPaths.ROOT_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDLayoutUtil.xsl";

    public final String GD_BASE_GAME_MIDLET = this.gdPaths.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.xsl";
    public final String GD_THREED_GAME_MIDLET = this.gdPaths.ROOT_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.xsl";
    public final String GD_GAME_COMMAND_FACTORY = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameCommandFactory.xsl";
    public final String GD_THREED_LEVEL_BUILDER_FACTORY = this.gdPaths.ROOT_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\graphics\\threed\\min3d\\GDGameThreedLevelBuilderFactory.xsl";
    public final String GD_GAME_SOUNDS = this.gdPaths.ROOT_PATH + "GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GDGameSounds.xsl";
    public final String GD_PLATFORM_ASSET_MANAGER = this.gdPaths.ROOT_PATH + "platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\org\\allbinary\\logic\\system\\PlatformAssetManager.xsl";
    public final String GD_CUSTOM_GAME_LAYER_FACTORY = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\GDCustomGameLayerFactory.xsl";
    public final String GD_CUSTOM_GAME_LAYER = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\GDCustomGameLayer.xsl";
    public final String GD_CUSTOM_COLLIDABLE_BEHAVIOR = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\special\\GDCustomCollidableBehavior.xsl";
    public final String GD_CUSTOM_MASK_COLLIDABLE_BEHAVIOR = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\layer\\special\\GDCustomMaskCollidableBehavior.xsl";
    public final String GD_PREBASE_GAME_SOFTWARE_INFO = this.gdPaths.ROOT_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameSoftwareInfo.xsl";
    public final String GD_THREED_PREBASE_GAME_SOFTWARE_INFO = this.gdPaths.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameSoftwareInfo.xsl";
    public final String GD_THREED_ANIMATION_RESOURCES = this.gdPaths.ROOT_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameThreedAnimationResources.xsl";

    public final String GD_ROTATION_ANIMATION = this.gdPaths.ROOT_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\animation\\GDRotationAnimation.xsl";
    public final String GD_BASE_LEVEL_BUILDER = this.gdPaths.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\level\\GDGameLevelBuilder.xsl";
    public final String GD_BASE_LAYOUT_RUNNABLE = this.gdPaths.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\midlet\\GDLayoutRunnable.xsl";
    public final String GD_THREED_LEVEL_BUILDER = this.gdPaths.ROOT_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\level\\GDGameLevelBuilder.xsl";
    public final String GD_THREED_LAYOUT_RUNNABLE = this.gdPaths.ROOT_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\midlet\\GDLayoutRunnable.xsl";
    public final String GD_BASE_CANVAS = this.gdPaths.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameGDLayoutCanvas.xsl";
    public final String GD_THREED_CANVAS = this.gdPaths.ROOT_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameGDLayoutCanvas.xsl";
    public final String GD_GAME_START_LAYOUT_CANVAS = this.gdPaths.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameStartGDLayoutCanvas.xsl";
    public final String GD_BASE_LAYOUT_START_RUNNABLE = this.gdPaths.ROOT_PATH + "GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDLayoutStartRunnable.xsl";
    public final String GD_THREED_LAYOUT_START_RUNNABLE = this.gdPaths.ROOT_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDLayoutStartRunnable.xsl";

    public final String GD_ANDROID_MANIFEST = this.gdPaths.ROOT_PATH + "platformx\\android\\GDGameAndroidApplicationM\\src\\main\\AndroidManifest.xsl";
    public final String GD_ANDROID_GRADLE_MANIFEST = this.gdPaths.ROOT_PATH + "platformx\\android\\GDGameAndroidApplicationNoLicensingGradle\\app\\src\\main\\AndroidManifest.xsl";
    public final String GD_THREED_ANDROID_MANIFEST = this.gdPaths.ROOT_PATH + "platformx\\android\\GDGameThreedAndroidApplicationM\\src\\main\\AndroidManifest.xsl";
    public final String GD_THREED_ANDROID_GRADLE_MANIFEST = this.gdPaths.ROOT_PATH + "platformx\\android\\GDGameThreedAndroidApplicationNoLicensingGradle\\app\\src\\main\\AndroidManifest.xsl";

    private final BasicArrayList xslPathList = new BasicArrayListD();
    private final BasicArrayList xslDataList = new BasicArrayListD();

    public String getAsString(final String xslPath, final SharedBytes sharedBytes) throws Exception {

        final int index = this.xslPathList.indexOf(xslPath);

        if (index == -1) {
            this.logUtil.putF(xslPath, this, this.commonStrings.PROCESS);
            final FileInputStream fileInputStream = new FileInputStream(xslPath);
            sharedBytes.outputStream.reset();
            final String xslAsString = new String(this.streamUtil.getByteArray(fileInputStream, sharedBytes.outputStream, sharedBytes.byteArray));
            this.xslPathList.add(xslPath);
            this.xslDataList.add(xslAsString);
            return xslAsString;
        } else {
            return (String) this.xslDataList.get(index);
        }

    }

}
