/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */
package org.allbinary.gdevelop.loader;

import org.allbinary.data.tree.dom.document.DomDocumentHelper;
import org.allbinary.data.tree.dom.document.XmlDocumentHelper;
import org.allbinary.logic.io.BufferedWriterUtil;
import org.allbinary.logic.io.StreamUtil;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.string.regex.replace.Replace;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.io.file.directory.Directory;
import org.allbinary.logic.io.path.AbFilePath;
import org.allbinary.logic.java.bool.BooleanUtil;
import org.allbinary.logic.math.PrimitiveLongSingleton;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonSeps;
import org.allbinary.logic.string.tokens.Tokenizer;
import org.allbinary.time.TimeDelayHelper;
import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;

/**
 *
 * @author User
 */
public class GDLayoutsToAllBinaryLayoutGenerator {

    protected final LogUtil logUtil = LogUtil.getInstance();

    private final CommonStrings commonStrings = CommonStrings.getInstance();
    private final CommonSeps commonSeps = CommonSeps.getInstance();
    private final Directory directory = Directory.getInstance();

    private final SmallIntegerSingletonFactory smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
    //private final StreamUtil streamUtil = StreamUtil.getInstance();

    private final BufferedWriterUtil bufferedWriterUtil = BufferedWriterUtil.getInstance();
    private final GDXslTemplates gdXslTemplates = GDXslTemplates.getInstance();
    private final GDPaths gdPaths = GDPaths.getInstance();
    private final GDData gdData = GDData.getInstance();
    private final GDToolStrings gdToolStrings = GDToolStrings.getInstance();

    private final String GAME_START = "<game>";
    private final String GAME_END = "</game>";

    private final String RESULT = "result: ";

    private final String GENERATED_START_WITH_ROOT_PATH = this.gdPaths.GEN_PATH + "GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas";
    private final String GENERATED_START_WITH_PATH = this.GENERATED_START_WITH_ROOT_PATH + "\\GD";
    private final String BUILTIN_GDNODE_START_WITH_PATH = this.GENERATED_START_WITH_ROOT_PATH + "\\node\\builtin\\GD";
    private final String ACTION_GDNODE_START_WITH_PATH = this.GENERATED_START_WITH_ROOT_PATH + "\\node\\action\\GD";

    private final String PACKAGE = "package org.allbinary.game.canvas.node.";
    private final String BUILT_IN = "BuiltIn";
    private final String END2 = "GDNodes.java";

    private final String[] VARIABLE_ARRAY = {
        "ToJSON(",
        "Variable(",
        "VariableString(",
        "VariableChildCount("
    };
    
    private final String GLOBALS = "globals.";

    private final String[] EXTERNAL_LINK_LAYOUTS_START = {
        this.GENERATED_START_WITH_PATH,
    };

    private final String[] EXTERNAL_LINK_LAYOUTS_MID = {
        "Game",
    };

    private final String[] EXTERNAL_LINK_LAYOUTS_END = {
        "ExternalLinkLayoutGDNode.java"
    };

    private final String[] LAYOUT_START = {
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.gdPaths.GEN_PATH + "platform\\html\\GDGameHTMLPlaynJavaLibraryM\\src\\main\\java\\gd\\res\\GD",
    };

    private final String[] LAYOUT_END = {
        "SpecialAnimation.xml",
        "SpecialAnimation.java",
        "SpecialAnimationBuilder.java",
        "SpecialAnimationExternalEventGDNodes.java",
        "SpecialAnimationExternalLayoutGDNodes.java",
        "SpecialAnimationExternalActionGDNodes.java",
        "SpecialAnimationExternalConditionGDNodes.java",
        "SpecialAnimationExternalObjectEventGDNodes.java",
        "SpecialAnimationExternalOtherEventGDNodes.java",
        "SpecialAnimationActionGDNodes.java",
        "SpecialAnimationConditionGDNodes.java",
        "SpecialAnimationObjectEventGDNodes.java",
        "SpecialAnimationOtherEventGDNodes.java",
        "SpecialAnimationGDResources.java",
        "SpecialAnimationGlobals.java",
        "GDObjectsFactory.java",
        "GamePlaynResources.java",
    };

    private final String[] GLOBALS_XSL_PATH_INPUT_ARRAY = {
        this.gdData.GD_NON_LAYOUT_AS_XML,
        this.gdData.GD_GLOBALS_ANIMATION,
        this.gdData.GD_GLOBALS,
        this.gdData.GD_GLOBALS_GD_OBJECTS_FACTORY,
        this.gdData.GD_GLOBALS_GD_RESOURCES,
        this.gdData.GD_EXTENSION_GD_NODES,
        this.gdData.GD_GLOBAL_GAME_THREED_LEVEL_LOADER,
    };

    private final String[] GLOBALS_START = {
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.GENERATED_START_WITH_PATH,
        this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
    };

    private final String[] GLOBALS_END = {
        "NonLayout.xml",
        "GlobalsSpecialAnimation.java",
        "GameGlobals.java",
        "GlobalsGDObjectsFactory.java",
        "GlobalsGDResources.java",
        "ExtensionGDNodes.java",
        "GlobalGameThreedLevelBuilder.java",
    };

    private final String[] XSL_PATH_INPUT_CREATE_INSTANCE_ARRAY = {this.gdData.GD_EXTERNAL_CREATE_INSTANCE_GD_NODE};

    private final String[] EXTERNAL_CREATE_INSTANCE_START = {
        this.GENERATED_START_WITH_PATH,
    };

    private final String[] EXTERNAL_CREATE_INSTANCE_MID = {
        "GameExternal",
    };

    private final String[] EXTERNAL_CREATE_INSTANCE_END = {
        "CreateInstance.java"
    };

    private final String[] CREATE_INSTANCE_XSL_PATH_INPUT_ARRAY = {this.gdData.GD_CREATE_INSTANCE_GD_NODE};

    private final String[] CREATE_INSTANCE_START = {
        this.GENERATED_START_WITH_PATH,
    };

    private final String[] CREATE_INSTANCE_MID = {
        "Game",
    };

    private final String[] CREATE_INSTANCE_END = {
        "CreateInstance.java"
    };
    
