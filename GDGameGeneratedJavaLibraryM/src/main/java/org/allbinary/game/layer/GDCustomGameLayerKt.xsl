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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/replace.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDGlobalCalls.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

        <xsl:variable name="foundOtherViewPosition" ><xsl:for-each select="layouts" ><xsl:for-each select="objects" ><xsl:for-each select="behaviors" ><xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:for-each></xsl:variable>

        package org.allbinary.game.layer

        import javax.microedition.lcdui.Canvas
        import javax.microedition.lcdui.Graphics
        import javax.microedition.lcdui.game.TiledLayer

        import org.allbinary.AndroidUtil
        import org.allbinary.animation.Animation
        import org.allbinary.animation.AnimationInterfaceFactoryInterface
        import org.allbinary.animation.IndexedAnimationInterface
        import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
        import org.allbinary.animation.text.TextInterface
        import org.allbinary.direction.Direction
        import org.allbinary.direction.DirectionFactory
        import org.allbinary.game.canvas.GDGameGlobals
        import org.allbinary.game.GameTypeFactory
//        import org.allbinary.game.behavior.platformer.GeographicMapPlatformGameLayerBehavior
//        import org.allbinary.game.behavior.platformer.InitialJumpBehavior
//        import org.allbinary.game.behavior.platformer.PlatformCharacterBehavior
//        import org.allbinary.game.behavior.platformer.PlatformCharacterInterface
//        import org.allbinary.game.behavior.platformer.PlayerPlatformCharacterBehavior
        import org.allbinary.game.configuration.feature.Features
        import org.allbinary.game.configuration.feature.InputFeatureFactory
        import org.allbinary.game.identification.Group
        import org.allbinary.game.identification.GroupCommonFactory
        import org.allbinary.game.layer.form.GDSliderAnimationBehavior
        import org.allbinary.game.layer.form.GDTextInputAnimationBehavior
        import org.allbinary.game.layer.behavior.GDBehaviorUtil
        import org.allbinary.game.input.GameInputProcessor
        import org.allbinary.game.input.GameInputProcessorUtil
        import org.allbinary.game.input.GameKeyEventSourceInterface
        import org.allbinary.game.input.InputFactory
        import org.allbinary.game.input.PlayerGameInput
        import org.allbinary.game.input.event.GameKeyEvent
        import org.allbinary.game.input.event.GameKeyEventHandler
        import org.allbinary.game.layer.special.Special1GameInputProcessor
        import org.allbinary.game.layer.special.Special2GameInputProcessor
        import org.allbinary.game.layer.special.SpecialFireGameInputProcessor
        import org.allbinary.game.layer.special.SpecialLeftGameInputProcessor
        import org.allbinary.game.layer.special.SpecialRightGameInputProcessor
        import org.allbinary.game.layer.special.SpecialUpGameInputProcessor
        import org.allbinary.game.layer.special.TempMapMovementBehavior
        import org.allbinary.game.layer.special.TempMovementBehaviorFactory
        import org.allbinary.game.layout.GDNode
        import org.allbinary.game.layer.special.TempGameLayerUtil
        import org.allbinary.game.layout.GDObject
        import org.allbinary.game.multiplayer.layer.RemoteInfo
        import org.allbinary.game.physics.acceleration.BasicAccelerationProperties
        import org.allbinary.game.physics.velocity.VelocityProperties
        import org.allbinary.game.view.StaticTileLayerIntoPositionViewPosition
        import org.allbinary.graphics.GPoint
        import org.allbinary.graphics.Rectangle
        import org.allbinary.graphics.color.BasicColorFactory
        import org.allbinary.graphics.opengles.OpenGLFeatureFactory
        import org.allbinary.layer.AllBinaryLayer
        import org.allbinary.layer.AllBinaryLayerManager
        import org.allbinary.string.CommonSeps
        import org.allbinary.string.CommonStrings
        import org.allbinary.logic.string.StringMaker
        import org.allbinary.logic.string.StringUtil

        import org.allbinary.logic.communication.log.LogUtil
        import org.allbinary.media.graphics.geography.map.BasicGeographicMap
        import org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil
        import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition
        import org.allbinary.media.graphics.geography.map.GeographicMapCellType
        import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
        import org.allbinary.media.graphics.geography.map.GeographicMapEventHandler
        import org.allbinary.media.graphics.geography.map.SimpleGeographicMapCellPositionFactory
        import org.allbinary.util.BasicArrayList
        import org.allbinary.util.BasicArrayListD
        import org.allbinary.view.ViewPosition
        import org.allbinary.view.ViewPositionBase
        import org.allbinary.util.ABHashtable

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
        import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />LayoutUtil
        </xsl:for-each>

    <xsl:variable name="foundPathFindingBehavior" >
        <xsl:for-each select="//behaviorsSharedData" >
            <xsl:if test="type = 'PathfindingBehavior::PathfindingBehavior'" >found</xsl:if>
        </xsl:for-each>
    </xsl:variable>

        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >

        import org.allbinary.animation.NullAnimationFactory
        import org.allbinary.animation.RotationAnimation
        import org.allbinary.animation.caption.CaptionAnimationHelper
        import org.allbinary.animation.caption.CaptionAnimationHelperBase
        import org.allbinary.game.input.event.GameKeyEventFactory
        import org.allbinary.game.layer.SteeringVisitor
        import org.allbinary.game.layer.behavior.GDBehaviorUtil
        import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer
        import org.allbinary.game.layer.waypoint.GDWaypointBehavior
        import org.allbinary.game.layer.waypoint.GDWaypointBehavior2
        import org.allbinary.game.layer.waypoint.Waypoint
        import org.allbinary.game.layer.waypoint.MultipassNoCacheWaypoint
        import org.allbinary.game.layer.waypoint.NoCacheWaypoint
        import org.allbinary.game.layer.waypoint.Waypoint2LogHelper
        import org.allbinary.game.layer.waypoint.WaypointLogHelper
        import org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper
        import org.allbinary.game.layer.waypoint.Waypoint2SelectedLogHelper
        import org.allbinary.game.layer.waypoint.WaypointSelectedLogHelper
        import org.allbinary.game.layer.waypoint.WaypointRunnableSelectedLogHelper
        import org.allbinary.game.layer.waypoint.WaypointBase
        import org.allbinary.game.tracking.TrackingEvent
        import org.allbinary.game.tracking.TrackingEventHandler
        import org.allbinary.game.view.TileLayerPositionIntoViewPosition
        import org.allbinary.game.view.TileLayerPositionIntoViewPosition
        import org.allbinary.graphics.GPoint
        import org.allbinary.media.audio.AttackSound
        import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory
        import org.allbinary.layer.Layer
        import org.allbinary.layer.LayerInterfaceFactoryInterface
        import org.allbinary.logic.string.StringUtil
        import org.allbinary.math.AngleFactory
        import org.allbinary.math.NamedAngle
        import org.allbinary.math.AngleInfo
        import org.allbinary.math.FrameUtil
        //import org.allbinary.math.LayerDistanceUtil
        import org.allbinary.string.CommonPhoneStrings
        import org.allbinary.media.graphics.geography.map.CurrentGeographicMapCellPositionInterface
        import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType
        import org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory
        import org.allbinary.thread.PathFindingThreadPool
        import org.allbinary.util.BasicArrayListUtil

        </xsl:if>

                open public class GDCustomGameLayer : GDGameLayer, <xsl:if test="contains($foundOtherViewPosition, 'found')" >GameKeyEventSourceInterface, org.allbinary.game.behavior.platformer.PlatformCharacterInterface </xsl:if>
        <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >org.allbinary.game.behavior.topview.TopViewCharacterInterface </xsl:if>
        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >, CurrentGeographicMapCellPositionInterface, org.allbinary.game.layer.PathFindingLayerInterface </xsl:if>
                {
                    private val stringUtil: StringUtil = StringUtil.getInstance()
                    private val basicGeographicMapUtil: BasicGeographicMapUtil = BasicGeographicMapUtil.getInstance()

                    private val gdBehaviorUtil: GDBehaviorUtil = GDBehaviorUtil.getInstance()
                    private val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                    private val groupCommonFactory: GroupCommonFactory = GroupCommonFactory.getInstance()

                    private var scale: Float

        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >
                    private val basicColorFactory: BasicColorFactory = BasicColorFactory.getInstance()
                    private val angleFactory: AngleFactory = AngleFactory.getInstance()

                    protected val debug: Boolean = true
                    public val showMoreCaptionStates: Boolean = debug
                    private val waypointLayerInterfaceFactoryInterface: LayerInterfaceFactoryInterface

                    private val captionAnimationHelper: CaptionAnimationHelperBase =
                        CaptionAnimationHelperBase.INSTANCE
                        //CaptionAnimationHelper(
                            //NullAnimationFactory.getFactoryInstance().getInstance(0),
                            //-23, -25, 6, 0)
                    private var captionAnimation: Animation = NullAnimationFactory.getFactoryInstance().getInstance(0)

                    private var selected: Boolean = false

                    private var waypointBehaviorBase: WaypointBehaviorBase = WaypointBehaviorBase()

                    protected var rtsLogHelper: RTSLayerLogHelper = RTSLayerLogHelper.getInstance()
                    public var rtsLayer2LogHelper: RTSLayer2LogHelper = RTSLayer2LogHelper.getInstance()
                    public var waypointLogHelper: WaypointLogHelper = WaypointLogHelper.getInstance()
                    public var waypoint2LogHelper: Waypoint2LogHelper = Waypoint2LogHelper.getInstance()
                    public var waypointRunnableLogHelper: WaypointRunnableLogHelper = WaypointRunnableLogHelper.getInstance()
                    //protected RTSLayerLogHelper rtsLogHelper = RTSLayerSelectedLogHelper.getInstance()
                    //public RTSLayer2LogHelper rtsLayer2LogHelper = RTSLayer2SelectedLogHelper.getInstance()
                    //public WaypointLogHelper waypointLogHelper = WaypointSelectedLogHelper.getInstance()
                    //public Waypoint2LogHelper waypoint2LogHelper = Waypoint2SelectedLogHelper.getInstance()
                    //public WaypointRunnableLogHelper waypointRunnableLogHelper = WaypointRunnableSelectedLogHelper.getInstance()

                    private val initPathAnimation: Animation
                    private var pathAnimation: Animation = NullAnimationFactory.getFactoryInstance().getInstance(0)

                    public val geographicMapCellPositionArea: GeographicMapCellPositionArea
                    private var movementAngle: NamedAngle = angleFactory.NOT_ANGLE
                    private var steeringInsideGeographicMapCellPosition: GeographicMapCellPosition
        </xsl:if>

        <xsl:variable name="hasLayoutWithTileMapAndIsTopView" >
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:for-each select="objects" >
                <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >
                <xsl:if test="type = 'TileMap::TileMap' or type = 'TiledSpriteObject::TiledSprite'" >found</xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        </xsl:variable>

                <xsl:if test="contains($hasLayoutWithTileMapAndIsTopView, 'found')" >
                    public val topViewGameBehavior: org.allbinary.game.behavior.topview.GeographicMapTopViewLayerBehavior

                    protected val topViewCharacterBehavior: org.allbinary.game.behavior.topview.TopViewCharacterBehavior =
                        <xsl:if test="1" >org.allbinary.game.behavior.topview.PlayerTopViewCharacterBehavior()</xsl:if>
                        <xsl:if test="0" >org.allbinary.game.behavior.topview.NonPlayerTopViewCharacterBehavior()</xsl:if>

                </xsl:if>

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:for-each select="objects" >

                <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" />
                    <xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >

                        <xsl:if test="1" >
    private var playerGameInput: PlayerGameInput
                        </xsl:if>

                    private val id: Int = 0

                    protected val inputProcessorArray: Array&lt;GameInputProcessor&gt; = arrayOfNulls&lt;GameInputProcessor&gt;(InputFactory.getInstance().MAX)

    protected val isSingleKeyProcessing: Boolean =
        Features.getInstance().isFeature(
                InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS)
            || Features.getInstance().isFeature(
                    InputFeatureFactory.getInstance().SINGLE_KEY_PRESS)

                    private val initialJumpBehavior: org.allbinary.game.behavior.platformer.InitialJumpBehavior = object : org.allbinary.game.behavior.platformer.InitialJumpBehavior() {
                        open public fun process() {
                            //SecondaryPlayerQueueFactory.getInstance().add(JumpSound.getInstance())
                        }
                    }

                    protected val platformGameBehavior: org.allbinary.game.behavior.platformer.GeographicMapPlatformGameLayerBehavior =
                        org.allbinary.game.behavior.platformer.GeographicMapPlatformGameLayerBehavior(64, false, 6)
                    protected val platformCharacterBehavior: org.allbinary.game.behavior.platformer.PlatformCharacterBehavior =
                        <xsl:if test="1" >org.allbinary.game.behavior.platformer.PlayerPlatformCharacterBehavior()</xsl:if>
                        <xsl:if test="0" >org.allbinary.game.behavior.platformer.NonPlayerPlatformCharacterBehavior()</xsl:if>

                    protected val rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt;

<!--
                    public boolean hasCollisionMask() {
                        if(this.rectangleArrayOfArrays != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.rectangleArrayOfArrays.length <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.rectangleArrayOfArrays[0].length <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                            return true;
                        } else {
                            return false;
                        }
                    }
-->

                    protected var acceleration: BasicAccelerationProperties

    protected var angle: Short = 0
    protected var lastDirectionKey: Int = Canvas.RIGHT
    protected var direction: Direction = DirectionFactory.getInstance().RIGHT
    protected var lastDirection: Direction = direction

    protected var directionChanged: Boolean = false

                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>

                    public constructor(layoutIndex: Int, primitiveDrawing: Animation, gameLayerList: BasicArrayList, gameLayerDestroyedList: BasicArrayList, behaviorList: BasicArrayList, remoteInfo: RemoteInfo, groupInterface: Array&lt;Group&gt;, gdName: String, animationInterfaceFactoryInterfaceArray: Array&lt;AnimationInterfaceFactoryInterface&gt;, proceduralAnimationInterfaceFactoryInterfaceArray: Array&lt;ProceduralAnimationInterfaceFactoryInterface&gt;, layerInfo: Rectangle, rectangleArrayOfArrays: Array&lt;Array&lt;Rectangle&gt;&gt;, gdObject: GDObject, animationBehavior: GDAnimationBehaviorBase, resetAnimationBehavior: Boolean) : super(primitiveDrawing, gameLayerList, gameLayerDestroyedList,
                            behaviorList,
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            <xsl:for-each select="objects" >
                <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" />
                    <xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >
                            VelocityProperties(<xsl:value-of select="number(maxSpeed) * 64" />, <xsl:value-of select="number(maxSpeed) * 64" />),
                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
        <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >
                            VelocityProperties(9600, 9600),
        </xsl:if>
                            remoteInfo,
                            groupInterface,
                            gdName,
                            animationInterfaceFactoryInterfaceArray,
                            proceduralAnimationInterfaceFactoryInterfaceArray,
                            layerInfo,
                            rectangleArrayOfArrays,
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            <xsl:for-each select="objects" >
                <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" />
                    <xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >

                        <xsl:if test="1" >
                            StaticTileLayerIntoPositionViewPosition(),
                            //ViewPosition.getInstanceD(),
                        </xsl:if>
                        <xsl:if test="0" >
                            StaticTileLayerIntoPositionViewPosition(),
                            //ViewPosition.getInstanceD(),
                        </xsl:if>

                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>

        <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >
                            ViewPosition.getInstanceD(),
        </xsl:if>
                            gdObject, animationBehavior, resetAnimationBehavior) {

                <xsl:if test="contains($hasLayoutWithTileMapAndIsTopView, 'found')" >
                    var topViewGameBehavior: org.allbinary.game.behavior.topview.GeographicMapTopViewLayerBehavior

                    if(this.hasCollisionMask()) {

                    topViewGameBehavior = object : org.allbinary.game.behavior.topview.GeographicMapTopViewMaskGameLayerBehavior(64, false, 6) {

    override public fun moveAndLand(geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt;, geographicMapCellTypeArray: Array&lt;GeographicMapCellType&gt;, geographicMapCellPosition: GeographicMapCellPosition, velocityProperties: VelocityProperties, layer: AllBinaryLayer, x: Int, y: Int) {
        //this.logUtil.put(StringMaker().append("x: ").append(x).append(" y: ").append(y).append(CommonSeps.getInstance().SPACE).append(layer.getViewPosition().getX()).toString(), this, "moveAndLand")

        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {

            super.moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y)

            //final String MOVE_AND_LAND = "moveAndLand"
            //this.logUtil.put(StringMaker().append("Should Land at: ").append(this.gravityActionIndex).append(" y: ").append(y).toString(), this, MOVE_AND_LAND)
        } else {
            //this.logUtil.putF("do not move", this, "moveAndLand")

            //CollisionNP?

        }

    }

                    }

                    } else {

                    topViewGameBehavior = object : org.allbinary.game.behavior.topview.GeographicMapTopViewGameLayerBehavior2(64, false, 6) {

    override public fun moveAndLand(geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt;, geographicMapCellTypeArray: Array&lt;GeographicMapCellType&gt;, geographicMapCellPosition: GeographicMapCellPosition, velocityProperties: VelocityProperties, layer: AllBinaryLayer, x: Int, y: Int) {
        //this.logUtil.put(StringMaker().append("x: ").append(x).append(" y: ").append(y).append(CommonSeps.getInstance().SPACE).append(layer.getViewPosition().getX()).toString(), this, "moveAndLand")

        if (geographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {

            super.moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y)

            //final String MOVE_AND_LAND = "moveAndLand"
            //this.logUtil.put(StringMaker().append("Should Land at: ").append(this.gravityActionIndex).append(" y: ").append(y).toString(), this, MOVE_AND_LAND)
        } else {
            //this.logUtil.putF("do not move", this, "moveAndLand")

            //CollisionNP?

        }

    }

                    }

                    }

                    this.topViewGameBehavior = topViewGameBehavior
                </xsl:if>

                <xsl:if test="contains($foundPathFindingBehavior, 'found')" >
                    this.waypointLayerInterfaceFactoryInterface = org.allbinary.game.layer.GDFlagLayerInterfaceFactory.getInstance() //waypointLayerInterfaceFactoryInterface
                    this.geographicMapCellPositionArea = GeographicMapCellPositionArea(this)
                </xsl:if>

        <xsl:if test="contains($foundOtherViewPosition, 'found')" >
                        StaticTileLayerIntoPositionViewPosition.layer = this
        </xsl:if>

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            <xsl:for-each select="objects" >
                <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" />
                    <xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >

                        this.acceleration = BasicAccelerationProperties(
                            <xsl:value-of select="number(acceleration) * 4" />,
                            -<xsl:value-of select="number(acceleration) * 4" />
                        )

                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>

        <xsl:variable name="hasDraggableBehavior" >
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:for-each select="objects" >
                <xsl:for-each select="behaviors" >
                    <xsl:if test="type = 'DraggableBehavior::Draggable'" >found</xsl:if>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
        </xsl:variable>

        <xsl:if test="contains($hasDraggableBehavior, 'found')" >
        this.isDraggable = gdObject.isBehaviorEnabledArray[gdBehaviorUtil.DRAGGABLE_BEHAVIOR_INDEX]
        //this.logUtil.putF("isDraggable: " + isDraggable, this, this.commonStrings.CONSTRUCTOR)
        </xsl:if>

        <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >
//                        this.acceleration = BasicAccelerationProperties(
//                            velocityInterface.getMaxForwardVelocity() / 12,
//                            -velocityInterface.getMaxReverseVelocity() / 12
//                        )
        </xsl:if>

            val features: Features = Features.getInstance()
            val openGLFeatureFactory: OpenGLFeatureFactory = OpenGLFeatureFactory.getInstance()

            var isThreed: Boolean = false
            if(features.isFeature(openGLFeatureFactory.OPENGL_2D_AND_3D) || features.isFeature(openGLFeatureFactory.OPENGL_3D)) {
                isThreed = true
            }

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            if(layoutIndex == <xsl:value-of select="$layoutIndex" />) {
                this.handleLayout<xsl:value-of select="$layoutIndex" />()
                this.scale = if ((AndroidUtil.isAndroid() <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>  isThreed)) GD<xsl:value-of select="$layoutIndex" />LayoutUtil.getInstance().scale else 1.0f
            }
        </xsl:for-each>

        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >
            //this.initPathAnimation = PathAnimation(this, LinePathRelativeAnimation.getInstance())
            ////Unremark as well in setAllBinaryGameLayerManager - (this.initPathAnimation as PathAnimation).setAllBinaryGameLayerManager(allBinaryGameLayerManager)
            this.initPathAnimation = NullAnimationFactory.getFactoryInstance().getInstance(0)
        </xsl:if>

        }

    override public fun onMeasure() {
        val textInterface: TextInterface = (this.initIndexedAnimationInterfaceArray[0] as TextInterface)
        this.gdObject.width = (textInterface.getWidth() / this.scale).toInt()
        this.gdObject.height = textInterface.getFontHeight()

        this.setWidth(this.gdObject.width)
        this.setHeight(this.gdObject.height)
    }

        <xsl:if test="not(contains($hasLayoutWithTileMapAndIsTopView, 'found') or contains($foundOtherViewPosition, 'found'))" >
    open public fun upp() {
    }

    open public fun leftp() {
    }

    open public fun rightp() {
    }

    open public fun reset() {
    }

    open public fun terrainMove(geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt;, geographicMapCellTypeArray: Array&lt;GeographicMapCellType&gt;, dx: Int, dy: Int) {
    }

    open public fun terrainEvent(dx: Int, dy: Int, geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt;, geographicMapCellTypeArray: Array&lt;GeographicMapCellType&gt;, geographicMapCellPosition: GeographicMapCellPosition) {
    }

        </xsl:if>

        <xsl:if test="contains($hasLayoutWithTileMapAndIsTopView, 'found')" >

        //private int lastX
        //private int lastY

        private var total: Int

        //String lastString = ""

    override public fun move() {
        try {
            //this.logUtil.putF("Move Map: " + this.gdObject.x + "," + this.gdObject.y, this, "move")

//            if(gameGlobals.PlayerGDGameLayerList.size() >= 0) {
//                final GDGameLayer player = gameGlobals.PlayerGDGameLayerList.get(0) as GDGameLayer
//                if(this == player) {
//                    String layerManagerAsString = this.allBinaryGameLayerManagerP.toString()
//                    if(lastString.compareTo(layerManagerAsString) != 0)
//                    lastString = layerManagerAsString
//                    if(TempMovementBehaviorFactory.getInstance().movementBehavior == TempMapMovementBehavior.getInstance()) {
//                        this.logUtil.putF("1this.allBinaryGameLayerManager: " + this.allBinaryGameLayerManagerP, this, "move")
//                    } else {
//                        this.logUtil.putF("0this.allBinaryGameLayerManager: " + this.allBinaryGameLayerManagerP, this, "move")
//                    }
//                }
//            }

            if(TempMovementBehaviorFactory.getInstance().movementBehavior == TempMapMovementBehavior.getInstance()) {

            if(this.allBinaryGameLayerManagerP == AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER) {
                if(this.total <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 5) {
                    this.total++
                    this.logUtil.putF(StringMaker().append("0LayerManager was null: ").append(this.getName()).append(CommonSeps.getInstance().SPACE).append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(stringUtil.toString(this.allBinaryGameLayerManagerP)).toString(), this, "move")
                }
                return
            }

            val geographicMapCompositeInterface: GeographicMapCompositeInterface = this.allBinaryGameLayerManagerP as GeographicMapCompositeInterface

            val geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt; = geographicMapCompositeInterface.getGeographicMapInterface()

            if(geographicMapInterfaceArray != BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY) {
                val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()

                <xsl:key name="uniqueValues" match="type" use="." />
                <xsl:variable name="hasValues" ><xsl:for-each select="//objects/type[count(. | key('uniqueValues', .)[1]) = 1]" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), ':', '_')" /></xsl:with-param></xsl:call-template></xsl:for-each></xsl:variable>

                <xsl:if test="contains($hasValues, 'TILEMAP__TILEMAP')" >
                if(this.gdObject.type == gameGlobals.TILEMAP__COLLISIONMASK) {

                } else if(this.gdObject.type == gameGlobals.TILEMAP__TILEMAP) {
                    if(<xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    val player: GDGameLayer = <xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.get(0) as GDGameLayer
                    //this.logUtil.put(StringMaker().append("Move Map: ").append(this.getName()).toString(), this, "move")

                    //basicGeographicMapUtil.move(geographicMapInterfaceArray, -x, -y)
                    basicGeographicMapUtil.setPosition(geographicMapInterfaceArray, x, y)

//                    if(this.topViewGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, player, this.gdObject.x, this.gdObject.y)) {
//                        lastX = this.gdObject.x
//                        lastY = this.gdObject.y
//                    } else {
//                        //this.gdObject.setX(lastX)
//                        //this.gdObject.setY(lastY)
//                        //this.logUtil.put(StringMaker().append("Move Back?: ").append(this.gdObject.x).append(CommonSeps.getInstance().COMMA).append(this.gdObject.y).toString(), this, "move")
//                    }
                    }
                } else {
                    if(<xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    val player: GDGameLayer = <xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.get(0) as GDGameLayer
                    if(this == player) {
                        //this.logUtil.put(StringMaker().append("Player - Move Map: ").append(this.gdObject.x).append(",").append(this.gdObject.y).toString(), this, "move")
                        //this.topViewGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, this, this.gdObject.x, this.gdObject.y)
                    } else {
                        super.move()
                    }
                    }
                }
                </xsl:if>
            } else {
                //this.logUtil.put(StringMaker().append("Map was null: ").append(this.getName()).append(CommonSeps.getInstance().SPACE).append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(this.allBinaryGameLayerManagerP).toString(), this, "move")
                GeographicMapEventHandler.getInstance().addListener(this)
            }

            } else {
                super.move()
            }

        } catch (e: Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "move", e)
        }
    }

    override public fun updatePosition() {
        super.updatePosition()
        this.move()
    }

    open public fun move2() {
        try {
            //this.logUtil.putF("Move Map: " + this.gdObject.x + "," + this.gdObject.y, this, "move2")

            if(TempMovementBehaviorFactory.getInstance().movementBehavior == TempMapMovementBehavior.getInstance()) {

            if(this.allBinaryGameLayerManagerP == AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER) {
                this.this.logUtil.putF(StringMaker().append("1LayerManager was null: ").append(this.getName()).append(CommonSeps.getInstance().SPACE).append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(stringUtil.toString(this.allBinaryGameLayerManagerP)).toString(), this, "move")
                return
            }

            val geographicMapCompositeInterface: GeographicMapCompositeInterface = this.allBinaryGameLayerManagerP as GeographicMapCompositeInterface

            val geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt; = geographicMapCompositeInterface.getGeographicMapInterface()

            if(geographicMapInterfaceArray != BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY) {
                val gameGlobals: GDGameGlobals = GDGameGlobals.getInstance()
                <xsl:if test="contains($hasValues, 'TILEMAP__TILEMAP')" >
                if(this.gdObject.type == gameGlobals.TILEMAP__COLLISIONMASK) {

                } else if(this.gdObject.type == gameGlobals.TILEMAP__TILEMAP) {
                    if(<xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    val player: GDGameLayer = <xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.get(0) as GDGameLayer
                    //this.logUtil.put(StringMaker().append("Move Map: ").append(this.gdObject.x).append(",").append(this.gdObject.y).toString(), this, "move2")

                    //basicGeographicMapUtil.move(geographicMapInterfaceArray, -x, -y)
                    basicGeographicMapUtil.setPosition(geographicMapInterfaceArray, x, y)

//                    if(this.topViewGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, player, this.gdObject.x, this.gdObject.y)) {
//                        lastX = this.gdObject.x
//                        lastY = this.gdObject.y
//                    } else {
//                        //this.gdObject.setX(lastX)
//                        //this.gdObject.setY(lastY)
//                        //this.logUtil.put(StringMaker().append("Move Back?: ").append(this.gdObject.x).append(CommonSeps.getInstance().COMMA).append(this.gdObject.y).toString(), this, "move")
//                    }
                    }
                } else {
                    if(<xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    val Player: GDGameLayer = <xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.get(0) as GDGameLayer
                    if(this == Player) {
                        //this.logUtil.put(StringMaker().append("Player - Move Map: ").append(this.gdObject.x).append(",").append(this.gdObject.y).toString(), this, "move2")
                        //this.topViewGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, this, this.gdObject.x, this.gdObject.y)
                    } else {
                        super.move()
                    }
                    }
                }
                </xsl:if>
            } else {
                //this.logUtil.put(StringMaker().append("Map was null: ").append(this.getName()).append(CommonSeps.getInstance().SPACE).append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(this.allBinaryGameLayerManagerP).toString(), this, "move2")
                GeographicMapEventHandler.getInstance().addListener(this)
            }

            } else {
                super.move()
            }

        } catch (e: Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "move2", e)
        }
    }

    open public fun updatePosition2() {
        super.updatePosition()
        this.move2()
    }

    override public fun terrainMove(geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt;, geographicMapCellTypeArray: Array&lt;GeographicMapCellType&gt;, dx: Int, dy: Int) {
        this.topViewCharacterBehavior.terrainMove(this, geographicMapInterfaceArray, dx, dy)
    }

    override public fun terrainEvent(dx: Int, dy: Int, geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt;, geographicMapCellTypeArray: Array&lt;GeographicMapCellType&gt;, geographicMapCellPosition: GeographicMapCellPosition) {
    }

    override public fun upp() {
    }

    override public fun leftp() {
    }

    override public fun rightp() {
    }

    override public fun reset() {
    }

        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >
    override public fun paint(graphics: Graphics) {
        super.paint(graphics)

        val viewPosition: ViewPositionBase = this.getViewPosition()
        val x: Int = viewPosition.getX()
        val y: Int = viewPosition.getY()

        this.captionAnimation.paintXY(graphics, x, y)

        this.pathAnimation.paintXY(graphics, x, y)

//        if(this.topViewGameBehavior.blockGeographicMapCellPosition != null) {
//        graphics.setColor(BasicColorFactory.getInstance().RED.intValue())
//        graphics.drawString(this.topViewGameBehavior.blockGeographicMapCellPosition.toString(), 10, 10, 0)
//        }
    }
        </xsl:if>

        </xsl:if>

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            <xsl:for-each select="objects" >

                <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> - START
                    <xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >

    open public fun initInputProcessors() {
        this.inputProcessorArray[Canvas.UP] = SpecialUpGameInputProcessor(this)

        this.inputProcessorArray[Canvas.KEY_NUM1] = SpecialFireGameInputProcessor(this)

        this.inputProcessorArray[Canvas.RIGHT] = SpecialRightGameInputProcessor(this)

        //-key == Canvas.LEFT
        this.inputProcessorArray[Canvas.LEFT] = SpecialLeftGameInputProcessor(this)

        this.inputProcessorArray[Canvas.KEY_NUM0] = Special1GameInputProcessor(this)

        this.inputProcessorArray[Canvas.KEY_POUND] = Special2GameInputProcessor(this)

        /*
       (key == Canvas.KEY_NUM5)
       {
       } else if (key == Canvas.KEY_NUM7)
       {
       } else if (key == Canvas.KEY_NUM9)
       {
       } else if ((key == Canvas.KEY_STAR || key == Canvas.KEY_NUM3))
       {
       }
         */
        GameInputProcessorUtil.init(this.inputProcessorArray)
    }

