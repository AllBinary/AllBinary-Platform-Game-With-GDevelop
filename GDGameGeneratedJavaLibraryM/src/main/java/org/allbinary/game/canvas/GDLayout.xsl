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
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventPaint.xsl" />
        
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventLogicConstruction.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventOpen.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventClose.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDEventProcess.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/PaintDebugButtons.xsl" />
    
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
                //layoutName=<xsl:value-of select="$layoutName" />
                //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />
                //externalEventActionModVarSceneAsString=<xsl:value-of select="$externalEventActionModVarSceneAsString" />
                
                package org.allbinary.game.canvas;

                import javax.microedition.lcdui.Graphics;

                import org.allbinary.game.input.event.RawKeyEventHandler;
                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.game.layer.AllBinaryGameLayerManager;
                import org.allbinary.game.layer.GDGameLayer;
                import org.allbinary.game.layer.form.GDFormInputProcessor;
                import org.allbinary.game.layout.BaseGDNodeStats;
                import org.allbinary.game.layout.GDNode;
                import org.allbinary.game.layout.GDNodes;
                import org.allbinary.game.layout.GDNodeUtil;
                import org.allbinary.game.layer.special.TempGameLayerUtil;
                import org.allbinary.game.layout.GDNodeStatsFactory;
                import org.allbinary.game.layout.GDObject;
                import org.allbinary.graphics.GPoint;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.graphics.color.BasicColor;
                import org.allbinary.graphics.color.BasicColorFactory;
                import org.allbinary.graphics.color.BasicColorSetUtil;
                import org.allbinary.graphics.displayable.MyCanvas;
                import org.allbinary.input.motion.gesture.MotionGestureInput;
                import org.allbinary.input.motion.gesture.TouchMotionGestureFactory;
                import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
                import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
                import org.allbinary.input.motion.gesture.observer.MovedMotionGesturesHandler;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.math.RectangleCollisionUtil;
                import org.allbinary.string.CommonStrings;
                import org.allbinary.logic.string.StringMaker;
                import org.allbinary.time.GameTickTimeDelayHelper;
                import org.allbinary.time.GameTickTimeDelayHelperFactory;
                import org.allbinary.logic.NullUtil;
                import org.allbinary.util.ArrayUtil;
                import org.allbinary.util.BasicArrayList;

                //Layout name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimation extends GDSpecialAnimation
                {
                    private static GD<xsl:value-of select="$layoutIndex" />SpecialAnimation instance = null;

                    public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimation getInstance(final MyCanvas abCanvas, final AllBinaryGameLayerManager allBinaryGameLayerManager) 
                        throws Exception {

                        final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();

                        abToGBUtil.abCanvas = abCanvas;
                        abToGBUtil.allBinaryGameLayerManager = allBinaryGameLayerManager;

                        if(instance == null) {
                            instance = new GD<xsl:value-of select="$layoutIndex" />SpecialAnimation();
                        } else {
                            instance.reinitInstances();
                        }
                        return instance;

                    }

                        public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimation getInstance()
                        {
                            return instance;
                        }

                        protected final LogUtil logUtil = LogUtil.getInstance();
                        private final CommonStrings commonStrings = CommonStrings.getInstance();
                        private final NullUtil nullUtil = NullUtil.getInstance();
                        private final ArrayUtil arrayUtil = ArrayUtil.getInstance();
                        private final PointFactory pointFactory = PointFactory.getInstance();
                        private final RectangleCollisionUtil rectangleCollisionUtil = RectangleCollisionUtil.getInstance();
                        private final GameTickTimeDelayHelper gameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance();
                        
                        private final BaseGDNodeStats gdNodeStatsFactory = GDNodeStatsFactory.getInstance();

                        private final StringMaker stringBuilder = new StringMaker();

                        private final GDNodes gdNodes = GDNodeUtil.getInstance().getInstance(<xsl:value-of select="$layoutIndex" />);
                                                
                        private final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
                        private final GDGlobalsSpecialAnimation gdGlobalsSpecialAnimation = GDGlobalsSpecialAnimation.getInstance();

                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals;
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder builder;
                        
                        //layers=<xsl:for-each select="layers" ><xsl:value-of select="name" />,</xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        //behaviorsSharedData=<xsl:for-each select="behaviorsSharedData" >type=<xsl:value-of select="type" />,</xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                                                
                    private final TouchMotionGestureFactory touchMotionGestureFactory = TouchMotionGestureFactory.getInstance();

                    private boolean clear = false;

                    private GD<xsl:value-of select="$layoutIndex" />SpecialAnimation() {

                        logUtil.put(commonStrings.START, this, commonStrings.CONSTRUCTOR);
                    
                        <xsl:call-template name="scale" >
                            <xsl:with-param name="layoutIndex" >
                                <xsl:value-of select="$layoutIndex" />
                            </xsl:with-param>
                            <xsl:with-param name="layoutName" >
                                <xsl:value-of select="$layoutName" />
                            </xsl:with-param>
                        </xsl:call-template>

                        gdNodeStatsFactory.reset();

                        globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.getInstanceOrCreate();
                        GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.getInstanceOrCreate();
                        builder = new GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder();
                    
<!--                        try {

                        } catch(Exception e) {
                            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e);
                        }-->

                        //allBinaryGameLayerManager.log();
                        //groupLayerManagerListener.log();
                        
                        gdNodeStatsFactory.log(stringBuilder, this);
                        
                        logUtil.put(commonStrings.END, this, commonStrings.CONSTRUCTOR);
                    }

                    public void process() {
                        
                        try {

                        globals.globalsGameTickTimeDelayHelper.loop();

                        if(globals.processingMotionEventListIndex == 0) {
                            globals.processingMotionEventListIndex = 1;
                            globals.inUseMotionEventListIndex = 0;
                        } else {
                            globals.processingMotionEventListIndex = 0;
                            globals.inUseMotionEventListIndex = 1;
                        }

                        if(true) {

                        GDGameLayer gameLayer;
                        <xsl:for-each select="objects" >
                            <xsl:if test="type = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" >
                        final int size2 = globals.<xsl:value-of select="name" />GDGameLayerList.size();
                            </xsl:if>
                        </xsl:for-each>
                        
                        final BasicArrayList motionEventList = (BasicArrayList) globals.motionEventListOfList[globals.processingMotionEventListIndex];
                        int size10 = motionEventList.size();
                        MotionGestureEvent motionGestureEvent;
                        boolean pressedAlready = false;
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size10; index++) {
                        
                            motionGestureEvent = (MotionGestureEvent) motionEventList.get(index);
                            
                            final MotionGestureInput motionGestureInput = motionGestureEvent.getMotionGesture();
                            if (motionGestureInput == touchMotionGestureFactory.PRESSED) {
                                globals.lastMotionGestureInput = motionGestureInput;
                                pressedAlready = true;
                            } else if(motionGestureInput == touchMotionGestureFactory.RELEASED) {
                            
                        <xsl:for-each select="objects" >
                            <xsl:if test="type = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" >
                        for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                            //SpriteMultitouchJoystick::SpriteMultitouchJoystick
                            gameLayer = (GDGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(index2);
                            final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /><xsl:text> </xsl:text><xsl:value-of select="name" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />) gameLayer.gdObject;
                            if(motionGestureEvent.getId() == <xsl:value-of select="name" />.getId()) {
                                <xsl:value-of select="name" />.setId(-1);
                                <xsl:value-of select="name" />.setPoint(PointFactory.getInstance().ZERO_ZERO);
                            }
                        }
                            </xsl:if>
                        </xsl:for-each>

                                if(pressedAlready) {
                                    size10 = index;
                                    break;
                                }
                                globals.lastMotionGestureInput = motionGestureInput;
                            }

                        GPoint point;
                        <xsl:for-each select="objects" >
                            <xsl:if test="type = 'SpriteMultitouchJoystick::SpriteMultitouchJoystick'" >
                        for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                            //SpriteMultitouchJoystick::SpriteMultitouchJoystick
                            gameLayer = (GDGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(index2);
                            point = motionGestureEvent.getCurrentPoint();
                            if (rectangleCollisionUtil.isInside(gameLayer.getXP(), gameLayer.getYP() - 2, gameLayer.getX2(), gameLayer.getY2() + 2, point.getX(), point.getY())) {
                                final GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" /><xsl:text> </xsl:text><xsl:value-of select="name" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="name" />) gameLayer.gdObject;

                                <xsl:value-of select="name" />.setId(motionGestureEvent.getId());
                                <xsl:value-of select="name" />.setPoint(point);
                                final float portionOfX = ((float) point.getX() - gameLayer.getXP() - gameLayer.getHalfWidth()) / (float) gameLayer.getWidth() * 2;
                                final float portionOfY = -((float) point.getY() - gameLayer.getYP() - gameLayer.getHalfHeight()) / (float) gameLayer.getHeight() * 2;
                                //logUtil.put(new StringMaker().append(portionOfX).append("portionOfX: ").append(point.getX()).append(" - ").append(gameLayer.getXP()).append(" / ").append(gameLayer.getWidth()).toString(), this, commonStrings.CONSTRUCTOR);
                                //logUtil.put(new StringMaker().append(portionOfY).append("portionOfY: ").append(point.getY()).append(" - ").append(gameLayer.getYP()).append(" / ").append(gameLayer.getHeight()).toString(), this, commonStrings.CONSTRUCTOR);
                                <xsl:value-of select="name" />.setStickForceX(portionOfX);
                                <xsl:value-of select="name" />.setStickForceY(portionOfY);
                                gameLayer.getDimensionalBehavior().getAnimationBehavior().set(gameLayer, <xsl:value-of select="name" />);
                            }                            
                        }
                            </xsl:if>
                        </xsl:for-each>

                            //final MotionGestureInput motionGestureInput = motionGestureEvent.getMotionGesture();
                            globals.lastPointGDNode.process(motionGestureEvent, globals.lastMotionGestureInput);

                        //MouseButton
                        <xsl:call-template name="processNodesForMotionGestureEvent" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>

                    }
                    
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size10; index++) {
                        motionEventList.remove(0);
                    }

                    }                                

                    gdNodes.process();

                        gdGlobalsSpecialAnimation.process(globals.globalsGameTickTimeDelayHelper.timeDelta);

                    <!--
                    <xsl:for-each select="../externalEvents" >
                        //externalEvents - START
                        <xsl:call-template name="actionIds" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="caller" >externalEvents</xsl:with-param>
                        </xsl:call-template>
                        //externalEvents - END
                    </xsl:for-each>
                    -->

                    //eventsProcess - START
                    <xsl:call-template name="eventsProcess" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsProcess - END
                    
                    int size;
                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="objectName" select="name" />

                        if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.objectArray != nullUtil.NULL_OBJECT_ARRAY) {
                        <xsl:if test="behaviors" >
                        //Behavior - animation
                        //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>
                        //if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList != null) {
                           final BasicArrayList removeList = new BasicArrayList();
                           size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.size();
                           for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                           <xsl:for-each select="behaviors" >
                               //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />
                               <xsl:if test="type = 'DestroyOutsideBehavior::DestroyOutside'" >
                               //logUtil.put("Behavior objectName=<xsl:value-of select="$objectName" /> name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />: check", this, commonStrings.PROCESS);
                               if(globals.destroyOutsideBehavior.process(globals.<xsl:value-of select="$objectName" />GDGameLayerList, index, globals.graphics)) {
                                   //logUtil.put("Behavior objectName=<xsl:value-of select="$objectName" /> name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />: remove", this, commonStrings.PROCESS);
                                   removeList.add(globals.<xsl:value-of select="$objectName" />GDGameLayerList.get(index));
                               }
                               </xsl:if>
                           </xsl:for-each>
                           }
                           
                           GDGameLayer gdGameLayer;
                           for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> removeList.size(); index++) {
                               gdGameLayer = (GDGameLayer) removeList.get(index);
                               //This removes itself from the list
                               gdGameLayer.setDestroyed(true);
                               //logUtil.put("Behavior objectName=<xsl:value-of select="name" /> size=<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList size: " + <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.size(), this, commonStrings.PROCESS);
                           }

                        </xsl:if>
                        <xsl:if test="not(behaviors)" >
                           //Behavior - animation without behaviors
                        </xsl:if>
                        
                           size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.size();
                           GDGameLayer gameLayer;
                           for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                               gameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.get(index));
                               gameLayer.process(globals.globalsGameTickTimeDelayHelper.timeDelta);
                               gameLayer.animate(globals.globalsGameTickTimeDelayHelper.timeDelta);
                           }

                        }
                    </xsl:for-each>

                        globals.globalsGameTickTimeDelayHelper.lastStartTime = gameTickTimeDelayHelper.startTime;
                    
                        } catch(Exception e) {
                            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e);
                        }
                        
                    }

                    public void paint(Graphics graphics, int x, int y)
                    {
                        //gdNodeStatsFactory.reset();

                    <xsl:call-template name="paintDebugButtons" >
                        <xsl:with-param name="caller" >paint</xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="createdObjectsAsString" >
                            <xsl:value-of select="$createdObjectsAsString" />
                        </xsl:with-param>

                    </xsl:call-template>

                    //eventsPaint - START
                    <!--
                    <xsl:call-template name="eventsPaint" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    -->
                    //eventsPaint - END

                    //instances - START
                    <xsl:for-each select="instances" >
                        <xsl:variable name="textObjectTextName" >TextObject::Text:<xsl:value-of select="name" /></xsl:variable>
                        <xsl:if test="contains($objectsAsString, $textObjectTextName)" >
                        //TextObject::Text instance
                        final int <xsl:value-of select="name" />Size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />RectangleList.size();
                        if(<xsl:value-of select="name" />Size != 0) {

                            final GDObject <xsl:value-of select="name" />GDobject = (GDObject) ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />GDGameLayerList.get(0)).gdObject;
                            final int <xsl:value-of select="name" />X = x + <xsl:value-of select="name" />GDobject.x;
                            final int <xsl:value-of select="name" />Y = y + <xsl:value-of select="name" />GDobject.y;

                            //Rectangle 2
                            final Rectangle <xsl:value-of select="name" />Rectangle = new Rectangle(
                                pointFactory.getInstance(<xsl:value-of select="name" />X, <xsl:value-of select="name" />Y),
                                <xsl:value-of select="name" />GDobject.Width(globals.graphics), <xsl:value-of select="name" />GDobject.Height(globals.graphics));
                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="name" />RectangleList.add(<xsl:value-of select="name" />Rectangle);
                        }
                        </xsl:if>
                    </xsl:for-each>
                    //instances - END

                        //gdNodeStatsFactory.log(stringBuilder, this);
                    }

                    public void open() {
                    
                        //logUtil.put("scene - open", this, commonStrings.PROCESS);

                    <xsl:variable name="foundMousePositionNeeded" >found</xsl:variable>
                    <xsl:if test="contains($foundMousePositionNeeded, 'found')" >
                        BasicMotionGesturesHandler.getInstance().addListener(globals.eventListenerInterfaceLastPoint);
                        MovedMotionGesturesHandler.getInstance().addListener(globals.eventListenerInterfaceLastPoint);
                    </xsl:if>

                        GDFormInputProcessor.getInstance().open();
                    
                    //eventsOpen - START
                    <xsl:call-template name="eventsOpen" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsOpen - END
                    }

                    public void close() {
                    
                        //logUtil.put("scene - close", this, commonStrings.PROCESS);

                        GDFormInputProcessor.getInstance().close();

                    <xsl:if test="contains($foundMousePositionNeeded, 'found')" >
                        MovedMotionGesturesHandler.getInstance().removeListener(globals.eventListenerInterfaceLastPoint);
                        BasicMotionGesturesHandler.getInstance().removeListener(globals.eventListenerInterfaceLastPoint);
                    </xsl:if>
                    
                        final int size = globals.motionEventListOfList.length;
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            final BasicArrayList motionEventList = (BasicArrayList) globals.motionEventListOfList[index];
                            motionEventList.clear();
                        }
                        
                        globals.lastMotionGestureInput = null;
                    
                    //eventsClose - START
                    <xsl:call-template name="eventsClose" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsClose - END
                    }

                    public void reinitInstances() throws Exception {
                    
                        if(!clear) {
                            //logUtil.put("scene - reinitInstances - duplicate", this, commonStrings.PROCESS);
                            //throw new RuntimeException();
                            return;
                        }
                    
                        //logUtil.put("scene - reinitInstances", this, commonStrings.PROCESS);

                    this.globals.reset();

                    <xsl:call-template name="addFromInstancesCache" >
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
                        </xsl:with-param>
                    </xsl:call-template>

                        builder.build();

                        <xsl:variable name="hasHighscoreSubmissionComplete" >
                            <xsl:for-each select="variables" >
                                <xsl:if test="name = 'highscoreSubmissionComplete'" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        
                        <xsl:if test="not(contains($hasHighscoreSubmissionComplete, 'found'))" >
                        //This layout should not be the highscore layout
                        logUtil.put("This layout should not be the highscore layout", this, commonStrings.PROCESS);
                        globals.highscoreSubmissionComplete = false;
                        </xsl:if>

                        clear = false;
                    }
                    
                    public void reset() {

                        //logUtil.put("scene - clear", this, commonStrings.PROCESS);

                        clear = true;

                        GDFormInputProcessor.getInstance().reset();

                        //objects - all - //layout - reset
            <xsl:for-each select="objects" >

                <xsl:variable name="initialVariablesValue" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="initialVariables/value" /></xsl:with-param><xsl:with-param name="find" >-</xsl:with-param><xsl:with-param name="replacementText" >Neg</xsl:with-param></xsl:call-template></xsl:variable>

                        //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="type" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>
                        //<xsl:value-of select="name" />GDObjectList<xsl:value-of select="$initialVariablesValue" />.clear();
                        globals.<xsl:value-of select="name" />GDGameLayerList<xsl:value-of select="$initialVariablesValue" />.clear();
                        <xsl:if test="type = 'TextObject::Text'" >
                        globals.<xsl:value-of select="name" />RectangleList<xsl:value-of select="$initialVariablesValue" />.clear();
                        </xsl:if>
                
                        globals.<xsl:value-of select="name" />CacheGDGameLayerList.clear();

            </xsl:for-each>

                        gdNodes.clear();
                        
                    }

                    public GDSceneGlobals getGlobals() {
                        return this.globals;
                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
