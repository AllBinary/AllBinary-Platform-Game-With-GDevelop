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

    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventClassProperty.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventCreateAssign.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventPaint.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventMouseButtonReleased.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventOpen.xsl" />
    <xsl:import href="../GDGameBaseJavaLibraryM/src\main/java/org/allbinary/game/gd/canvas/GDEventClose.xsl" />

    <xsl:template match="/game">
        <xsl:for-each select="layouts" >
            <xsl:variable name="index" select="position() - 1" />
            <xsl:if test="number($index) =
                <GD_CURRENT_INDEX>" >
                    <xsl:variable name="nameValue" select="name" />
                    package org.allbinary.game.gd.canvas;

                    import java.io.InputStream;

                    import javax.microedition.lcdui.Graphics;
                    import javax.microedition.lcdui.Image;
                    import org.allbinary.animation.AnimationInterfaceFactoryInterface;
                    import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface;
                    import org.allbinary.animation.image.AllBinaryAndroidImageRotationAnimationFactory;

                    import org.allbinary.animation.special.SpecialAnimation;
                    import org.allbinary.animation.text.TextAnimation;
                    import org.allbinary.data.resource.ResourceUtil;
                    import org.allbinary.game.gd.layer.GDGameLayer;
                    import org.allbinary.game.gd.layout.GDAction;
                    import org.allbinary.graphics.color.BasicColor;
                    import org.allbinary.graphics.displayable.DisplayInfoSingleton;

                    import org.allbinary.game.gd.layout.GDObject;
                    import org.allbinary.game.identification.Group;
                    import org.allbinary.game.rand.MyRandomFactory;
                    import org.allbinary.graphics.PointFactory;
                    import org.allbinary.graphics.Rectangle;

                    import org.allbinary.input.motion.gesture.observer.BasicMotionGesturesHandler;
                    import org.allbinary.logic.basic.string.CommonStrings;
                    import org.allbinary.logic.basic.util.event.AllBinaryEventObject;
                    import org.allbinary.logic.basic.util.event.EventListenerInterface;
                    import org.allbinary.logic.communication.log.LogFactory;
                    import org.allbinary.logic.communication.log.LogUtil;

                    //Layout name=<xsl:value-of select="$nameValue" />
                    public class GD<xsl:value-of select="$index" />SpecialAnimation extends SpecialAnimation
                    {<xsl:text>&#10;</xsl:text>

                        private final GDAction[] actionArrayOfArrays = new GDAction[100];                        
                    
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
                            private final GDGameLayer <xsl:value-of select="name" />GDGameLayer;
                            private GDObject <xsl:value-of select="name" /> = new GDObject(null, 0, 0, null);
                        </xsl:if>
                        <xsl:if test="$typeValue = 'TextObject::Text'" >
                            <xsl:variable name="stringValue" select="string" />
                            private final TextAnimation <xsl:value-of select="name" />TextAnimation = new TextAnimation("<xsl:value-of select="$stringValue" />");

                            private final class <xsl:value-of select="name" /> extends GDObject {

                                public <xsl:value-of select="name" />() {
                                    super(null, 0, 0, null);
                                }

                                public int Width(final Graphics graphics) {
                                    return graphics.getFont().stringWidth(<xsl:value-of select="name" />TextAnimation.getText());
                                }

                                public int Height(final Graphics graphics) {
                                    return 12;
                                    //return <xsl:value-of select="characterSize" />;
                                }
                            }

                            private GDObject<xsl:text> </xsl:text><xsl:value-of select="name" /> = new <xsl:value-of select="name" />();

                        </xsl:if>
                        private Rectangle <xsl:value-of select="name" />Rectangle = null;
                        private int <xsl:value-of select="name" />X = 0;
                        private int <xsl:value-of select="name" />Y = 0;

                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>

                    <xsl:call-template name="eventsClassProperty" >
                        <xsl:with-param name="totalRecursions" >
                            <xsl:value-of select="0" />
                        </xsl:with-param>
                    </xsl:call-template>

                    public GD<xsl:value-of select="$index" />SpecialAnimation() {

                        final int size = actionArrayOfArrays.length;
                        for(int index = 0; index <xsl:text disable-output-escaping="yes">&lt;</xsl:text> size; index++) {
                            final int currentIndex = index;
                            actionArrayOfArrays[index] = new GDAction() {
                                public void process() {
                                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, Integer.toString(currentIndex), new Exception()));
                                }
                            };
                        }
                    
                    <xsl:for-each select="instances" >
                        <xsl:value-of select="name" />X = <xsl:value-of select="x" />;
                        <xsl:value-of select="name" />Y = <xsl:value-of select="y" />;
                    </xsl:for-each>

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:if test="$typeValue = 'Sprite'" >
                            <xsl:variable name="name" select="name" />
                            GDGameLayer <xsl:value-of select="name" />GDGameLayer = null;
                        </xsl:if>
                    </xsl:for-each>

                        try {

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
                            //Animation Total: <xsl:value-of select="count(animations)" />
                            final String <xsl:value-of select="name" />Resource = "";
                            final ResourceUtil <xsl:value-of select="name" />ResourceUtil = ResourceUtil.getInstance();
                            final InputStream <xsl:value-of select="name" />InputStream = <xsl:value-of select="name" />ResourceUtil.getResourceAsStream(<xsl:value-of select="name" />Resource);
                            final Image <xsl:value-of select="name" />Image = Image.createImage(<xsl:value-of select="name" />InputStream);

                            final Group <xsl:value-of select="name" />GroupInterface = null;
                            final AnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray = {
                            <xsl:for-each select="animations" >
                            //<xsl:value-of select="$name" />AnimationInterfaceFactoryInterfaceArray[<xsl:value-of select="position()" />] = ;
                            new AllBinaryAndroidImageRotationAnimationFactory(
                            <xsl:value-of select="$name" />Image, <xsl:value-of select="$name" />Image.getWidth(), <xsl:value-of select="$name" />Image.getHeight()
                            <xsl:for-each select="directions" >
                                //looping=<xsl:value-of select="looping" /> timeBetweenFrames=<xsl:value-of select="timeBetweenFrames" />
                                <xsl:for-each select="sprites" >
                                    //image=<xsl:value-of select="image" /> hasCustomCollisionMask=<xsl:value-of select="hasCustomCollisionMask" />
                                    <xsl:for-each select="points" >
                                        //Point name=<xsl:value-of select="name" /> x=<xsl:value-of select="x" /> y=<xsl:value-of select="y" />
                                    </xsl:for-each>
                                    //OriginPoint name=<xsl:value-of select="originPoint/name" /> x=<xsl:value-of select="originPoint/x" /> y=<xsl:value-of select="originPoint/y" />
                                    //CenterPoint name=<xsl:value-of select="centerPoint/name" /> x=<xsl:value-of select="centerPoint/x" /> y=<xsl:value-of select="centerPoint/y" /> automatic=<xsl:value-of select="centerPoint/automatic" />
                                    //customCollisionMask, array, x, y
                                </xsl:for-each>
                            </xsl:for-each>
                            )<xsl:if test="position() != last()" >,</xsl:if>
                            </xsl:for-each>
                            };

                            final ProceduralAnimationInterfaceFactoryInterface[] <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray = new ProceduralAnimationInterfaceFactoryInterface[0];
                            final Rectangle <xsl:value-of select="name" />LayerInfo = null;
                            <xsl:value-of select="name" />GDGameLayer = new GDGameLayer(
                                <xsl:value-of select="name" />GroupInterface,
                                <xsl:value-of select="name" />AnimationInterfaceFactoryInterfaceArray,
                                <xsl:value-of select="name" />ProceduralAnimationInterfaceFactoryInterfaceArray,
                                <xsl:value-of select="name" />LayerInfo);
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>

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
                            this.<xsl:value-of select="name" />GDGameLayer = <xsl:value-of select="name" />GDGameLayer;
                        </xsl:if>
                    </xsl:for-each>

                    <xsl:call-template name="eventsMouseButtonReleased" >
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

                    <xsl:for-each select="instances" >
                        <xsl:value-of select="name" />X = x + this.<xsl:value-of select="name" />X;
                        <xsl:value-of select="name" />Y = y + this.<xsl:value-of select="name" />Y;

                        if(this.<xsl:value-of select="name" />Rectangle == null) {
                            this.<xsl:value-of select="name" />Rectangle = new Rectangle(
                                PointFactory.getInstance().getInstance(<xsl:value-of select="name" />X, <xsl:value-of select="name" />Y),
                                <xsl:value-of select="name" />.Width(graphics), <xsl:value-of select="name" />.Height(graphics));
                        }
                    </xsl:for-each>

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

                    }
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