//    private int lastSize = -1

    @Synchronized open public fun processInput2(allbinaryLayerManager: AllBinaryLayerManager) {
        //this.workSpecialIndex = this.minSpecialIndex

        val list: BasicArrayList = this.getGameKeyEventList()
        val size: Int = list.size()
//        if(size != lastSize) {
//            this.logUtil.put(StringMaker().append("Size: ").append(size).toString(), this, "processInput")
//            lastSize = size
//        }

        //if (this.isSingleKeyProcessing || this.timeHelper.isTime())
        //{
        var key: Int = 0
        var gameKeyEvent: GameKeyEvent

        for(index in 0 until size) {
            gameKeyEvent = list.get(index) as GameKeyEvent
            key = gameKeyEvent.getKey()

            inputProcessorArray[key].process(allbinaryLayerManager, gameKeyEvent)
        }
        //this.updateSpecialAnimation()
//      }

        //updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta)
        updateGDObject(1000)
        VelocityUtil.reduceX(this.velocityInterface, 90, 100)
    }

    open public fun terrainEvent(dx: Int, dy: Int, geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt;, geographicMapCellPosition: GeographicMapCellPosition) {
    }

    open public fun terrainMove(geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt;, geographicMapCellTypeArray: Array&lt;GeographicMapCellType&gt;, dx: Int, dy: Int) {
        this.platformCharacterBehavior.terrainMove(this, geographicMapInterfaceArray, dx, dy)
    }

    open public fun terrainLand() {
        //this.specialAnimationInterfaceArray[LEGS_ANIMATION].setFrame(STANDARD_FRAME)
    }

    open public fun move() {
        try {
            if(this.allBinaryGameLayerManagerP == AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER) {
                this.logUtil.put(StringMaker().append("2LayerManager was null: ").append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(this.allBinaryGameLayerManagerP).toString(), this, "move")
                return
            }

            val geographicMapCompositeInterface: GeographicMapCompositeInterface = this.allBinaryGameLayerManagerP as GeographicMapCompositeInterface

            val geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt; = geographicMapCompositeInterface.getGeographicMapInterface()

            if(geographicMapInterfaceArray != BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY) {
                this.platformGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, this)
            } else {
                //this.logUtil.putF("Map was null, this, "move")
            }

        } catch (e: Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "move", e)
        }
    }

    open public fun up() {
        //this.logUtil.putF("Jump", this, "processInput")

        this.platformGameBehavior.up(this.velocityInterface as VelocityProperties, acceleration, initialJumpBehavior, 4)

    }

    open public fun upp() {
    }

    open public fun right() {
        try {
            if(this.allBinaryGameLayerManagerP == AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER) {
                this.logUtil.put(StringMaker().append("3LayerManager was null: ").append(this.getName()).append(CommonSeps.getInstance().SPACE).append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(this.allBinaryGameLayerManagerP).toString(), this, "move")
                return
            }

            val geographicMapCompositeInterface: GeographicMapCompositeInterface = this.allBinaryGameLayerManagerP as GeographicMapCompositeInterface

            val geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt; = geographicMapCompositeInterface.getGeographicMapInterface()

            if(geographicMapInterfaceArray != BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY) {
                this.platformGameBehavior.right(geographicMapInterfaceArray, this.velocityInterface, this)
            }
        } catch (e: Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "right", e)
        }
    }

   open public fun rightp() {
      this.velocityInterface.getVelocityXBasicDecimalP().add(-this.acceleration.getReverse())
      this.velocityInterface.limitXYToForwardAndReverseMaxVelocity()

      //this.logUtil.putF("Right: dx: " + this.velocityInterface.getVelocityXBasicDecimalP().getUnscaled(), this, "processInput")

      //this.getVelocityProperties().addVelocity(this.acceleration.getReverse(), 180)

      this.angle = 0
      lastDirectionKey = Canvas.RIGHT

   }

   open public fun leftp() {
       this.velocityInterface.getVelocityXBasicDecimalP().add(this.acceleration.getReverse())
       this.velocityInterface.limitXYToForwardAndReverseMaxVelocity()

       //this.logUtil.putF("Left: dx: " + this.velocityInterface.getVelocityXBasicDecimalP().getUnscaled(), this, "processInput")

       //this.getVelocityProperties().addVelocity(this.acceleration.getReverse(), 0)
       //this.specialAnimationArray[this.specialIndex++] = LEFT

       this.angle = 180
       lastDirectionKey = Canvas.LEFT

    }

    open public fun left() {
        try {
            if(this.allBinaryGameLayerManagerP == AllBinaryGameLayerManager.NULL_ALLBINARY_LAYER_MANAGER) {
                this.logUtil.put(StringMaker().append("4LayerManager was null: ").append(this.getName()).append(CommonSeps.getInstance().SPACE).append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(this.allBinaryGameLayerManagerP).toString(), this, "move")
                return
            }

            val geographicMapCompositeInterface: GeographicMapCompositeInterface = this.allBinaryGameLayerManagerP as GeographicMapCompositeInterface

            val geographicMapInterfaceArray: Array&lt;BasicGeographicMap&gt; = geographicMapCompositeInterface.getGeographicMapInterface()

            if(geographicMapInterfaceArray != BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY) {
                this.platformGameBehavior.left(geographicMapInterfaceArray, this.velocityInterface, this)
            }

        } catch (e: Exception) {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "left", e)
        }
    }

   open public fun inputFrames() {
      this.platformGameBehavior.inputFrames(this.velocityInterface)

      //TWB - Was this supposed to be remarked
      //this.specialAnimationInterfaceArray[HEAD_ANIMATION].setFrame(this.direction.getFrameFactor())

      // this.armAnimation()

      val indexedAnimationInterface: IndexedAnimationInterface = this.getIndexedAnimationInterface()
      if (this.directionChanged <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> !this.isReadyForExplosion())
      {
         indexedAnimationInterface.setFrame(this.direction.getFrameFactor())
      }

      /*
       * int hatFrame = this.absoluteXVelocity.toInt() / hatReverseDenominator
       * int yHatFrame = (int)
       * Math.abs(this.velocityInterface.getVelocityYBasicDecimalP().getUnscaled()) /
       * hatReverseDenominator; hatFrame += yHatFrame
       *
       * if (hatFrame > TOTAL_HAT_FRAMES - 1) { hatFrame = TOTAL_HAT_FRAMES -
       * 1; }
       * this.specialAnimationInterfaceArray[HAT_ANIMATION].setFrame(hatFrame +
       * (this.direction.getFrameFactor() * TOTAL_HAT_FRAMES))
       */

//      final IndexedAnimationInterface legsIndexedAnimationInterface =
//         this.specialAnimationInterfaceArray[LEGS_ANIMATION]
//
//      if (this.platformGameBehavior.gravityActionIndex == 0  || this.platformGameBehavior.isFallingWithoutJumpAttempt)
//      {
//         int legDirectionIndex = this.direction.getFrameFactor() * TOTAL_LEG_FRAMES
//
//         if (this.movedEnoughForMovement || this.directionChanged)
//         {
//            int nextFrame = this.runFrameSequence[legsIndexedAnimationInterface.getFrame()]
//            legsIndexedAnimationInterface.setFrame(nextFrame + legDirectionIndex)
//         }
//         else if (!isMovingEnough)
//         {
//            this.specialAnimationInterfaceArray[LEGS_ANIMATION].setFrame(STANDARD_FRAME + legDirectionIndex)
//         }
//      }

    }

    open public fun armAnimation() {
//        final int armsDirectionIndex = TOTAL_ARM_FRAMES * this.direction.getFrameFactor()
//        if (this.platformGameBehavior.gravityActionIndex <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
//            this.specialAnimationInterfaceArray[ARMS_ANIMATION].setFrame(JUMP_ARMS_FRAME + armsDirectionIndex)
//        } else if (!this.movedEnoughForMovement) {
//            this.specialAnimationInterfaceArray[ARMS_ANIMATION].setFrame(armsDirectionIndex)
//        }
    }

    open public fun reset() {
        //this.specialIndex = this.minSpecialIndex

        this.platformGameBehavior.land(this.velocityInterface as VelocityProperties)
        this.velocityInterface.zero()

        //this.initPosition()

        //this.setAnimationInterface(this.getAnimationInterfaceFactoryInterface().getInstance())

        //this.getIndexedAnimationInterface().setFrame(0)
        //directionChanged = true
    }

    open public fun getSourceId(): Int {
        var id: return
    }

                        <xsl:if test="1" >

    @Synchronized open public fun processInput(allbinaryLayerManager: AllBinaryLayerManager) {
        try
        {
            this.processInput2(allbinaryLayerManager)

            if (isSingleKeyProcessing)
            {
                this.playerGameInput.clear()
            }
            else
            {
                this.playerGameInput.update()
            }

        }
        catch (e: Exception)
        {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, "processInput")
            //this.logUtil.putF("Danger Danger Danger ^^^%%$*($)*@)!$", this, "processInput", e)
        }

    }

    open public fun getPlayerGameInput(): PlayerGameInput {
        return this.playerGameInput
    }

    open public fun implmentsGameInputInterface(): Boolean {
        var true: return
    }

                        </xsl:if>
                        <xsl:if test="0" >

    @Synchronized open public fun processInput(allbinaryLayerManager: AllBinaryLayerManager) {
        this.processInput2(allbinaryLayerManager)
    }

                        </xsl:if>

                    </xsl:if>
                    //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> - END
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>

    open public fun setValue(value: Int) {
        (this.getDimensionalBehavior().getAnimationBehavior() as GDSliderAnimationBehavior).setValue(value)
    }

    open public fun Value(): Int {
        return (this.getDimensionalBehavior().getAnimationBehavior() as GDSliderAnimationBehavior).Value()
    }

        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >

    open protected fun setSelected(selected: Boolean) {
        this.selected = selected
    }

    open public fun isSelected(): Boolean {
        return this.selected
    }

    open public fun implmentsTickableInterface(): Boolean {
        var true: return
    }

