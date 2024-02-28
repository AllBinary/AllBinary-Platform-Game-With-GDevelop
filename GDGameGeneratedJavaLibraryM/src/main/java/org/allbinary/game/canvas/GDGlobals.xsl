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
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDScaling.xsl" />
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

                <!-- Android images assets need to be enlarged if they are not setup to be inside the cirle area needed -->
                <xsl:variable name="enlargeTheImageBackgroundForRotation" >true</xsl:variable>
                <xsl:variable name="gameName" select="properties/name" />
                <xsl:variable name="objectsGroupsAsString" >,<xsl:for-each select="objectsGroups" ><xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="/game/objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each>,<xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="externalEventsCreateActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="gameName" ><xsl:value-of select="$gameName" /></xsl:with-param></xsl:call-template><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="variables" ><xsl:for-each select="variables" ><xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />
                //variables=<xsl:value-of select="$variables" />

                package org.allbinary.game.canvas;

                import javax.microedition.lcdui.Font;
                import javax.microedition.lcdui.Graphics;

                import org.json.me.JSONObject;
                import org.json.me.JSONTokener;

                import org.allbinary.AndroidUtil;
                import org.allbinary.animation.text.CustomTextAnimation;
                import org.allbinary.game.identification.Group;
                import org.allbinary.game.identification.GroupFactory;
                import org.allbinary.game.input.GameInputProcessor;
                import org.allbinary.game.input.InputFactory;
                import org.allbinary.game.layer.GDGameLayerStrings;
                import org.allbinary.game.layer.GDGameLayer;
                import org.allbinary.game.layer.special.GDConditionWithGroupActions;
                import org.allbinary.game.layout.GDNode;
                import org.allbinary.game.layer.special.TempGameLayerUtil;
                import org.allbinary.game.layout.GDObject;
                import org.allbinary.game.layout.behavior.DestroyOutsideBehavior;
                import org.allbinary.game.layout.behavior.GDBehavior;
                import org.allbinary.game.rand.MyRandomFactory;
                import org.allbinary.game.score.HighScoresHelper2;
                import org.allbinary.game.score.HighScoresHelperBase;
                import org.allbinary.graphics.color.BasicColor;
                import org.allbinary.graphics.color.SmallBasicColorCacheFactory;
                import org.allbinary.graphics.color.BasicColorUtil;
                import org.allbinary.graphics.DisplayUtil;
                import org.allbinary.graphics.GPoint;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
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

                //GameGlobals name=<xsl:value-of select="properties/name" />
                public class GDGameGlobals extends GDGlobals
                {

                    private static final GDGameGlobals instance = new GDGameGlobals();
<!--                
                    private static GDGameGlobals instance;

                    public static GDGameGlobals create()
                    {
                        instance = new GDGameGlobals();
                        return instance;
                    }
-->

                    public static GDGameGlobals getInstance()
                    {
                        return instance;
                    }

                        private final BasicColorUtil basicColorUtil = BasicColorUtil.getInstance();
                        private final SmallBasicColorCacheFactory smallBasicColorCacheFactory = SmallBasicColorCacheFactory.getInstance();
                                          
                    private final GDGameLayerStrings gameLayerStrings = GDGameLayerStrings.getInstance();
                           
                    public final HighScoresHelperBase highScoresHelper = new HighScoresHelper2();

                        <xsl:variable name="objectsWithOnceCondition" ><xsl:call-template name="gdNodeToOnceList" ><xsl:with-param name="iteration" >0</xsl:with-param></xsl:call-template></xsl:variable>
                        //objectsWithOnceCondition=<xsl:value-of select="$objectsWithOnceCondition" />
                        <xsl:for-each select="objects" >
                            <xsl:if test="contains($objectsWithOnceCondition, name/text())" >
                        public final BasicArrayList <xsl:value-of select="name/text()" />OnceGDNodeList = new BasicArrayList();
                            </xsl:if>
                        </xsl:for-each>

                    //PrimitiveDrawing::FillColor - START
                        <xsl:for-each select="//actions[type/value = 'PrimitiveDrawing::FillColor']" >
                            
                            public BasicColor <xsl:for-each select="parameters" ><xsl:if test="position() = 2" >RGB_<xsl:value-of select="translate(translate(text(), '\&quot;', ''), ';', '_')" />_BASIC_COLOR</xsl:if></xsl:for-each> = smallBasicColorCacheFactory.getInstance(
                                basicColorUtil.get(255, 
                                <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="translate(translate(text(), '\&quot;', ''), ';', ',')" /></xsl:if></xsl:for-each>)
                                );
                                //"<xsl:for-each select="parameters" ><xsl:if test="position() = 2" >RGB_<xsl:value-of select="translate(translate(text(), '\&quot;', ''), ';', '_')" />_BASIC_COLOR</xsl:if></xsl:for-each>"
                        </xsl:for-each>
                    //PrimitiveDrawing::FillColor - END              

                    <xsl:for-each select="externalEvents" >
                        //Count - //ExternalEvents - START
                        <xsl:call-template name="generateIndexToNodeIdMapping2" >
                            <xsl:with-param name="totalRecursion" >0</xsl:with-param>
                        </xsl:call-template>
                        //Count - //ExternalEvents - END
                    </xsl:for-each>

                    <xsl:for-each select="layouts" >
                        //Count - //layouts - <xsl:value-of select="position()" /> - START
                        <xsl:call-template name="generateIndexToNodeIdMapping" >
                            <xsl:with-param name="totalRecursion" >0</xsl:with-param>
                        </xsl:call-template>
                        //Count - //layouts - <xsl:value-of select="position()" /> - END
                    </xsl:for-each>

                    <xsl:variable name="total" ><xsl:call-template name="generateGDNodeTotal" ></xsl:call-template></xsl:variable>
                        private final int MAX_NODES = <xsl:value-of select="$total" />;
                        public final GDNode[] nodeArray = new GDNode[MAX_NODES];

                        public final BasicArrayList[] channelSoundArray = new BasicArrayList[4];

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
                            <xsl:value-of select="$gameName" />
                        </xsl:with-param>
                    </xsl:call-template>

                    //more objects class properties - START
                    <xsl:call-template name="objectsClassProperty" >
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>
            public final String PRIMITIVEDRAWING__DRAWER = "PrimitiveDrawing::Drawer";
            public final String SPRITE = "Sprite";
            public final String TILEMAP__TILEMAP = "TileMap::TileMap";
            public final String TILEMAP__COLLISIONMASK = "TileMap::CollisionMask";
                    <xsl:text>&#10;</xsl:text>
                    //more objects class properties - END
                    <xsl:text>&#10;</xsl:text>

                    <xsl:variable name="foundMousePositionNeeded" >found</xsl:variable>
                        <xsl:if test="contains($foundMousePositionNeeded, 'found')" >
                    public BaseMotionGestureEventListener eventListenerInterfaceLastPoint;
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
                            Global
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>

                    <xsl:call-template name="layerManagerEventListenerList" >
                    </xsl:call-template>    
                    <xsl:text>&#10;</xsl:text>


                    //variables - ModVarGlobal - START
                    <xsl:call-template name="actionsWithUndefinedGlobalVariables" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        <xsl:with-param name="variables" >
                            <xsl:value-of select="$variables" />
                        </xsl:with-param>
                    </xsl:call-template>    
                    //variables - ModVarGlobal - END
                    <xsl:text>&#10;</xsl:text>

                    //variables - layouts - ModVarGlobal - START
                    <xsl:for-each select="layouts" >
                    <xsl:call-template name="actionsWithUndefinedGlobalVariables" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        <xsl:with-param name="variables" >
                            <xsl:value-of select="$variables" />
                        </xsl:with-param>
                    </xsl:call-template>
                    </xsl:for-each>
                    //variables - layouts - ModVarGlobal - END
                    <xsl:text>&#10;</xsl:text>

                    //variables - START
                    <xsl:call-template name="variables" />
                    //variables - END

                    <xsl:text>&#10;</xsl:text>
                    public final GDGameLayer[] tempGameLayerArray = new GDGameLayer[<xsl:value-of select="count(//objectsGroups) + count(//objects) + 1" />];
                    public final int[] creationIndex = new int[<xsl:value-of select="count(//objectsGroups) + count(//objects) + 1" />];

                    private final LayerManagerEventListener layerManagerEventListener;
                                     
                    private GDGameGlobals() {
                    
                        LogUtil.put(LogFactory.getInstance(commonStrings.CONSTRUCTOR, this, commonStrings.CONSTRUCTOR));

                        final int size = channelSoundArray.length;
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            channelSoundArray[index] = new BasicArrayList();
                        }

                            <xsl:call-template name="scale" >
                                <xsl:with-param name="layoutIndex" >
                                    Global
                                </xsl:with-param>
                                <xsl:with-param name="layoutName" >
                                    Global
                                </xsl:with-param>
                            </xsl:call-template>
                                        
                        <xsl:for-each select="variables" >
                            <xsl:if test="type = 'boolean'" >
                                <xsl:if test="name = 'RandomDungeon'" >
        this.RandomDungeon = true;

        final CommonStrings commonStrings = CommonStrings.getInstance();
        final StringMaker stringMaker = new StringMaker();
        LogUtil.put(LogFactory.getInstance(stringMaker.append("PlatformerMap: RandomDungeon: ").append(this.RandomDungeon).toString(), this, commonStrings.PROCESS));

                                </xsl:if>
                            </xsl:if>
                        </xsl:for-each>
                                        
                    //objectsGroups - START
                    <xsl:for-each select="objectsGroups" >
                        <xsl:variable name="name" ><xsl:value-of select="name" /></xsl:variable>
                        <xsl:for-each select="objects" >
                            //<xsl:value-of select="$name" />GDObjectListOfList.add(<xsl:value-of select="name" />GDObjectList);
                            <xsl:value-of select="$name" />GDGameLayerListOfList.add(<xsl:value-of select="name" />GDGameLayerList);
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
                    
                    public void reset() {

                        //objects - all - Sprite, TileMap::CollisionMask, TileMap::TileMap, ParticleSystem::ParticleEmitter, PrimitiveDrawing::Drawer, TextObject::Text, TextInput::TextInputObject, TextEntryObject::TextEntry, PanelSpriteSlider::PanelSpriteSlider
            <xsl:for-each select="objects" >

                <xsl:variable name="initialVariablesValue" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="initialVariables/value" /></xsl:with-param><xsl:with-param name="find" >-</xsl:with-param><xsl:with-param name="replacementText" >Neg</xsl:with-param></xsl:call-template></xsl:variable>

                        //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>
                        //<xsl:value-of select="name" />GDObjectList<xsl:value-of select="$initialVariablesValue" />.clear();
                        <xsl:value-of select="name" />GDGameLayerList<xsl:value-of select="$initialVariablesValue" />.clear();
                        <xsl:value-of select="name" />RectangleList<xsl:value-of select="$initialVariablesValue" />.clear();

                        <xsl:value-of select="name" />CacheGDGameLayerList.clear();
                        <xsl:value-of select="name" />GDGameLayerDestroyedList.clear();

            </xsl:for-each>

                    }
                    
                    public String VariableString(final String string) {
                        return string;
                    }

                }
    </xsl:template>

</xsl:stylesheet>
