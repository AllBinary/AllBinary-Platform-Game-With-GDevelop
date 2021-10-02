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
    <xsl:output method="html" indent="yes" />

    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/case.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDActionId.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDExternalEvents.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDObjectClassProperty.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDObjectAssign.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDObjectAtIndex.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventClassPropertyActions.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventClassPropertyConditions.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventCreateAssign.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventCreateAssignGDObject.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventPaint.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventLogicConstruction.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventOpen.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventClose.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventProcess.xsl" />

    <xsl:template match="/game">
        <xsl:variable name="windowWidth" select="properties/windowWidth" />

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
            <xsl:if test="number($layoutIndex) = <GD_CURRENT_INDEX>" >
                    <xsl:variable name="layoutName" select="name" />
                    package org.allbinary.game.gd.canvas;

                    import java.io.InputStream;

                    import javax.microedition.lcdui.Font;
                    import javax.microedition.lcdui.Graphics;
                    import javax.microedition.lcdui.Image;

                    import org.allbinary.animation.AnimationInterfaceFactoryInterface;
                    import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
                    import org.allbinary.animation.image.AllBinaryAndroidImageRotationAnimationFactory;

                    import org.allbinary.animation.special.SpecialAnimation;
                    import org.allbinary.animation.text.TextAnimation;
                    import org.allbinary.animation.text.CustomTextAnimation;
                    import org.allbinary.data.resource.ResourceUtil;
                    import org.allbinary.game.gd.GDGameMIDlet;
                    import org.allbinary.game.gd.layer.GDGameLayer;
                    import org.allbinary.game.gd.layer.GDGameLayerFactory;
                    import org.allbinary.game.gd.layer.NullGDGameLayerFactory;
                    import org.allbinary.game.gd.layout.GDAction;
                    import org.allbinary.game.gd.layout.GDGroupHelper;
                    import org.allbinary.graphics.color.BasicColor;
                    import org.allbinary.graphics.displayable.DisplayInfoSingleton;

                    import org.allbinary.game.gd.layout.GDObject;
                    import org.allbinary.game.gd.resource.GDResources;
                    import org.allbinary.game.identification.Group;
                    import org.allbinary.game.identification.GroupFactory;
                    import org.allbinary.game.layer.AllBinaryGameLayerManager;
                    import org.allbinary.game.layer.identification.GroupLayerManagerListener;
                    import org.allbinary.game.rand.MyRandomFactory;
                    import org.allbinary.graphics.GPoint;
                    import org.allbinary.graphics.PointFactory;
                    import org.allbinary.graphics.Rectangle;
                    import org.allbinary.input.motion.gesture.observer.BaseMotionGestureEventListener;

                    import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
                    import org.allbinary.logic.basic.string.CommonStrings;
                    import org.allbinary.input.motion.gesture.observer.MotionGestureEvent;
                    import org.allbinary.logic.basic.util.event.AllBinaryEventObject;
                    import org.allbinary.logic.basic.util.event.EventListenerInterface;
                    import org.allbinary.logic.communication.log.LogFactory;
                    import org.allbinary.logic.communication.log.LogUtil;
                    import org.allbinary.util.BasicArrayList;
                    import org.allbinary.math.RectangleCollisionUtil;
                    import org.allbinary.time.GameTickTimeDelayHelperFactory;
                    import org.allbinary.time.TimeDelayHelper;
                    import org.microemu.MIDletBridge;

                    //Layout name=<xsl:value-of select="$layoutName" />
                    public class GD<xsl:value-of select="$layoutIndex" />SpecialAnimation extends SpecialAnimation
                    {

                        private static GD<xsl:value-of select="$layoutIndex" />SpecialAnimation instance;

                        public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimation getInstance(final AllBinaryGameLayerManager allBinaryGameLayerManager)
                        {
                            instance = new GD<xsl:value-of select="$layoutIndex" />SpecialAnimation(allBinaryGameLayerManager);
                            return instance;
                        }

                        public static GD<xsl:value-of select="$layoutIndex" />SpecialAnimation getInstance()
                        {
                            return instance;
                        }
                        
                        private final GroupFactory groupFactory = GroupFactory.getInstance();
                        private final GroupLayerManagerListener groupLayerManagerListener = GroupLayerManagerListener.getInstance();
                        
                        private final Object graphics = new Object();
                        private final GDAction[] actionArrayOfArrays = new GDAction[10000];
                        
                        private final GDGroupHelper gdGroupHelper = new GDGroupHelper();

                    //objectsGroups - START
                    <xsl:for-each select="objectsGroups" >
                        private final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template> = "<xsl:value-of select="name" />";
                        private final Group <xsl:value-of select="name" />GroupInterface = this.groupFactory.getNextGroup();
                        <xsl:for-each select="objects" >
                            //<xsl:value-of select="name" />
                        </xsl:for-each>
                    </xsl:for-each>
                    //objectsGroups - END

                    //instances class properties - START
                    <xsl:for-each select="instances" >
                        //name=<xsl:value-of select="name" /> layout=<xsl:value-of select="layer" /><xsl:text>&#10;</xsl:text>
                        <xsl:if test="layer != ''" >
                            private GDGameLayer <xsl:value-of select="name" />GDGameLayer;
                        </xsl:if>
                    </xsl:for-each>
                    //instances class properties - END

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

                    <xsl:call-template name="eventsClassPropertyConditions" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>

                    <xsl:call-template name="eventsClassPropertyActions" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>

                    public GD<xsl:value-of select="$layoutIndex" />SpecialAnimation(final AllBinaryGameLayerManager allBinaryGameLayerManager) {

                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().CONSTRUCTOR, this, CommonStrings.getInstance().CONSTRUCTOR));

                        int size = actionArrayOfArrays.length;