    private final String[] LAYOUT_XSL_PATH_INPUT_ARRAY = {
        this.gdData.GD_LAYOUT_AS_XML,
        this.gdData.GD_LAYOUT,
        this.gdData.GD_LAYOUT_BUILDER,
        this.gdData.GD_LAYOUT_EXTERNAL_EVENT_GD_NODES,
        this.gdData.GD_LAYOUT_EXTERNAL_LAYOUT_GD_NODES,
        this.gdData.GD_LAYOUT_EXTERNAL_ACTION_GD_NODES,
        this.gdData.GD_LAYOUT_EXTERNAL_CONDITION_GD_NODES,
        this.gdData.GD_LAYOUT_EXTERNAL_OBJECT_EVENT_GD_NODES,
        this.gdData.GD_LAYOUT_EXTERNAL_OTHER_EVENT_GD_NODES,
        this.gdData.GD_LAYOUT_ACTION_GD_NODES,
        this.gdData.GD_LAYOUT_CONDITION_GD_NODES,
        this.gdData.GD_LAYOUT_OBJECT_EVENT_GD_NODES,
        this.gdData.GD_LAYOUT_OTHER_EVENT_GD_NODES,
        this.gdData.GD_LAYOUT_GD_RESOURCES,
        this.gdData.GD_LAYOUT_SCENE_AS_SPECIAL_ANIMATION_GLOBALS,
        this.gdData.GD_LAYOUT_GD_OBJECTS_FACTORY,
        this.gdData.GD_GAME_PLAYN_RESOURCES,};

    private final String[] BUILT_IN_XSL_PATH_INPUT_ARRAY = {this.gdData.GD_OTHER_EVENT_GD_NODES};

    private final String[] BUILT_IN_END = {
        this.END2,};

    private final String[] BUILT_IN_START = {
        this.BUILTIN_GDNODE_START_WITH_PATH,};

    private final String[] BUILT_IN_MIDDLE = {
        this.BUILT_IN,};

    private final String[] ACTION_GDNODES_XSL_PATH_INPUT_ARRAY = {
        this.gdData.GD_LAYOUT_N_EXTERNAL_ACTION_GD_NODES,
        this.gdData.GD_LAYOUT_N_ACTION_GD_NODES,};

    private final String ACTION_GDNODES_END2 = "GDNodes.java";
    private final String[] ACTION_GDNODES_END = {
        ACTION_GDNODES_END2,
        ACTION_GDNODES_END2,};

    private final String[] ACTION_GDNODES_START = {
        this.ACTION_GDNODE_START_WITH_PATH,
        this.ACTION_GDNODE_START_WITH_PATH,};

    private final String[] ACTION_GDNODES_MIDDLE = {
        "ExternalAction",
        "Action",};
    
    private final String[] RESOURCE_LOADER_XSL_PATH_INPUT_ARRAY = {
        this.gdData.GD_ANDROID_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_LAZY_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_HTML_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_LAZY_HTML_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_LAZY_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_OPENGL_TWO_D_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_OPENGL_TWO_D_LAZY_J2SE_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_OPENGL_TWO_D_ANDROID_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_OPENGL_THREED_GLOBAL_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_GLOBAL_RESOURCES,
        this.gdData.GD_THREED_GLOBAL_RESOURCES,
        this.gdData.GD_GLOBAL_IMAGE_RESOURCES,
        this.gdData.GD_THREED_GLOBAL_IMAGE_RESOURCES,
        this.gdData.GD_GAME_MUSIC_FACTORY,
        this.gdData.GD_ANDROID_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_LAZY_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_HTML_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_LAZY_HTML_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_LAZY_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_OPENGL_TWO_D_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_OPENGL_TWO_D_LAZY_J2SE_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_OPENGL_TWO_D_ANDROID_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_OPENGL_THREED_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_ANDROID_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_J2SE_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_LAZY_J2SE_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_HTML_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_LAZY_HTML_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_LAZY_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_OPENGL_THREED_TOUCH_GAME_RESOURCES_IMAGE_ANIMATION_FACTORY,
        this.gdData.GD_GAME_SOUNDS_FACTORY,
        this.gdData.GD_LAYOUT_RESOURCES,
        this.gdData.GD_THREED_LAYOUT_RESOURCES,
        this.gdData.GD_LAYOUT_IMAGE_RESOURCES,
        this.gdData.GD_THREED_LAYOUT_IMAGE_RESOURCES,
        this.gdData.GD_LAYOUT_TOUCH_IMAGE_RESOURCES,
        this.gdData.GD_THREED_LAYOUT_TOUCH_IMAGE_RESOURCES,
        this.gdData.GD_LAYOUT_GAME_THREED_LEVEL_LOADER,
        this.gdData.GD_GAME_CAMERA_SETUP,
        this.gdData.GD_LAYOUT_UTIL,};

    private final String[] RESOURCE_LOADER_OUTPUT_FILE_PATH_ARRAY = {
        this.gdPaths.GEN_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
        this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
        this.gdPaths.GEN_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
        this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
        this.gdPaths.GEN_PATH + "GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLTwoDAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameAndroidImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameLazyJ2SEImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameLazyHTMLImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameLazyImageAnimationInterfaceResourceFactoryJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameOpenGLThreedAnimationResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\animation\\image\\GD",
        this.gdPaths.GEN_PATH + "GDGameWavSoundsJavaLibraryM\\src\\main\\java\\org\\allbinary\\media\\audio\\GD",
        this.gdPaths.GEN_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
        this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
        this.gdPaths.GEN_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
        this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
        this.gdPaths.GEN_PATH + "GDGamePreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
        this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
        this.gdPaths.GEN_PATH + "GDGameThreedPreBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",
        this.gdPaths.GEN_PATH + "GDGameThreedBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\graphics\\threed\\min3d\\GD",
        this.gdPaths.GEN_PATH + "resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GD",};

    private final String[] RESOURCE_LOADER_OUTPUT_FILE_PATH_END_ARRAY = {
        "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTwoDGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGlobalGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GlobalSpecialAnimationResources.java",
        "GlobalSpecialAnimationResources.java",
        "GlobalSpecialAnimationImageResources.java",
        "GlobalSpecialAnimationImageResources.java",
        "GameMusicFactory.java",
        "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTwoDGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameTouchGameResourcesImageBasedAnimationInterfaceFactoryInterfaceFactory.java",
        "GameSoundsFactory.java",
        "SpecialAnimationResources.java",
        "SpecialAnimationResources.java",
        "SpecialAnimationImageResources.java",
        "SpecialAnimationImageResources.java",
        "SpecialAnimationTouchImageResources.java",
        "SpecialAnimationTouchImageResources.java",
        "GameThreedLevelBuilder.java",
        "GameCameraSetup.java",
        "LayoutUtil.java",};

    private final String PARAMETERS_START = "<parameters>";
    private final String PARAMETERS_END = "</parameters>";
    private final String QUOTE = "&quot;";
    private final String THIS_GDUTIL = "this.gdUtil.";

    private final String FINISHED = "Finished";
    private final String SKIPPING_INDEX_AS_STRING = "skipping indexAsString:";
    private final String NO_GDNODE = "No GDNode: ";
    private final String ACTION_LIST = " action list:";

