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
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDAction.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeId.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassProperty.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAssignGlobals.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAnimations.xsl" />
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
        <xsl:variable name="windowWidth" select="properties/windowWidth" />
        
        <xsl:for-each select="layouts" >
            //layouts=<xsl:value-of select="name" /> position=<xsl:value-of select="position()" />-1=<GD_CURRENT_INDEX>
            <xsl:variable name="layoutIndex" select="position() - 1" />

            <xsl:if test="number($layoutIndex) =
                <GD_CURRENT_INDEX>" >
                <!-- Android images assets need to be enlarged if they are not setup to be inside the cirle area needed -->
                <xsl:variable name="enlargeTheImageBackgroundForRotation" >true</xsl:variable>
                <xsl:variable name="layoutName" select="name" />
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="externalEventsCreateActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="externalEventActionModVarSceneAsString" >,<xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />
                //externalEventActionModVarSceneAsString=<xsl:value-of select="$externalEventActionModVarSceneAsString" />

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
                import org.allbinary.game.layer.GDGameLayer;
                import org.allbinary.game.layer.special.GDConditionWithGroupActions;
                import org.allbinary.game.layout.GDNode;
                import org.allbinary.game.layout.behavior.DestroyOutsideBehavior;
                import org.allbinary.game.layout.behavior.GDBehavior;
                import org.allbinary.game.rand.MyRandomFactory;
                import org.allbinary.graphics.GPoint;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.graphics.displayable.DisplayInfoSingleton;
                import org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener;
                import org.allbinary.layer.AllBinaryLayer;
                import org.allbinary.layer.event.LayerManagerEvent;
                import org.allbinary.layer.event.LayerManagerEventHandler;
                import org.allbinary.layer.event.LayerManagerEventListener;
                import org.allbinary.logic.basic.string.StringUtil;
                import org.allbinary.logic.basic.string.CommonStrings;
                import org.allbinary.logic.basic.string.StringMaker;
                import org.allbinary.logic.basic.util.event.EventListenerInterface;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.media.audio.Sound;
                import org.allbinary.time.TimeDelayHelper;
                import org.allbinary.util.ArrayUtil;
                import org.allbinary.util.BasicArrayList;

                //LayoutGlobals name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals extends GDGlobals
                {

                    private static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals instance;

                    public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals create()
                    {
                        instance = new GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals();
                        return instance;
                    }

                    public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals getInstance()
                    {
                        return instance;
                    }

                        private final ArrayUtil arrayUtil = ArrayUtil.getInstance();
                        private final GroupFactory groupFactory = GroupFactory.getInstance();
                        
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

                        //variables - START
                        <xsl:for-each select="variables" >
                            <xsl:if test="type = 'structure'" >
                        public final GDStructure<xsl:value-of select="name" /><xsl:text> </xsl:text><xsl:value-of select="name" /> = new GDStructure<xsl:value-of select="name" />();
                            </xsl:if>
                            <xsl:if test="type = 'string'" >
                                <xsl:if test="number(value) != value" >
                                    public String <xsl:value-of select="name" /> = <xsl:if test="value = ''" >StringUtil.getInstance().EMPTY_STRING</xsl:if><xsl:if test="value != ''" >"<xsl:value-of select="value" />"</xsl:if>;
                                </xsl:if>
                                <xsl:if test="number(value) = value" >
                        public int <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                            </xsl:if>
                            <xsl:if test="type = 'boolean'" >
                        public boolean <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>

                        </xsl:for-each>
                        //variables - END

                        <xsl:variable name="objectsWithOnceCondition" ><xsl:call-template name="gdNodeToOnceList" ><xsl:with-param name="iteration" >0</xsl:with-param></xsl:call-template></xsl:variable>
                        //objectsWithOnceCondition=<xsl:value-of select="$objectsWithOnceCondition" />
                        <xsl:for-each select="objects" >
                            <xsl:if test="contains($objectsWithOnceCondition, name/text())" >
                        public final BasicArrayList <xsl:value-of select="name/text()" />OnceGDNodeList = new BasicArrayList();
                            </xsl:if>
                        </xsl:for-each>

                    
                        public final Graphics graphics = new Graphics();
                        //public final BasicArrayList ZERO_GD_OBJECT = new BasicArrayList(this.arrayUtil.ZERO_OBJECT_ARRAY);
                        public final GDNode[] nodeArray = new GDNode[15000];
                        <!--
                        public final int FAKE_COLLISION_NODE_ID = 14999;
                        -->

                        public final BasicArrayList[] channelSoundArray = new BasicArrayList[4];

                    //objectsGroups - START
                    <xsl:for-each select="objectsGroups" >
                        public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template> = "<xsl:value-of select="name" />";
                        public final Group <xsl:value-of select="name" />GroupInterface = this.groupFactory.getNextGroup(this.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>);
                        public final BasicArrayList <xsl:value-of select="name" />GDGameLayerList = new BasicArrayList();
                        <xsl:for-each select="objects" >
                        //public final Group <xsl:value-of select="name" />GroupInterface;
                        </xsl:for-each>
                    </xsl:for-each>
                    //objectsGroups - END

<!--
                    //instances class properties - START                    
                    <xsl:for-each select="instances" >
                        //name=<xsl:value-of select="name" /> layout=<xsl:value-of select="layer" /><xsl:text>&#10;</xsl:text>
                        <xsl:variable name="initialVariablesValue" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="initialVariables/value" /></xsl:with-param><xsl:with-param name="find" >-</xsl:with-param><xsl:with-param name="replacementText" >Neg</xsl:with-param></xsl:call-template></xsl:variable>

                        public final BasicArrayList <xsl:value-of select="name" />GDObjectList<xsl:value-of select="$initialVariablesValue" /> = new BasicArrayList();
                        <xsl:variable name="name" select="name" />
                        <xsl:variable name="notTextObject" ><xsl:for-each select="../objects" ><xsl:if test="$name = name" ><xsl:if test="type != 'TextObject::Text'" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="layer != '' or contains($notTextObject, 'found')" >
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

                        public final BasicArrayList <xsl:value-of select="name" />GDObjectList<xsl:value-of select="$initialVariablesValue" /> = new BasicArrayList();
                        public final BasicArrayList <xsl:value-of select="name" />GDGameLayerList<xsl:value-of select="$initialVariablesValue" /> = new BasicArrayList();
                        public final BasicArrayList <xsl:value-of select="name" />RectangleList<xsl:value-of select="$initialVariablesValue" /> = new BasicArrayList();

                    </xsl:for-each>
                    //objects class properties - END

                    <xsl:call-template name="externalEventsClassProperty" >
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
                        </xsl:with-param>
                    </xsl:call-template>

                    <xsl:call-template name="objectsClassProperty" >
                        <xsl:with-param name="windowWidth" >
                            <xsl:value-of select="$windowWidth" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>

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
                    </xsl:if>

                    //eventsClassPropertyActions - START
                    <xsl:call-template name="eventsClassPropertyActions" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsClassPropertyActions - END
                    
                    <xsl:call-template name="objectsAssignGroup" >
                        <xsl:with-param name="enlargeTheImageBackgroundForRotation" >
                            <xsl:value-of select="$enlargeTheImageBackgroundForRotation" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="windowWidth" >
                            <xsl:value-of select="$windowWidth" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>

                    <xsl:call-template name="layerManagerEventListenerList" >
                        <xsl:with-param name="windowWidth" >
                            <xsl:value-of select="$windowWidth" />
                        </xsl:with-param>
                    </xsl:call-template>    
                    <xsl:text>&#10;</xsl:text>

                    private final LayerManagerEventListener layerManagerEventListener;
                    
                    public long timeDelta;
                    public long lastStartTime = Long.MIN_VALUE;
                    //public final String FAKE_COLLISION_NODE_STRING = "FAKE_COLLISION_NODE_ID";
                 
                    private GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals() {
                    

                    //eventsClassPropertyArrayActions - START
                    <xsl:call-template name="eventsClassPropertyArrayActions" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsClassPropertyArrayActions - END

                        final int size = channelSoundArray.length;
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            channelSoundArray[index] = new BasicArrayList();
                        }
                        
                        final LayerManagerEventHandler layerManagerEventHandler = LayerManagerEventHandler.getInstance();
                        
                        layerManagerEventListener = new LayerManagerEventListener() {

                            public void onDeleteLayerManagerEvent(final LayerManagerEvent layerManagerEvent) throws Exception
                            {
                                final AllBinaryLayer layerInterface = layerManagerEvent.getLayerInterface();
                                
                    <xsl:call-template name="layerManagerEventListenerRemove" >
                        <xsl:with-param name="windowWidth" >
                            <xsl:value-of select="$windowWidth" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>
                            }

                        };

                        layerManagerEventHandler.addListener(layerManagerEventListener);
                        
                    }

                    public int SceneWindowWidth() {
                        return DisplayInfoSingleton.getInstance().getLastWidth();
                    }

                    public int SceneWindowHeight() {
                        return DisplayInfoSingleton.getInstance().getLastHeight();
                    }

                    public int Random(final int range) {
                        return MyRandomFactory.getInstance().getAbsoluteNextInt(range + 1);
                    }

                    public int Variable(final int value) {
                        return value;
                    }

                    public double Variable(final double value) {
                        return value;
                    }

                    public int VariableString(final int value) {
                        return value;
                    }

                    public String Variable(final String value) {
                        return value;
                    }

                    public String VariableString(final String string) {
                        return string;
                    }

                    public int MouseX(String string, int value) {
                        return value;
                    }

                    public int MouseY(String string, int value) {
                        return value;
                    }

                    public int GlobalVariable(final int value) {
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
