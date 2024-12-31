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
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDGlobalCalls.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/layer/GDCustomGameLayerCollisionHack.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

        <xsl:variable name="foundOtherViewPosition" ><xsl:for-each select="layouts" ><xsl:for-each select="objects" ><xsl:for-each select="behaviors" ><xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:for-each></xsl:variable>
        
                package org.allbinary.game.layer;

        import java.util.Hashtable;

        import javax.microedition.lcdui.Canvas;
        import javax.microedition.lcdui.Graphics;
        import javax.microedition.lcdui.game.TiledLayer;

        import org.allbinary.animation.Animation;
        import org.allbinary.animation.AnimationInterfaceFactoryInterface;
        import org.allbinary.animation.IndexedAnimationInterface;
        import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
        import org.allbinary.direction.Direction;
        import org.allbinary.direction.DirectionFactory;
        import org.allbinary.game.canvas.GDGameGlobals;
        import org.allbinary.game.GameTypeFactory;
//        import org.allbinary.game.behavior.platformer.GeographicMapPlatformGameLayerBehavior;
//        import org.allbinary.game.behavior.platformer.InitialJumpBehavior;
//        import org.allbinary.game.behavior.platformer.PlatformCharacterBehavior;
//        import org.allbinary.game.behavior.platformer.PlatformCharacterInterface;
//        import org.allbinary.game.behavior.platformer.PlayerPlatformCharacterBehavior;
        import org.allbinary.game.configuration.feature.Features;
        import org.allbinary.game.configuration.feature.InputFeatureFactory;
        import org.allbinary.game.identification.Group;
        import org.allbinary.game.layer.form.GDSliderAnimationBehavior;
        import org.allbinary.game.layer.form.GDTextInputAnimationBehavior;
        import org.allbinary.game.input.GameInputProcessor;
        import org.allbinary.game.input.GameInputProcessorUtil;
        import org.allbinary.game.input.GameKeyEventSourceInterface;
        import org.allbinary.game.input.InputFactory;
        import org.allbinary.game.input.PlayerGameInput;
        import org.allbinary.game.input.event.GameKeyEvent;
        import org.allbinary.game.input.event.GameKeyEventHandler;
        import org.allbinary.game.layer.special.Special1GameInputProcessor;
        import org.allbinary.game.layer.special.Special2GameInputProcessor;
        import org.allbinary.game.layer.special.SpecialFireGameInputProcessor;
        import org.allbinary.game.layer.special.SpecialLeftGameInputProcessor;
        import org.allbinary.game.layer.special.SpecialRightGameInputProcessor;
        import org.allbinary.game.layer.special.SpecialUpGameInputProcessor;
        import org.allbinary.game.layer.special.TempMapMovementBehavior;
        import org.allbinary.game.layer.special.TempMovementBehaviorFactory;        
        import org.allbinary.game.layout.GDNode;
        import org.allbinary.game.layer.special.TempGameLayerUtil;
        import org.allbinary.game.layout.GDObject;
        import org.allbinary.game.multiplayer.layer.RemoteInfo;
        import org.allbinary.game.physics.acceleration.BasicAccelerationProperties;
        import org.allbinary.game.physics.velocity.VelocityProperties;
        import org.allbinary.game.view.StaticTileLayerIntoPositionViewPosition;
        import org.allbinary.graphics.GPoint;
        import org.allbinary.graphics.Rectangle;
        import org.allbinary.graphics.color.BasicColorFactory;
        import org.allbinary.layer.AllBinaryLayer;
        import org.allbinary.layer.AllBinaryLayerManager;
        import org.allbinary.logic.string.CommonSeps;
        import org.allbinary.logic.string.CommonStrings;
        import org.allbinary.logic.string.StringMaker;
        import org.allbinary.logic.communication.log.LogFactory;
        import org.allbinary.logic.communication.log.LogUtil;
        import org.allbinary.media.graphics.geography.map.BasicGeographicMap;
        import org.allbinary.media.graphics.geography.map.BasicGeographicMapUtil;
        import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
        import org.allbinary.media.graphics.geography.map.GeographicMapCellType;
        import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
        import org.allbinary.media.graphics.geography.map.GeographicMapEventHandler;
        import org.allbinary.util.BasicArrayList;
        import org.allbinary.view.ViewPosition;

    <xsl:variable name="foundPathFindingBehavior" >
        <xsl:for-each select="//behaviorsSharedData" >
            <xsl:if test="type = 'PathfindingBehavior::PathfindingBehavior'" >found</xsl:if>
        </xsl:for-each>
    </xsl:variable>

        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >

        import org.allbinary.animation.NullAnimationFactory;
        import org.allbinary.animation.RotationAnimation;
        import org.allbinary.animation.caption.CaptionAnimationHelper;
        import org.allbinary.animation.caption.CaptionAnimationHelperBase;
        import org.allbinary.game.configuration.feature.HTMLFeatureFactory;
        import org.allbinary.game.input.event.GameKeyEventFactory;
        import org.allbinary.game.layer.SteeringVisitor;
        import org.allbinary.game.layer.behavior.GDBehaviorUtil;
        import org.allbinary.game.layer.special.CollidableDestroyableDamageableLayer;
        import org.allbinary.game.layer.waypoint.GDWaypointBehavior;
        import org.allbinary.game.layer.waypoint.GDWaypointBehavior2;
        import org.allbinary.game.layer.waypoint.Waypoint;
        import org.allbinary.game.layer.waypoint.MultipassNoCacheWaypoint;
        import org.allbinary.game.layer.waypoint.NoCacheWaypoint;
        import org.allbinary.game.layer.waypoint.Waypoint2LogHelper;
        import org.allbinary.game.layer.waypoint.WaypointLogHelper;
        import org.allbinary.game.layer.waypoint.WaypointRunnableLogHelper;
        import org.allbinary.game.layer.waypoint.Waypoint2SelectedLogHelper;
        import org.allbinary.game.layer.waypoint.WaypointSelectedLogHelper;
        import org.allbinary.game.layer.waypoint.WaypointRunnableSelectedLogHelper;
        import org.allbinary.game.layer.waypoint.WaypointBase;
        import org.allbinary.game.tracking.TrackingEvent;
        import org.allbinary.game.tracking.TrackingEventHandler;
        import org.allbinary.game.view.TileLayerPositionIntoViewPosition;
        import org.allbinary.game.view.TileLayerPositionIntoViewPosition;
        import org.allbinary.graphics.GPoint;
        import org.allbinary.media.audio.AttackSound;
        import org.allbinary.media.graphics.geography.map.GeographicMapCellHistory;
        import org.allbinary.layer.Layer;
        import org.allbinary.layer.LayerInterfaceFactoryInterface;
        import org.allbinary.logic.string.StringUtil;
        import org.allbinary.math.AngleFactory;
        import org.allbinary.math.AngleInfo;
        import org.allbinary.math.FrameUtil;
        //import org.allbinary.math.LayerDistanceUtil;
        import org.allbinary.string.CommonPhoneStrings;
        import org.allbinary.media.graphics.geography.map.racetrack.RaceTrackGeographicMapCellType;
        import org.allbinary.media.graphics.geography.map.topview.BasicTopViewGeographicMapCellTypeFactory;
        import org.allbinary.thread.PathFindingThreadPool;
            
        </xsl:if>

                public class GDCustomGameLayer extends GDGameLayer 
        <xsl:if test="contains($foundOtherViewPosition, 'found')" >implements GameKeyEventSourceInterface, org.allbinary.game.behavior.platformer.PlatformCharacterInterface </xsl:if>
        <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >implements org.allbinary.game.behavior.topview.TopViewCharacterInterface </xsl:if>        
        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >, org.allbinary.game.layer.PathFindingLayerInterface </xsl:if>
                {
                    private final StringUtil stringUtil = StringUtil.getInstance();
                    private final BasicGeographicMapUtil basicGeographicMapUtil = BasicGeographicMapUtil.getInstance();
                    private final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();

        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >
                    private final BasicColorFactory basicColorFactory = BasicColorFactory.getInstance();
                    private final AngleFactory angleFactory = AngleFactory.getInstance();

                    protected final boolean debug = true;
                    public final boolean showMoreCaptionStates = debug;
                    private final LayerInterfaceFactoryInterface waypointLayerInterfaceFactoryInterface;

                    private final CaptionAnimationHelperBase captionAnimationHelper = 
                        CaptionAnimationHelperBase.INSTANCE;
                        //new CaptionAnimationHelper(
                            //NullAnimationFactory.getFactoryInstance().getInstance(0),
                            //-23, -25, 6, 0);    
                    private Animation captionAnimation  = NullAnimationFactory.getFactoryInstance().getInstance(0);
                        
                    private boolean selected = false;

                    private WaypointBehaviorBase waypointBehaviorBase = new WaypointBehaviorBase();
            
                    protected RTSLayerLogHelper rtsLogHelper = RTSLayerLogHelper.getInstance();
                    public RTSLayer2LogHelper rtsLayer2LogHelper = RTSLayer2LogHelper.getInstance();
                    public WaypointLogHelper waypointLogHelper = WaypointLogHelper.getInstance();
                    public Waypoint2LogHelper waypoint2LogHelper = Waypoint2LogHelper.getInstance();
                    public WaypointRunnableLogHelper waypointRunnableLogHelper = WaypointRunnableLogHelper.getInstance();
                    //protected RTSLayerLogHelper rtsLogHelper = RTSLayerSelectedLogHelper.getInstance();
                    //public RTSLayer2LogHelper rtsLayer2LogHelper = RTSLayer2SelectedLogHelper.getInstance();
                    //public WaypointLogHelper waypointLogHelper = WaypointSelectedLogHelper.getInstance();
                    //public Waypoint2LogHelper waypoint2LogHelper = Waypoint2SelectedLogHelper.getInstance();
                    //public WaypointRunnableLogHelper waypointRunnableLogHelper = WaypointRunnableSelectedLogHelper.getInstance();

                    private final Animation initPathAnimation;
                    private Animation pathAnimation = NullAnimationFactory.getFactoryInstance().getInstance(0);
            
                    public final GeographicMapCellPositionArea geographicMapCellPositionArea;
                    private int movementAngle = -1;
                    private GeographicMapCellPosition steeringInsideGeographicMapCellPosition;
        </xsl:if>

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:call-template name="createCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
            <xsl:call-template name="createWhileCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
            <xsl:call-template name="createSubInstructionsCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
        </xsl:for-each>

        <xsl:variable name="hasLayoutWithTileMapAndIsTopView" >
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:for-each select="objects" >                
                <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >
                <xsl:if test="type = 'TileMap::TileMap'" >found</xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        </xsl:variable>

                <xsl:if test="contains($hasLayoutWithTileMapAndIsTopView, 'found')" >
                    public final org.allbinary.game.behavior.topview.GeographicMapTopViewLayerBehavior topViewGameBehavior;

                    protected final org.allbinary.game.behavior.topview.TopViewCharacterBehavior topViewCharacterBehavior = 
                        <xsl:if test="1" >new org.allbinary.game.behavior.topview.PlayerTopViewCharacterBehavior();</xsl:if>
                        <xsl:if test="0" >new org.allbinary.game.behavior.topview.NonPlayerTopViewCharacterBehavior();</xsl:if>

                </xsl:if>

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:for-each select="objects" >                

                <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" />
                    <xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >

                        <xsl:if test="1" >
    private PlayerGameInput playerGameInput;
                        </xsl:if>
                        
                    private final int id = 0;
                        
                    protected final GameInputProcessor[] inputProcessorArray = new GameInputProcessor[InputFactory.getInstance().MAX];

    protected final boolean isSingleKeyProcessing = 
        Features.getInstance().isFeature(
                InputFeatureFactory.getInstance().SINGLE_KEY_REPEAT_PRESS)
            || Features.getInstance().isFeature(
                    InputFeatureFactory.getInstance().SINGLE_KEY_PRESS);

                    private final org.allbinary.game.behavior.platformer.InitialJumpBehavior initialJumpBehavior = new org.allbinary.game.behavior.platformer.InitialJumpBehavior() {
                        public void process() {
                            //SecondaryPlayerQueueFactory.getInstance().add(JumpSound.getInstance());
                        }
                    };

                    protected final org.allbinary.game.behavior.platformer.GeographicMapPlatformGameLayerBehavior platformGameBehavior = 
                        new org.allbinary.game.behavior.platformer.GeographicMapPlatformGameLayerBehavior(64, false, 6);
                    protected final org.allbinary.game.behavior.platformer.PlatformCharacterBehavior platformCharacterBehavior = 
                        <xsl:if test="1" >new org.allbinary.game.behavior.platformer.PlayerPlatformCharacterBehavior();</xsl:if>
                        <xsl:if test="0" >new org.allbinary.game.behavior.platformer.NonPlayerPlatformCharacterBehavior();</xsl:if>

                    protected final Rectangle[][] rectangleArrayOfArrays;

<!--
                    public boolean hasCollisionMask() {
                        if(this.rectangleArrayOfArrays != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.rectangleArrayOfArrays.length <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.rectangleArrayOfArrays[0].length <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                            return true;
                        } else {
                            return false;
                        }
                    }
-->

                    protected BasicAccelerationProperties acceleration;

    protected short angle = 0;
    protected int lastDirectionKey = Canvas.RIGHT;
    protected Direction direction = DirectionFactory.getInstance().RIGHT;
    protected Direction lastDirection = direction;
    
    protected boolean directionChanged = false;
                        
                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>

                    public GDCustomGameLayer(
                        final int layoutIndex, 
                        final Animation primitiveDrawing,
                        final BasicArrayList gameLayerList, final BasicArrayList gameLayerDestroyedList, 
                        final BasicArrayList behaviorList,
                        final RemoteInfo remoteInfo,
                        final Group[] groupInterface,
                        final String gdName, 
                        final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
                        final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
                        final Rectangle layerInfo, 
                        final Rectangle[][] rectangleArrayOfArrays,
                        final GDObject gdObject, final GDAnimationBehaviorBase animationBehavior) throws Exception {

                        super(primitiveDrawing, gameLayerList, gameLayerDestroyedList, 
                            behaviorList, 
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            <xsl:for-each select="objects" >            
                <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" />
                    <xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >
                            new VelocityProperties(<xsl:value-of select="number(maxSpeed) * 64" />, <xsl:value-of select="number(maxSpeed) * 64" />),
                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
        <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >
                            new VelocityProperties(9600, 9600),
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
                            new StaticTileLayerIntoPositionViewPosition(),
                            //new ViewPosition(),
                        </xsl:if>
                        <xsl:if test="0" >
                            new StaticTileLayerIntoPositionViewPosition(),
                            //new ViewPosition(),
                        </xsl:if>

                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
        
        <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >
                            new ViewPosition(),
        </xsl:if>
                            gdObject, animationBehavior);

                <xsl:if test="contains($hasLayoutWithTileMapAndIsTopView, 'found')" >
                    org.allbinary.game.behavior.topview.GeographicMapTopViewLayerBehavior topViewGameBehavior;
                    
                    if(this.hasCollisionMask()) {
                    
                    topViewGameBehavior = new org.allbinary.game.behavior.topview.GeographicMapTopViewMaskGameLayerBehavior(64, false, 6) {

    public void moveAndLand(final BasicGeographicMap[] geographicMapInterfaceArray, final GeographicMapCellType[] geographicMapCellTypeArray, final GeographicMapCellPosition geographicMapCellPosition, final VelocityProperties velocityProperties, final AllBinaryLayer layer, final int x, final int y) throws Exception {
        
        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("x: ").append(x).append(" y: ").append(y).append(CommonSeps.getInstance().SPACE).append(layer.getViewPosition().getX()).toString(), this, "moveAndLand"));
        
        if (geographicMapCellPosition != null) {

            super.moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y);

            //final String MOVE_AND_LAND = "moveAndLand";
            //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Should Land at: ").append(this.gravityActionIndex).append(" y: ").append(y).toString(), this, MOVE_AND_LAND));
        } else {
            //LogUtil.put(LogFactory.getInstance("do not move", this, "moveAndLand"));
                    
            //CollisionNP
            <xsl:for-each select=".." >
            <xsl:call-template name="mapCollisionMaskHack" />
            </xsl:for-each>

        }
        
    }
                    
                    };
                    
                    } else {

                    topViewGameBehavior = new org.allbinary.game.behavior.topview.GeographicMapTopViewGameLayerBehavior2(64, false, 6) {
                    
    public void moveAndLand(final BasicGeographicMap[] geographicMapInterfaceArray, final GeographicMapCellType[] geographicMapCellTypeArray, final GeographicMapCellPosition geographicMapCellPosition, final VelocityProperties velocityProperties, final AllBinaryLayer layer, final int x, final int y) throws Exception {
        
        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("x: ").append(x).append(" y: ").append(y).append(CommonSeps.getInstance().SPACE).append(layer.getViewPosition().getX()).toString(), this, "moveAndLand"));
        
        if (geographicMapCellPosition != null) {

            super.moveAndLand(geographicMapInterfaceArray, geographicMapCellTypeArray, geographicMapCellPosition, velocityProperties, layer, x, y);

            //final String MOVE_AND_LAND = "moveAndLand";
            //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Should Land at: ").append(this.gravityActionIndex).append(" y: ").append(y).toString(), this, MOVE_AND_LAND));
        } else {
            //LogUtil.put(LogFactory.getInstance("do not move", this, "moveAndLand"));
                    
            //CollisionNP
            <xsl:for-each select=".." >
            <xsl:call-template name="mapCollisionMaskHack" />
            </xsl:for-each>

        }
        
    }
                    
                    };
                    
                    }

                    this.topViewGameBehavior = topViewGameBehavior;
                </xsl:if>

                <xsl:if test="contains($foundPathFindingBehavior, 'found')" >
                    this.waypointLayerInterfaceFactoryInterface = org.allbinary.game.layer.GDFlagLayerInterfaceFactory.getInstance(); //waypointLayerInterfaceFactoryInterface;
                    this.geographicMapCellPositionArea = new GeographicMapCellPositionArea(this);
                </xsl:if>