    private final String ELAPSED_TIME = "ElapsedTime: ";
    private final String CURRENT_STATE_ELAPSED_TIME = "Current State ElapsedTime: ";
    private final String GENERATE_XML_AND_GLOBALS = "generateXMLAndGlobals (Takes a long time and has little output) ";
    private final String GENERATE_LAYOUTS = "generateLayouts ";
    private final String GENERATE_CREATE_INSTANCES = "generateCreateInstances ";
    private final String GENERATE_EXTERNAL_LINK_LAYOUTS = "generateExternalLinkLayouts ";
    private final String GENERATE_EXTERNAL_CREATE_INSTANCES = "generateExternalCreateInstances ";
    private final String GENERATE_ACTION_GDNODES = "generateActionGDNodes ";
    private final String GENERATE_BUILT_IN_GDNODES = "generateBuiltInGDNodes ";
    private final String GENERATE_RESOURCES_LOADERS_SETUP = "generateResourcesLoadersSetup ";
    private final String GAME_XML_NOT_FORMATTED = "Is the game xml formatted when it is not we get an error from: gglobals.dVersion";

    //Applied in order to the game xml
    private final String[] GAME_XML_REPLACE_FIND_ARRAY = {
        ".Width()",
        ".Height()",
        "GlobalVariable(",
        "GlobalVariableString(",
        "GlobalVariableChildCount(",
        "Time(&quot;timestamp&quot;)",
        "GlobalVarToJSON(",
        "Text::Value()",
        "FileSystem::",
        "FileSystem.ReadDirectory",
        "AdvancedHTTP::ResponseStatusText",
        ".Text()",
    };

    private final String[] GAME_XML_REPLACE_WITH_ARRAY = {
        //".Width(globals.graphics)",
        ".Width(null)",
        //".Height(globals.graphics)",
        ".Height(null)",
        "GlobalVariable(gameGlobals.",
        "GlobalVariableString(gameGlobals.",
        "GlobalVariableChildCount(gameGlobals.",
        "gameTickTimeDelayHelper.startTime",
        "GlobalVarToJSON(gameGlobals.",
        "Text()",
        "FileSystem.",
        "FileSystem::ReadDirectory",
        "AdvancedHTTP.ResponseStatusText",
        "GDGameLayer.Text()",
    };

    //Applied in order to the layout game xml
    private final String[] LAYOUT_GAME_XML_REPLACE_FIND_ARRAY = {
        "PointX(&quot;",
        "PointY(&quot;",
        "MouseX(&quot;&quot;",
        "MouseY(&quot;&quot;",
        "CameraX(&quot;&quot;",
        "CameraY(&quot;&quot;",
        "CameraWidth(&quot;&quot;",
        "\"value\": \" V\"",
        "\"value\": \"V \"",
    };

    private final String[] LAYOUT_GAME_XML_REPLACE_WITH_ARRAY = {
        "PointX(&quot;globals.",
        "PointY(&quot;globals.",
        "MouseX(EMPTY_STRING",
        "MouseY(EMPTY_STRING",
        "CameraX(EMPTY_STRING",
        "CameraY(EMPTY_STRING",
        "CameraWidth(EMPTY_STRING",
        "\"value\": \" &#8595;\"",
        "\"value\": \"&#8595; \"",
    };

    public GDLayoutsToAllBinaryLayoutGenerator() {
        this.smallIntegerSingletonFactory.init();
    }

