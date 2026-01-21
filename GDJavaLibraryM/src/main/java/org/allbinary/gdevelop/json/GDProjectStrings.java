/*
 * GDevelop to AllBinary Core
 * Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights
 * reserved. This project is released under the MIT License.
 */

package org.allbinary.gdevelop.json;

/**
 *
 * @author User
 */
public class GDProjectStrings
{
    private static final GDProjectStrings instance = new GDProjectStrings();
    
    /**
     * @return the instance
     */
    public static GDProjectStrings getInstance()
    {
        return instance;
    }

    public final String GAME = "game";
    
    public final String GD_VERSION = "gdVersion";
    public final String MAJOR = "major";
    public final String MINOR = "minor";
    public final String BUILD = "build";
    public final String REVISION = "revision";
    
    public final String PROPERTIES = "properties";
    public final String NAME = "name";
    public final String VERSION = "version";
    public final String WINDOW_WIDTH = "windowWidth";
    public final String WINDOW_HEIGHT = "windowHeight";
    public final String MAX_FPS = "maxFPS";
    public final String MIN_FPS = "minFPS";
    public final String VERTICAL_SYNC = "verticalSync";
    public final String SCALE_MODE = "scaleMode";
    public final String ADAPT_GAME_RESOLUTION_AT_RUNTIME = "adaptGameResolutionAtRuntime";
    public final String SIZE_ON_STARTUP_MODE = "sizeOnStartupMode";
    public final String PROJECT_UUID = "projectUuid";
    
    public final String AUTHOR = "author";
    public final String PACKAGE_NAME = "packageName";
    public final String ORIENTATION = "orientation";
    
    public final String FOLDER_PROJECT = "folderProject";
    public final String LATEST_COMPILATION_DIRECTORY = "latestCompilationDirectory";
    public final String PLATFORM_SPECIFIC_ASSETS = "platformSpecificAssets";
    public final String LOADING_SCREEN = "loadingScreen";
    public final String USE_EXTERNAL_SOURCE_FILES = "useExternalSourceFiles";
    public final String USE_DEPRECATED_ZERO_AS_DEFAULT_Z_ORDER = "useDeprecatedZeroAsDefaultZOrder";
    public final String EXTENSION_PROPERTIES = "extensionProperties";
    public final String AD_MOB_APP_ID = "adMobAppId";
    public final String CURRENT_PLATFORM = "currentPlatform";
    public final String PLATFORMS = "platforms";
    public final String OBJECT_GROUPS = "objectsGroups";
    public final String RESOURCES = "resources";
    public final String OBJECTS = "objects";
    public final String VARIABLES = "variables";
    //Scenes
    public final String LAYOUTS = "layouts";
    public final String EXTERNAL_EVENTS = "externalEvents";
    public final String EVENTS_FUNCTIONS_EXTENSIONS = "eventsFunctionsExtensions";
    public final String EXTERNAL_LAYOUTS = "externalLayouts";
    public final String EXTERNAL_SOURCE_FILES = "externalSourceFiles";
    
    public final String ACTIONS = "actions";
    public final String TYPE = "type";
    //public final String INVERTED = "inverted";
    public final String VALUE = "value";    
    public final String PARAMETERS = "parameters";
    
    public final String PLAY_SOUND = "PlaySound";
    public final String PLAY_SOUND_CANAL = "PlaySoundCanal";
        
    public final String DEFAULT = "default";
    
    public final String TAGS = "tags";

    public final String EFFECTS = "effects";
    public final String BEHAVIORS = "behaviors";
    
    public final String COLOR = "color";
    public final String R = "r";
    public final String G = "g";
    public final String G_V = "v";
    public final String B = "b";
    public final String TEXT_R = "textR";
    public final String TEXT_G = "textG";
    public final String TEXT_B = "textB";
    public final String COLOR_R = "colorR";
    public final String COLOR_G = "colorG";
    public final String COLOR_B = "colorB";
    
    public final String COMMENT = "comment";
    public final String COMMENT2 = "comment2";
    
    public final String TITLE = "title";
    public final String MANGLED_NAME = "mangledName";
    
    public final String GRID = "grid";
    public final String GRID_ALPHA = "gridAlpha";
    public final String GRID_COLOR = "gridColor";
    //public final String GRID_B = "gridB";
    //public final String GRID_G = "gridG";
    //public final String GRID_R = "gridR";    
    public final String GRID_HEIGHT = "gridHeight";
    public final String GRID_OFFSET_X = "gridOffsetX";
    public final String GRID_OFFSET_Y = "gridOffsetY";
    public final String GRID_TYPE = "gridType";
    public final String GRID_WIDTH = "gridWidth";
    public final String SNAP = "snap";
    public final String WINDOW_MASK = "windowMask";
    public final String ZOOM_FACTOR = "zoomFactor";

    //public final String OGL_FOV = "oglFOV";
    //public final String OGL_Z_NEAR = "oglZNear";
    //public final String OGL_Z_FAR = "oglZFar";
    public final String STANDARD_SORT_METHOD = "standardSortMethod";
    public final String STOP_SOUNDS_ON_STARTUP = "stopSoundsOnStartup";
    public final String DISABLE_INPUT_WHEN_NOT_FOCUSED = "disableInputWhenNotFocused";
    
