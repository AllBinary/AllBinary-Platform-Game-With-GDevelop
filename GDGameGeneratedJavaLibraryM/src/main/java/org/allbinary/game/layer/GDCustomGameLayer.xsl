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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectClassPropertyGDObjects.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAssign.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAnimations.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDObjectAtIndex.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyActions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClassPropertyConditions.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObject.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventWithOnceCondition.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventPaint.xsl" />
        
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventLogicConstruction.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventOpen.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClose.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventProcess.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/PaintDebugButtons.xsl" />
    
    <xsl:output method="html" indent="yes" />

    <xsl:template name="mapCollisionMaskHack" >
        <xsl:for-each select="events" >
            <xsl:variable name="foundCollisionNP" >
            <xsl:for-each select="conditions" >
                <xsl:if test="type/value = 'CollisionNP'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            <xsl:value-of select="text()" />
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
            </xsl:variable>
            <xsl:if test="string-length($foundCollisionNP) > 0" >
                <xsl:for-each select="actions" >
            //globals.nodeArray[globals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:for-each>
            </xsl:if>
            <xsl:call-template name="mapCollisionMaskHack" />
        </xsl:for-each>
    </xsl:template>
        
    <xsl:template match="/game">
        <xsl:variable name="windowWidth" select="properties/windowWidth" />

        <xsl:variable name="foundOtherViewPosition" ><xsl:for-each select="layouts" ><xsl:for-each select="objects" ><xsl:for-each select="behaviors" ><xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >found</xsl:if></xsl:for-each></xsl:for-each></xsl:for-each></xsl:variable>
        
                package org.allbinary.game.layer;

        import javax.microedition.lcdui.Canvas;
        import javax.microedition.lcdui.Graphics;
        import javax.microedition.lcdui.game.TiledLayer;

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
        import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals;
        </xsl:for-each>

        import org.allbinary.animation.AnimationInterfaceFactoryInterface;
        import org.allbinary.animation.IndexedAnimationInterface;
        import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
        import org.allbinary.direction.Direction;
        import org.allbinary.direction.DirectionFactory;
        import org.allbinary.game.GameTypeFactory;
