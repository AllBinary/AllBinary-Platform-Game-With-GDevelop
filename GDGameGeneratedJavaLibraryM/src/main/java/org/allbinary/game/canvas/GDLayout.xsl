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
                <xsl:variable name="instancesAsString" >,<xsl:for-each select="instances" ><xsl:value-of select="layer" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="objectsAsString" >,<xsl:for-each select="/game/objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each>,<xsl:for-each select="objects" ><xsl:value-of select="type" />:<xsl:value-of select="name" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="createdObjectsAsString" >,<xsl:call-template name="externalEventsCreateActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="createActions" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                <xsl:variable name="externalEventActionModVarSceneAsString" >,<xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param><xsl:with-param name="layoutName" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template><xsl:call-template name="externalEventActionModVarScene" ><xsl:with-param name="totalRecursions" ><xsl:value-of select="0" /></xsl:with-param></xsl:call-template></xsl:variable>
                //instancesAsString=<xsl:value-of select="$instancesAsString" />
                //createdObjectsAsString=<xsl:value-of select="$createdObjectsAsString" />
                //objectsAsString=<xsl:value-of select="$objectsAsString" />
                //externalEventActionModVarSceneAsString=<xsl:value-of select="$externalEventActionModVarSceneAsString" />
                
                package org.allbinary.game.canvas;

                import javax.microedition.lcdui.Graphics;

                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.game.layer.AllBinaryGameLayerManager;
                import org.allbinary.game.layer.GDGameLayer;
                import org.allbinary.game.layout.BaseGDNodeStats;
                import org.allbinary.game.layout.GDNode;
                import org.allbinary.game.layout.GDNodeStatsFactory;
                import org.allbinary.game.layout.GDObject;
                import org.allbinary.graphics.GPoint;
                import org.allbinary.graphics.DisplayUtil;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.graphics.color.BasicColor;
                import org.allbinary.graphics.color.BasicColorFactory;
                import org.allbinary.graphics.color.BasicColorSetUtil;
                import org.allbinary.graphics.displayable.MyCanvas;
                import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
                import org.allbinary.input.motion.gesture.observer.MovedMotionGesturesHandler;
                import org.allbinary.logic.string.CommonStrings;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.time.GameTickTimeDelayHelperFactory;
                import org.allbinary.util.ArrayUtil;
                import org.allbinary.util.BasicArrayList;

                //Layout name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimation extends GDSpecialAnimation
                {

                    private static GD<xsl:value-of select="$layoutIndex" />SpecialAnimation instance;

                    public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimation getInstance(final MyCanvas canvas, final AllBinaryGameLayerManager allBinaryGameLayerManager)
                    {
                        instance = new GD<xsl:value-of select="$layoutIndex" />SpecialAnimation(canvas, allBinaryGameLayerManager);
                        return instance;
                    }

                        public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimation getInstance()
                        {
                            return instance;
                        }

                        private final CommonStrings commonStrings = CommonStrings.getInstance();
                        private final ArrayUtil arrayUtil = ArrayUtil.getInstance();
                        private final BaseGDNodeStats gdNodeStatsFactory = GDNodeStatsFactory.getInstance();
                        private final GameTickTimeDelayHelperFactory gameTickTimeDelayHelperFactory = GameTickTimeDelayHelperFactory.getInstance();
                        
                        private final StringBuilder stringBuilder = new StringBuilder();
                        
                        private final GDGameGlobals gameGlobals = GDGameGlobals.getInstance();
                        private final GDGlobalsSpecialAnimation gdGlobalsSpecialAnimation = GDGlobalsSpecialAnimation.getInstance();

                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals;
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder builder;
                        
                        //layers=<xsl:for-each select="layers" ><xsl:value-of select="name" />,</xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        //behaviorsSharedData=<xsl:for-each select="behaviorsSharedData" >type=<xsl:value-of select="type" />,</xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        
                        private final DisplayUtil displayUtil = DisplayUtil.getInstance();
                        <xsl:variable name="windowWidth" select="/game/properties/windowWidth" />
                        <xsl:variable name="windowHeight" select="/game/properties/windowHeight" />
                        private final int scaleLayout = <xsl:if test="$layoutIndex = 0" >1</xsl:if><xsl:if test="$layoutIndex > 0" >2</xsl:if>;
                        private final int scaleWidth = (displayUtil.width / <xsl:value-of select="$windowWidth" />);
                        private final int scaleHeight = (displayUtil.height / <xsl:value-of select="$windowHeight" />);
                        private final int scale = (scaleWidth <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> scaleHeight) ? scaleWidth : scaleHeight;

                    public GD<xsl:value-of select="$layoutIndex" />SpecialAnimation(final MyCanvas canvas, final AllBinaryGameLayerManager allBinaryGameLayerManager) {

                        LogUtil.put(LogFactory.getInstance(commonStrings.CONSTRUCTOR, this, commonStrings.CONSTRUCTOR));
                    
                        gdNodeStatsFactory.reset();

                        //this.allBinaryGameLayerManager = allBinaryGameLayerManager;
                        globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.create();
                        GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.create();
                        builder = new GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder(canvas, allBinaryGameLayerManager);
                    
<!--                        try {

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
                        }-->

                        //allBinaryGameLayerManager.log();
                        //groupLayerManagerListener.log();
                        
                        gdNodeStatsFactory.log(stringBuilder, this);
                    }

                    public void process() {
                        
                        try {

                        if(globals.lastStartTime == Long.MIN_VALUE) {
                            globals.timeDelta = 0;
                        } else {
                            globals.timeDelta = System.currentTimeMillis() - globals.lastStartTime;
                        }

                        GDNode gdNode;                        
                        final int size2 = globals.gdNodeWithRunnableList.size();
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index++) {
                            gdNode = (GDNode) globals.gdNodeWithRunnableList.get(index);
                            gdNode.currentRunnable.run();
                        }

                        gdGlobalsSpecialAnimation.process(globals.timeDelta);

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

                        if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                        <xsl:if test="behaviors" >
                        //Behavior - animation
                        //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" />
                        //if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList != null) {
                           final BasicArrayList removeList = new BasicArrayList();
                           size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList.size();
                           for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                           <xsl:for-each select="behaviors" >
                               //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />
                               <xsl:if test="type = 'DestroyOutsideBehavior::DestroyOutside'" >
                               //LogUtil.put(LogFactory.getInstance("Behavior objectName=<xsl:value-of select="$objectName" /> name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />: check", this, commonStrings.PROCESS));
                               if(globals.destroyOutsideBehavior.process(globals.<xsl:value-of select="$objectName" />GDGameLayerList, index, globals.graphics)) {
                                   //LogUtil.put(LogFactory.getInstance("Behavior objectName=<xsl:value-of select="$objectName" /> name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />: remove", this, commonStrings.PROCESS));
                                   removeList.add(globals.<xsl:value-of select="$objectName" />GDGameLayerList.get(index));
                               }
                               </xsl:if>
                           </xsl:for-each>
                           }
                           
                           GDGameLayer gdGameLayer;
                           size = removeList.size();
                           for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                               gdGameLayer = (GDGameLayer) removeList.get(index);
                               gdGameLayer.setDestroyed(true);
                               //LogUtil.put(LogFactory.getInstance("Behavior objectName=<xsl:value-of select="name" /> size=<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList size: " + <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList.size(), this, commonStrings.PROCESS));
                           }

                           size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList.size();
                           GDGameLayer gameLayer;
                           for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                               gameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList.get(index));
                               gameLayer.process(globals.timeDelta);
                               gameLayer.animate(globals.timeDelta);
                           }

                        </xsl:if>
                        <xsl:if test="not(behaviors)" >
                           //Behavior - non animation
                           size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList.size();
                           for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                               ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDGameLayerList.get(index)).animate(globals.timeDelta);
                           }
                        </xsl:if>
                        }
                    </xsl:for-each>

                        globals.lastStartTime = gameTickTimeDelayHelperFactory.getStartTime();
                    
                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e));
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
                        final int <xsl:value-of select="name" />Size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />RectangleList.size();
                        if(<xsl:value-of select="name" />Size != 0) {

                            final GDObject <xsl:value-of select="name" />GDobject2 = (GDObject) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDObjectList.get(0);
                            final int <xsl:value-of select="name" />X = x + <xsl:value-of select="name" />GDobject2.x;
                            final int <xsl:value-of select="name" />Y = y + <xsl:value-of select="name" />GDobject2.y;

                            final Rectangle <xsl:value-of select="name" />Rectangle = new Rectangle(
                                PointFactory.getInstance().getInstance(<xsl:value-of select="name" />X, <xsl:value-of select="name" />Y),
                                <xsl:value-of select="name" />GDobject2.Width(globals.graphics) * scale, <xsl:value-of select="name" />GDobject2.Height(globals.graphics) * scale);
                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />RectangleList.add(<xsl:value-of select="name" />Rectangle);
                        }
                        </xsl:if>
                    </xsl:for-each>
                    //instances - END

                    //objects - START
                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:if test="$typeValue = 'TextObject::Text'" >
                            final int size<xsl:value-of select="name" />Size2 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDObjectList.size();
                            GDObject <xsl:value-of select="name" />Size2;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size<xsl:value-of select="name" />Size2; index++) {
                                <xsl:value-of select="name" />Size2 = (GDObject) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />GDObjectList.get(index);
                                <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template><xsl:value-of select="name" />TextAnimation.paint(graphics, <xsl:value-of select="name" />Size2.x, <xsl:value-of select="name" />Size2.y);
                            }
                        </xsl:if>
                    </xsl:for-each>
                    //objects - end

                        //gdNodeStatsFactory.log(stringBuilder, this);
                    }

                    public void open() {
                    
                    <xsl:variable name="foundMousePositionNeeded" >found</xsl:variable>
                    <xsl:if test="contains($foundMousePositionNeeded, 'found')" >
                        MovedMotionGesturesHandler.getInstance().addListener(globals.eventListenerInterfaceLastPoint);
                    </xsl:if>
                    
                    //eventsOpen - START
                    <xsl:call-template name="eventsOpen" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsOpen - END
                    }

                    public void close() {
                    
                    <xsl:if test="contains($foundMousePositionNeeded, 'found')" >
                        MovedMotionGesturesHandler.getInstance().removeListener(globals.eventListenerInterfaceLastPoint);
                    </xsl:if>
                    
                    //eventsClose - START
                    <xsl:call-template name="eventsClose" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //eventsClose - END
                    }

                    public GDSceneGlobals getGlobals() {
                        return this.globals;
                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
