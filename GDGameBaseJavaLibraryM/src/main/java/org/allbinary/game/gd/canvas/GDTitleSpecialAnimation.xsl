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

    <xsl:template match="/game">
        <xsl:for-each select="layouts" >
            <xsl:variable name="index" select="position() - 1" />
            <xsl:if test="number($index) = 
                <GD_CURRENT_INDEX>" >
                    <xsl:variable name="nameValue" select="name" />
                    package org.allbinary.game.gd.canvas;

                    import javax.microedition.lcdui.Graphics;
                    
                    import org.allbinary.animation.special.SpecialAnimation;
                    import org.allbinary.animation.text.TextAnimation;
                    import org.allbinary.graphics.color.BasicColor;
                    import org.allbinary.graphics.displayable.DisplayInfoSingleton;

                    import org.allbinary.game.gd.layout.GDObject;
                    import org.allbinary.game.rand.MyRandomFactory;

                    //Layout name=<xsl:value-of select="$nameValue" disable-output-escaping="yes" />
                    public class GD<xsl:value-of select="$index" disable-output-escaping="yes" />SpecialAnimation extends SpecialAnimation
                    {<xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" />
                        <xsl:if test="$typeValue = 'Sprite'" >
                            <xsl:variable name="stringValue" select="string" />
                            private final GDGameLayer <xsl:value-of select="name" />GDGameLayer = new GDGameLayer(Group groupInterface, 
                            AnimationInterfaceFactoryInterface[] animationInterfaceFactoryInterfaceArray,
                            ProceduralAnimationInterfaceFactoryInterface[] proceduralAnimationInterfaceFactoryInterfaceArray,
                            Rectangle layerInfo);
                        </xsl:if>
                        <xsl:if test="$typeValue = 'TextObject::Text'" >        
                            <xsl:variable name="stringValue" select="string" />
                            private final TextAnimation <xsl:value-of select="name" />TextAnimation = new TextAnimation("<xsl:value-of select="$stringValue" />");
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:if test="$typeValue = 'TextObject::Text'" >        
                            <xsl:variable name="stringValue" select="string" />
                            private final class <xsl:value-of select="name" /> {
                            public int Width(final Graphics graphics) {
                            return graphics.getFont().stringWidth(<xsl:value-of select="name" />TextAnimation.getText());
                            }
                            }
            
                            private final <xsl:value-of select="name" />
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="name" /> = new <xsl:value-of select="name" />();
                        </xsl:if>
                    </xsl:for-each>

                    <xsl:for-each select="instances" >
                        private int <xsl:value-of select="name" />X = <xsl:value-of select="x" />;
                        private int <xsl:value-of select="name" />Y = <xsl:value-of select="y" />;
                    </xsl:for-each>    

                    <xsl:for-each select="events" >
                        <xsl:for-each select="events" >
                            //events 2
                            <xsl:for-each select="actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                //Action type=<xsl:value-of select="$typeValue" /><xsl:text>&#10;</xsl:text>
                                <xsl:if test="$typeValue = 'Create'" >
                                    <xsl:for-each select="parameters" >
                                        <xsl:variable name="index" select="position() - 1" />
                                        <xsl:if test="number($index) = 1" >
                                            GDObject <xsl:value-of select="text()" />GDObject = new GDObject(
                                        </xsl:if>
                                    </xsl:for-each>
                                    <xsl:for-each select="parameters" >
                                        <xsl:variable name="index" select="position() - 1" />
                                        <xsl:if test="number($index) != 1" >
                                            <xsl:if test="position() != last()" >
                                                <xsl:if test="string-length(text()) = 0" >
                                                    null
                                                </xsl:if>
                                                <xsl:if test="string-length(text()) > 0" >
                                                    <xsl:value-of select="text()" />
                                                </xsl:if>,
                                            </xsl:if>
                                            <xsl:if test="position() = last()" >
                                                <xsl:if test="string-length(text()) = 0" >
                                                    null
                                                </xsl:if>
                                                <xsl:if test="string-length(text()) > 0" >
                                                    <xsl:value-of select="text()" />
                                                </xsl:if>
                                            </xsl:if>
                                        </xsl:if>
                                    </xsl:for-each>);
                                </xsl:if>
                            </xsl:for-each>
                            <xsl:for-each select="events" >
                                //events 3
                                <xsl:for-each select="actions" >
                                    <xsl:variable name="typeValue" select="type/value" />
                                    //Action type=<xsl:value-of select="$typeValue" /><xsl:text>&#10;</xsl:text>
                                    <xsl:if test="$typeValue = 'Create'" >
                                        <xsl:for-each select="parameters" >
                                            <xsl:variable name="index" select="position() - 1" />
                                            <xsl:if test="number($index) = 1" >
                                                GDObject <xsl:value-of select="text()" />GDObject = new GDObject(
                                            </xsl:if>
                                        </xsl:for-each>
                                        <xsl:for-each select="parameters" >
                                            <xsl:variable name="index" select="position() - 1" />
                                            <xsl:if test="number($index) != 1" >
                                                <xsl:if test="position() != last()" >
                                                    <xsl:if test="string-length(text()) = 0" >
                                                        null
                                                    </xsl:if>
                                                    <xsl:if test="string-length(text()) > 0" >
                                                        <xsl:value-of select="text()" />
                                                    </xsl:if>,
                                                </xsl:if>
                                                <xsl:if test="position() = last()" >
                                                    <xsl:if test="string-length(text()) = 0" >
                                                        null
                                                    </xsl:if>
                                                    <xsl:if test="string-length(text()) > 0" >
                                                        <xsl:value-of select="text()" />
                                                    </xsl:if>
                                                </xsl:if>
                                            </xsl:if>
                                        </xsl:for-each>);
                                    </xsl:if>
                                </xsl:for-each>
                                <xsl:for-each select="events" >
                                    //events 4
                                    <xsl:for-each select="actions" >
                                        <xsl:variable name="typeValue" select="type/value" />
                                        //Action type=<xsl:value-of select="$typeValue" /><xsl:text>&#10;</xsl:text>
                                        <xsl:if test="$typeValue = 'Create'" >
                                            <xsl:for-each select="parameters" >
                                                <xsl:variable name="index" select="position() - 1" />
                                                <xsl:if test="number($index) = 1" >
                                                    GDObject <xsl:value-of select="text()" />GDObject = new GDObject(
                                                </xsl:if>
                                            </xsl:for-each>
                                            <xsl:for-each select="parameters" >
                                                <xsl:variable name="index" select="position() - 1" />
                                                <xsl:if test="number($index) != 1" >
                                                    <xsl:if test="position() != last()" >
                                                        <xsl:if test="string-length(text()) = 0" >
                                                            null
                                                        </xsl:if>
                                                        <xsl:if test="string-length(text()) > 0" >
                                                            <xsl:value-of select="text()" />
                                                        </xsl:if>,
                                                    </xsl:if>
                                                    <xsl:if test="position() = last()" >
                                                        <xsl:if test="string-length(text()) = 0" >
                                                            null
                                                        </xsl:if>
                                                        <xsl:if test="string-length(text()) > 0" >
                                                            <xsl:value-of select="text()" />
                                                        </xsl:if>
                                                    </xsl:if>
                                                </xsl:if>
                                            </xsl:for-each>);
                                        </xsl:if>
                                    </xsl:for-each>
                                    <xsl:for-each select="events" >
                                        //events 5
                                        <xsl:for-each select="events" >
                                            //events 6
                                            <xsl:for-each select="events" >
                                                //events 7
                                                <xsl:for-each select="events" >
                                                    //events 8
                                                    <xsl:for-each select="events" >
                                                        //events 9
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </xsl:for-each>                
                                        </xsl:for-each>
                                    </xsl:for-each>        
                                    
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:for-each>
                
                    public GD<xsl:value-of select="$index" disable-output-escaping="yes" />SpecialAnimation() {
                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:if test="$typeValue = 'TextObject::Text'" >
                            this.<xsl:value-of select="name" />TextAnimation.setBasicColor(new BasicColor(255, <xsl:for-each select="color" > 
                                <xsl:value-of select="r" />, <xsl:value-of select="g" />, <xsl:value-of select="b" />, </xsl:for-each>"name=<xsl:value-of select="name" />;type=<xsl:value-of select="$typeValue" />"));
                        </xsl:if>
                    </xsl:for-each>
    
                    }

                    public void paint(Graphics graphics, int x, int y)
                    {
                    <xsl:for-each select="events" >
                        <xsl:for-each select="events" >
                            //events 2
                            <xsl:for-each select="actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                //Action type=<xsl:value-of select="$typeValue" /><xsl:text>&#10;</xsl:text>
                                <xsl:if test="$typeValue = 'TextObject::String'" >
                                    <xsl:for-each select="parameters" >
                                        <xsl:variable name="index" select="position() - 1" />
                                        //Parameter = <xsl:value-of select="text()" />
                                    </xsl:for-each>;
                                </xsl:if>
                            </xsl:for-each>
                            <xsl:for-each select="events" >
                                //events 3
                                <xsl:for-each select="actions" >
                                    <xsl:variable name="typeValue" select="type/value" />
                                    //Action type=<xsl:value-of select="$typeValue" /><xsl:text>&#10;</xsl:text>
                                    <xsl:if test="$typeValue = 'TextObject::String'" >
                                        <xsl:for-each select="parameters" >
                                            <xsl:variable name="index" select="position() - 1" />
                                            //Parameter = <xsl:value-of select="text()" />
                                        </xsl:for-each>;
                                    </xsl:if>
                                </xsl:for-each>                
                                <xsl:for-each select="events" >
                                    //events 4
                                    <xsl:for-each select="events" >
                                        //events 5
                                        <xsl:for-each select="events" >
                                            //events 6
                                            <xsl:for-each select="events" >
                                                //events 7
                                                <xsl:for-each select="events" >
                                                    //events 8
                                                    <xsl:for-each select="events" >
                                                        //events 9
                                                    </xsl:for-each>
                                                </xsl:for-each>
                                            </xsl:for-each>                
                                        </xsl:for-each>
                                    </xsl:for-each>        
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="actions" >
                            <xsl:variable name="typeValue" select="type/value" />
                            //Action type=<xsl:value-of select="$typeValue" /><xsl:text>&#10;</xsl:text>
                            <xsl:if test="$typeValue = 'MettreX'" >
                                <xsl:for-each select="parameters" >
                                    <xsl:variable name="index" select="position() - 1" />
                                    <xsl:value-of select="text()" />
                                    <xsl:if test="number($index) = 0" >X</xsl:if>
                                </xsl:for-each>;
                            </xsl:if>
                            <xsl:if test="$typeValue = 'MettreY'" >
                                <xsl:for-each select="parameters" >
                                    <xsl:variable name="index" select="position() - 1" />
                                    <xsl:value-of select="text()" />
                                    <xsl:if test="number($index) = 0" >Y</xsl:if>
                                </xsl:for-each>;
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>
    
                    <xsl:for-each select="instances" >        
                        final int <xsl:value-of select="name" />X = x + this.<xsl:value-of select="name" />X;
                        final int <xsl:value-of select="name" />Y = y + this.<xsl:value-of select="name" />Y;
                    </xsl:for-each>    

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:if test="$typeValue = 'TextObject::Text'" >
                            this.<xsl:value-of select="name" />TextAnimation.paint(graphics, <xsl:value-of select="name" />X, <xsl:value-of select="name" />Y);
                        </xsl:if>
                    </xsl:for-each>    
                    }

                    public int SceneWindowWidth() {
                    return DisplayInfoSingleton.getInstance().getLastWidth();
                    }

                    public int Random(final int range) {
                    return MyRandomFactory.getInstance().getAbsoluteNextInt(range);
                    }

                    }                
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