//        import org.allbinary.game.behavior.platformer.GeographicMapPlatformGameLayerBehavior;
//        import org.allbinary.game.behavior.platformer.InitialJumpBehavior;
//        import org.allbinary.game.behavior.platformer.PlatformCharacterBehavior;
//        import org.allbinary.game.behavior.platformer.PlatformCharacterInterface;
//        import org.allbinary.game.behavior.platformer.PlayerPlatformCharacterBehavior;
        import org.allbinary.game.configuration.feature.Features;
        import org.allbinary.game.configuration.feature.InputFeatureFactory;
        import org.allbinary.game.identification.Group;
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
        import org.allbinary.game.layout.GDObject;        
        import org.allbinary.game.physics.acceleration.BasicAccelerationProperties;
        import org.allbinary.game.physics.velocity.VelocityProperties;
        import org.allbinary.game.physics.velocity.VelocityUtil;
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
        import org.allbinary.media.graphics.geography.map.GeographicMapCellPosition;
        import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface;
        import org.allbinary.media.graphics.geography.map.GeographicMapEventHandler;
        import org.allbinary.util.BasicArrayList;
        import org.allbinary.view.ViewPosition;

                public class GDCustomGameLayer extends GDGameLayer 
        <xsl:if test="contains($foundOtherViewPosition, 'found')" >implements GameKeyEventSourceInterface, org.allbinary.game.behavior.platformer.PlatformCharacterInterface </xsl:if>
        <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >implements org.allbinary.game.behavior.topview.TopViewCharacterInterface </xsl:if>
                {

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            <xsl:for-each select="objects" >
                
                <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >
                <xsl:if test="type = 'TileMap::TileMap'" >
                    public final org.allbinary.game.behavior.topview.GeographicMapTopViewGameLayerBehavior2 topViewGameBehavior = 
                        new org.allbinary.game.behavior.topview.GeographicMapTopViewGameLayerBehavior2(64, false, 6) {
                    
    public void moveAndLand(final BasicGeographicMap[] geographicMapInterfaceArray, final GeographicMapCellPosition geographicMapCellPosition, final VelocityProperties velocityProperties, final AllBinaryLayer layer, final int x, final int y) throws Exception {
        
        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("x: ").append(x).append(" y: ").append(y).append(CommonSeps.getInstance().SPACE).append(layer.getViewPosition().getX()).toString(), this, "moveAndLand"));
        
        if (geographicMapCellPosition != null) {

            super.moveAndLand(geographicMapInterfaceArray, geographicMapCellPosition, velocityProperties, layer, x, y);

            //final String MOVE_AND_LAND = "moveAndLand";
            //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Should Land at: ").append(this.gravityActionIndex).append(" y: ").append(y).toString(), this, MOVE_AND_LAND));
        } else {
            //LogUtil.put(LogFactory.getInstance("do not move", this, "moveAndLand"));
                    
            //CollisionNP
            final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
            <xsl:for-each select=".." >
            <xsl:call-template name="mapCollisionMaskHack" />
            </xsl:for-each>

        }
        
    }
                    
                    };
                    protected final org.allbinary.game.behavior.topview.TopViewCharacterBehavior topViewCharacterBehavior = 
                        <xsl:if test="1" >new org.allbinary.game.behavior.topview.PlayerTopViewCharacterBehavior();</xsl:if>
                        <xsl:if test="0" >new org.allbinary.game.behavior.topview.NonPlayerTopViewCharacterBehavior();</xsl:if>

                    public final AllBinaryGameLayerManager allBinaryGameLayerManager;
                </xsl:if>
                </xsl:if>

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

                    protected final AllBinaryGameLayerManager allBinaryGameLayerManager;

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

                    public GDCustomGameLayer(final AllBinaryGameLayerManager allBinaryGameLayerManager,
                        final BasicArrayList gameLayerList, final BasicArrayList gameLayerDestroyedList, 
                        final BasicArrayList behaviorList,
                        final String gdName, final Group[] groupInterface,
                        final AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
                        final ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
                        final Rectangle layerInfo, 
                        final GDObject gdObject, final AnimationBehaviorBase animationBehavior) throws Exception {

                        super(gameLayerList, gameLayerDestroyedList, 
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
                            new VelocityProperties(3200, 3200),
        </xsl:if>
                            gdName, groupInterface,
                            animationInterfaceFactoryInterfaceArray,
                            proceduralAnimationInterfaceFactoryInterfaceArray,
                            layerInfo, 
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

        <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:for-each select="objects" >            
                
                <xsl:if test="type = 'TileMap::TileMap'" >
                        this.allBinaryGameLayerManager = allBinaryGameLayerManager;
                    
                        //final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
                        //if(this.gdObject.type == globals.TILEMAP__COLLISIONMASK) {
                        //} else if(this.gdObject.type == globals.TILEMAP__TILEMAP) {
                            //this.updatePosition();
                        //}
                    
                </xsl:if>

            </xsl:for-each>
        </xsl:for-each>
        </xsl:if>

        <xsl:if test="contains($foundOtherViewPosition, 'found')" >
                        this.allBinaryGameLayerManager = allBinaryGameLayerManager;
                        
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

            <xsl:for-each select="objects" >

                <xsl:for-each select="behaviors" >
                //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" />
                    <xsl:if test="type = 'PlatformBehavior::PlatformerObjectBehavior'" >
                        
                        <xsl:if test="1" >
                        this.playerGameInput = new PlayerGameInput(this.getGameKeyEventList(), 0);

                        if (allBinaryGameLayerManager.getGameInfo().getGameType() != GameTypeFactory.getInstance().BOT)
                        {   
                            GameKeyEventHandler.getInstance().addListener(playerGameInput, playerGameInput.getPlayerInputId());
                            //AllBinaryGameCanvas.addPlayerGameInput(((PlayerGameInputCompositeInterface) this.playerLayer).getPlayerGameInput());
                        }

                        </xsl:if>

                        this.initInputProcessors();               
                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>

                    }
                
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />

            <xsl:for-each select="objects" >
                
                <xsl:if test="not(contains($foundOtherViewPosition, 'found'))" >
                <xsl:if test="type = 'TileMap::TileMap'" >
                    
        private int lastX;
        private int lastY;

    public void move() {
        try {
            //LogUtil.put(LogFactory.getInstance("Move Map: " + this.gdObject.x + "," + this.gdObject.y, this, "move"));

            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;

            final BasicGeographicMap[] geographicMapInterfaceArray
                    = geographicMapCompositeInterface.getGeographicMapInterface();

            if(geographicMapInterfaceArray != null) {
                //final BasicGeographicMap geographicMapInterface = geographicMapInterfaceArray[0];
                final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstance();
                if(this.gdObject.type == globals.TILEMAP__COLLISIONMASK) {

                } else if(this.gdObject.type == globals.TILEMAP__TILEMAP) {
                    final GDGameLayer player = (GDGameLayer) globals.PlayerGDGameLayerList.get(0);
                    //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Move Map: ").append(this.gdObject.toShortString()).toString(), this, "move"));
                    if(this.topViewGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, player, this.gdObject.x, this.gdObject.y)) {
                        lastX = this.gdObject.x;
                        lastY = this.gdObject.y;
                    } else {
                        //this.gdObject.setX(lastX);
                        //this.gdObject.setY(lastY);
                        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Move Back?: ").append(this.gdObject.x).append(CommonSeps.getInstance().COMMA).append(this.gdObject.y).toString(), this, "move"));
                    }

                } else {
                    final GDGameLayer player = (GDGameLayer) globals.PlayerGDGameLayerList.get(0);
                    if(this == player) {
                        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Player - Move Map: ").append(this.gdObject.x).append(",").append(this.gdObject.y).toString(), this, "move"));
                        //this.topViewGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, this, this.gdObject.x, this.gdObject.y);
                    } else {
                        super.move();
                    }
                }
            } else {
                LogUtil.put(LogFactory.getInstance(new StringMaker().append("Map was null: ").append(this.gdObject.x).append(",").append(this.gdObject.y).toString(), this, "move"));
                GeographicMapEventHandler.getInstance().addListener(this);
            }

        } catch (Exception e) {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "move", e));
        }
    }
                    
    public void updatePosition() {
        super.updatePosition();
        this.move();
    }
    
    public void move2() {
        try {
            //LogUtil.put(LogFactory.getInstance("Move Map: " + this.gdObject.x + "," + this.gdObject.y, this, "move"));

            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;

            final BasicGeographicMap[] geographicMapInterfaceArray
                    = geographicMapCompositeInterface.getGeographicMapInterface();

            if(geographicMapInterfaceArray != null) {
                //final BasicGeographicMap geographicMapInterface = geographicMapInterfaceArray[0];
                
                final GD0SpecialAnimationGlobals globals = GD0SpecialAnimationGlobals.getInstance();
                if(this.gdObject.type == globals.TILEMAP__COLLISIONMASK) {

                } else if(this.gdObject.type == globals.TILEMAP__TILEMAP) {
                    final GDGameLayer Player = (GDGameLayer) globals.PlayerGDGameLayerList.get(0);
                    //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Move Map: ").append(this.gdObject.x).append(",").append(this.gdObject.y).toString(), this, "move"));
                    this.terrainMove(geographicMapInterfaceArray, this.gdObject.x, this.gdObject.y);

                } else {
                    final GDGameLayer Player = (GDGameLayer) globals.PlayerGDGameLayerList.get(0);
                    if(this == Player) {
                        //LogUtil.put(LogFactory.getInstance(new StringMaker().append("Player - Move Map: ").append(this.gdObject.x).append(",").append(this.gdObject.y).toString(), this, "move"));
                        //this.topViewGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, this, this.gdObject.x, this.gdObject.y);
                    } else {
                        super.move();
                    }
                }
            } else {
                LogUtil.put(LogFactory.getInstance(new StringMaker().append("Map was null: ").append(this.gdObject.x).append(",").append(this.gdObject.y).toString(), this, "move"));
                GeographicMapEventHandler.getInstance().addListener(this);
            }

        } catch (Exception e) {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "move", e));
        }
    }

    public void updatePosition2() {
        super.updatePosition();
        this.move2();
    }

    public void terrainMove(final BasicGeographicMap[] geographicMapInterfaceArray, final int dx, final int dy) {
        this.topViewCharacterBehavior.terrainMove(this, geographicMapInterfaceArray, dx, dy);
    }
    
    public void terrainEvent(final int dx, final int dy, 
            final BasicGeographicMap[] geographicMapInterfaceArray,
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
                    
//    public void paint(final Graphics graphics) {
//        super.paint(graphics);
//        if(this.topViewGameBehavior.blockGeographicMapCellPosition != null) {
//        graphics.setColor(BasicColorFactory.getInstance().RED.intValue());
//        graphics.drawString(this.topViewGameBehavior.blockGeographicMapCellPosition.toString(), 10, 10, 0);
//        }
//    }

                </xsl:if>
                </xsl:if>
                
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

        //updateGDObject(globals.timeDelta);
        updateGDObject(1000);
        VelocityUtil.reduceX(this.velocityInterface, 90, 100);
    }
                        
    public void terrainEvent(final int dx, final int dy, final BasicGeographicMap[] geographicMapInterfaceArray,
            final GeographicMapCellPosition geographicMapCellPosition) throws Exception {
    }

    public void terrainMove(final BasicGeographicMap[] geographicMapInterfaceArray, final int dx, final int dy) {
        this.platformCharacterBehavior.terrainMove(this, geographicMapInterfaceArray, dx, dy);
    }
   
    public void terrainLand() {
        //this.specialAnimationInterfaceArray[LEGS_ANIMATION].setFrame(STANDARD_FRAME);
    }

    public void move() {
        try {
            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;

            final BasicGeographicMap[] geographicMapInterfaceArray
                    = geographicMapCompositeInterface.getGeographicMapInterface();

            if(geographicMapInterfaceArray != null) {
                final BasicGeographicMap geographicMapInterface = geographicMapInterfaceArray[0];
                this.platformGameBehavior.move(geographicMapInterfaceArray, this.velocityInterface, this);
            } else {
                //LogUtil.put(LogFactory.getInstance("Map was null, this, "move"));
            }

        } catch (Exception e) {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "move", e));
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
            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;

            final BasicGeographicMap[] geographicMapInterfaceArray
                    = geographicMapCompositeInterface.getGeographicMapInterface();

            if(geographicMapInterfaceArray != null) {
                this.platformGameBehavior.right(geographicMapInterfaceArray, this.velocityInterface, this);
            }
        } catch (Exception e) {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "right", e));
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
            final GeographicMapCompositeInterface geographicMapCompositeInterface
                    = (GeographicMapCompositeInterface) this.allBinaryGameLayerManager;

            final BasicGeographicMap[] geographicMapInterfaceArray
                    = geographicMapCompositeInterface.getGeographicMapInterface();

            if(geographicMapInterfaceArray != null) {
                this.platformGameBehavior.left(geographicMapInterfaceArray, this.velocityInterface, this);
            }

        } catch (Exception e) {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "left", e));
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
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "processInput"));
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
            
                
                }

    </xsl:template>

</xsl:stylesheet>