<!--    int ox = Integer.MAX_VALUE;
    int oy = Integer.MAX_VALUE;-->
    open public fun processTick(allBinaryLayerManager: AllBinaryLayerManager) {
//    private final String PLAYER = "Player"
//        if(this.getName().indexOf<xsl:text disable-output-escaping="yes" > as PLAYER&gt;</xsl:text>= 0) {
//            final int size = this.initIndexedAnimationInterfaceArray.length
//            RotationAnimation rotationAnimation
//            for(index in 0 until size) {
//                rotationAnimation = (this.initIndexedAnimationInterfaceArray[index] as RotationAnimation)
//                //rotationAnimation.nextRotationX()
//                //rotationAnimation.nextRotationZ()
//            }
//        }

        if(this.gdObject.isBehaviorEnabledArray[gdBehaviorUtil.PATHFINDING_BEHAVIOR_INDEX]) {

<!--            if(this.x != this.ox || this.y != this.oy) {
                this.ox = this.x;
                this.oy = this.y;
                this.logUtil.put(new StringMaker().append(this.getName()).append(commonSeps.SPACE).append(this.x).append(commonSeps.SPACE).append(this.y).toString(), this, GameStrings.getInstance().PROCESS_TICK);
            }-->

            this.captionAnimationHelper.tick()
            //if(!this.isDestination(this.targetGDGameLayer)) {
                //this.pathAnimation = NullAnimationFactory.getFactoryInstance().getInstance(0)
            //}
            this.waypointBehaviorBase.processTick(allBinaryLayerManager)
        }
    }

    open public fun setAllBinaryGameLayerManager(allBinaryGameLayerManager: AllBinaryGameLayerManager) {
        super.setAllBinaryGameLayerManager(allBinaryGameLayerManager)

        PathFindingThreadPool.getInstance().clear()

        if(this.gdObject.hasBehaviorArray[gdBehaviorUtil.PATHFINDING_BEHAVIOR_INDEX]) {

            val geographicMapCompositeInterface: GeographicMapCompositeInterface = this.allBinaryGameLayerManagerP as GeographicMapCompositeInterface
            val basicGeographicMapArray: Array&lt;BasicGeographicMap&gt; = geographicMapCompositeInterface.getGeographicMapInterface()

            if (basicGeographicMapArray != BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY) {
                val geographicMapInterface: BasicGeographicMap = basicGeographicMapArray[0]

//            final AllBinaryTiledLayer tiledLayer = geographicMapInterface.getAllBinaryTiledLayer()
//            final TileLayerPositionIntoViewPosition viewPosition2
//                = this.getViewPosition() as TileLayerPositionIntoViewPosition
//            viewPosition2.setTiledLayer(tiledLayer)
                this.updateWaypointBehavior(geographicMapInterface)
                //System.out.println("map: " + this)
            } else {
                //System.out.println("no map: " + this)
            }

            //(this.initPathAnimation as PathAnimation).setAllBinaryGameLayerManager(allBinaryGameLayerManager)

        }

    }

    open public fun setTarget(targetGameLayer: PathFindingLayerInterface) {
        this.pathAnimation = this.initPathAnimation
        this.captionAnimation = this.captionAnimationHelper

        val waypointBehaviorBase: WaypointBehaviorBase = this.getWaypointBehavior()
        waypointBehaviorBase.setTarget(targetGameLayer as PathFindingLayerInterface)
    }

    open public fun updateWaypointBehavior(geographicMapInterface: BasicGeographicMap) {
        val hashtable: ABHashtable = ABHashtable()
        hashtable.put(groupCommonFactory.ID, this.getGroupInterface())
        hashtable.put(Layer.ID, this)
        hashtable.put(AllBinaryGameLayerManager.ID, allBinaryGameLayerManagerP)

        this.setWaypointBehavior(
                GDWaypointBehavior2(
                        this,
                        waypointLayerInterfaceFactoryInterface.getNextInstance(
                                hashtable, x, y, z) as CollidableDestroyableDamageableLayer)
                )

        this.updateWaypointBehavior2(geographicMapInterface)

        val waypoint: WaypointBase =
            if (//isHTML) MultipassNoCacheWaypoint(this, AttackSound.getInstance()) else NoCacheWaypoint(this, AttackSound.getInstance())

        waypoint.setAllBinaryGameLayerManager(this.allBinaryGameLayerManagerP)
        this.waypointBehaviorBase.setWaypoint(waypoint)

        //this.initRangeHack()
    }

    open public fun updateWaypointBehavior2(geographicMapInterface: BasicGeographicMap) {
        this.geographicMapCellPositionArea.update(geographicMapInterface)
    }

    open public fun getHudPaintable(): SelectionHudPaintable {
        var null: return
    }

    open public fun getSourceId(): Int {
        var 0: return
    }

    open public fun getEndGeographicMapCellPositionList(): BasicArrayList {
        val geographicMapCompositeInterface: GeographicMapCompositeInterface =
            this.allBinaryGameLayerManagerP as GeographicMapCompositeInterface
        val geographicMapInterface: BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0]

        geographicMapCellPositionArea.update(geographicMapInterface)

        return this.geographicMapCellPositionArea.getOccupyingGeographicMapCellPositionList()
    }

    open public fun getGeographicMapCellPositionArea(): GeographicMapCellPositionArea {
        var geographicMapCellPositionArea: return
    }

    open public fun shouldHandleStartSameAsEnd(): Boolean {
        var true: return
    }

    open public fun handleCost(ownerLayer: PathFindingLayerInterface) {
    }

    open public fun getWaypointBehavior(): WaypointBehaviorBase {
        return this.waypointBehaviorBase
    }

    open protected fun setWaypointBehavior(unitWaypointHelper: WaypointBehaviorBase) {
        this.waypointBehaviorBase = unitWaypointHelper
    }

    open public fun getParentLayer(): PathFindingLayerInterface {
        return NullPathFindingLayer.NULL_PATH_FINDING_LAYER
    }

    open public fun getRTSLayer2LogHelper(): RTSLayer2LogHelper {
        return this.rtsLayer2LogHelper
    }

    open public fun getWaypointLogHelper(): WaypointLogHelper {
        return this.waypointLogHelper
    }

    open public fun getWaypoint2LogHelper(): Waypoint2LogHelper {
        return this.waypoint2LogHelper
    }

    open public fun getWaypointRunnableLogHelper(): WaypointRunnableLogHelper {
        return this.waypointRunnableLogHelper
    }

    open public fun shouldAddWaypointFromBuilding(): Boolean {
        var false: return
    }

    open public fun getCaptionAnimationHelper(): CaptionAnimationHelperBase {
        var captionAnimationHelper: return
    }

    open public fun isShowMoreCaptionStates(): Boolean {
        return this.showMoreCaptionStates
    }

    //private final String REMOVING_LAST_CELLPOSITION = "Removing last cell position in path: "
    open public fun init(geographicMapCellHistory: GeographicMapCellHistory, geographicMapCellPositionBasicArrayList: BasicArrayList) {
        //System.out.println("geographicMapCellPositionBasicArrayList: " + geographicMapCellPositionBasicArrayList.size())
        val geographicMapCompositeInterface: GeographicMapCompositeInterface = this.allBinaryGameLayerManagerP as GeographicMapCompositeInterface
        val geographicMapInterface: BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0]

        val geographicMapCellPosition: GeographicMapCellPosition = geographicMapCellPositionBasicArrayList.get(geographicMapCellPositionBasicArrayList.size() - 1) as GeographicMapCellPosition
        val geographicMapCellType: RaceTrackGeographicMapCellType = geographicMapInterface.getCellTypeAt(geographicMapCellPosition) as RaceTrackGeographicMapCellType
        val basicTopViewGeographicMapCellTypeFactory: BasicTopViewGeographicMapCellTypeFactory = geographicMapInterface.getGeographicMapCellTypeFactory() as BasicTopViewGeographicMapCellTypeFactory
        if(geographicMapCellType.getTravelCost() == basicTopViewGeographicMapCellTypeFactory.BLOCK_CELL_TYPE.cost) {
            geographicMapCellPositionBasicArrayList.remove(geographicMapCellPosition)
            //this.logUtil.putF(REMOVING_LAST_CELLPOSITION + geographicMapCellPosition, this, this.commonStrings.INIT)
        }

        geographicMapCellHistory.trackAll(geographicMapCellPositionBasicArrayList)

    }

    open public fun getCurrentGeographicMapCellPosition(): GeographicMapCellPosition {
        val geographicMapCompositeInterface: GeographicMapCompositeInterface = this.allBinaryGameLayerManagerP as GeographicMapCompositeInterface
        val geographicMapInterface: BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0]

        val geographicMapCellPosition: GeographicMapCellPosition =
            geographicMapInterface.getCellPositionAtXYNoThrow(
            this.x + this.getHalfWidth(),
            this.y + this.getHalfHeight())

        //This should never happen remove when bug is found