    private void generateXMLAndGlobals(final String gameXmlAsString, final boolean[] finished) throws Exception {

        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();

        final String[] xmlStringArray0 = {
            gameXmlAsString,
            gameXmlAsString,
            gameXmlAsString,
            gameXmlAsString,
            gameXmlAsString,
            gameXmlAsString,
            gameXmlAsString,};

        final int xslTotal0 = GLOBALS_XSL_PATH_INPUT_ARRAY.length;
        final String[] xslDocumentAsString0 = new String[xslTotal0];
        for (int index = 0; index < xslTotal0; index++) {
            xslDocumentAsString0[index] = this.gdData.getAsString(GLOBALS_XSL_PATH_INPUT_ARRAY[index], sharedBytes);
        }

        for (int index2 = 0; index2 < xslTotal0; index2++) {

            final int currentIndex = index2;
            final Runnable runnable = new Runnable() {
                public void run() {
                    try {
                        generateXMLAndGlobalsAt(xmlStringArray0, GLOBALS_XSL_PATH_INPUT_ARRAY, GLOBALS_START, GLOBALS_END, xslDocumentAsString0, currentIndex, new StringMaker());
                        finished[0] = true;
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable).start();
        }
    }

    private void generateXMLAndGlobalsAt(final String[] xmlStringArray0, final String[] xslPathInputArray0, final String[] START0, final String[] END0, final String[] xslDocumentAsString0, final int index2, final StringMaker stringMaker) throws Exception {
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);
        //timeDelayHelper.setStartTimeTNT();

        //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(xslPathInputArray0[index2]).toString(), this, this.commonStrings.PROCESS);

        final String updatedXslDocumentAsString = xslDocumentAsString0[index2];

        String result = this.gdXslTemplates.translate(xslPathInputArray0[index2], updatedXslDocumentAsString, xmlStringArray0[index2]);

        stringMaker.delete(0, stringMaker.length());
        String fileName = fileName = this.gdPaths.getOutputPath(stringMaker.append(START0[index2]).append(END0[index2]).toString());

        //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

        if (index2 == 0) {
            this.logUtil.putF(this.RESULT + result, this, this.commonStrings.PROCESS);
            stringMaker.delete(0, stringMaker.length());
            String formattedXml = XmlDocumentHelper.getInstance().format(stringMaker.append(this.GAME_START).append(result).append(this.GAME_END).toString());
            final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
            formattedXml = replaceLT.all(formattedXml);
            this.bufferedWriterUtil.overwrite(fileName, formattedXml);
        } else {
            final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
            result = replaceLT.all(result);
            this.bufferedWriterUtil.overwrite(fileName, result);
        }

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.appendint(index2).append(this.commonSeps.SPACE).append(xslPathInputArray0[index2]).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
    }

    public void generateExternalLinkLayouts(final int startIndex, final int size, final String gameXmlAsString, final String layoutGameXmlAsString, final GDGameInfo gdGameInfo, final StringMaker stringMaker)
        throws Exception {
        
        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

        final String[] xmlStringArray = {
            layoutGameXmlAsString
        };

        final String[] xslPathInputArray = {this.gdData.GD_EXTERNAL_LINK_LAYOUT_GD_NODE};

        final int xslTotal = xslPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            xslDocumentAsString[index] = this.gdData.getAsString(xslPathInputArray[index], sharedBytes);
        }

        String indexAsString;
        String index4AsString;
        int externalLayoutTotalForSceneLayout;
        for (int index = startIndex; index < size; index++) {
            //stringMaker.delete(0, stringMaker.length());
            //logUtil.put(stringMaker.append("layout:").appendint(index).toString(), this, commonStrings.PROCESS);

            externalLayoutTotalForSceneLayout = gdGameInfo.getExternalLayoutTotal(index);
            indexAsString = Integer.toString(index);

            for (int index2 = 0; index2 < xslTotal; index2++) {

                for (int index4 = 0; index4 < externalLayoutTotalForSceneLayout; index4++) {

                index4AsString = Integer.toString(index4);

                //stringMaker.delete(0, stringMaker.length());
                //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                timeDelayHelper.setStartTimeTNT();

                //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(xslPathInputArray[index2]).toString(), this, this.commonStrings.PROCESS);

                String result = this.gdXslTemplates.translate(xslPathInputArray[index2], xslDocumentAsString[index2],
                    new String[] {this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, this.gdToolStrings.GD_EXTERNAL_LAYOUT_INDEX},
                    new String[] {indexAsString, index4AsString},
                    xmlStringArray[index2]);
                 
                stringMaker.delete(0, stringMaker.length());
                final String fileName = this.gdPaths.getOutputPath(stringMaker.append(EXTERNAL_LINK_LAYOUTS_START[index2]).append(indexAsString).append(EXTERNAL_LINK_LAYOUTS_MID[index2]).appendint(index4).append(EXTERNAL_LINK_LAYOUTS_END[index2]).toString());
                this.directory.create(new AbFilePath(fileName));

                //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    result = replaceLT.all(result);
                    this.bufferedWriterUtil.overwrite(fileName, result);

                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.appendint(index).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
                }
            }

        }

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).append(this.FINISHED).toString(), this, this.commonStrings.PROCESS);

    }

    public void generateExternalCreateInstances(final int startIndex, final int size, final String gameXmlAsString, final String layoutGameXmlAsString, final GDGameInfo gdGameInfo, final StringMaker stringMaker)
        throws Exception {
        
        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

        final String[] xmlStringArray = {
            layoutGameXmlAsString
        };

        final int xslTotal = XSL_PATH_INPUT_CREATE_INSTANCE_ARRAY.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            xslDocumentAsString[index] = this.gdData.getAsString(XSL_PATH_INPUT_CREATE_INSTANCE_ARRAY[index], sharedBytes);
        }
        
        String indexAsString;
        String index4AsString;
        int externalCreateInstanceTotal;
        int externalLayoutTotalForSceneLayout;
        String createInstanceIndexAsString;
        for (int index = startIndex; index < size; index++) {
            //stringMaker.delete(0, stringMaker.length());
            //logUtil.put(stringMaker.append("layout:").appendint(index).toString(), this, commonStrings.PROCESS);

            externalLayoutTotalForSceneLayout = gdGameInfo.getExternalLayoutTotal(index);
            indexAsString = Integer.toString(index);

            for (int index2 = 0; index2 < xslTotal; index2++) {

                for (int index4 = 0; index4 < externalLayoutTotalForSceneLayout; index4++) {

                externalCreateInstanceTotal = gdGameInfo.getExternalLayoutInstanceTotal(index4);
                index4AsString = Integer.toString(index4);

                for (int index5 = 0; index5 < externalCreateInstanceTotal; index5++) {

                createInstanceIndexAsString = Integer.toString(index5);

                //stringMaker.delete(0, stringMaker.length());
                //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                timeDelayHelper.setStartTimeTNT();

                //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(XSL_PATH_INPUT_CREATE_INSTANCE_ARRAY[index2]).toString(), this, this.commonStrings.PROCESS);

                String result = this.gdXslTemplates.translate(XSL_PATH_INPUT_CREATE_INSTANCE_ARRAY[index2], xslDocumentAsString[index2],
                    new String[] {this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, this.gdToolStrings.GD_EXTERNAL_LAYOUT_INDEX, this.gdToolStrings.GD_CREATE_INSTANCE_INDEX},
                    new String[] {indexAsString, index4AsString, createInstanceIndexAsString},
                    xmlStringArray[index2]);
                 
                stringMaker.delete(0, stringMaker.length());
                final String fileName = this.gdPaths.getOutputPath(stringMaker.append(EXTERNAL_CREATE_INSTANCE_START[index2]).append(indexAsString).append(EXTERNAL_CREATE_INSTANCE_MID[index2]).appendint(index5).append(EXTERNAL_CREATE_INSTANCE_END[index2]).toString());
                this.directory.create(new AbFilePath(fileName));

                //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    result = replaceLT.all(result);
                    this.bufferedWriterUtil.overwrite(fileName, result);

                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.appendint(index).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
                }
                }
            }

        }

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).append(this.FINISHED).toString(), this, this.commonStrings.PROCESS);

    }

    public void generateCreateInstances(final int startIndex, final int size, final String gameXmlAsString, final String layoutGameXmlAsString, final GDGameInfo gdGameInfo, final StringMaker stringMaker)
        throws Exception {
        
        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

        final String[] xmlStringArray = {
            layoutGameXmlAsString
        };

        final int xslTotal = CREATE_INSTANCE_XSL_PATH_INPUT_ARRAY.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            xslDocumentAsString[index] = this.gdData.getAsString(CREATE_INSTANCE_XSL_PATH_INPUT_ARRAY[index], sharedBytes);
        }
        
        String indexAsString;

        int createInstanceTotal;
        String createInstanceIndexAsString;
        for (int index = startIndex; index < size; index++) {
            //stringMaker.delete(0, stringMaker.length());
            //logUtil.put(stringMaker.append("layout:").appendint(index).toString(), this, commonStrings.PROCESS);
            
            createInstanceTotal = gdGameInfo.getLayoutInstanceTotal(index);
            indexAsString = Integer.toString(index);

            for (int index2 = 0; index2 < xslTotal; index2++) {

                for (int index4 = 0; index4 < createInstanceTotal; index4++) {

                createInstanceIndexAsString = Integer.toString(index4);

                //stringMaker.delete(0, stringMaker.length());
                //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                timeDelayHelper.setStartTimeTNT();

                //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(CREATE_INSTANCE_XSL_PATH_INPUT_ARRAY[index2]).toString(), this, this.commonStrings.PROCESS);

                String result = this.gdXslTemplates.translate(CREATE_INSTANCE_XSL_PATH_INPUT_ARRAY[index2], xslDocumentAsString[index2],
                    new String[] {this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, this.gdToolStrings.GD_CREATE_INSTANCE_INDEX},
                    new String[] {indexAsString, createInstanceIndexAsString},
                    xmlStringArray[index2]);
                 
                stringMaker.delete(0, stringMaker.length());
                final String fileName = this.gdPaths.getOutputPath(stringMaker.append(CREATE_INSTANCE_START[index2]).append(indexAsString).append(CREATE_INSTANCE_MID[index2]).appendint(index4).append(CREATE_INSTANCE_END[index2]).toString());
                this.directory.create(new AbFilePath(fileName));

                //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    result = replaceLT.all(result);
                    this.bufferedWriterUtil.overwrite(fileName, result);

                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.appendint(index).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
                }
            }

        }

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).append(this.FINISHED).toString(), this, this.commonStrings.PROCESS);

    }
    
    public void generateLayouts(final int startIndex, final int size, final String gameXmlAsString, final String layoutGameXmlAsString, final StringMaker stringMaker)
        throws Exception {

        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

        final String[] xmlStringArray = {
            layoutGameXmlAsString,
            layoutGameXmlAsString,
            layoutGameXmlAsString,
            layoutGameXmlAsString,
            layoutGameXmlAsString,
            layoutGameXmlAsString,
            layoutGameXmlAsString,
            layoutGameXmlAsString,
            layoutGameXmlAsString,
            layoutGameXmlAsString,
            layoutGameXmlAsString,
            layoutGameXmlAsString,
            layoutGameXmlAsString,
            layoutGameXmlAsString,
            gameXmlAsString,
            layoutGameXmlAsString,
            gameXmlAsString,};

        final int xslTotal = LAYOUT_XSL_PATH_INPUT_ARRAY.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            xslDocumentAsString[index] = this.gdData.getAsString(LAYOUT_XSL_PATH_INPUT_ARRAY[index], sharedBytes);
        }
        this.gdXslTemplates.compile(LAYOUT_XSL_PATH_INPUT_ARRAY, xslDocumentAsString);

        String indexAsString;
        for (int index = startIndex; index < size; index++) {
            //stringMaker.delete(0, stringMaker.length());
            //logUtil.put(stringMaker.append("layout:").appendint(index).toString(), this, commonStrings.PROCESS);

            indexAsString = Integer.toString(index);

            for (int index2 = 0; index2 < xslTotal; index2++) {

                //stringMaker.delete(0, stringMaker.length());
                //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                timeDelayHelper.setStartTimeTNT();

                //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(LAYOUT_XSL_PATH_INPUT_ARRAY[index2]).toString(), this, this.commonStrings.PROCESS);

                String result = this.gdXslTemplates.translate(LAYOUT_XSL_PATH_INPUT_ARRAY[index2], xslDocumentAsString[index2],
                    this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, indexAsString, xmlStringArray[index2]);
                 
                stringMaker.delete(0, stringMaker.length());
                final String fileName = this.gdPaths.getOutputPath(stringMaker.append(LAYOUT_START[index2]).append(indexAsString).append(LAYOUT_END[index2]).toString());
                this.directory.create(new AbFilePath(fileName));

                //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

                if (index2 == 0) {
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.RESULT).append(result).toString(), this, this.commonStrings.PROCESS);
                    stringMaker.delete(0, stringMaker.length());
                    String formattedXml = XmlDocumentHelper.getInstance().format(stringMaker.append(this.GAME_START).append(result).append(this.GAME_END).toString());
                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    formattedXml = replaceLT.all(formattedXml);
                    this.bufferedWriterUtil.overwrite(fileName, formattedXml);
                } else {
                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    result = replaceLT.all(result);
                    this.bufferedWriterUtil.overwrite(fileName, result);
                }

                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.appendint(index).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
            }

        }

        stringMaker.delete(0, stringMaker.length());
        this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).append(this.FINISHED).toString(), this, this.commonStrings.PROCESS);

    }

    private String getIndexAsString(BasicArrayList list, int fileIndex) {

        final PrimitiveLongSingleton primitiveLongSingleton = PrimitiveLongSingleton.getInstance();

        int charIndex = 0;
        final int size = list.size();
        final StringMaker stringMaker = new StringMaker();
        String indexAsString;

        //Not very efficient, but better than creating a file for each and every GDNode.
        for (int index3 = 0; index3 < size; index3++) {
            indexAsString = (String) list.get(index3);
            if (fileIndex == 0) {
                charIndex = 0;
                while (charIndex <= 4) {
                    if (indexAsString.charAt(indexAsString.length() - 1) == primitiveLongSingleton.NUMBER_CHAR_ARRAY[charIndex]) {
                        stringMaker.append(this.commonSeps.COMMA).append(indexAsString).append(this.commonSeps.COMMA);
                        break;
                    }
                    charIndex++;
                }
            } else {
                charIndex = 5;
                while (charIndex < primitiveLongSingleton.NUMBER_CHAR_ARRAY.length) {
                    if (indexAsString.charAt(indexAsString.length() - 1) == primitiveLongSingleton.NUMBER_CHAR_ARRAY[charIndex]) {
                        stringMaker.append(this.commonSeps.COMMA).append(indexAsString).append(this.commonSeps.COMMA);
                        break;
                    }
                    charIndex++;
                }
            }
//                    if (indexAsString.charAt(indexAsString.length() - 1) == primitiveLongSingleton.NUMBER_CHAR_ARRAY[charIndex]) {
//                        nodeIdStringMaker.append(commonSeps.COMMA).append(indexAsString).append(commonSeps.COMMA);
//                    }
        }
        //charIndex++;

        return stringMaker.toString();
    }

    private String getBuiltInGDNodeListAsString(final String gameXmlAsString, final int layoutIndex, final SharedBytes sharedBytes)
        throws Exception {

        final String[] xmlStringArray = {
            gameXmlAsString,};

        final String[] gdNodeXSLPathInputArray = {this.gdData.GD_OTHER_EVENT_GD_NODE_ID_LIST};

        final int xslTotal = gdNodeXSLPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            xslDocumentAsString[index] = this.gdData.getAsString(gdNodeXSLPathInputArray[index], sharedBytes);
        }

        String result = this.gdXslTemplates.translate(gdNodeXSLPathInputArray[0], xslDocumentAsString[0],
            this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, this.smallIntegerSingletonFactory.getString(layoutIndex), xmlStringArray[0]);

        final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
        result = replaceLT.all(result);
        
        return result;

    }

    private BasicArrayList getBuiltInGDNodeList(final String gameXmlAsString, final int layoutIndex, final SharedBytes sharedBytes) throws Exception {

        final String nodeListAsString = this.getBuiltInGDNodeListAsString(gameXmlAsString, layoutIndex, sharedBytes);
        final Tokenizer tokenizer = new Tokenizer(this.commonSeps.SPACE);
        return tokenizer.getTokensFromString(nodeListAsString, new BasicArrayListD());

    }

    private void generateBuiltInGDNodes(final String gameXmlAsString, final String layoutGameXmlAsString2, final int layoutTotal, final StringMaker stringMaker)
        throws Exception {

        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

        for (int layoutIndex = 0; layoutIndex < layoutTotal; layoutIndex++) {

            final BasicArrayList list = this.getBuiltInGDNodeList(gameXmlAsString, layoutIndex, sharedBytes);

            final String[] xmlStringArray = {
                layoutGameXmlAsString2,};
            
            final int xslTotal = BUILT_IN_XSL_PATH_INPUT_ARRAY.length;
            final String[] xslDocumentAsString = new String[xslTotal];
            for (int index = 0; index < xslTotal; index++) {
                xslDocumentAsString[index] = this.gdData.getAsString(BUILT_IN_XSL_PATH_INPUT_ARRAY[index], sharedBytes);
            }

            String indexAsString;
            //while (charIndex < primitiveLongSingleton.NUMBER_CHAR_ARRAY.length) {
            for (int fileIndex = 0; fileIndex < 2; fileIndex++) {

                indexAsString = this.getIndexAsString(list, fileIndex);

                if (indexAsString.isEmpty()) {
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.SKIPPING_INDEX_AS_STRING).append(indexAsString).toString(), this, this.commonStrings.PROCESS);
                    continue;
                }

                final String[] placeholderArray = {this.gdToolStrings.GD_NODE_IDS, this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX};
                final String[] valueArray = {indexAsString, this.smallIntegerSingletonFactory.getString(layoutIndex)};

//            stringMaker.delete(0, stringMaker.length());
//            logUtil.put(stringMaker.append("indexAsString:").append(indexAsString).toString(), this, commonStrings.PROCESS);
                for (int index2 = 0; index2 < xslTotal; index2++) {

                    //stringMaker.delete(0, stringMaker.length());
                    //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                    timeDelayHelper.setStartTimeTNT();

                    //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                    String result = this.gdXslTemplates.translate(BUILT_IN_XSL_PATH_INPUT_ARRAY[index2], xslDocumentAsString[index2],
                        placeholderArray, valueArray, xmlStringArray[index2]);

                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    result = replaceLT.all(result);

                    stringMaker.delete(0, stringMaker.length());
                    //String fileName = stringMaker.append(START[index2]).append(layoutIndex).append(MIDDLE[index2]).append(indexAsString.substring(indexAsString.length() - 2, indexAsString.length() - 1)).append(END[index2]).toString();
                    String fileName = this.gdPaths.getOutputPath(stringMaker.append(BUILT_IN_START[index2]).appendint(layoutIndex).append(BUILT_IN_MIDDLE[index2]).appendint(fileIndex).append(BUILT_IN_END[index2]).toString());

                    if (result.indexOf(this.PACKAGE) < 0) {
                        stringMaker.delete(0, stringMaker.length());
                        this.logUtil.putF(stringMaker.append(this.NO_GDNODE).append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);
                        continue;
                    }

                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(BUILT_IN_XSL_PATH_INPUT_ARRAY[index2]).toString(), this, this.commonStrings.PROCESS);

                    //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

                    this.bufferedWriterUtil.overwrite(fileName, result);

                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.appendint(fileIndex).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
                }

            }

            stringMaker.delete(0, stringMaker.length());
            this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).append(this.FINISHED).toString(), this, this.commonStrings.PROCESS);

        }
    }

    private String getActionGDNodeListAsString(final String gameXmlAsString, final int layoutIndex, final SharedBytes sharedBytes)
        throws Exception {

        final String[] xmlStringArray = {
            gameXmlAsString,};

        final String[] gdNodeXSLPathInputArray = {this.gdData.GD_ACTION_GD_NODE_ID_LIST};

        final int xslTotal = gdNodeXSLPathInputArray.length;
        final String[] xslDocumentAsString = new String[xslTotal];
        for (int index = 0; index < xslTotal; index++) {
            xslDocumentAsString[index] = this.gdData.getAsString(gdNodeXSLPathInputArray[index], sharedBytes);
        }

        String result = this.gdXslTemplates.translate(gdNodeXSLPathInputArray[0], xslDocumentAsString[0],
            this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, this.smallIntegerSingletonFactory.getString(layoutIndex), xmlStringArray[0]);

        final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
        result = replaceLT.all(result);

        return result;

    }

    private BasicArrayList getActionGDNodeList(final String gameXmlAsString, final int layoutIndex, final SharedBytes sharedBytes) throws Exception {

        final String nodeListAsString = this.getActionGDNodeListAsString(gameXmlAsString, layoutIndex, sharedBytes);
        final Tokenizer tokenizer = new Tokenizer(this.commonSeps.SPACE);
        return tokenizer.getTokensFromString(nodeListAsString, new BasicArrayListD());

    }

    private void generateActionGDNodes(final String gameXmlAsString, final String layoutGameXmlAsString2, final int layoutTotal, final StringMaker stringMaker)
        throws Exception {

        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

        for (int layoutIndex = 0; layoutIndex < layoutTotal; layoutIndex++) {

            final BasicArrayList list = this.getActionGDNodeList(gameXmlAsString, layoutIndex, sharedBytes);

            stringMaker.delete(0, stringMaker.length());
            this.logUtil.putF(stringMaker.appendint(layoutIndex).append(this.ACTION_LIST).appendint(list.size()).toString(), this, this.commonStrings.PROCESS);

            final String[] xmlStringArray = {
                layoutGameXmlAsString2,
                layoutGameXmlAsString2,};
            
            final int xslTotal = ACTION_GDNODES_XSL_PATH_INPUT_ARRAY.length;
            final String[] xslDocumentAsString = new String[xslTotal];
            for (int index = 0; index < xslTotal; index++) {
                xslDocumentAsString[index] = this.gdData.getAsString(ACTION_GDNODES_XSL_PATH_INPUT_ARRAY[index], sharedBytes);
            }

            String indexAsString;
            //while (charIndex < primitiveLongSingleton.NUMBER_CHAR_ARRAY.length) {
            for (int fileIndex = 0; fileIndex < 2; fileIndex++) {

                indexAsString = this.getIndexAsString(list, fileIndex);

                if (indexAsString.isEmpty()) {
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.SKIPPING_INDEX_AS_STRING).append(indexAsString).toString(), this, this.commonStrings.PROCESS);
                    continue;
                }

                final String[] placeholderArray = {this.gdToolStrings.GD_NODE_IDS, this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX};
                final String[] valueArray = {indexAsString, this.smallIntegerSingletonFactory.getString(layoutIndex)};

//            stringMaker.delete(0, stringMaker.length());
//            logUtil.put(stringMaker.append("indexAsString:").append(indexAsString).toString(), this, commonStrings.PROCESS);
                for (int index2 = 0; index2 < xslTotal; index2++) {

                    //stringMaker.delete(0, stringMaker.length());
                    //logUtil.put(stringMaker.append("xslt:").append(index2).toString(), this, commonStrings.PROCESS);
                    timeDelayHelper.setStartTimeTNT();

                    //logUtil.put("xsl index: " + index2, this, commonStrings.PROCESS);
                    String result = this.gdXslTemplates.translate(ACTION_GDNODES_XSL_PATH_INPUT_ARRAY[index2], xslDocumentAsString[index2],
                        placeholderArray, valueArray, xmlStringArray[index2]);

                    final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                    result = replaceLT.all(result);

                    stringMaker.delete(0, stringMaker.length());
                    String fileName = this.gdPaths.getOutputPath(stringMaker.append(ACTION_GDNODES_START[index2]).appendint(layoutIndex).append(ACTION_GDNODES_MIDDLE[index2]).appendint(fileIndex).append(ACTION_GDNODES_END[index2]).toString());

                    if (result.indexOf(this.PACKAGE) < 0) {
                        stringMaker.delete(0, stringMaker.length());
                        this.logUtil.putF(stringMaker.append(this.NO_GDNODE).append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);
                        continue;
                    }

                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(ACTION_GDNODES_XSL_PATH_INPUT_ARRAY[index2]).toString(), this, this.commonStrings.PROCESS);

                    //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(fileName).toString(), this, this.commonStrings.PROCESS);

                    this.bufferedWriterUtil.overwrite(fileName, result);

                    stringMaker.delete(0, stringMaker.length());
                    this.logUtil.putF(stringMaker.appendint(fileIndex).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
                }

            }

            stringMaker.delete(0, stringMaker.length());
            this.logUtil.putF(stringMaker.append(CommonLabels.getInstance().ELAPSED).append(this.FINISHED).toString(), this, this.commonStrings.PROCESS);

        }
    }

    private void generateResourcesLoadersSetup(final int startIndex, final int size, final String gameXmlAsString, final StringMaker stringMaker)
        throws Exception {

        //final SharedBytes sharedBytes = SharedBytes.getInstance();
        final SharedBytes sharedBytes = new SharedBytes();
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);

        final int xslTotal2 = RESOURCE_LOADER_OUTPUT_FILE_PATH_ARRAY.length;
        final String[] xslDocumentAsString2 = new String[xslTotal2];
        for (int index = 0; index < xslTotal2; index++) {
            xslDocumentAsString2[index] = this.gdData.getAsString(RESOURCE_LOADER_XSL_PATH_INPUT_ARRAY[index], sharedBytes);
        }
        this.gdXslTemplates.compile(RESOURCE_LOADER_XSL_PATH_INPUT_ARRAY, xslDocumentAsString2);

        //TWB - need to update to allow loading for every layout.
        String indexAsString;
        for (int index = startIndex; index < size; index++) {
            timeDelayHelper.setStartTimeTNT();

            indexAsString = Integer.toString(index);

            for (int index2 = 0; index2 < xslTotal2; index2++) {

                //logUtil.put("xsl2 index: " + index2, this, commonStrings.PROCESS);
                String result = this.gdXslTemplates.translate(RESOURCE_LOADER_XSL_PATH_INPUT_ARRAY[index2], xslDocumentAsString2[index2],
                    this.gdToolStrings.GD_CURRENT_LAYOUT_INDEX, indexAsString, gameXmlAsString);

                final Replace replaceLT = new Replace(this.gdToolStrings.LESS_THAN_ESCAPE_CODE, this.gdToolStrings.LESS_THAN);
                result = replaceLT.all(result);

                stringMaker.delete(0, stringMaker.length());
                String outputFilePath = this.gdPaths.getOutputPath(stringMaker.append(RESOURCE_LOADER_OUTPUT_FILE_PATH_ARRAY[index2]).appendint(index).append(RESOURCE_LOADER_OUTPUT_FILE_PATH_END_ARRAY[index2]).toString());
                if (index2 < 15) {
                    stringMaker.delete(0, stringMaker.length());
                    outputFilePath = this.gdPaths.getOutputPath(stringMaker.append(RESOURCE_LOADER_OUTPUT_FILE_PATH_ARRAY[index2]).append(RESOURCE_LOADER_OUTPUT_FILE_PATH_END_ARRAY[index2]).toString());
                }

                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.append(this.gdToolStrings.FILENAME).append(outputFilePath).toString(), this, this.commonStrings.PROCESS);

                this.bufferedWriterUtil.overwrite(outputFilePath, result);

                //logUtil.put(RESULT + result, this, commonStrings.PROCESS);
                stringMaker.delete(0, stringMaker.length());
                this.logUtil.putF(stringMaker.appendint(index).append(this.commonSeps.COMMA).appendint(index2).append(CommonLabels.getInstance().ELAPSED).appendlong(timeDelayHelper.getElapsedTNT()).toString(), this, this.commonStrings.PROCESS);
            }
        }
    }

    //TypeScript and JavaScript require this. before local method calls.
    //Calls already qualified with globals., gameGlobals., this., GDGameLayer., Ship., etc are skipped as are calls inside quoted strings.
    private String addThisToGDUtilLocalCalls(final String xmlAsString, final StringMaker stringMaker) {
        stringMaker.delete(0, stringMaker.length());
        final int size = xmlAsString.length();
        int lastIndex = 0;
        int startIndex;
        int endIndex;
        while ((startIndex = xmlAsString.indexOf(PARAMETERS_START, lastIndex)) >= 0) {
            startIndex += PARAMETERS_START.length();
            endIndex = xmlAsString.indexOf(PARAMETERS_END, startIndex);
            if (endIndex < 0) {
                break;
            }

            stringMaker.append(xmlAsString.substring(lastIndex, startIndex));

            boolean inQuote = false;
            int index = startIndex;
            char c;
            while (index < endIndex) {
                if (xmlAsString.startsWith(QUOTE, index)) {
                    inQuote = !inQuote;
                    stringMaker.append(QUOTE);
                    index += QUOTE.length();
                } else {
                    c = xmlAsString.charAt(index);
                    if (!inQuote && (Character.isLetter(c) || c == '_')
                        && (index == startIndex || !this.isQualifiedOrIdentifierPart(xmlAsString.charAt(index - 1)))) {
                        int identifierEndIndex = index + 1;
                        while (identifierEndIndex < endIndex && (Character.isLetterOrDigit(xmlAsString.charAt(identifierEndIndex)) || xmlAsString.charAt(identifierEndIndex) == '_')) {
                            identifierEndIndex++;
                        }
                        if (identifierEndIndex < endIndex && xmlAsString.charAt(identifierEndIndex) == '(') {
                            stringMaker.append(THIS_GDUTIL);
                        }
                        stringMaker.append(xmlAsString.substring(index, identifierEndIndex));
                        index = identifierEndIndex;
                    } else {
                        stringMaker.appendchar(c);
                        index++;
                    }
                }
            }

            lastIndex = endIndex;
        }
        if (lastIndex < size) {
            stringMaker.append(xmlAsString.substring(lastIndex));
        }
        return stringMaker.toString();
    }

    private boolean isQualifiedOrIdentifierPart(final char c) {
        return c == '.' || c == '_' || Character.isLetterOrDigit(c);
    }

    public void process(final int startIndex, final GDGameInfo gdGameInfo, final boolean[] finished) {
        try {
            final int layoutTotal = gdGameInfo.layoutTotal;

            //final SharedBytes sharedBytes = SharedBytes.getInstance();
            final SharedBytes sharedBytes = new SharedBytes();
            final StringMaker stringMaker = new StringMaker();

            String gameXmlAsString = this.gdData.getAsString(this.gdPaths.GAME_XML_PATH, sharedBytes);

            final int gameXmlReplaceTotal = GAME_XML_REPLACE_FIND_ARRAY.length;
            for (int index = 0; index < gameXmlReplaceTotal; index++) {
                final Replace replace = new Replace(GAME_XML_REPLACE_FIND_ARRAY[index], GAME_XML_REPLACE_WITH_ARRAY[index]);
                gameXmlAsString = replace.all(gameXmlAsString);
            }

            String layoutGameXmlAsString = new String(gameXmlAsString);
            final int size2 = VARIABLE_ARRAY.length;
            for (int index2 = 0; index2 < size2; index2++) {
                final String VARIABLE = VARIABLE_ARRAY[index2];
                for (int index = 0; index >= 0;) {
                    index = layoutGameXmlAsString.indexOf(VARIABLE, index + VARIABLE.length());
                    //skip digits
                    if (Character.isDigit(layoutGameXmlAsString.charAt(index + VARIABLE.length()))) {
                        //skip GObject
                    } else if (index >= 1 && layoutGameXmlAsString.charAt(index - 1) == '.') {
                        //skip graphics
                    } else if (layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'g') {
                        //skip max_scale
                        //} else if(layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'm' && layoutGameXmlAsString.charAt(index + VARIABLE.length() + 1) == 'a') {
                        //skip angle
                        //} else if(layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'a') {
                        //skip movement_angle
                        //} else if(layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'm' && layoutGameXmlAsString.charAt(index + VARIABLE.length() + 1) == 'o') {
                        //opacity
                        //} else if(layoutGameXmlAsString.charAt(index + VARIABLE.length()) == 'o') {
                    } else {
                        stringMaker.delete(0, stringMaker.length());
                        layoutGameXmlAsString = stringMaker.append(layoutGameXmlAsString.substring(0, index + VARIABLE.length())).append(GLOBALS).append(layoutGameXmlAsString.substring(index + VARIABLE.length())).toString();
                    }
                }
            }

            final int layoutGameXmlReplaceTotal = LAYOUT_GAME_XML_REPLACE_FIND_ARRAY.length;
            for (int index = 0; index < layoutGameXmlReplaceTotal; index++) {
                final Replace replace = new Replace(LAYOUT_GAME_XML_REPLACE_FIND_ARRAY[index], LAYOUT_GAME_XML_REPLACE_WITH_ARRAY[index]);
                layoutGameXmlAsString = replace.all(layoutGameXmlAsString);
            }

            //Add this before all method calls here
            gameXmlAsString = this.addThisToGDUtilLocalCalls(gameXmlAsString, stringMaker);
            layoutGameXmlAsString = this.addThisToGDUtilLocalCalls(layoutGameXmlAsString, stringMaker);

            final String gameXmlAsString2 = gameXmlAsString;
            final String layoutGameXmlAsString2 = layoutGameXmlAsString;

            final Runnable runnable = new Runnable() {
                public void run() {
                    try {
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateXMLAndGlobals(gameXmlAsString2, finished);
                        System.out.println(new StringMaker().append(GENERATE_XML_AND_GLOBALS).append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[1] = true;
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable).start();

            final Runnable runnable2a = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateLayouts(startIndex, layoutTotal, gameXmlAsString2, layoutGameXmlAsString2, stringMaker);
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(GENERATE_LAYOUTS).append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[2] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable2a).start();

            final Runnable runnable2b = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateCreateInstances(startIndex, layoutTotal, gameXmlAsString2, layoutGameXmlAsString2, gdGameInfo, new StringMaker());
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(GENERATE_CREATE_INSTANCES).append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[3] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable2b).start();

            final Runnable runnable2c = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateExternalLinkLayouts(startIndex, layoutTotal, gameXmlAsString2, layoutGameXmlAsString2, gdGameInfo, new StringMaker());
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(GENERATE_EXTERNAL_LINK_LAYOUTS).append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[4] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable2c).start();

            final Runnable runnable2d = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateExternalCreateInstances(startIndex, layoutTotal, gameXmlAsString2, layoutGameXmlAsString2, gdGameInfo, new StringMaker());
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(GENERATE_EXTERNAL_CREATE_INSTANCES).append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[5] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable2d).start();
            
            final Runnable runnable3 = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateActionGDNodes(gameXmlAsString2, layoutGameXmlAsString2, layoutTotal, new StringMaker());
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(GENERATE_ACTION_GDNODES).append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[6] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable3).start();

            final Runnable runnable4 = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateBuiltInGDNodes(gameXmlAsString2, layoutGameXmlAsString2, layoutTotal, new StringMaker());
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(GENERATE_BUILT_IN_GDNODES).append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[7] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable4).start();

            final Runnable runnable5 = new Runnable() {
                public void run() {
                    try {
                        final StringMaker stringMaker = new StringMaker();
                        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
                        generateResourcesLoadersSetup(startIndex, layoutTotal, gameXmlAsString2, new StringMaker());
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(GENERATE_RESOURCES_LOADERS_SETUP).append(ELAPSED_TIME).appendlong(timeDelayHelper.getElapsedTNT()).toString());
                        finished[8] = true;
                        stringMaker.delete(0, stringMaker.length());
                        System.out.println(stringMaker.append(CURRENT_STATE_ELAPSED_TIME).append(BooleanUtil.getInstance().toStringFromBooleanArray(finished)).toString());
                    } catch (Exception e) {
                        logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
                        System.exit(1);
                    }
                }
            };

            new Thread(runnable5).start();

        } catch (Exception e) {
            this.logUtil.put(this.GAME_XML_NOT_FORMATTED, this, this.commonStrings.PROCESS, e);
        }

    }

    public static void main(String[] args) throws Exception {
        DomDocumentHelper.init();
        GDPaths.init(args);

        //Generate Layout 1
        final boolean[] finished = new boolean[6];
        final GDGameInfo gdGameInfo = new GDGenerateGDGameInfo().process();
        new GDLayoutsToAllBinaryLayoutGenerator().process(1, gdGameInfo, finished);

        //new GDLayoutsToAllBinaryLayoutGenerator().process(0, gdGameInfo);
    }

}
