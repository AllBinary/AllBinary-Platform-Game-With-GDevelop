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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDScaling.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionCentreCameraGlobal.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionZoomCameraGlobal.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDCreateInstances.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDNodeId.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassProperty.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassPropertyGDObjects.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAssign.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAtIndex.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyActions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyConditions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObject.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventWithOnceCondition.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/condition/GDEventWithKeyFromTextCondition.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventLogicConstruction.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventOpen.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClose.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventProcess.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

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
                //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />
                //externalEventActionModVarSceneAsString=<xsl:value-of select="$externalEventActionModVarSceneAsString" />

                package org.allbinary.game.canvas

                import javax.microedition.lcdui.Graphics

                import org.json.me.JSONArray
                import org.json.me.JSONObject

                import org.allbinary.AndroidUtil
                import org.allbinary.J2MEUtil
                import org.allbinary.animation.AnimationBehavior
                import org.allbinary.animation.special.SpecialAnimation
                import org.allbinary.canvas.GameGlobalsFactory
                import org.allbinary.game.canvas.GDExtensionGDNodes
                import org.allbinary.game.input.GameInputProcessorUtil
                import org.allbinary.game.input.GameInputProcessor
                import org.allbinary.game.displayable.canvas.AllBinaryGameCanvas
                import org.allbinary.game.layout.GDNode
                import org.allbinary.game.layer.special.TempGameLayerUtil
                import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton
                import org.allbinary.graphics.displayable.event.DisplayChangeEvent
                import org.allbinary.graphics.displayable.event.DisplayChangeEventHandler
                import org.allbinary.graphics.displayable.event.DisplayChangeEventListener
                import org.allbinary.game.layout.GDObject
                import org.allbinary.game.layer.AllBinaryGameLayerManager
                import org.allbinary.game.layer.GDGameLayer
                import org.allbinary.game.layer.CollidableCompositeLayer
                import org.allbinary.game.layout.BaseGDNodeStats
                import org.allbinary.game.layout.GDInitialVariables
                import org.allbinary.game.layout.GDNodeStatsFactory
                import org.allbinary.game.layout.GDObjectStrings
                import org.allbinary.game.rand.MyRandomFactory
                import org.allbinary.graphics.PointFactory
                import org.allbinary.graphics.Rectangle
                import org.allbinary.graphics.color.BasicColor
                import org.allbinary.graphics.color.SmallBasicColorCacheFactory
                import org.allbinary.graphics.color.BasicColorUtil
                import org.allbinary.graphics.displayable.MyCanvas
                import org.allbinary.input.motion.gesture.MotionGestureInput
                import org.allbinary.input.motion.gesture.TouchMotionGestureFactory
                import org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener
                import org.allbinary.input.motion.gesture.observer.MotionGestureEvent
                import org.allbinary.logic.communication.log.LogUtil
                import org.allbinary.string.CommonStrings
                import org.allbinary.string.CommonSeps
                import org.allbinary.logic.string.StringMaker
                import org.allbinary.logic.util.event.AllBinaryEventObject
                import org.allbinary.thread.NullRunnable
                import org.allbinary.util.BasicArrayList
                import org.allbinary.util.BasicArrayListD
                import org.allbinary.logic.NullUtil
                import org.allbinary.util.ArrayUtil
                import org.allbinary.logic.math.SmallIntegerSingletonFactory

                //LayoutBuilder name=<xsl:value-of select="$layoutName" />
                open public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder : SpecialAnimation
                {
                        protected val logUtil: LogUtil = LogUtil.getInstance()
                        private val commonStrings: CommonStrings = CommonStrings.getInstance()
                        private val nullUtil: NullUtil = NullUtil.getInstance()
                        private val arrayUtil: ArrayUtil = ArrayUtil.getInstance()
                        private val pointFactory: PointFactory = PointFactory.getInstance()
                        private val basicColorUtil: BasicColorUtil = BasicColorUtil.getInstance()
                        private val smallBasicColorCacheFactory: SmallBasicColorCacheFactory = SmallBasicColorCacheFactory.getInstance()
                        private val gameTickDisplayInfoSingleton: GameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance()
                        private val smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()
                        private val gameGlobalsFactory: GameGlobalsFactory = GameGlobalsFactory.getInstance()

                        private val objectStrings: GDObjectStrings = GDObjectStrings.getInstance()

                        private val gdNodeStatsFactory: BaseGDNodeStats = GDNodeStatsFactory.getInstance()
                        private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                        private val gdExtensionGDNodes: GDExtensionGDNodes = GDExtensionGDNodes.getInstance()

                        private val globals: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance()
                        private val gdGlobalsObjectsFactory: GDGlobalsGDObjectsFactory = GDGlobalsGDObjectsFactory.getInstance()
                        private val gdObjectsFactory: GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory = GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstance()

                        private val CREATE_INSTANCES: String = "createInstances"

                        public var initialized: Boolean = false

                        private fun createSpecialAnimationImageResources(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources {
                            try {
                                return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources.getInstanceOrCreate()
                            } catch (e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + "GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources", this, this.commonStrings.CONSTRUCTOR, e)
                            }
                            var null: return
                        }

                        private fun createSpecialAnimationTouchImageResources(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources {
                            try {
                                return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources.getInstanceOrCreate()
                            } catch (e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + "GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources", this, this.commonStrings.CONSTRUCTOR, e)
                            }
                            var null: return
                        }

                        private fun createSpecialAnimationGDResources(): GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources {
                            try {
                                return GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources.getInstanceOrCreate()
                            } catch (e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e)
                            }
                            var null: return
                        }

                        open public fun createGlobalSpecialAnimationImageResources(): GDGlobalSpecialAnimationImageResources {
                            try {
                                return GDGlobalSpecialAnimationImageResources.getInstanceOrCreate()
                            } catch (e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION_LABEL + "GDGlobalSpecialAnimationImageResources", this, this.commonStrings.CONSTRUCTOR, e)
                            }
                            var null: return
                        }

                        open public fun createGlobalsSpecialAnimationGDResources(): GDGlobalsGDResources {
                            try {
                                return GDGlobalsGDResources.getInstanceOrCreate()
                            } catch (e: Exception) {
                                this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e)
                            }
                            var null: return
                        }

                        public constructor() : super(AnimationBehavior.getInstance()) {

                            <xsl:call-template name="scale" >
                                <xsl:with-param name="layoutIndex" >
                                    <xsl:value-of select="$layoutIndex" />
                                </xsl:with-param>
                                <xsl:with-param name="layoutName" >
                                    <xsl:value-of select="$layoutName" />
                                </xsl:with-param>
                            </xsl:call-template>

                            this.logUtil.putF(StringMaker().append(this.commonStrings.START).append(":GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder scale: ").append(scale).toString(), this, this.commonStrings.CONSTRUCTOR)

                    <xsl:call-template name="findMousePositionNeeded" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>

                            //eventsLogicConstructionMotionGestureEvent - START
                    <xsl:call-template name="eventsLogicConstructionMotionGestureEvent" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                    </xsl:call-template>
                            //eventsLogicConstructionMotionGestureEvent - END

                            var externalEventNodes: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalEventGDNodes
                            var externalLayoutNodes: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalLayoutGDNodes
                            var externalActionNodes: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalActionGDNodes
                            var externalConditionNodes: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalConditionGDNodes
                            var externalOtherEventNodes: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalOtherEventGDNodes
                            var externalObjectEventNodes: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalObjectEventGDNodes
                            var actionNodes: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes
                            var conditionNodes: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationConditionGDNodes
                            var otherEventNodes: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationOtherEventGDNodes
                            var objectEventNodes: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationObjectEventGDNodes

                            var size: Int = gameGlobals.nodeArray.length
                        <!--
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            final int currentIndex = index;
                            gameGlobals.nodeArray[index2][index] = new GDNode() {

                                @Override
                                public boolean process() throws Exception {
                                    super.processStats();
                                    this.logUtil.put(Integer.toString(currentIndex), this, this.commonStrings.PROCESS, new Exception());

                                    return true;
                                }
                            };
                        }
                        -->

                        val globalImageResources: GDGlobalSpecialAnimationImageResources = this.createGlobalSpecialAnimationImageResources()
                        val imageResources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationImageResources = this.createSpecialAnimationImageResources()
                        val touchImageResources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationTouchImageResources = this.createSpecialAnimationTouchImageResources()

                    val globalResources: GDGlobalsGDResources = this.createGlobalsSpecialAnimationGDResources()
                    val resources: GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGDResources = this.createSpecialAnimationGDResources()

                    //GDNode - START
                    externalEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalEventGDNodes.getInstance()
                    externalLayoutNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalLayoutGDNodes.getInstance()
                    externalActionNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalActionGDNodes.getInstance()
                    externalConditionNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalConditionGDNodes.getInstance()
                    externalOtherEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalOtherEventGDNodes.getInstance()
                    externalObjectEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationExternalObjectEventGDNodes.getInstance()
                    actionNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationActionGDNodes.getInstance()
                    conditionNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationConditionGDNodes.getInstance()
                    otherEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationOtherEventGDNodes.getInstance()
                    objectEventNodes = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationObjectEventGDNodes.getInstance()
                    //GDNode - END

                        try {

                        <xsl:call-template name="createInstancesCalls" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                        </xsl:call-template>


                        } catch (e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.CONSTRUCTOR, e)
                        }

                        this.build()

                        this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.CONSTRUCTOR)
                    }

                    open public fun build() {
                        try {
                            this.logUtil.putF(this.commonStrings.START, this, this.commonStrings.PROCESS)

                            <xsl:call-template name="scale" >
                                <xsl:with-param name="layoutIndex" >
                                    <xsl:value-of select="$layoutIndex" />
                                </xsl:with-param>
                                <xsl:with-param name="layoutName" >
                                    <xsl:value-of select="$layoutName" />
                                </xsl:with-param>
                            </xsl:call-template>

                        val tempGameLayerUtil: TempGameLayerUtil = TempGameLayerUtil.getInstance()

                    <xsl:for-each select="../externalEvents" >
                    <xsl:if test="$layoutName = associatedLayout" >
                    //externalEventsProcess - START
                        <xsl:call-template name="eventIdsLessRecursion" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="caller" >externalEventsProcess</xsl:with-param>
                        </xsl:call-template>
                    //externalEventsProcess - END
                    </xsl:if>
                    </xsl:for-each>

                    <xsl:for-each select="../externalLayouts" >
                    <xsl:if test="$layoutName = associatedLayout" >
                    //externalLayoutsProcess - START
                        <xsl:call-template name="eventIdsLessRecursion" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="caller" >externalEventsProcess</xsl:with-param>
                        </xsl:call-template>
                    //externalLayoutsProcess - END
                    </xsl:if>
                    </xsl:for-each>

                    //startConditionProcessActions - START
                    <xsl:call-template name="startConditionProcessActions" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //startConditionProcessActions - END

                    //objects - all - //builder
                    <xsl:for-each select="objects" >
                        //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

                        <xsl:if test="type = 'Sprite' or type = 'ParticleSystem::ParticleEmitter'" >
                            <xsl:variable name="stringValue" select="string" />
                            <xsl:variable name="name" select="name" />
                            //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerFactory = <xsl:value-of select="name" />GDGameLayerFactory
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

                    //eventsLogicConstructionCollisionNP - START
                    <xsl:call-template name="eventsLogicConstructionCollisionNP" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsLogicConstructionCollisionNP - END

                    <xsl:if test="$layoutIndex = 1" >
                    //GameAreaBoxUtil.getInstance().append()
                    </xsl:if>

                    //eventsKeyFromTextConditions - START
                    <xsl:call-template name="eventsKeyFromTextConditions" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsKeyFromTextConditions - END

                    <xsl:variable name="hasForm" ><xsl:for-each select="objects" ><xsl:if test="type = 'TextInput::TextInputObject' or type = 'PanelSpriteSlider::PanelSpriteSlider'" >found</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="contains($hasForm, 'found')" >
                    val abToGBUtil: ABToGBUtil = ABToGBUtil.getInstance()
                    val abCanvas: AllBinaryGameCanvas = abToGBUtil.abCanvas as AllBinaryGameCanvas
                    abCanvas.setInputProcessor(abCanvas.getRawInputProcessor())
                    </xsl:if>

                    if(globals.anyKeyProcessorArray[0] == null) {
                        globals.anyKeyProcessorArray[0] = GameInputProcessor.getInstance()
                    }
                    GameInputProcessorUtil.init(globals.inputProcessorArray)
                    GameInputProcessorUtil.init(globals.unmappedInputProcessorArray)

                        //allBinaryGameLayerManager.log()
                        //groupLayerManagerListener.log()

                        this.logUtil.putF("DepartScene - completed newCanvas is now false", this, this.commonStrings.PROCESS)
                        gameGlobalsFactory.newCanvas = false
                        initialized = true

                        } catch (e: Exception) {
                            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.PROCESS, e)
                        }

                        this.logUtil.putF(this.commonStrings.END, this, this.commonStrings.PROCESS)
                    }

                    open public fun SceneWindowWidth(): Int {
                        return gameTickDisplayInfoSingleton.getLastWidth()
                    }

                    open public fun SceneWindowHeight(): Int {
                        return gameTickDisplayInfoSingleton.getLastHeight()
                    }

                    open public fun abs(value: Int): Int {
                        return Math.abs(value)
                    }

                    open public fun abs(value: Float): Float {
                        return Math.abs(value)
                    }

                    open public fun log2(value: Int): Double {
                        return Math.log(value)
                    }

                    open public fun Random(range: Int): Int {
                        return MyRandomFactory.getInstance().getAbsoluteNextInt(range + 1)
                    }

                    open public fun Variable(value: Int): Int {
                        var value: return
                    }

                    open public fun Variable(value: Float): Float {
                        var value: return
                    }

                    open public fun Variable(value: Double): Double {
                        var value: return
                    }

                    open public fun GlobalVariable(value: String): String {
                        var value: return
                    }

                    open public fun GlobalVariable(value: Float): Float {
                        var value: return
                    }

                    open public fun GlobalVariable(value: Long): Long {
                        var value: return
                    }

                    open public fun GlobalVariable(value: Int): Int {
                        var value: return
                    }

                    open public fun ToString(value: Int): String {
                        if(this.abs(value) <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 499) {
                            return Integer.toString(value)
                        } else {
                            return smallIntegerSingletonFactory.getString(value)
                        }
                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