    public final String EDITOR_SETTINGS = "uiSettings";
    public final String EVENTS = "events";
    public final String INSTANCES = "instances";
    public final String LAYERS = "layers";
    public final String VISIBILITY = "visibility";
    public final String IS_LIGHTING_LAYER = "isLightingLayer";
    public final String FOLLOW_BASE_LAYER_CAMERA = "followBaseLayerCamera";
    
    public final String AMBIENT_LIGHT_COLOR_R = "ambientLightColorR";
    public final String AMBIENT_LIGHT_COLOR_G = "ambientLightColorG";
    public final String AMBIENT_LIGHT_COLOR_B = "ambientLightColorB";

    public final String CAMERAS = "cameras";
    public final String DEFAULT_SIZE = "defaultSize";
    public final String DEFAULT_VIEWPORT = "defaultViewport";
    
    public final String WIDTH = "width";
    public final String HEIGHT = "height";
    
    public final String VIEWPORT_LEFT = "viewportLeft";
    public final String VIEWPORT_TOP = "viewportTop";
    public final String VIEWPORT_RIGHT = "viewportRight";
    public final String VIEWPORT_BOTTOM = "viewportBottom";
    
    public final String BEHAVIORS_SHARED_DATA = "behaviorsSharedData";
    //public final String DISABLED = "disabled";
    //public final String FOLDED = "folded";
    
    public final String X = "x";
    public final String Y = "y";
    public final String ANGLE = "angle";
    public final String Z_ORDER = "zOrder";
    public final String LAYER = "layer";
    
    public final String CUSTOM_SIZE = "customSize";
    //public final String LOCKED = "locked";
    public final String PERSISTED_UUID = "persistentUuid";
    public final String INITIAL_VARIABLE = "initialVariables";
    public final String NUMBER_PROPERTIES = "numberProperties";
    public final String STRING_PROPERTIES = "stringProperties";
    public final String CHILDREN = "children";
    
    public final String ITERABLE_VARIABLE_NAME = "iterableVariableName";
    public final String VALUE_ITERATOR_VARIABLE_NAME = "valueIteratorVariableName";
    public final String KEY_ITERATOR_VARIABLE_NAME = "keyIteratorVariableName";

    public final String CONDITIIONS = "conditions";
    //public final String SUB_INSTRUCTIONS = "subInstructions";
    
    public final String SOURCE = "source";
    public final String CREATION_TIME = "creationTime";
    public final String REPEAT_EXPRESSION = "repeatExpression";
    
    public final String TARGET = "target";
    public final String INCLUDE = "include";
    public final String INCLUDE_CONFIG = "includeConfig";
    public final String EVENTS_GROUP = "eventsGroup";
    public final String INFINITE_LOOP_WARNING = "infiniteLoopWarning";
    public final String WHILE_CONDITIONS = "whileConditions";
    public final String EFFECT_TYPE = "effectType";
    public final String DOUBLE_PARAMETERS = "doubleParameters";
    public final String STRING_PARAMETERS = "stringParameters";
    public final String BOOLEAN_PARAMETERS = "booleanParameters";
    public final String ASSOCIATED_LAYOUT = "associatedLayout";
    public final String RESOURCE_FOLDERS = "resourceFolders";
    
    public final String METADATA = "metadata";
    public final String ORIGIN = "origin";
    public final String IDENTIFIER = "identifier";
    public final String USER_ADDED = "userAdded";
    
    public final String FILE = "file";
    public final String DISABLE_PRELOAD = "disablePreload";
    
    public final String PRELOAD_AS_MUSIC = "preloadAsMusic";
    public final String PRELOAD_AS_SOUND = "preloadAsSound";
    
    public final String ALWAYS_LOADED = "alwaysLoaded";
    public final String SMOOTHED = "smoothed";
    
    public final String TEXTURE = "texture";
    public final String ANIMATIONS = "animations";
    public final String USE_MULTIPLE_DIRECTIONS = "useMultipleDirections";
    
    public final String CONTENT = "content";
    public final String TILEMAP_JSON_FILE = "tilemapJsonFile";
    public final String TILESET_JSON_FILE = "tilesetJsonFile";
    public final String TILEMAP_ATLAS_IMAGE = "tilemapAtlasImage";
    public final String DISPLAY_MODE = "displayMode";
    public final String LAYER_INDEX = "layerIndex";
    public final String LEVEL_INDEX = "levelIndex";
    public final String ANIMATION_SPEED_SCALE = "animationSpeedScale";
    public final String ANIMATION_FPS = "animationFps";
    
    public final String DIRECTIONS = "directions";
    
    public final String LOOPING = "looping";
    public final String TIME_BETWEEN_FRAMES = "timeBetweenFrames";
    public final String HAS_CUSTOM_COLLISION_MASK = "hasCustomCollisionMask";
    public final String IMAGE = "image";

    public final String POINTS = "points";
    public final String ORIGIN_POINTS = "originPoint";
    public final String CENTER_POINTS = "centerPoint";
    public final String CUSTOM_COLLISION_MASK = "customCollisionMask";

    public final String SPRITE = "Sprite";
    public final String SPRITES = "sprites";
    
    public final String AUTOMATIC = "automatic";
    
}