<!--
        <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:for-each select="objects" >            
                
                <xsl:if test="type = 'TileMap::TileMap'" >
                    
                        //final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
                        //if(this.gdObject.type == gameGlobals.TILEMAP__COLLISIONMASK) {
                        //} else if(this.gdObject.type == gameGlobals.TILEMAP__TILEMAP) {
                            //this.updatePosition();
                        //}
                    
                </xsl:if>

            </xsl:for-each>
        </xsl:for-each>
        </xsl:if>
-->

        <xsl:if test="contains($foundOtherViewPosition, 'found')" >
                        StaticTileLayerIntoPositionViewPosition.layer = this;
        </xsl:if>

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            <xsl:for-each select="objects" >            
                <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" />
                    <xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >
                        
                        this.acceleration = new BasicAccelerationProperties(
                            <xsl:value-of select="number(acceleration) * 4" />,
                            -<xsl:value-of select="number(acceleration) * 4" />
                        );

                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
        
        <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >
//                        this.acceleration = new BasicAccelerationProperties(
//                            velocityInterface.getMaxForwardVelocity() / 12, 
//                            -velocityInterface.getMaxReverseVelocity() / 12
//                        );
        </xsl:if>

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            
            if(layoutIndex == <xsl:value-of select="$layoutIndex" />) {
                this.handleLayout<xsl:value-of select="$layoutIndex" />();
            }
        </xsl:for-each>

        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >
            //this.initPathAnimation = new PathAnimation(this, LinePathRelativeAnimation.getInstance());
            ////Unremark as well in setAllBinaryGameLayerManager - ((PathAnimation) this.initPathAnimation).setAllBinaryGameLayerManager(allBinaryGameLayerManager);
            this.initPathAnimation = NullAnimationFactory.getFactoryInstance().getInstance(0);
        </xsl:if>

        }

        <xsl:if test="not(contains($hasLayoutWithTileMapAndIsTopView, 'found') or contains($foundOtherViewPosition, 'found'))" >
    public void upp()
    {
    }

    public void leftp()
    {
    }

    public void rightp()
    {
    }

    public void reset() throws Exception
    {
    }
            
    public void terrainMove(final BasicGeographicMap[] geographicMapInterfaceArray, final GeographicMapCellType[] geographicMapCellTypeArray, final int dx, final int dy) {
    }

    public void terrainEvent(final int dx, final int dy, 
            final BasicGeographicMap[] geographicMapInterfaceArray,
            final GeographicMapCellType[] geographicMapCellTypeArray,
            final GeographicMapCellPosition geographicMapCellPosition) throws Exception {
    }

        </xsl:if>
        
        <xsl:if test="contains($hasLayoutWithTileMapAndIsTopView, 'found')" >
                    
        //private int lastX;
        //private int lastY;

        private int total;
            
        //String lastString = "";
    public void move() {
        try {
            //LogUtil.put(LogFactory.getInstance("Move Map: " + this.gdObject.x + "," + this.gdObject.y, this, "move"));

//            if(gameGlobals.PlayerGDGameLayerList.size() >= 0) {
//                final GDGameLayer player = (GDGameLayer) gameGlobals.PlayerGDGameLayerList.get(0);
//                if(this == player) {
//                    String layerManagerAsString = this.allBinaryGameLayerManager.toString();
//                    if(lastString.compareTo(layerManagerAsString) != 0)
//                    lastString = layerManagerAsString;
//                    if(TempMovementBehaviorFactory.getInstance().movementBehavior == TempMapMovementBehavior.getInstance()) {
//                        LogUtil.put(LogFactory.getInstance("1this.allBinaryGameLayerManager: " + this.allBinaryGameLayerManager, this, "move"));
//                    } else {
//                        LogUtil.put(LogFactory.getInstance("0this.allBinaryGameLayerManager: " + this.allBinaryGameLayerManager, this, "move"));
//                    }
//                }
//            }

            if(TempMovementBehaviorFactory.getInstance().movementBehavior == TempMapMovementBehavior.getInstance()) {

            if(this.allBinaryGameLayerManager == null) {
                if(total <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 5) {
                    total++;
                    LogUtil.put(LogFactory.getInstance(new StringMaker().append("0LayerManager was null: ").append(this.getName()).append(CommonSeps.getInstance().SPACE).append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(this.allBinaryGameLayerManager).toString(), this, "move"));
                }
                return;
            }
            
            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;
            
            final BasicGeographicMap[] geographicMapInterfaceArray
                    = geographicMapCompositeInterface.getGeographicMapInterface();

            if(geographicMapInterfaceArray != null) {
                final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
                if(this.gdObject.type == gameGlobals.TILEMAP__COLLISIONMASK) {

                } else if(this.gdObject.type == gameGlobals.TILEMAP__TILEMAP) {
                    if(<xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    final GDGameLayer player = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.get(0);
                    //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Move Map: ").append(this.getName()).toString(), this, "move"));
                    
                    //basicGeographicMapUtil.move(geographicMapInterfaceArray, -x, -y);
                    basicGeographicMapUtil.setPosition(geographicMapInterfaceArray, x, y);
                    
//                    if(this.topViewGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, player, this.gdObject.x, this.gdObject.y)) {
//                        lastX = this.gdObject.x;
//                        lastY = this.gdObject.y;
//                    } else {
//                        //this.gdObject.setX(lastX);
//                        //this.gdObject.setY(lastY);
//                        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Move Back?: ").append(this.gdObject.x).append(CommonSeps.getInstance().COMMA).append(this.gdObject.y).toString(), this, "move"));
//                    }
                    }
                } else {
                    if(<xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    final GDGameLayer player = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.get(0);
                    if(this == player) {
                        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Player - Move Map: ").append(this.gdObject.x).append(",").append(this.gdObject.y).toString(), this, "move"));
                        //this.topViewGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, this, this.gdObject.x, this.gdObject.y);
                    } else {
                        super.move();
                    }
                    }
                }
            } else {
                LogUtil.put(LogFactory.getInstance(new StringMaker().append("Map was null: ").append(this.getName()).append(CommonSeps.getInstance().SPACE).append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(this.allBinaryGameLayerManager).toString(), this, "move"));
                GeographicMapEventHandler.getInstance().addListener(this);
            }

            } else {
                super.move();
            }

        } catch (Exception e) {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "move", e));
        }
    }
                    
    public void updatePosition() {
        super.updatePosition();
        this.move();
    }
    
    public void move2() {
        try {
            //LogUtil.put(LogFactory.getInstance("Move Map: " + this.gdObject.x + "," + this.gdObject.y, this, "move2"));

            if(TempMovementBehaviorFactory.getInstance().movementBehavior == TempMapMovementBehavior.getInstance()) {

            if(this.allBinaryGameLayerManager == null) {
                LogUtil.put(LogFactory.getInstance(new StringMaker().append("1LayerManager was null: ").append(this.getName()).append(CommonSeps.getInstance().SPACE).append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(this.allBinaryGameLayerManager).toString(), this, "move"));
                return;
            }

            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;

            final BasicGeographicMap[] geographicMapInterfaceArray
                    = geographicMapCompositeInterface.getGeographicMapInterface();

            if(geographicMapInterfaceArray != null) {
                final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
                if(this.gdObject.type == gameGlobals.TILEMAP__COLLISIONMASK) {

                } else if(this.gdObject.type == gameGlobals.TILEMAP__TILEMAP) {
                    if(<xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    final GDGameLayer player = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.get(0);
                    //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Move Map: ").append(this.gdObject.x).append(",").append(this.gdObject.y).toString(), this, "move2"));
                    
                    //basicGeographicMapUtil.move(geographicMapInterfaceArray, -x, -y);
                    basicGeographicMapUtil.setPosition(geographicMapInterfaceArray, x, y);

//                    if(this.topViewGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, player, this.gdObject.x, this.gdObject.y)) {
//                        lastX = this.gdObject.x;
//                        lastY = this.gdObject.y;
//                    } else {
//                        //this.gdObject.setX(lastX);
//                        //this.gdObject.setY(lastY);
//                        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Move Back?: ").append(this.gdObject.x).append(CommonSeps.getInstance().COMMA).append(this.gdObject.y).toString(), this, "move"));
//                    }
                    }
                } else {
                    if(<xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    final GDGameLayer Player = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" >Player</xsl:with-param></xsl:call-template>.PlayerGDGameLayerList.get(0);
                    if(this == Player) {
                        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Player - Move Map: ").append(this.gdObject.x).append(",").append(this.gdObject.y).toString(), this, "move2"));
                        //this.topViewGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, this, this.gdObject.x, this.gdObject.y);
                    } else {
                        super.move();
                    }
                    }
                }
            } else {
                LogUtil.put(LogFactory.getInstance(new StringMaker().append("Map was null: ").append(this.getName()).append(CommonSeps.getInstance().SPACE).append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(this.allBinaryGameLayerManager).toString(), this, "move2"));
                GeographicMapEventHandler.getInstance().addListener(this);
            }

            } else {
                super.move();
            }

        } catch (Exception e) {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "move2", e));
        }
    }

    public void updatePosition2() {
        super.updatePosition();
        this.move2();
    }

    public void terrainMove(final BasicGeographicMap[] geographicMapInterfaceArray, final GeographicMapCellType[] geographicMapCellTypeArray, final int dx, final int dy) {
        this.topViewCharacterBehavior.terrainMove(this, geographicMapInterfaceArray, dx, dy);
    }
    
    public void terrainEvent(final int dx, final int dy, 
            final BasicGeographicMap[] geographicMapInterfaceArray,
            final GeographicMapCellType[] geographicMapCellTypeArray,
            final GeographicMapCellPosition geographicMapCellPosition) throws Exception {
    }

    public void upp()
    {
    }

    public void leftp()
    {
    }

    public void rightp()
    {
    }

    public void reset() throws Exception
    {
    }
                    
        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >                    
    public void paint(final Graphics graphics) {
        super.paint(graphics);
        
        final ViewPosition viewPosition = this.getViewPosition();
        final int x = viewPosition.getX();
        final int y = viewPosition.getY();
        
        this.captionAnimation.paint(graphics, x, y);

        this.pathAnimation.paint(graphics, x, y);

//        if(this.topViewGameBehavior.blockGeographicMapCellPosition != null) {
//        graphics.setColor(BasicColorFactory.getInstance().RED.intValue());
//        graphics.drawString(this.topViewGameBehavior.blockGeographicMapCellPosition.toString(), 10, 10, 0);
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

    public void initInputProcessors() {
        this.inputProcessorArray[Canvas.UP] = new SpecialUpGameInputProcessor(this);

        this.inputProcessorArray[Canvas.KEY_NUM1] = new SpecialFireGameInputProcessor(this);

        this.inputProcessorArray[Canvas.RIGHT] = new SpecialRightGameInputProcessor(this);

        //-key == Canvas.LEFT
        this.inputProcessorArray[Canvas.LEFT] = new SpecialLeftGameInputProcessor(this);

        this.inputProcessorArray[Canvas.KEY_NUM0] = new Special1GameInputProcessor(this);

        this.inputProcessorArray[Canvas.KEY_POUND] = new Special2GameInputProcessor(this);

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
        GameInputProcessorUtil.init(this.inputProcessorArray);
    }

//    private int lastSize = -1;

    public synchronized void processInput2(final AllBinaryLayerManager allbinaryLayerManager) throws Exception {
        //this.workSpecialIndex = this.minSpecialIndex;

        final BasicArrayList list = this.getGameKeyEventList();
        final int size = list.size();
//        if(size != lastSize) {
//            LogUtil.put(LogFactory.getInstance(new StringMaker().append("Size: ").append(size).toString(), this, "processInput"));
//            lastSize = size;
//        }

        //if (this.isSingleKeyProcessing || this.timeHelper.isTime())
        //{
        int key = 0;
        GameKeyEvent gameKeyEvent;

        for (int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
            gameKeyEvent = (GameKeyEvent) list.get(index);
            key = gameKeyEvent.getKey();

            inputProcessorArray[key].process(allbinaryLayerManager, gameKeyEvent);
        }
        //this.updateSpecialAnimation();
//      }

        //updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);
        updateGDObject(1000);
        VelocityUtil.reduceX(this.velocityInterface, 90, 100);
    }
                        
    public void terrainEvent(final int dx, final int dy, final BasicGeographicMap[] geographicMapInterfaceArray,
            final GeographicMapCellPosition geographicMapCellPosition) throws Exception {
    }

    public void terrainMove(final BasicGeographicMap[] geographicMapInterfaceArray, final GeographicMapCellType[] geographicMapCellTypeArray, final int dx, final int dy) {
        this.platformCharacterBehavior.terrainMove(this, geographicMapInterfaceArray, dx, dy);
    }
   
    public void terrainLand() {
        //this.specialAnimationInterfaceArray[LEGS_ANIMATION].setFrame(STANDARD_FRAME);
    }

    public void move() {
        try {
            if(this.allBinaryGameLayerManager == null) {
                LogUtil.put(LogFactory.getInstance(new StringMaker().append("2LayerManager was null: ").append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(this.allBinaryGameLayerManager).toString(), this, "move"));
                return;
            }
        
            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;

            final BasicGeographicMap[] geographicMapInterfaceArray
                    = geographicMapCompositeInterface.getGeographicMapInterface();

            if(geographicMapInterfaceArray != null) {
                this.platformGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, this);
            } else {
                //LogUtil.put(LogFactory.getInstance("Map was null, this, "move"));
            }

        } catch (Exception e) {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "move", e));
        }
    }

    public void up()
    {
        //LogUtil.put(LogFactory.getInstance("Jump", this, "processInput"));

        this.platformGameBehavior.up((VelocityProperties) this.velocityInterface, acceleration, initialJumpBehavior, 4);
        
    }    

    public void upp() {
        
    }
    
    public void right()
    {
        try {
            if(this.allBinaryGameLayerManager == null) {
                LogUtil.put(LogFactory.getInstance(new StringMaker().append("3LayerManager was null: ").append(this.getName()).append(CommonSeps.getInstance().SPACE).append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(this.allBinaryGameLayerManager).toString(), this, "move"));
                return;
            }
        
            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;

            final BasicGeographicMap[] geographicMapInterfaceArray
                    = geographicMapCompositeInterface.getGeographicMapInterface();

            if(geographicMapInterfaceArray != null) {
                this.platformGameBehavior.right(geographicMapInterfaceArray, this.velocityInterface, this);
            }
        } catch (Exception e) {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "right", e));
        }
    }
    
   public void rightp()
   {
      this.velocityInterface.getVelocityXBasicDecimal().add(-this.acceleration.getReverse());
      this.velocityInterface.limitXYToForwardAndReverseMaxVelocity();

      //LogUtil.put(LogFactory.getInstance("Right: dx: " + this.velocityInterface.getVelocityXBasicDecimal().getUnscaled(), this, "processInput"));
      
      //this.getVelocityProperties().addVelocity(this.acceleration.getReverse(), 180);

      this.angle = 0;
      lastDirectionKey = Canvas.RIGHT;
      
   }

   public void leftp()
   {
       this.velocityInterface.getVelocityXBasicDecimal().add(this.acceleration.getReverse());
       this.velocityInterface.limitXYToForwardAndReverseMaxVelocity();

       //LogUtil.put(LogFactory.getInstance("Left: dx: " + this.velocityInterface.getVelocityXBasicDecimal().getUnscaled(), this, "processInput"));

       //this.getVelocityProperties().addVelocity(this.acceleration.getReverse(), 0);
       //this.specialAnimationArray[this.specialIndex++] = LEFT;

       this.angle = 180;
       lastDirectionKey = Canvas.LEFT;

    }
    
    public void left()
    {
        try {
            if(this.allBinaryGameLayerManager == null) {
                LogUtil.put(LogFactory.getInstance(new StringMaker().append("4LayerManager was null: ").append(this.getName()).append(CommonSeps.getInstance().SPACE).append(this.gdObject.x).append(",").append(this.gdObject.y).append(" LayerManager: ").append(this.allBinaryGameLayerManager).toString(), this, "move"));
                return;
            }

            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;

            final BasicGeographicMap[] geographicMapInterfaceArray
                    = geographicMapCompositeInterface.getGeographicMapInterface();

            if(geographicMapInterfaceArray != null) {
                this.platformGameBehavior.left(geographicMapInterfaceArray, this.velocityInterface, this);
            }

        } catch (Exception e) {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "left", e));
        }
    }
        
   public void inputFrames()
   {

      this.platformGameBehavior.inputFrames(this.velocityInterface);

      //TWB - Was this supposed to be remarked
      //this.specialAnimationInterfaceArray[HEAD_ANIMATION].setFrame(this.direction.getFrameFactor());

      // this.armAnimation();

      final IndexedAnimationInterface indexedAnimationInterface = this.getIndexedAnimationInterface();
      if (this.directionChanged <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> !this.isReadyForExplosion())
      {
         indexedAnimationInterface.setFrame(this.direction.getFrameFactor());
      }

      /*
       * int hatFrame = (int) this.absoluteXVelocity / hatReverseDenominator;
       * int yHatFrame = (int)
       * Math.abs(this.velocityInterface.getVelocityYBasicDecimal().getUnscaled()) /
       * hatReverseDenominator; hatFrame += yHatFrame;
       * 
       * if (hatFrame > TOTAL_HAT_FRAMES - 1) { hatFrame = TOTAL_HAT_FRAMES -
       * 1; }
       * this.specialAnimationInterfaceArray[HAT_ANIMATION].setFrame(hatFrame +
       * (this.direction.getFrameFactor() * TOTAL_HAT_FRAMES));
       */

//      final IndexedAnimationInterface legsIndexedAnimationInterface =
//         this.specialAnimationInterfaceArray[LEGS_ANIMATION];
//
//      if (this.platformGameBehavior.gravityActionIndex == 0  || this.platformGameBehavior.isFallingWithoutJumpAttempt)
//      {
//         int legDirectionIndex = this.direction.getFrameFactor() * TOTAL_LEG_FRAMES;
//
//         if (this.movedEnoughForMovement || this.directionChanged)
//         {
//            int nextFrame = this.runFrameSequence[legsIndexedAnimationInterface.getFrame()];
//            legsIndexedAnimationInterface.setFrame(nextFrame + legDirectionIndex);
//         }
//         else if (!isMovingEnough)
//         {
//            this.specialAnimationInterfaceArray[LEGS_ANIMATION].setFrame(STANDARD_FRAME + legDirectionIndex);
//         }
//      }

    }

    public void armAnimation() {
//        final int armsDirectionIndex = TOTAL_ARM_FRAMES * this.direction.getFrameFactor();
//        if (this.platformGameBehavior.gravityActionIndex <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
//            this.specialAnimationInterfaceArray[ARMS_ANIMATION].setFrame(JUMP_ARMS_FRAME + armsDirectionIndex);
//        } else if (!this.movedEnoughForMovement) {
//            this.specialAnimationInterfaceArray[ARMS_ANIMATION].setFrame(armsDirectionIndex);
//        }
    }

    public void reset() throws Exception
    {
        //this.specialIndex = this.minSpecialIndex;

        this.platformGameBehavior.land((VelocityProperties) this.velocityInterface);
        this.velocityInterface.zero();

        //this.initPosition();

        //this.setAnimationInterface(this.getAnimationInterfaceFactoryInterface().getInstance());

        //this.getIndexedAnimationInterface().setFrame(0);
        //directionChanged = true;
    }
    
    public int getSourceId() {
        return id;
    }
    
                        <xsl:if test="1" >
                                    
    public synchronized void processInput(final AllBinaryLayerManager allbinaryLayerManager) throws Exception
    {
        try
        {
            this.processInput2(allbinaryLayerManager);

            if (isSingleKeyProcessing)
            {
                this.playerGameInput.clear();
            }
            else
            {
                this.playerGameInput.update();
            }

        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, "processInput"));
            //LogUtil.put(LogFactory.getInstance("Danger Danger Danger ^^^%%$*($)*@)!$", this, "processInput", e));
        }

    }

    public PlayerGameInput getPlayerGameInput()
    {
        return this.playerGameInput;
    }
    
    public boolean implmentsGameInputInterface()
    {
        return true;
    }
    
                        </xsl:if>
                        <xsl:if test="0" >
        
    public synchronized void processInput(final AllBinaryLayerManager allbinaryLayerManager) throws Exception
    {
        this.processInput2(allbinaryLayerManager);
    }

                        </xsl:if>

                    </xsl:if>
                    //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> - END
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>

    //private final String P = "processGDCollision";    
    //private final String B = "BatEnemy";
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:call-template name="processCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
            <xsl:call-template name="processWhileCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
            <xsl:call-template name="processSubInstructionsCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
        </xsl:for-each>

    public void setValue(final int value) {
        ((GDSliderAnimationBehavior) this.getDimensionalBehavior().getAnimationBehavior()).setValue(value);
    }

    public int Value() {
        return ((GDSliderAnimationBehavior) this.getDimensionalBehavior().getAnimationBehavior()).Value();
    }

        <xsl:if test="contains($foundPathFindingBehavior, 'found')" >

    protected void setSelected(boolean selected)
    {
        this.selected = selected;
    }

    public boolean isSelected()
    {
        return this.selected;
    }

    public boolean implmentsTickableInterface()
    {
        return true;
    }

