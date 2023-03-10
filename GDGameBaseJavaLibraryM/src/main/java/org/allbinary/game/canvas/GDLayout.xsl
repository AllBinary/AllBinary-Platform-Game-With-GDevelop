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
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/canvas/PaintDebugButtons.xsl" />

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
                
                package org.allbinary.game.canvas;

                import javax.microedition.lcdui.Graphics;

                import org.allbinary.animation.special.SpecialAnimation;
                import org.allbinary.game.layer.AllBinaryGameLayerManager;
                import org.allbinary.game.layer.GDGameLayer;
                import org.allbinary.game.layout.GDNodeStatsFactory;
                import org.allbinary.game.layout.GDObject;
                import org.allbinary.graphics.GPoint;
                import org.allbinary.graphics.PointFactory;
                import org.allbinary.graphics.Rectangle;
                import org.allbinary.graphics.color.BasicColor;
                import org.allbinary.graphics.color.BasicColorFactory;
                import org.allbinary.graphics.color.BasicColorSetUtil;
                import org.allbinary.graphics.displayable.MyCanvas;
                import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
                import org.allbinary.logic.basic.string.CommonStrings;
                import org.allbinary.logic.communication.log.LogFactory;
                import org.allbinary.logic.communication.log.LogUtil;
                import org.allbinary.time.GameTickTimeDelayHelperFactory;
                import org.allbinary.util.ArrayUtil;
                import org.allbinary.util.BasicArrayList;

                //Layout name=<xsl:value-of select="$layoutName" />
                public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimation extends SpecialAnimation
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
                        
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals globals;
                        private final GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder builder;
                        
                        //private final AllBinaryGameLayerManager allBinaryGameLayerManager;

                    public GD<xsl:value-of select="$layoutIndex" />SpecialAnimation(final MyCanvas canvas, final AllBinaryGameLayerManager allBinaryGameLayerManager) {

                        //this.allBinaryGameLayerManager = allBinaryGameLayerManager;
                        globals = GD<xsl:value-of select="$layoutIndex" />SpecialAnimationGlobals.create();
                        builder = new GD<xsl:value-of select="$layoutIndex" />SpecialAnimationBuilder(canvas, allBinaryGameLayerManager);
                    
                        try {
                    
                            LogUtil.put(LogFactory.getInstance(commonStrings.CONSTRUCTOR, this, commonStrings.CONSTRUCTOR));                            

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.CONSTRUCTOR, e));
                        }

                        //allBinaryGameLayerManager.log();
                        //groupLayerManagerListener.log();
                    }

                    public void process() {
                        GDNodeStatsFactory.getInstance().reset();
                        
                        try {

                        if(globals.lastStartTime == Long.MIN_VALUE) {
                            globals.timeDelta = 0;
                        } else {
                            globals.timeDelta = System.currentTimeMillis() - globals.lastStartTime;
                        }

                        final int size2 = globals.gdRunnableList.size();
                        Runnable runnable;
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index++) {
                            runnable = (Runnable) globals.gdRunnableList.get(index);
                            runnable.run();
                        }

                    <xsl:for-each select="../externalEvents" >
                        //externalEvents - START
                        <!--
                        <xsl:call-template name="actionIds" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                            <xsl:with-param name="caller" >externalEvents</xsl:with-param>
                        </xsl:call-template>
                        -->
                        //externalEvents - END
                    </xsl:for-each>

                    <xsl:call-template name="eventsProcess" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                    int size;
                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="objectName" select="name" />

                        <xsl:if test="behaviors" >
                        //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" />
                        //if(globals.<xsl:value-of select="name" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                           final BasicArrayList removeList = new BasicArrayList();
                           size = globals.<xsl:value-of select="name" />GDGameLayerList.size();
                           for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                           <xsl:for-each select="behaviors" >
                               //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />
                               <xsl:if test="type = 'DestroyOutsideBehavior::DestroyOutside'" >
                               if(globals.destroyOutsideBehavior.process(globals.<xsl:value-of select="$objectName" />GDGameLayerList, index, globals.graphics)) {
                                   removeList.add(globals.<xsl:value-of select="$objectName" />GDGameLayerList.get(index));
                               }
                               </xsl:if>
                           </xsl:for-each>
                           }
                           
                           size = removeList.size();
                           for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                               globals.<xsl:value-of select="name" />GDGameLayerList.remove(removeList.get(index));
                           }

                           //TWB - Not all layers have this behavior so other games may not work with this.
                           size = globals.<xsl:value-of select="name" />GDGameLayerList.size();
                           for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                               ((GDGameLayer) globals.<xsl:value-of select="name" />GDGameLayerList.get(index)).process(globals.timeDelta);
                           }

                        }
                        </xsl:if>
                    </xsl:for-each>

                        globals.lastStartTime = GameTickTimeDelayHelperFactory.getInstance().getStartTime();
                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.PROCESS, e));
                        }
                        
                        GDNodeStatsFactory.getInstance().log(new StringBuilder());
                    }

                    public void paint(Graphics graphics, int x, int y)
                    {

                    <xsl:call-template name="paintDebugButtons" >
                        <xsl:with-param name="caller" >paint</xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
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

                    <xsl:call-template name="eventsPaint" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                        <xsl:with-param name="instancesAsString" >
                            <xsl:value-of select="$instancesAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                    //instances - START
                    <xsl:for-each select="instances" >
                        <xsl:variable name="textObjectTextName" >TextObject::Text:<xsl:value-of select="name" /></xsl:variable>
                        <xsl:if test="contains($objectsAsString, $textObjectTextName)" >
                        //TextObject::Text instance
                        if(globals.<xsl:value-of select="name" />Rectangle == null) {

                            final GDObject <xsl:value-of select="name" />2 = (GDObject) globals.<xsl:value-of select="name" />GDObjectList.get(0);
                            final int <xsl:value-of select="name" />X = x + <xsl:value-of select="name" />2.x;
                            final int <xsl:value-of select="name" />Y = y + <xsl:value-of select="name" />2.y;

                            globals.<xsl:value-of select="name" />Rectangle = new Rectangle(
                                PointFactory.getInstance().getInstance(<xsl:value-of select="name" />X, <xsl:value-of select="name" />Y),
                                <xsl:value-of select="name" />2.Width(globals.graphics), <xsl:value-of select="name" />2.Height(globals.graphics));

                        }
                        </xsl:if>
                    </xsl:for-each>
                    //instances - END

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:if test="$typeValue = 'TextObject::Text'" >
                            final int size<xsl:value-of select="name" />2 = globals.<xsl:value-of select="name" />GDObjectList.size();
                            GDObject <xsl:value-of select="name" />2;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size<xsl:value-of select="name" />2; index++) {
                                <xsl:value-of select="name" />2 = (GDObject) globals.<xsl:value-of select="name" />GDObjectList.get(index);
                                globals.<xsl:value-of select="name" />TextAnimation.paint(graphics, <xsl:value-of select="name" />2.x, <xsl:value-of select="name" />2.y);
                            }
                        </xsl:if>
                    </xsl:for-each>
                    }

                    public void open() {
                    <xsl:call-template name="eventsOpen" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    }

                    public void close() {
                    <xsl:call-template name="eventsClose" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>
                    }

                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