//        final RTSRaceTrackGeographicMap raceTrackGeographicMap =
//            geographicMapInterface as RTSRaceTrackGeographicMap
//
//        if(!raceTrackGeographicMap.isValid(geographicMapCellPosition))
//        {
//            throw Exception("Position is not really on the map: " + geographicMapCellPosition)
//        }

        var geographicMapCellPosition: return
    }

    open public fun getTopLeftGeographicMapCellPosition(): GeographicMapCellPosition {
        val geographicMapCompositeInterface: GeographicMapCompositeInterface = this.allBinaryGameLayerManagerP as GeographicMapCompositeInterface
        val geographicMapInterface: BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0]

        val geographicMapCellPosition: GeographicMapCellPosition =
            geographicMapInterface.getCellPositionAtXYNoThrow(
            this.x,
            this.y)

        var geographicMapCellPosition: return
    }

    open public fun getMoveOutOfBuildAreaPath(geographicMapCellPosition: GeographicMapCellPosition): BasicArrayList {
        return BasicArrayListUtil.getInstance().getImmutableInstance()
    }

    open public fun setClosestGeographicMapCellHistory(pathsList: BasicArrayList) {
    }

    open public fun teleportTo(geographicMapCellPosition: GeographicMapCellPosition) {
    }

    open public fun setLoad(resource: Int) {
    }

    open public fun getSurroundingGeographicMapCellPositionList(): BasicArrayList {
        val geographicMapCompositeInterface: GeographicMapCompositeInterface =
            this.allBinaryGameLayerManagerP as GeographicMapCompositeInterface
        val geographicMapInterface: BasicGeographicMap = geographicMapCompositeInterface.getGeographicMapInterface()[0]

        geographicMapCellPositionArea.update(geographicMapInterface)

        return geographicMapCellPositionArea.getSurroundingGeographicMapCellPositionList()
    }

    open public fun trackTo(reason: String) {
        val nextUnvisitedPathGeographicMapCellPosition: GeographicMapCellPosition = this.waypointBehaviorBase.getNextUnvisitedPathGeographicMapCellPosition()
        val point: GPoint = nextUnvisitedPathGeographicMapCellPosition.getMidPoint()

        val dx: Int = (this.getXP() + this.getHalfWidth()) + point.getX()
        val dy: Int = (this.getYP() + this.getHalfHeight()) + point.getY()

        this.rtsLogHelper.trackTo(this, nextUnvisitedPathGeographicMapCellPosition, dx, dy, reason)

        this.trackToDXY(dx, dy)

    }

    open public fun trackToDXY(dx: Int, dy: Int) {
        val angleOfTarget: Int = 0
        this.trackTo(dx, dy, angleOfTarget)

    }

    private fun trackTo(dx: Int, dy: Int, targetAngle: Int) {
        //If colliding with a game object then don't try to turn since in chase mode
        val list: BasicArrayList = this.getWaypointBehavior().getSteeringVisitorList()

        if(list.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0)
        {
            //this.logUtil.putF("Chasing", this, "trackTo")

            for(index in list.size() - 1 downTo 0)
            {
                val steeringVisitor: SteeringVisitor = list.get(index) as SteeringVisitor

                val object: Object = steeringVisitor.visit(null)

                if(object == null)
                {
                    list.remove(index)
                }
            }

            this.fireOrMove()
        }
        else if(!this.turnTo(dx, dy, targetAngle))
        {
            this.fireOrMove()
        }
    }

    private val MOVE: String = "Moving"

    open protected fun fireOrMove() {
        //this.logUtil.putF("Move/Attack: trackingWaypoint: " + this.trackingWaypoint + " sensorAction: " + this.sensorAction + " currentTargetDistance &gt;= longWeaponRange " + this.currentTargetDistance + "&gt;=" + this.longWeaponRange, this, "trackTo")

        val gameKeyEventFactory: GameKeyEventFactory = GameKeyEventFactory.getInstance()

        // Move if going to waypoint, evading, or towards target
        if (this.getWaypointBehavior().needToMove())
        {
            this.rtsLayer2LogHelper.steeringUp(this)

            if(this.showMoreCaptionStates <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> !this.captionAnimationHelper.isShowing())
            {
                this.captionAnimationHelper.update(MOVE, this.basicColorFactory.GREEN)
            }

            //this.getGameKeyEventList().add(gameKeyEventFactory.getInstance(this, Canvas.UP))
            this.forward()
        }
        else
        {
            this.captionAnimationHelper.update(CommonPhoneStrings.getInstance().FIRE, this.basicColorFactory.RED)

            // int anotherTargetDistance = DistanceUtil.getDistance(this, this.currentTargetLayerInterface)

            this.rtsLayer2LogHelper.steeringFireOrStop(this)

            //this.logUtil.putF("Attacking: " + this.currentTargetLayerInterface.getName() + " anotherTargetDistance: " + anotherTargetDistance + " Range: " + this.currentTargetDistance, this, "trackTo")

            //this.logUtil.put(TrackingEventHandler.getInstance().toString(), this, "processTargeting")

            //this.logUtil.putF("Attacking: " + this.currentTargetLayerInterface.getName() + " X: " + this.currentTargetLayerInterface.getX() + " ? " + this.x + " Y: " + this.currentTargetLayerInterface.getY() + " ? " + this.y, this, "processTargeting")
            //this.logUtil.putF("Attacking: " + this.currentTargetLayerInterface.getName() + " at Range: " + this.currentTargetDistance + "&gt;=" + this.longWeaponRange, this, "processTargeting")

            this.allStop()
            //this.getGameKeyEventList().add(gameKeyEventFactory.getInstance(this, Canvas.KEY_NUM0))
            TrackingEventHandler.getInstance().fireEvent(this.getTrackingEvent())
        }
    }

    private fun handleDeltalX(dx: Int, dy: Int) {
        val nextUnvisitedPathGeographicMapCellPosition: GeographicMapCellPosition = this.waypointBehaviorBase.getNextUnvisitedPathGeographicMapCellPosition()
        if (dx <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
            this.movementAngle = this.angleFactory.LEFT
            this.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition

        } else {
            this.movementAngle = this.angleFactory.RIGHT
            this.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition

        }

        this.rtsLogHelper.handle(this, this.movementAngle)

    }

    private fun handleDeltalY(dx: Int, dy: Int) {
        val nextUnvisitedPathGeographicMapCellPosition: GeographicMapCellPosition = this.waypointBehaviorBase.getNextUnvisitedPathGeographicMapCellPosition()
        if (dy <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
            this.movementAngle = this.angleFactory.UP
            this.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition

        } else {
            this.movementAngle = this.angleFactory.DOWN
            this.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition

        }

        this.rtsLogHelper.handle(this, this.movementAngle)

    }

    private fun turnTo(dx: Int, dy: Int, targetAngle: Int): Boolean {
        // int angleOfTarget = NoDecimalTrigTable.antiTan(dx, dy)

        val nextUnvisitedPathGeographicMapCellPosition: GeographicMapCellPosition = this.waypointBehaviorBase.getNextUnvisitedPathGeographicMapCellPosition()

        if(nextUnvisitedPathGeographicMapCellPosition == SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {
            //this.logUtil.put(StringMaker().append(this.getName()).append(" - do not turn or move until we have the first unvisited cell position").toString(), this, "turnTo")
            var true: return
        }

        val currentGeographicMapCellPosition: GeographicMapCellPosition = this.getCurrentGeographicMapCellPosition()

        var evading: Boolean = false

        // Run until out of sensor range
//        if (this.getUnitWaypointBehavior().getSensorAction() == SensorActionFactory.getInstance().EVADE)
//        {
//            this.rtsLogHelper.evade(this)
//
//            evading = true
//            targetAngle += 180
//        }

        //final int angleOfTarget = FrameUtil.getInstance().adjustAngleToFrameAngle(targetAngle)
        //final int angleOfTarget2 = angleOfTarget
        //final int angleOfTarget2 = angleOfTarget / 10 * 10
        //final int angleOfTarget2 = AngleFactory.getInstance().getClosestDirection(angleOfTarget).getValue()

        //final AngleInfo angleInfo = this.rotationAnimationInterface.getAngleInfo()
        //final AngleInfo angleInfo = (this.indexedAnimationInterfaceArray[0] as RotationAnimation).getAngleInfo()
        //final int angle = FrameUtil.getInstance().adjustAngleToFrameAngle(angleInfo.getAngle() - 270)

        val angle: Int = gdObject.angle

        //final int angle = angleInfo.getAngle()

        //if (this.getUnitWaypointBehavior().isWaypointListEmptyOrOnlyTargets())

        this.rtsLogHelper.turnTo(this, dx, dy, null, angle, this.movementAngle, evading, targetAngle)

        val geographicMapCellHistory: GeographicMapCellHistory = this.waypointBehaviorBase.getCurrentGeographicMapCellHistory()

        //final GameKeyEventFactory gameKeyEventFactory = GameKeyEventFactory.getInstance()

        //int deltaAngle = closestDirectionAngle.getValue() - angle
//        int deltaAngle = angleOfTarget2 - angle
//        int absoluteDeltaAngle = Math.abs(deltaAngle)
          //absoluteDeltaAngle == 0 ||
          //() ||
        if(Math.abs(dx) <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 3 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> Math.abs(dy) <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 3) {
        //if(dx == 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> dy == 0) {

            this.rtsLogHelper.doneMoving(this)

            //TWB - This is probably covering up and issue with the existing visit logic.
            if(geographicMapCellHistory.visit(currentGeographicMapCellPosition)) {
                this.waypoint2LogHelper.processWaypointTrackedVisit(this, currentGeographicMapCellPosition)
            } else {
                val reason: String =
                    stringUtil.EMPTY_STRING
                    //StringMaker().append(" - finished moving without progress: ").append(geographicMapCellHistory.getVisited()).toString()
                this.waypoint2LogHelper.processWaypointTrackedWithoutProgress(this, reason)
                this.getWaypointBehavior().updatePathOnTargetMove(reason)
            }

            var true: return

        } else if(Math.abs(dx) <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 5 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> Math.abs(dy) <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 5) {

            this.rtsLogHelper.closeEnough(this)

            //TWB - This is probably covering up and issue with the existing visit logic.
            if(geographicMapCellHistory.visit(nextUnvisitedPathGeographicMapCellPosition)) {
                this.waypoint2LogHelper.processWaypointTrackedVisit(this, nextUnvisitedPathGeographicMapCellPosition)
            } else {
                val reason: String =
                    stringUtil.EMPTY_STRING
                    //StringMaker().append(" - finished moving without progress: ").append(geographicMapCellHistory.getVisited()).toString()
                this.waypoint2LogHelper.processWaypointTrackedWithoutProgress(this, reason)
                this.getWaypointBehavior().updatePathOnTargetMove(reason)
            }

            this.setPosition(this.x + dx, this.y + dy, z)

            var true: return

        } else if(this.movementAngle.getValue() == angle) {

            //final BasicArrayList occupyingList = this.getEndGeographicMapCellPositionList()
            val pathList: BasicArrayList = geographicMapCellHistory.getTracked()
            if(pathList.contains(currentGeographicMapCellPosition)
//                ||
//                geographicMapCellHistory.getTotalVisited() == 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> GeographicMapDirectionUtil.getInstance().getEightDirectionFromCellPositionToAdjacentCellPosition(currentGeographicMapCellPosition, pathList.get(0) as GeographicMapCellPosition) != DirectionFactory.getInstance().NOT_BORDERED_WITH
                ) {

            if(dx <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.movementAngle == this.angleFactory.LEFT) {
                this.rtsLogHelper.movingLeft(this)
                var false: return
            }
            if(dx <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.movementAngle == this.angleFactory.RIGHT) {
                this.rtsLogHelper.movingRight(this)
                var false: return
            }
            if(dy <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.movementAngle == this.angleFactory.UP) {
                this.rtsLogHelper.movingUp(this)
                var false: return
            }
            if(dy <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.movementAngle == this.angleFactory.DOWN) {
                this.rtsLogHelper.movingDown(this)
                var false: return
            }

            } else {
                val reason: String =
                    stringUtil.EMPTY_STRING
                    //StringMaker().append(commonSeps.SPACE).append(geographicMapCellHistory.getTotalVisited()).append(commonSeps.SPACE).append(currentGeographicMapCellPosition).append(" - trying to move but not on path: ").append(pathList).toString()
                this.rtsLogHelper.notOnPath(this, geographicMapCellHistory, currentGeographicMapCellPosition, pathList)
                this.getWaypointBehavior().updatePathOnTargetMove(reason)
                var true: return
            }

            this.rtsLogHelper.currentMoveEnded(this)

            if(this.movementAngle == this.angleFactory.LEFT ||
                this.movementAngle == this.angleFactory.RIGHT) {
                this.handleDeltalY(dx, dy)
            } else if(this.movementAngle == this.angleFactory.UP ||
                this.movementAngle == this.angleFactory.DOWN) {
                this.handleDeltalX(dx, dy)
            }

            var true: return
        //} else if(absoluteDeltaAngle <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> ANGLE_INCREMENT) {

            //return false
        } else {
            //this.slightAngle = angleOfTarget - angle

            if(nextUnvisitedPathGeographicMapCellPosition != SimpleGeographicMapCellPositionFactory.NULL_GEOGRAPHIC_MAP_CELL_POSITION) {

                if(this.steeringInsideGeographicMapCellPosition != nextUnvisitedPathGeographicMapCellPosition) {

                    if (Math.abs(dx) <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> Math.abs(dy) <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> dy != 0) {
                        this.handleDeltalY(dx, dy)
                    } else if (dx != 0) {
                        this.handleDeltalX(dx, dy)
                    } else {
                        this.handleDeltalY(dx, dy)
                        //throw RuntimeException()
                    }

                }

                var deltaAngle2: Int = this.movementAngle.getValue() - angle
                if (deltaAngle2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    this.rtsLogHelper.rotateRight(this)
                    //this.getGameKeyEventList().add(gameKeyEventFactory.getInstance(this, Canvas.RIGHT))
                    this.right()
                } else {
                    this.rtsLogHelper.rotateLeft(this)
                    //this.getGameKeyEventList().add(gameKeyEventFactory.getInstance(this, Canvas.LEFT))
                    this.left()
                }

                var true: return

            } else {
                this.rtsLogHelper.noRotation(this)
            }

            //System.out.println(allowing movement outside of logic?")
            var true: return
            //return false
        }

    }

    override public fun isWaypointListEmptyOrOnlyTargets(): Boolean {
        var false: return
    }

    override public fun getTrackingEvent(): TrackingEvent {
        var null: return
    }

    override public fun buildingChase(allbinaryLayer: AllBinaryLayer, cellPosition: GeographicMapCellPosition): Boolean {
        var false: return
    }

    override public fun allStop() {
    }

<!--    public boolean isDestination(final GDGameLayer gdGameLayer) throws Exception {

        if(gdGameLayer == null) {
            return false;
        }

        final WaypointBehaviorBase waypointBehaviorBase = this.getWaypointBehavior();

        if(waypointBehaviorBase.isRunning()) {
            //System.out.println("isDestination - unknown as path is processing - true");
            return true;
        }

        final BasicArrayList waypointPathList = waypointBehaviorBase.getWaypointPathsList();

        if(waypointPathList == null || waypointPathList.size() == 0) {
            //System.out.println("isDestination no path - false");
            return false;
        }

        final GDCustomGameLayer destinationGDCustomGameLayer = (GDCustomGameLayer) gdGameLayer;
        final BasicArrayList occupyPathList = destinationGDCustomGameLayer.getEndGeographicMapCellPositionList();
        final BasicArrayList pathList = (BasicArrayList) waypointPathList.get(waypointPathList.size() - 1);
        final GeographicMapCellPosition lastCellPosition = (GeographicMapCellPosition) pathList.get(pathList.size() - 1);
        if(occupyPathList.contains(lastCellPosition)) {
            //System.out.println("isDestination - target is the path destination - true");
            return true;
        }
        //System.out.println("isDestination not target - false");
        return false;
    }-->

    public var direction: Int = 0
    open public fun forward() {
        //this.logUtil.put(this.getName(), this, "forward")

        //TWB - temp hack for path finding to work
        val Enemies: org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies = (org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies) gdObject
        if (this.direction == 0) {
            Enemies.setX(Enemies.x + -(Enemies.speed))
        } else if (this.direction == 1) {
            Enemies.setX(Enemies.x + (Enemies.speed))
        } else if (this.direction == 2) {
            Enemies.setY(Enemies.y + -(Enemies.speed))
        } else if (this.direction == 3) {
            Enemies.setY(Enemies.y + (Enemies.speed))
        }
        this.updatePosition()

    }

    override public fun right() {
        //this.logUtil.put(this.getName(), this, "right")

        if(this.direction == 0) {
            this.direction = 2
        } else if(this.direction == 1) {
            this.direction = 3
        } else if(this.direction == 2) {
            this.direction = 1
        } else if(this.direction == 3) {
            this.direction = 0
        }
        //TWB - temp hack for path finding to work
        val Enemies: org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies = (org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies) gdObject
        Enemies.direction = this.direction
        val animationName: String = gdObject.getAnimation(this.gdObject.ObjectName() + gameGlobals.walkAnimationArray[this.direction])
        if(gdObject.setAnimation(animationName)) this.resetAnimation()

        this.updateAngle()

    }

    override public fun left() {
        //this.logUtil.put(this.getName(), this, "left")

        if(this.direction == 0) {
            this.direction = 3
        } else if(this.direction == 1) {
            this.direction = 2
        } else if(this.direction == 2) {
            this.direction = 0
        } else if(this.direction == 3) {
            this.direction = 1
        }
        //TWB - temp hack for path finding to work
        val Enemies: org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies = (org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies) gdObject
        Enemies.direction = this.direction
        val animationName: String = gdObject.getAnimation(this.gdObject.ObjectName() + gameGlobals.walkAnimationArray[this.direction])
        if(gdObject.setAnimation(animationName)) this.resetAnimation()

        this.updateAngle()

    }

    open public fun updateAngle() {
        val Enemies: org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies = (org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies) gdObject
        val angleFactory: AngleFactory = AngleFactory.getInstance()
        if (this.direction == 0) {
            Enemies.setAngle(angleFactory.LEFT.getValue(), this)
        } else if (this.direction == 1) {
            Enemies.setAngle(angleFactory.RIGHT.getValue(), this)
        } else if (this.direction == 2) {
            Enemies.setAngle(angleFactory.UP.getValue(), this)
        } else if (this.direction == 3) {
            Enemies.setAngle(angleFactory.DOWN.getValue(), this)
        }
    }

        </xsl:if>


        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            open public fun handleLayout<xsl:value-of select="$layoutIndex" />() {
            <xsl:for-each select="objects" >

                <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" />
                    <xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >

                        <xsl:if test="1" >
                        this.playerGameInput = PlayerGameInput(this.getGameKeyEventList(), 0)

                        //if (allBinaryGameLayerManager.getGameInfo().getGameType() != GameTypeFactory.getInstance().BOT)
                        //{
                            GameKeyEventHandler.getInstance().addListener(playerGameInput, playerGameInput.getPlayerInputId())
                            //AllBinaryGameCanvas.addPlayerGameInput((this.playerLayer as PlayerGameInputCompositeInterface).getPlayerGameInput())
                        //}

                        </xsl:if>

                        this.initInputProcessors()
                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>

            }
        </xsl:for-each>

                }

    </xsl:template>

</xsl:stylesheet>
