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

    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/case.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/indexof.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/replace.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/reverse.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/split.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDNodeId.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDExternalEventsGDNodes.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectClassProperty.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectClassPropertyGDObjects.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectAssign.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectAnimations.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectAtIndex.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventClassPropertyActions.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventClassPropertyConditions.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObject.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventWithOnceCondition.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventPaint.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventLogicConstruction.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventOpen.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventClose.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventProcess.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">
        <xsl:variable name="windowWidth" select="properties/windowWidth" />

        <xsl:for-each select="layouts" >
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

                //showAll - START
                <!--
                    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>root<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                    <xsl:call-template name="showAll" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <xsl:text disable-output-escaping="yes" >&lt;</xsl:text>/root<xsl:text disable-output-escaping="yes" >&gt;</xsl:text>
                -->                
                //showAll - END
                
                package org.allbinary.game.canvas;

                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.game.layout.GDNode;
                import org.allbinary.graphics.color.BasicColor;
                import org.allbinary.graphics.displayable.DisplayInfoSingleton;

                import org.allbinary.game.layout.GDObject;
                import org.allbinary.game.layer.AllBinaryGameLayerManager;
                import org.allbinary.game.layer.CollidableCompositeLayer;
                import org.allbinary.game.rand.MyRandomFactory;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.graphics.displayable.MyCanvas;
                import org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener;
                import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
                import org.allbinary.logic.basic.string.CommonStrings;
                import org.allbinary.logic.basic.util.event.AllBinaryEventObject;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.util.BasicArrayList;
                import org.allbinary.util.ArrayUtil;

                //Layout name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder extends SpecialAnimation
                {

                    private static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder instance;

                    public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder getInstance(final MyCanvas canvas, final AllBinaryGameLayerManager allBinaryGameLayerManager)
                    {
                        instance = new GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder(canvas, allBinaryGameLayerManager);
                        return instance;
                    }

                        public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder getInstance()
                        {
                            return instance;
                        }

                        private final CommonStrings commonStrings = CommonStrings.getInstance();
                        private final ArrayUtil arrayUtil = ArrayUtil.getInstance();
                        
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
                        private final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory gdObjectsFactory = GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstance();

                        public boolean initialized = false;
                        
                        public GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder(final MyCanvas canvas, final AllBinaryGameLayerManager allBinaryGameLayerManager) {
                        
                            LogUtil.put(LogFactory.getInstance(commonStrings.CONSTRUCTOR + ":GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder", this, commonStrings.CONSTRUCTOR));
                        
                    <xsl:call-template name="eventsLogicConstructionMouseButtonReleased" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                    </xsl:call-template>

                        GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalActionGDNodes externalActionNodes;
                        GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalConditionGDNodes externalConditionNodes;
                        GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalOtherEventGDNodes externalOtherEventNodes;
                        GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalObjectEventGDNodes externalObjectEventNodes;
                        GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes actionNodes;
                        GD<xsl:value-of select="$layoutIndex" />SpecialAnimationConditionGDNodes conditionNodes;
                        GD<xsl:value-of select="$layoutIndex" />SpecialAnimationOtherEventGDNodes otherEventNodes;
                        GD<xsl:value-of select="$layoutIndex" />SpecialAnimationObjectEventGDNodes objectEventNodes;
                        
                        int size = globals.nodeArray.length;
//                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
//                            final int currentIndex = index;
//                            globals.nodeArray[index2][index] = new GDNode() {
//
//                                @Override
//                                public void process() {
//                                    LogUtil.put(LogFactory.getInstance(commonStrings.PROCESS, this, Integer.toString(currentIndex), new Exception()));
//                                }
//                            };
//                        }

                        globals.nodeArray[globals.FAKE_COLLISION_NODE_ID] = new GDNode() {

                            @Override
                            public void processM(final CollidableCompositeLayer[] gameLayerArray, final GDNode gdNode, final BasicArrayList gdNodeList) {
                                
                                gdNode.gameLayerArray[0] = gameLayerArray[0];
                                gdNode.gameLayerArray[1] = gameLayerArray[1];

                                //LogUtil.put(LogFactory.getInstance(commonStrings.PROCESS, this, FAKE_COLLISION_NODE_STRING));
                                gdNode.processM(gdNode.gameLayerArray, gdNode, gdNodeList);
                            }
                        };

                    GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources imageResources = null;
                        try {
                    imageResources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources.create();
                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources", this, commonStrings.CONSTRUCTOR, e));
                        }

                    //GDNode processM calls in this class can load resources
                    GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources resources = null;
                        try {
                    resources = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources.getInstance(allBinaryGameLayerManager);
                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
                        }

                    //GDNode - START
                    externalActionNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalActionGDNodes.getInstance(allBinaryGameLayerManager);
                    externalConditionNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalConditionGDNodes.getInstance(allBinaryGameLayerManager);
                    externalOtherEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalOtherEventGDNodes.getInstance(allBinaryGameLayerManager); //GDNode processM calls in this class can load resources
                    externalObjectEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalObjectEventGDNodes.getInstance(allBinaryGameLayerManager);
                    actionNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes.getInstance(canvas, allBinaryGameLayerManager);
                    conditionNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationConditionGDNodes.getInstance(allBinaryGameLayerManager); //GDNode processM calls in this class can load resources
                    otherEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationOtherEventGDNodes.getInstance(allBinaryGameLayerManager); //GDNode processM calls in this class can load resources
                    objectEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationObjectEventGDNodes.getInstance(allBinaryGameLayerManager);
                    //GDNode - END

                        try {
                    
                    //instances create - START
                    <xsl:for-each select="instances" >
                        <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                        //name=<xsl:value-of select="name" /> layout=<xsl:value-of select="layer" />
                        <xsl:text>&#10;</xsl:text>
                        final int <xsl:value-of select="name" />X = <xsl:value-of select="x" />;
                        final int <xsl:value-of select="name" />Y = <xsl:value-of select="y" />;

                        if(globals.<xsl:value-of select="name" />List.objectArray == arrayUtil.ZERO_OBJECT_ARRAY) {
                            globals.<xsl:value-of select="name" />List.ensureCapacity(1);
                        }

                        if(globals.<xsl:value-of select="name" />GDGameLayerList.objectArray == arrayUtil.ZERO_OBJECT_ARRAY) {
                            globals.<xsl:value-of select="name" />GDGameLayerList.ensureCapacity(1);
                        }

                        //this.<xsl:value-of select="name" />GDGameLayerArray = new GDGameLayer[1];
                        final GDObject <xsl:value-of select="name" />2 = gdObjectsFactory.get<xsl:value-of select="name" />(null, <xsl:value-of select="name" />X, <xsl:value-of select="name" />Y, globals.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>);
                        //Add GDObject 1 at index 0
                        globals.<xsl:value-of select="name" />List.add(<xsl:value-of select="name" />2);
                        
                        <xsl:variable name="spriteName" >Sprite:<xsl:value-of select="name" /></xsl:variable>
                        <xsl:if test="contains($objectsAsString, $spriteName)" >
                        //instances //We may need to set a dimension for each image/animation.
                        <xsl:value-of select="name" />2.canvasWidth = imageResources.<xsl:value-of select="name" />ImageArray[0].getWidth();
                        <xsl:value-of select="name" />2.canvasHeight = imageResources.<xsl:value-of select="name" />ImageArray[0].getHeight();
                        <xsl:value-of select="name" />2.width = (int) (imageResources.<xsl:value-of select="name" />ImageArray[0].getWidth() / 1.44f);
                        <xsl:value-of select="name" />2.height = (int) (imageResources.<xsl:value-of select="name" />ImageArray[0].getHeight() / 1.44f);
                        <xsl:value-of select="name" />2.halfWidth = (<xsl:value-of select="name" />2.width / 2);
                        <xsl:value-of select="name" />2.halfHeight = (<xsl:value-of select="name" />2.height / 2);
                        LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />2.toString(), this, commonStrings.PROCESS));
                        </xsl:if>

                        <xsl:if test="layer = 'touch'" >
                        globals.<xsl:value-of select="name" />Rectangle = new Rectangle(
                            PointFactory.getInstance().getInstance(<xsl:value-of select="name" />2.x, <xsl:value-of select="name" />2.y),
                            <xsl:value-of select="name" />2.Width(globals.graphics), <xsl:value-of select="name" />2.Height(globals.graphics));
                        </xsl:if>

                        //this.<xsl:value-of select="name" /> = new <xsl:value-of select="name" />(null, <xsl:value-of select="name" />X, <xsl:value-of select="name" />Y, null);
                        <xsl:if test="layer != ''" >
                        globals.<xsl:value-of select="name" />GDGameLayer = resources.<xsl:value-of select="name" />GDGameLayerFactory.create(globals.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>, <xsl:value-of select="name" />2, globals.<xsl:value-of select="name" />GDConditionWithGroupActions);
                        LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$nodeId" /> for globals.<xsl:value-of select="name" />GDGameLayerList.add(<xsl:value-of select="name" />GDGameLayer); at: 0", this, commonStrings.PROCESS));
                        globals.<xsl:value-of select="name" />GDGameLayerList.add(globals.<xsl:value-of select="name" />GDGameLayer);

                        globals.<xsl:value-of select="name" />GDGameLayer.updateGDObject(globals.timeDelta);
                        allBinaryGameLayerManager.insert(globals.<xsl:value-of select="name" />GDGameLayer);
                        </xsl:if>
                    </xsl:for-each>
                    //instances create - END

                    <xsl:for-each select="../externalEvents" >
                    <xsl:if test="$layoutName = associatedLayout" >
                    //externalEventsProcess - START
                        <xsl:call-template name="eventIds" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="caller" >externalEventsProcess</xsl:with-param>
                        </xsl:call-template>
                    //externalEventsProcess - END
                    </xsl:if>
                    </xsl:for-each>

                    //BuiltinCommonInstructions::Once - START
                    <xsl:call-template name="eventsOnceConditionProcessActions" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //BuiltinCommonInstructions::Once - END

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:if test="$typeValue = 'TextObject::Text'" >
                            globals.<xsl:value-of select="name" />TextAnimation.setBasicColor(new BasicColor(255, <xsl:for-each select="color" >
                                <xsl:value-of select="r" />, <xsl:value-of select="g" />, <xsl:value-of select="b" />, </xsl:for-each>"name=<xsl:value-of select="name" />;type=<xsl:value-of select="$typeValue" />"));

                            <xsl:variable name="name2" >:<xsl:value-of select="name" />,</xsl:variable>

                            //test="not(contains($instancesAsString, $name2))"
                            //<xsl:value-of select="name" />.x = 0;
                            //<xsl:value-of select="name" />.y = 0;

                        </xsl:if>

                    </xsl:for-each>

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" />
                        //With tags <xsl:for-each select="tags" >?</xsl:for-each>
                        //With variables <xsl:for-each select="variables" >?</xsl:for-each>
                        //With effects <xsl:for-each select="effects" >?</xsl:for-each>

                        <xsl:if test="$typeValue = 'Sprite'" >
                            <xsl:variable name="stringValue" select="string" />
                            <xsl:variable name="name" select="name" />
                            //globals.<xsl:value-of select="name" />GDGameLayerFactory = <xsl:value-of select="name" />GDGameLayerFactory;
                        </xsl:if>
                    </xsl:for-each>

<!--
                    <xsl:call-template name="externalEventsCreateAssign" >
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                    <xsl:with-param name="conditionToProcess" >
                        <xsl:value-of select="''" />
                    </xsl:with-param>
                    <xsl:with-param name="actionToProcess" >
                        <xsl:value-of select="''" />
                    </xsl:with-param>
                    <xsl:with-param name="otherEventToProcess" >
                        <xsl:value-of select="''" />
                    </xsl:with-param>
                                            
                    </xsl:call-template>
-->

                    <xsl:call-template name="eventsLogicConstructionCollisionNP" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                    </xsl:call-template>

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
                        }

                        //allBinaryGameLayerManager.log();
                        //groupLayerManagerListener.log();
                        
                        initialized = true;
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