<!--    int ox = Integer.MAX_VALUE;
    int oy = Integer.MAX_VALUE;-->            
    public void processTick(final AllBinaryLayerManager allBinaryLayerManager)
        throws Exception
    {
        final GDBehaviorUtil gdBehaviorUtil = GDBehaviorUtil.getInstance();
        if(this.gdObject.isBehaviorEnabledArray[gdBehaviorUtil.PATHFINDING_BEHAVIOR_INDEX]) {
            
<!--            if(this.x != this.ox || this.y != this.oy) {
                this.ox = this.x;
                this.oy = this.y;
                LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.getName()).append(' ').append(this.x).append(' ').append(this.y).toString(), this, GameStrings.getInstance().PROCESS_TICK));
            }-->
            
            this.captionAnimationHelper.tick();
            //if(!this.isDestination(this.targetGDGameLayer)) {
                //this.pathAnimation = NullAnimationFactory.getFactoryInstance().getInstance(0);
            //}
            this.waypointBehaviorBase.processTick(allBinaryLayerManager);
        }
    }
    
    private final GDBehaviorUtil gdBehaviorUtil = GDBehaviorUtil.getInstance();    
    public void setAllBinaryGameLayerManager(final AllBinaryGameLayerManager allBinaryGameLayerManager) throws Exception {

        super.setAllBinaryGameLayerManager(allBinaryGameLayerManager);

        if(this.gdObject.hasBehaviorArray[gdBehaviorUtil.PATHFINDING_BEHAVIOR_INDEX]) {

            PathFindingThreadPool.getInstance().clear();
            
            final GeographicMapCompositeInterface geographicMapCompositeInterface
                = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;
            final BasicGeographicMap[] basicGeographicMapArray = geographicMapCompositeInterface.getGeographicMapInterface();

            if (basicGeographicMapArray != null) {
                final BasicGeographicMap geographicMapInterface = basicGeographicMapArray[0];

//            final AllBinaryTiledLayer tiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
//            final TileLayerPositionIntoViewPosition viewPosition2
//                = (TileLayerPositionIntoViewPosition) this.getViewPosition();
//            viewPosition2.setTiledLayer(tiledLayer);
                this.updateWaypointBehavior(geographicMapInterface);
                //System.out.println("map: " + this);
            } else {
                //System.out.println("no map: " + this);
            }

            //((PathAnimation) this.initPathAnimation).setAllBinaryGameLayerManager(allBinaryGameLayerManager);

        }

    }

    public void setTarget(final PathFindingLayerInterface targetGameLayer) throws Exception {
        this.pathAnimation = this.initPathAnimation;
        this.captionAnimation = this.captionAnimationHelper;
        
        final WaypointBehaviorBase waypointBehaviorBase = this.getWaypointBehavior();
        waypointBehaviorBase.setTarget((PathFindingLayerInterface) targetGameLayer);
    }
            
    public void updateWaypointBehavior(final BasicGeographicMap geographicMapInterface) throws Exception {
        
        final Hashtable hashtable = new Hashtable();
        hashtable.put(Group.ID, this.getGroupInterface());
        hashtable.put(Layer.ID, this);
        hashtable.put(AllBinaryGameLayerManager.ID, allBinaryGameLayerManager);
        
        this.setWaypointBehavior(
                new GDWaypointBehavior2(
                        this, 
                        (CollidableDestroyableDamageableLayer) 
                        waypointLayerInterfaceFactoryInterface.getInstance(
                                hashtable, x, y, z))
                );

        this.updateWaypointBehavior2(geographicMapInterface);
            
        final Features features = Features.getInstance();
        final boolean isHTML = features.isDefault(HTMLFeatureFactory.getInstance().HTML);
            
        final WaypointBase waypoint = isHTML ? 
            new NoCacheWaypoint(this, AttackSound.getInstance()): new MultipassNoCacheWaypoint(this, AttackSound.getInstance());
        waypoint.setAllBinaryGameLayerManager(allBinaryGameLayerManager);
        this.waypointBehaviorBase.setWaypoint(waypoint);
        
        //this.initRangeHack();
    }
    
    public void updateWaypointBehavior2(final BasicGeographicMap geographicMapInterface) throws Exception {
        this.geographicMapCellPositionArea.update(geographicMapInterface);
    }
            
    public SelectionHudPaintable getHudPaintable()
    {
        return null;
    }

    public int getSourceId()
    {
        return 0;
    }
            
    public BasicArrayList getEndGeographicMapCellPositionList() throws Exception {
        
        final GeographicMapCompositeInterface geographicMapCompositeInterface = 
            (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;
        final BasicGeographicMap geographicMapInterface = geographicMapCompositeInterface.getGeographicMapInterface()[0];

        geographicMapCellPositionArea.update(geographicMapInterface);
        
        return this.geographicMapCellPositionArea.getOccupyingGeographicMapCellPositionList();
    }

    public GeographicMapCellPositionArea getGeographicMapCellPositionArea() {
        return geographicMapCellPositionArea;
    }

    public boolean shouldHandleStartSameAsEnd() {
        return true;
    }

    public void handleCost(PathFindingLayerInterface ownerLayer) throws Exception {
    }

    public WaypointBehaviorBase getWaypointBehavior()
    {
        return this.waypointBehaviorBase;
    }

    protected void setWaypointBehavior(WaypointBehaviorBase unitWaypointHelper)
    {
        this.waypointBehaviorBase = unitWaypointHelper;
    }

    public PathFindingLayerInterface getParentLayer() {
        return null;
    }

    public RTSLayer2LogHelper getRTSLayer2LogHelper() {
        return this.rtsLayer2LogHelper;
    }
    
    public WaypointLogHelper getWaypointLogHelper() {
        return this.waypointLogHelper;
    }

    public Waypoint2LogHelper getWaypoint2LogHelper() {
        return this.waypoint2LogHelper;
    }
    
    public WaypointRunnableLogHelper getWaypointRunnableLogHelper() {
        return this.waypointRunnableLogHelper;
    }

    public boolean shouldAddWaypointFromBuilding() {
        return false;
    }

    public CaptionAnimationHelperBase getCaptionAnimationHelper() {
        return captionAnimationHelper;
    }

    public boolean isShowMoreCaptionStates() {
        return this.showMoreCaptionStates;
    }
    
    //private static final String REMOVING_LAST_CELLPOSITION = "Removing last cell position in path: ";
    public void init(final GeographicMapCellHistory geographicMapCellHistory,
        final BasicArrayList geographicMapCellPositionBasicArrayList) throws Exception { 
        
        //System.out.println("geographicMapCellPositionBasicArrayList: " + geographicMapCellPositionBasicArrayList.size());
        final GeographicMapCompositeInterface geographicMapCompositeInterface
            = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;
        final BasicGeographicMap geographicMapInterface = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        
        final GeographicMapCellPosition geographicMapCellPosition = (GeographicMapCellPosition) 
            geographicMapCellPositionBasicArrayList.get(geographicMapCellPositionBasicArrayList.size() - 1);
        final RaceTrackGeographicMapCellType geographicMapCellType = (RaceTrackGeographicMapCellType) geographicMapInterface.getCellTypeAt(geographicMapCellPosition);
        final BasicTopViewGeographicMapCellTypeFactory basicTopViewGeographicMapCellTypeFactory = (BasicTopViewGeographicMapCellTypeFactory) geographicMapInterface.getGeographicMapCellTypeFactory();
        if(geographicMapCellType.getTravelCost() == basicTopViewGeographicMapCellTypeFactory.BLOCK_CELL_TYPE.cost) {
            geographicMapCellPositionBasicArrayList.remove(geographicMapCellPosition);
            //LogUtil.put(LogFactory.getInstance(REMOVING_LAST_CELLPOSITION + geographicMapCellPosition, this, CommonStrings.getInstance().INIT));
        }
        
        geographicMapCellHistory.track(geographicMapCellPositionBasicArrayList);
            
    }
    
    public GeographicMapCellPosition getCurrentGeographicMapCellPosition()
    throws Exception
    {
        final GeographicMapCompositeInterface geographicMapCompositeInterface
            = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;
        final BasicGeographicMap geographicMapInterface = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        
        final GeographicMapCellPosition geographicMapCellPosition =
            geographicMapInterface.getCellPositionAtNoThrow(
            this.x + this.getHalfWidth(),
            this.y + this.getHalfHeight());

        //This should never happen remove when bug is found
//        final RTSRaceTrackGeographicMap raceTrackGeographicMap =
//            (RTSRaceTrackGeographicMap) geographicMapInterface;
//        
//        if(!raceTrackGeographicMap.isValid(geographicMapCellPosition))
//        {
//            throw new Exception("Position is not really on the map: " + geographicMapCellPosition);
//        }

        return geographicMapCellPosition;
    }

    public GeographicMapCellPosition getTopLeftGeographicMapCellPosition()
    throws Exception
    {
        final GeographicMapCompositeInterface geographicMapCompositeInterface
            = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;
        final BasicGeographicMap geographicMapInterface = geographicMapCompositeInterface.getGeographicMapInterface()[0];
        
        final GeographicMapCellPosition geographicMapCellPosition =
            geographicMapInterface.getCellPositionAtNoThrow(
            this.x,
            this.y);

        return geographicMapCellPosition;
    }

    public BasicArrayList getMoveOutOfBuildAreaPath(
        final GeographicMapCellPosition geographicMapCellPosition) {
        return null;
    }   

    public void setClosestGeographicMapCellHistory(final BasicArrayList pathsList)
        throws Exception
    {
    }
    
    public void teleportTo(final GeographicMapCellPosition geographicMapCellPosition) {
        
    }
    
    public void setLoad(short resource) throws Exception {
        
    }

    public BasicArrayList getSurroundingGeographicMapCellPositionList() 
        throws Exception {
        final GeographicMapCompositeInterface geographicMapCompositeInterface = 
            (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;
        final BasicGeographicMap geographicMapInterface = geographicMapCompositeInterface.getGeographicMapInterface()[0];

        geographicMapCellPositionArea.update(geographicMapInterface);

        return geographicMapCellPositionArea.getSurroundingGeographicMapCellPositionList();
    }
    
    public void trackTo(final String reason) 
        throws Exception {
        
        final GeographicMapCellPosition nextUnvisitedPathGeographicMapCellPosition = this.waypointBehaviorBase.getNextUnvisitedPathGeographicMapCellPosition();
        final GPoint point = nextUnvisitedPathGeographicMapCellPosition.getMidPoint();
        
        final int dx = (this.getX() + this.getHalfWidth()) + point.getX();
        final int dy = (this.getY() + this.getHalfHeight()) + point.getY();

        this.rtsLogHelper.trackTo(this, nextUnvisitedPathGeographicMapCellPosition, dx, dy, reason);
        
        this.trackTo(dx, dy);
        
    }

    public void trackTo(final int dx, final int dy) 
        throws Exception {

        final int angleOfTarget = 0;
        this.trackTo(dx, dy, angleOfTarget);
        
    }
    
    private void trackTo(final int dx, final int dy, final int targetAngle)
        throws Exception
    {
        //If colliding with a game object then don't try to turn since in chase mode
        final BasicArrayList list = this.getWaypointBehavior().getSteeringVisitorList();

        if(list.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0)
        {
            //LogUtil.put(LogFactory.getInstance("Chasing", this, "trackTo"));

            for(int index = list.size() - 1; index <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> 0; index--)
            {
                final SteeringVisitor steeringVisitor = (SteeringVisitor) list.get(index);
                
                final Object object = steeringVisitor.visit(null);
                
                if(object == null)
                {
                    list.remove(index);
                }
            }

            this.fireOrMove();
        }
        else if(!this.turnTo(dx, dy, targetAngle))
        {
            this.fireOrMove();
        }
    }

    private static final String MOVE = "Moving";
    
    protected void fireOrMove()
        throws Exception
    {
        //LogUtil.put(LogFactory.getInstance("Move/Attack: trackingWaypoint: " + this.trackingWaypoint + " sensorAction: " + this.sensorAction + " currentTargetDistance &gt;= longWeaponRange " + this.currentTargetDistance + "&gt;=" + this.longWeaponRange, this, "trackTo"));

        final GameKeyEventFactory gameKeyEventFactory = GameKeyEventFactory.getInstance();
        
        // Move if going to waypoint, evading, or towards target
        if (this.getWaypointBehavior().needToMove())
        {
            this.rtsLayer2LogHelper.steeringUp(this);

            if(this.showMoreCaptionStates <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> !this.captionAnimationHelper.isShowing())
            {
                this.captionAnimationHelper.update(MOVE, this.basicColorFactory.GREEN);
            }

            //this.getGameKeyEventList().add(gameKeyEventFactory.getInstance(this, Canvas.UP));
            this.forward();
        }
        else
        {
            this.captionAnimationHelper.update(CommonPhoneStrings.getInstance().FIRE, this.basicColorFactory.RED);
            
            // int anotherTargetDistance = DistanceUtil.getDistance(this, this.currentTargetLayerInterface);

            this.rtsLayer2LogHelper.steeringFireOrStop(this);
            
            //LogUtil.put(LogFactory.getInstance("Attacking: " + this.currentTargetLayerInterface.getName() + " anotherTargetDistance: " + anotherTargetDistance + " Range: " + this.currentTargetDistance, this, "trackTo"));

            //LogUtil.put(LogFactory.getInstance(TrackingEventHandler.getInstance().toString(), this, "processTargeting"));

            //LogUtil.put(LogFactory.getInstance("Attacking: " + this.currentTargetLayerInterface.getName() + " X: " + this.currentTargetLayerInterface.getX() + " ? " + this.x + " Y: " + this.currentTargetLayerInterface.getY() + " ? " + this.y, this, "processTargeting"));
            //LogUtil.put(LogFactory.getInstance("Attacking: " + this.currentTargetLayerInterface.getName() + " at Range: " + this.currentTargetDistance + "&gt;=" + this.longWeaponRange, this, "processTargeting"));

            this.allStop();
            //this.getGameKeyEventList().add(gameKeyEventFactory.getInstance(this, Canvas.KEY_NUM0));
            TrackingEventHandler.getInstance().fireEvent(this.getTrackingEvent());
        }
    }

    private void handleDeltalX(final int dx, final int dy) {
        final GeographicMapCellPosition nextUnvisitedPathGeographicMapCellPosition = this.waypointBehaviorBase.getNextUnvisitedPathGeographicMapCellPosition();
        if (dx <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
            this.movementAngle = this.angleFactory.LEFT.getValue();
            this.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition;
            
            this.rtsLogHelper.handleLeft(this, this.movementAngle);
            
        } else {
            this.movementAngle = this.angleFactory.RIGHT.getValue();
            this.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition;
            
            this.rtsLogHelper.handleRight(this, this.movementAngle);
            
        }
    }
    
    private void handleDeltalY(final int dx, final int dy) {
        final GeographicMapCellPosition nextUnvisitedPathGeographicMapCellPosition = this.waypointBehaviorBase.getNextUnvisitedPathGeographicMapCellPosition();
        if (dy <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
            this.movementAngle = this.angleFactory.UP.getValue();
            this.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition;
            
            this.rtsLogHelper.handleUp(this, this.movementAngle);
            
        } else {
            this.movementAngle = this.angleFactory.DOWN.getValue();
            this.steeringInsideGeographicMapCellPosition = nextUnvisitedPathGeographicMapCellPosition;
            
            this.rtsLogHelper.handleDown(this, this.movementAngle);
            
        }
    }

    private boolean turnTo(final int dx, final int dy, int targetAngle)
    throws Exception
    {    
        // int angleOfTarget = NoDecimalTrigTable.antiTan(dx, dy);

        final GeographicMapCellPosition nextUnvisitedPathGeographicMapCellPosition = this.waypointBehaviorBase.getNextUnvisitedPathGeographicMapCellPosition();

        if(nextUnvisitedPathGeographicMapCellPosition == null) {
            //LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.getName()).append(" - do not turn or move until we have the first unvisited cell position").toString(), this, "turnTo"));
            return true;
        }

        final GeographicMapCellPosition currentGeographicMapCellPosition = this.getCurrentGeographicMapCellPosition();

        boolean evading = false;
        
        // Run until out of sensor range
//        if (this.getUnitWaypointBehavior().getSensorAction() == SensorActionFactory.getInstance().EVADE)
//        {
//            this.rtsLogHelper.evade(this);
//            
//            evading = true;
//            targetAngle += 180;
//        }

        //final int angleOfTarget = FrameUtil.getInstance().adjustAngleToFrameAngle(targetAngle);
        //final int angleOfTarget2 = angleOfTarget;
        //final int angleOfTarget2 = angleOfTarget / 10 * 10;
        //final int angleOfTarget2 = AngleFactory.getInstance().getClosestDirection(angleOfTarget).getValue();
        
        //final AngleInfo angleInfo = this.rotationAnimationInterface.getAngleInfo();
        //final AngleInfo angleInfo = ((RotationAnimation) this.indexedAnimationInterfaceArray[0]).getAngleInfo();
        //final int angle = FrameUtil.getInstance().adjustAngleToFrameAngle(angleInfo.getAngle() - 270);
        
        final int angle = gdObject.angle;
        
        //final int angle = angleInfo.getAngle();

        //if (this.getUnitWaypointBehavior().isWaypointListEmptyOrOnlyTargets())
        
        this.rtsLogHelper.turnTo(this, dx, dy, null, angle, movementAngle, evading, targetAngle);

        final GeographicMapCellHistory geographicMapCellHistory = this.waypointBehaviorBase.getCurrentGeographicMapCellHistory();

        //final GameKeyEventFactory gameKeyEventFactory = GameKeyEventFactory.getInstance();

        //int deltaAngle = closestDirectionAngle.getValue() - angle;
//        int deltaAngle = angleOfTarget2 - angle;
//        int absoluteDeltaAngle = Math.abs(deltaAngle);
          //absoluteDeltaAngle == 0 || 
          //() || 
        if(Math.abs(dx) <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 3 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> Math.abs(dy) <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 3) {
        //if(dx == 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> dy == 0) {
            
            this.rtsLogHelper.doneMoving(this);
            
            //TWB - This is probably covering up and issue with the existing visit logic.
            if(geographicMapCellHistory.visit(currentGeographicMapCellPosition)) {
                this.waypoint2LogHelper.processWaypointTracked(this, currentGeographicMapCellPosition);
            } else {
                final String reason = 
                    stringUtil.EMPTY_STRING;
                    //new StringMaker().append(" - finished moving without progress: ").append(geographicMapCellHistory.getVisited()).toString();
                this.waypoint2LogHelper.processWaypointTrackedWithoutProgress(this, reason);
                this.getWaypointBehavior().updatePathOnTargetMove(reason);
            }

            return true;
        } else if(this.movementAngle == angle) {

            //final BasicArrayList occupyingList = this.getEndGeographicMapCellPositionList();
            final BasicArrayList pathList = geographicMapCellHistory.getTracked();
            if(pathList.contains(currentGeographicMapCellPosition) 
//                ||
//                geographicMapCellHistory.getTotalVisited() == 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> GeographicMapDirectionUtil.getInstance().getEightDirectionFromCellPositionToAdjacentCellPosition(currentGeographicMapCellPosition, (GeographicMapCellPosition) pathList.get(0)) != DirectionFactory.getInstance().NOT_BORDERED_WITH
                ) {
            
            if(dx <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.movementAngle == this.angleFactory.LEFT.getValue()) {
                this.rtsLogHelper.movingLeft(this);
                return false;
            }
            if(dx <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.movementAngle == this.angleFactory.RIGHT.getValue()) {
                this.rtsLogHelper.movingRight(this);
                return false;
            }
            if(dy <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.movementAngle == this.angleFactory.UP.getValue()) {
                this.rtsLogHelper.movingUp(this);
                return false;
            }
            if(dy <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 0 <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> this.movementAngle == this.angleFactory.DOWN.getValue()) {
                this.rtsLogHelper.movingDown(this);
                return false;
            }

            } else {
                final String reason = 
                    stringUtil.EMPTY_STRING;
                    //new StringMaker().append(' ').append(geographicMapCellHistory.getTotalVisited()).append(' ').append(currentGeographicMapCellPosition).append(" - trying to move but not on path: ").append(pathList).toString();
                this.rtsLogHelper.notOnPath(this, geographicMapCellHistory, currentGeographicMapCellPosition, pathList);
                this.getWaypointBehavior().updatePathOnTargetMove(reason);
                return true;
            }

            this.rtsLogHelper.currentMoveEnded(this);
            
            if(this.movementAngle == this.angleFactory.LEFT.getValue() || 
                this.movementAngle == this.angleFactory.RIGHT.getValue()) {
                this.handleDeltalY(dx, dy);
            } else if(this.movementAngle == this.angleFactory.UP.getValue() || 
                this.movementAngle == this.angleFactory.DOWN.getValue()) {
                this.handleDeltalX(dx, dy);
            }
            
            return true;
        //} else if(absoluteDeltaAngle <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> ANGLE_INCREMENT) {

            //return false;
        } else {
            //this.slightAngle = angleOfTarget - angle;
     
            if(nextUnvisitedPathGeographicMapCellPosition != null) {
                
                if(this.steeringInsideGeographicMapCellPosition != nextUnvisitedPathGeographicMapCellPosition) {
                    
                    if (Math.abs(dx) <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> Math.abs(dy) <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> dy != 0) {
                        this.handleDeltalY(dx, dy);
                    } else if (dx != 0) {
                        this.handleDeltalX(dx, dy);
                    } else {
                        this.handleDeltalY(dx, dy);
                        //throw new RuntimeException();
                    }
                    
                }

                int deltaAngle2 = this.movementAngle - angle;
                if (deltaAngle2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    this.rtsLogHelper.rotateRight(this);
                    //this.getGameKeyEventList().add(gameKeyEventFactory.getInstance(this, Canvas.RIGHT));
                    this.right();
                } else {
                    this.rtsLogHelper.rotateLeft(this);
                    //this.getGameKeyEventList().add(gameKeyEventFactory.getInstance(this, Canvas.LEFT));
                    this.left();
                }
                
                return true;
                
            } else {
                this.rtsLogHelper.noRotation(this);
            }
            
            //System.out.println(allowing movement outside of logic?");
            return true;
            //return false;
        }

    }
            
    public boolean isWaypointListEmptyOrOnlyTargets() {
        return false;
    }

    public TrackingEvent getTrackingEvent() {
        return null;
    }

    public boolean buildingChase(final AllBinaryLayer allbinaryLayer, final GeographicMapCellPosition cellPosition) throws Exception {
        return false;
    }
    
    public void allStop() {
        
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

    public int direction = 0;
    public void forward()
    throws Exception
    {
        //TWB - temp hack for path finding to work
        final org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies Enemies = (org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies) gdObject;
        if (this.direction == 0) {
            Enemies.setX(Enemies.x + -(Enemies.speed));
        } else if (this.direction == 1) {
            Enemies.setX(Enemies.x + (Enemies.speed));
        } else if (this.direction == 2) {
            Enemies.setY(Enemies.y + -(Enemies.speed));
        } else if (this.direction == 3) {
            Enemies.setY(Enemies.y + (Enemies.speed));
        }
        this.updatePosition();

    }

    public void right()
    throws Exception
    {
        if(this.direction == 0) {
            this.direction = 2;
        } else if(this.direction == 1) {
            this.direction = 3;
        } else if(this.direction == 2) {
            this.direction = 1;
        } else if(this.direction == 3) {
            this.direction = 0;
        }
        //TWB - temp hack for path finding to work
        final org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies Enemies = (org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies) gdObject;
        Enemies.direction = this.direction;
        final String animationName = gdObject.getAnimation(this.gdObject.ObjectName() + gameGlobals.walkAnimationArray[this.direction]);
        if(gdObject.setAnimation(animationName)) this.resetAnimation();
        
        this.updateAngle();

    }

    public void left()
    throws Exception
    {
        if(this.direction == 0) {
            this.direction = 3;
        } else if(this.direction == 1) {
            this.direction = 2;
        } else if(this.direction == 2) {
            this.direction = 0;
        } else if(this.direction == 3) {
            this.direction = 1;
        }
        //TWB - temp hack for path finding to work
        final org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies Enemies = (org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies) gdObject;
        Enemies.direction = this.direction;
        final String animationName = gdObject.getAnimation(this.gdObject.ObjectName() + gameGlobals.walkAnimationArray[this.direction]);
        if(gdObject.setAnimation(animationName)) this.resetAnimation();

        this.updateAngle();
        
    }
    
    public void updateAngle() {
        final org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies Enemies = (org.allbinary.game.canvas.GD1GDObjectsFactory.Enemies) gdObject;
        final AngleFactory angleFactory = AngleFactory.getInstance();
        if (this.direction == 0) {
            Enemies.setAngle(angleFactory.LEFT.getValue(), this);
        } else if (this.direction == 1) {
            Enemies.setAngle(angleFactory.RIGHT.getValue(), this);
        } else if (this.direction == 2) {
            Enemies.setAngle(angleFactory.UP.getValue(), this);
        } else if (this.direction == 3) {
            Enemies.setAngle(angleFactory.DOWN.getValue(), this);
        }
    }
        
        </xsl:if>


        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
                        
            public void handleLayout<xsl:value-of select="$layoutIndex" />() {

            <xsl:for-each select="objects" >

                <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" />
                    <xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >
                        
                        <xsl:if test="1" >
                        this.playerGameInput = new PlayerGameInput(this.getGameKeyEventList(), 0);

                        //if (allBinaryGameLayerManager.getGameInfo().getGameType() != GameTypeFactory.getInstance().BOT)
                        //{   
                            GameKeyEventHandler.getInstance().addListener(playerGameInput, playerGameInput.getPlayerInputId());
                            //AllBinaryGameCanvas.addPlayerGameInput(((PlayerGameInputCompositeInterface) this.playerLayer).getPlayerGameInput());
                        //}

                        </xsl:if>

                        this.initInputProcessors();               
                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>

            <xsl:variable name="hasCollisionListForLayout" ><xsl:call-template name="hasCollisionListForLayout" ><xsl:with-param name="layoutIndex" select="$layoutIndex" /></xsl:call-template></xsl:variable>
            <xsl:variable name="hasWhileCollisionList" ><xsl:call-template name="hasWhileCollisionList" ><xsl:with-param name="layoutIndex" select="$layoutIndex" /></xsl:call-template></xsl:variable>
            <xsl:variable name="hasSubInstructionsCollisionList" ><xsl:call-template name="hasSubInstructionsCollisionList" ><xsl:with-param name="layoutIndex" select="$layoutIndex" /></xsl:call-template></xsl:variable>
            //CollisionNP - processing for the specific game object - //hasCollisionListForLayout=<xsl:if test="contains($hasCollisionListForLayout, 'found')" ></xsl:if> //hasWhileCollisionList=<xsl:if test="contains($hasWhileCollisionList, 'found')" ></xsl:if> //hasSubInstructionsCollisionList=<xsl:if test="contains($hasSubInstructionsCollisionList, 'found')" ></xsl:if>
            <xsl:if test="contains($hasCollisionListForLayout, 'found') or contains($hasWhileCollisionList, 'found')  or contains($hasSubInstructionsCollisionList, 'found')" >
            final org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals<xsl:value-of select="$layoutIndex" /> = 
                org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
            </xsl:if>
            //addCollisionList
            <xsl:call-template name="addCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
            //addWhileCollisionList
            <xsl:call-template name="addWhileCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
            //addSubInstructionsCollisionList
            <xsl:call-template name="addSubInstructionsCollisionList" >
                <xsl:with-param name="layoutIndex" select="$layoutIndex" />
            </xsl:call-template>
            
            }            
        </xsl:for-each>
                                                                
                }

    </xsl:template>

</xsl:stylesheet>