//                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
//                            final int currentIndex = index;
//                            actionArrayOfArrays[index2][index] = new GDAction() {
//                            public void process() {
//                                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, Integer.toString(currentIndex), new Exception()));
//                                }
//                            };
//                        }

                    //objectsGroupsSet - START
                    <xsl:for-each select="objectsGroups" >
                        <xsl:variable name="groupName" select="name" />
                        gdGroupHelper.map.put(this.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$groupName" /></xsl:with-param></xsl:call-template>, this.<xsl:value-of select="$groupName" />GroupInterface);
                        <xsl:for-each select="objects" >
                        gdGroupHelper.map.put(this.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>, this.<xsl:value-of select="$groupName" />GroupInterface);
                        </xsl:for-each>
                    </xsl:for-each>
                    //objectsGroupsSet - END

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:if test="$typeValue = 'Sprite'" >
                            <xsl:variable name="name" select="name" />
                            GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory = null;
                        </xsl:if>
                        <xsl:if test="$typeValue = 'TextObject::Text'" >
                            <xsl:variable name="name" select="name" />
                            GDGameLayerFactory <xsl:value-of select="name" />GDGameLayerFactory = null;
                        </xsl:if>
                    </xsl:for-each>

                        try {

                    <xsl:call-template name="objectsAssign" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>                        
                        <xsl:with-param name="windowWidth" >
                            <xsl:value-of select="$windowWidth" />
                        </xsl:with-param>                        
                    </xsl:call-template>
                    <xsl:text>&#10;</xsl:text>

                    <xsl:call-template name="eventsCreateAssignGDObject" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>

                    <xsl:call-template name="eventsCreateAssign" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:if test="$typeValue = 'TextObject::Text'" >
                            this.<xsl:value-of select="name" />TextAnimation.setBasicColor(new BasicColor(255, <xsl:for-each select="color" >
                                <xsl:value-of select="r" />, <xsl:value-of select="g" />, <xsl:value-of select="b" />, </xsl:for-each>"name=<xsl:value-of select="name" />;type=<xsl:value-of select="$typeValue" />"));
                        </xsl:if>
                    </xsl:for-each>

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().CONSTRUCTOR, e));
                        }

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" />
                        //With tags <xsl:for-each select="tags" >?</xsl:for-each>
                        //With variables <xsl:for-each select="variables" >?</xsl:for-each>
                        //With effects <xsl:for-each select="effects" >?</xsl:for-each>
                        <xsl:for-each select="behaviors" >
                            //Behavior name=<xsl:value-of select="name" /> as <xsl:value-of select="type" /> extraBorder=<xsl:value-of select="extraBorder" />
                        </xsl:for-each>

                        <xsl:if test="$typeValue = 'Sprite'" >
                            <xsl:variable name="stringValue" select="string" />
                            <xsl:variable name="name" select="name" />
                            this.<xsl:value-of select="name" />GDGameLayerFactory = <xsl:value-of select="name" />GDGameLayerFactory;
                        </xsl:if>
                    </xsl:for-each>

                        try {

                    //instances create - START
                    <xsl:for-each select="instances" >
                        //name=<xsl:value-of select="name" /> layout=<xsl:value-of select="layer" />
                        <xsl:text>&#10;</xsl:text><xsl:value-of select="name" />X = <xsl:value-of select="x" />;
                        <xsl:value-of select="name" />Y = <xsl:value-of select="y" />;
                        this.<xsl:value-of select="name" /> = new <xsl:value-of select="name" />(null, <xsl:value-of select="name" />X, <xsl:value-of select="name" />Y, null);
                        <xsl:if test="layer != ''" >
                        this.<xsl:value-of select="name" />GDGameLayer = <xsl:value-of select="name" />GDGameLayerFactory.create(this.<xsl:value-of select="name" />);
                        allBinaryGameLayerManager.append(this.<xsl:value-of select="name" />GDGameLayer);
                        </xsl:if>
                    </xsl:for-each>
                    //instances create - END

                    <xsl:call-template name="externalEventsCreateAssign" >
                        <xsl:with-param name="layoutName" >
                            <xsl:value-of select="$layoutName" />
                        </xsl:with-param>                        
                    </xsl:call-template>

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().CONSTRUCTOR, e));
                        }

                    <xsl:call-template name="eventsLogicConstruction" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>

                        groupLayerManagerListener.log();
                    }

                    public void process() {
                    
                    <xsl:call-template name="eventsProcess" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>                        
                    }
                    
                    public void paint(Graphics graphics, int x, int y)
                    {
                    <xsl:call-template name="eventsPaint" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>

                    //instances - START
                    <xsl:for-each select="instances" >
                        <xsl:value-of select="name" />X = x + this.<xsl:value-of select="name" />X;
                        <xsl:value-of select="name" />Y = y + this.<xsl:value-of select="name" />Y;

                        if(this.<xsl:value-of select="name" />Rectangle == null) {
                            this.<xsl:value-of select="name" />Rectangle = new Rectangle(
                                PointFactory.getInstance().getInstance(<xsl:value-of select="name" />X, <xsl:value-of select="name" />Y),
                                <xsl:value-of select="name" />.Width(graphics), <xsl:value-of select="name" />.Height(graphics));
                        }
                    </xsl:for-each>
                    //instances - END

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:if test="$typeValue = 'TextObject::Text'" >
                            this.<xsl:value-of select="name" />TextAnimation.paint(graphics, <xsl:value-of select="name" />X, <xsl:value-of select="name" />Y);
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

                    public int SceneWindowWidth() {
                        return DisplayInfoSingleton.getInstance().getLastWidth();
                    }

                    public int SceneWindowHeight() {
                        return DisplayInfoSingleton.getInstance().getLastHeight();
                    }

                    public int Random(final int range) {
                        return MyRandomFactory.getInstance().getAbsoluteNextInt(range);
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
                }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
