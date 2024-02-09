<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/indexof.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/replace.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/reverse.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/split.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDGlobalCalls.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDAction.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeId.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassProperty.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAssignGroups.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAtIndex.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyActions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyConditions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObject.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventWithOnceCondition.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventPaint.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventLogicConstruction.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventProcess.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">
        //game
        
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            //layouts=<xsl:value-of select="name" /> position=<xsl:value-of select="position()" />-1=<xsl:value-of select="$layoutIndex" />

            <xsl:if test="number($layoutIndex) =
                <GD_CURRENT_INDEX>" >
                <!-- Android images assets need to be enlarged if they are not setup to be inside the cirle area needed -->
                <xsl:variable name="enlargeTheImageBackgroundForRotation" >true</xsl:variable>
                <xsl:variable name="layoutName" select="name" />
                <xsl:variable name="objectsGroupsAsString" >,<xsl:for-each select="objectsGroups" ><xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="/game/objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each>,<xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="externalEventsCreateActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="externalEventActionModVarSceneAsString" >,<xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="variables" ><xsl:for-each select="variables" ><xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />
                //externalEventActionModVarSceneAsString=<xsl:value-of select="$externalEventActionModVarSceneAsString" />
                //variables=<xsl:value-of select="$variables" />

                package org.allbinary.game.canvas;

                import javax.microedition.lcdui.Font;
                import javax.microedition.lcdui.Graphics;

                import org.json.me.JSONObject;
                import org.json.me.JSONTokener;

                import org.allbinary.animation.text.CustomTextAnimation;
                import org.allbinary.game.identification.Group;
                import org.allbinary.game.identification.GroupFactory;
                import org.allbinary.game.input.GameInputProcessor;
                import org.allbinary.game.input.InputFactory;
                import org.allbinary.game.layer.GDGameLayerStrings;
                import org.allbinary.game.layer.GDGameLayer;
                import org.allbinary.game.layer.special.GDConditionWithGroupActions;
                import org.allbinary.game.layout.GDNode;
                import org.allbinary.game.layout.GDObject;
                import org.allbinary.game.layout.behavior.DestroyOutsideBehavior;
                import org.allbinary.game.layout.behavior.GDBehavior;
                import org.allbinary.game.rand.MyRandomFactory;
                import org.allbinary.graphics.DisplayUtil;
                import org.allbinary.graphics.GPoint;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
                import org.allbinary.input.motion.gesture.MotionGestureInput;
                import org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener;
                import org.allbinary.layer.AllBinaryLayer;
                import org.allbinary.layer.event.LayerManagerEvent;
                import org.allbinary.layer.event.LayerManagerEventHandler;
                import org.allbinary.layer.event.LayerManagerEventListener;
                import org.allbinary.logic.string.StringUtil;
                import org.allbinary.logic.string.CommonStrings;
                import org.allbinary.logic.string.StringMaker;
                import org.allbinary.logic.util.event.EventListenerInterface;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.media.audio.Sound;
                import org.allbinary.time.TimeDelayHelper;
                import org.allbinary.util.ArrayUtil;
                import org.allbinary.util.BasicArrayList;

                //LayoutGlobals name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals extends GDSceneGlobals
                {

                    private static final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals instance = 
                        new GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals();

                    public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals getInstanceOrCreate()
                    {
                        return instance;
                    }

                    public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals getInstance()
                    {
                        return instance;
                    }

                        private final CommonStrings commonStrings = CommonStrings.getInstance();
                        private final ArrayUtil arrayUtil = ArrayUtil.getInstance();
                        private final GroupFactory groupFactory = GroupFactory.getInstance();
                        private final GameTickDisplayInfoSingleton gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
                        private final PointFactory pointFactory = PointFactory.getInstance();
                        
                        private final GDGameLayerStrings gameLayerStrings = GDGameLayerStrings.getInstance();
                        
                        public final String PROCESS_RELEASE = "processReleased";
                        
                        public final BasicArrayList gdNodeWithRunnableList = new BasicArrayList();

public class GDStructure {

    public int Size = -1;

}                    
                                                            
                    //variablesStructures - START
                    <xsl:call-template name="variablesStructures" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //variablesStructures - END
                                        
                        <xsl:for-each select="../externalEvents" >
                            <xsl:if test="$layoutName = associatedLayout" >
                        public GDNode <xsl:value-of select="name" />GDNode = null;
                            </xsl:if>
                        </xsl:for-each>
                                                
                        <xsl:variable name="objectsWithOnceCondition" ><xsl:call-template name="gdNodeToOnceList" ><xsl:with-param name="iteration" >0</xsl:with-param></xsl:call-template></xsl:variable>
                        //objectsWithOnceCondition=<xsl:value-of select="$objectsWithOnceCondition" />
                        <xsl:for-each select="objects" >
                            <xsl:if test="contains($objectsWithOnceCondition, name/text())" >
                        public final BasicArrayList <xsl:value-of select="name/text()" />OnceGDNodeList = new BasicArrayList();
                            </xsl:if>
                        </xsl:for-each>

                    
                        public final Graphics graphics = new Graphics();
                        //public final BasicArrayList ZERO_GD_OBJECT = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                        
                    //objectsGroups - START
                    <xsl:for-each select="objectsGroups" >
                        public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_GROUPS_NAME = "<xsl:value-of select="name" />";
                        public final Group <xsl:value-of select="name" />GroupInterface = this.groupFactory.getNextGroup(this.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_OBJECT_GROUPS_NAME);
                        //public final BasicArrayList <xsl:value-of select="name" />GDObjectListOfList = new BasicArrayList();
                        public final BasicArrayList <xsl:value-of select="name" />GDGameLayerListOfList = new BasicArrayList();
                        public final BasicArrayList <xsl:value-of select="name" />GDGameLayerRemoveListOfList = new BasicArrayList();
                        public final BasicArrayList <xsl:value-of select="name" />CacheGDGameLayerListOfList = new BasicArrayList();
                        public final BasicArrayList <xsl:value-of select="name" />GDConditionWithGroupActionsList = new BasicArrayList();
                        <xsl:for-each select="objects" >
                        //public final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" />";
                        //public final Group <xsl:value-of select="name" />GroupInterface;
                        </xsl:for-each>
                    </xsl:for-each>
                    //objectsGroups - END

<!--
                    //instances class properties - START                    
                    <xsl:for-each select="instances" >
                        //name=<xsl:value-of select="name" /> layout=<xsl:value-of select="layer" /><xsl:text>&#10;</xsl:text>
                        <xsl:variable name="initialVariablesValue" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="initialVariables/value" /></xsl:with-param><xsl:with-param name="find" >-</xsl:with-param><xsl:with-param name="replacementText" >Neg</xsl:with-param></xsl:call-template></xsl:variable>

                        //public final BasicArrayList <xsl:value-of select="name" />GDObjectList<xsl:value-of select="$initialVariablesValue" /> = new BasicArrayList();
                        <xsl:variable name="name" select="name" />
                        <xsl:variable name="notTextObject" ><xsl:for-each select="../objects" ><xsl:if test="$name = name" ><xsl:if test="type != 'TextObject::Text'" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($notTextObject, 'found')" >
                        public GDGameLayer <xsl:value-of select="name" />GDGameLayer;
                        </xsl:if>
                        public Rectangle <xsl:value-of select="name" />Rectangle<xsl:value-of select="$initialVariablesValue" /> = null;

                    </xsl:for-each>
                    //instances class properties - END
-->

                    //objects class properties - START                    
                    <xsl:for-each select="objects" >
                        //name=<xsl:value-of select="name" /> layout=<xsl:value-of select="layer" /><xsl:text>&#10;</xsl:text>
                        <xsl:variable name="initialVariablesValue" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="initialVariables/value" /></xsl:with-param><xsl:with-param name="find" >-</xsl:with-param><xsl:with-param name="replacementText" >Neg</xsl:with-param></xsl:call-template></xsl:variable>

                        //public final BasicArrayList <xsl:value-of select="name" />GDObjectList<xsl:value-of select="$initialVariablesValue" /> = new BasicArrayList();
                        public final BasicArrayList <xsl:value-of select="name" />GDGameLayerList<xsl:value-of select="$initialVariablesValue" /> = new BasicArrayList();
                        public final BasicArrayList <xsl:value-of select="name" />RemoveList<xsl:value-of select="$initialVariablesValue" /> = new BasicArrayList();
                        public final BasicArrayList <xsl:value-of select="name" />RectangleList<xsl:value-of select="$initialVariablesValue" /> = new BasicArrayList();

                        <xsl:for-each select="animations" >
                            <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(name, '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                            <xsl:if test="string-length($animationName)" >
                        public final String <xsl:value-of select="$animationName" /> = "<xsl:value-of select="name" />";
                            </xsl:if>
                        </xsl:for-each>

                    </xsl:for-each>
                    //objects class properties - END

                    <xsl:call-template name="externalEventsClassProperty" >
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
                        </xsl:with-param>
                    </xsl:call-template>

                    <xsl:call-template name="instancesCacheProperties" >
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
                        </xsl:with-param>
                    </xsl:call-template>

                    //more objects class properties - START
                    <xsl:call-template name="objectsClassProperty" >
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>
            private final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
            public final String PRIMITIVEDRAWING__DRAWER = gameGlobals.PRIMITIVEDRAWING__DRAWER;
            public final String SPRITE = gameGlobals.SPRITE;
            public final String TILEMAP__TILEMAP = gameGlobals.TILEMAP__TILEMAP;
            public final String TILEMAP__COLLISIONMASK = gameGlobals.TILEMAP__COLLISIONMASK;
                    <xsl:text>&#10;</xsl:text>
                    //more objects class properties - END
                    <xsl:text>&#10;</xsl:text>

                    <xsl:variable name="hasScaleVariable" >
                        <xsl:for-each select="variables" >
                            <xsl:if test="name = 'scale'" >found</xsl:if>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:if test="not(contains($hasScaleVariable, 'found'))" >
                    //variables - default - START
                    public int scale;
                    public int scaleNominator;
                    public int scaleDenominator;
                    //variables - default - END
                    </xsl:if>

                    //variables - external - ModVarScene - START
                    <xsl:for-each select="../externalEvents" >
                    <xsl:call-template name="actionsWithUndefinedVariables" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        <xsl:with-param name="variables" >
                            <xsl:value-of select="$variables" />
                        </xsl:with-param>
                    </xsl:call-template>
                    </xsl:for-each>
                    //variables - external - ModVarScene - END
                    <xsl:text>&#10;</xsl:text>

                    //variables - ModVarScene - START
                    <xsl:call-template name="actionsWithUndefinedVariables" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        <xsl:with-param name="variables" >
                            <xsl:value-of select="$variables" />
                        </xsl:with-param>
                    </xsl:call-template>    
                    //variables - ModVarScene - END
                    <xsl:text>&#10;</xsl:text>

                    //variables - START
                    <xsl:call-template name="variables" />
                    //variables - END

                    //eventsClassProperty - START
                    <xsl:call-template name="eventsClassPropertyConditions" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="externalEventActionModVarSceneAsString" >
                            <xsl:value-of select="$externalEventActionModVarSceneAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsClassProperty - END

                    <xsl:variable name="foundMousePositionNeeded" >found</xsl:variable>
                        <xsl:if test="contains($foundMousePositionNeeded, 'found')" >
                    public BaseMotionGestureEventListener eventListenerInterfaceLastPoint;
                    public GDNode lastPointGDNode;
                            
                    public int inUseMotionEventListIndex = 0;
                    public int processingMotionEventListIndex = 0;
                    public BasicArrayList[] motionEventListOfList = {
                        new BasicArrayList(),
                        new BasicArrayList()
                    };
                    //public GDNode currentButtonGDNodePressed = null;
                    MotionGestureInput lastMotionGestureInput = null;
                    </xsl:if>

                    //eventsClassPropertyActions - START
<!--                    
                    <xsl:call-template name="eventsClassPropertyActions" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
-->
                    //eventsClassPropertyActions - END
                    
                    <xsl:call-template name="objectsAssignGroup" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>

                    <xsl:call-template name="layerManagerEventListenerList" >
                    </xsl:call-template>    
                    <xsl:text>&#10;</xsl:text>

                    private final LayerManagerEventListener layerManagerEventListener;
                    
                    public long timeDelta;
                    public long startTime = System.currentTimeMillis();
                    public long lastStartTime = startTime;
                    //public final String FAKE_COLLISION_NODE_STRING = "FAKE_COLLISION_NODE_ID";
                 
                    private GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals() {
                    
                    //objectsGroups - START
                    <xsl:for-each select="objectsGroups" >
                        <xsl:variable name="name" ><xsl:value-of select="name" /></xsl:variable>
                        <xsl:for-each select="objects" >
                            //<xsl:value-of select="$name" />GDObjectListOfList.add(<xsl:value-of select="name" />GDObjectList);
                            <xsl:value-of select="$name" />GDGameLayerListOfList.add(<xsl:value-of select="name" />GDGameLayerList);
                            <xsl:value-of select="$name" />GDGameLayerRemoveListOfList.add(<xsl:value-of select="name" />GDGameLayerList);
                            <xsl:value-of select="$name" />CacheGDGameLayerListOfList.add(<xsl:value-of select="name" />CacheGDGameLayerList);
                            //<xsl:value-of select="$name" />GDConditionWithGroupActionsList.add(<xsl:value-of select="name" />GDConditionWithGroupActions);
                        </xsl:for-each>
                    </xsl:for-each>
                    //objectsGroups - END
                                    
                    //eventsClassPropertyArrayActions - START
                    <xsl:call-template name="eventsClassPropertyArrayActions" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsClassPropertyArrayActions - END
                        
                        final LayerManagerEventHandler layerManagerEventHandler = LayerManagerEventHandler.getInstance();
                        
                        layerManagerEventListener = new LayerManagerEventListener() {

                            public void onDeleteLayerManagerEvent(final LayerManagerEvent layerManagerEvent) throws Exception
                            {
                                final AllBinaryLayer layerInterface = layerManagerEvent.getLayerInterface();
                                
                    <xsl:call-template name="layerManagerEventListenerRemove" >
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>
                            }

                        };

                        layerManagerEventHandler.addListener(layerManagerEventListener);
                        
                    }

                    public int SceneWindowWidth() {
                        return gameTickDisplayInfoSingleton.getLastWidth();
                    }

                    public int SceneWindowHeight() {
                        return gameTickDisplayInfoSingleton.getLastHeight();
                    }

                    public int Random(final int range) {
                        return MyRandomFactory.getInstance().getAbsoluteNextInt(range + 1);
                    }

                    public float Random(final double range) {
                        return ((float) MyRandomFactory.getInstance().getAbsoluteNextInt((int) (range * 1000))) / 1000;
                    }
                    
                    public int Variable(final int value) {
                        return value;
                    }

                    public double Variable(final double value) {
                        return value;
                    }

                    public String Variable(final String value) {
                        return value;
                    }

                    public int VariableString(final int value) {
                        return value;
                    }

                    public String VariableString(final String string) {
                        return string;
                    }

                    public int VariableChildCount(final String[] array) {
                        return array.length;
                    }

                    public int VariableChildCount(final int[] array) {
                        return array.length;
                    }

                    public int MouseX(String string, int value) {
                        return value;
                    }

                    public int MouseY(String string, int value) {
                        return value;
                    }
                    
                    public String ToString(final int value) {
                        //this.primitiveLongUtil = new PrimitiveLongUtil(max + 1);
                        return Integer.toString(value);
                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
