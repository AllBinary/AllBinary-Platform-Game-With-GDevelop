<?xml version="1.0" encoding="windows-1252"?>

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

    <xsl:template name="objectsClassPropertyGDObjects" >
        <xsl:param name="windowWidth" />

        //objectsClassPropertyGDObjects - START
        <xsl:for-each select="objects" >

            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" />

            //$typeValue = 'TileMap::CollisionMask' or 
            <xsl:if test="$typeValue = 'TileMap::TileMap' or $typeValue = 'Sprite' or $typeValue = 'PrimitiveDrawing::Drawer'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>

                //animations/directions/sprites/originPoint/x <xsl:value-of select="animations/directions/sprites/originPoint/x" />
                //animations/directions/sprites/originPoint/y <xsl:value-of select="animations/directions/sprites/originPoint/y" />
                public final class <xsl:value-of select="name" /> extends GDObject {

                <xsl:for-each select="variables" >
                    public <xsl:if test="type = 'number'" >int</xsl:if><xsl:if test="type != 'number'" ><xsl:value-of select="type" /></xsl:if><xsl:text> </xsl:text><xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                </xsl:for-each>

                <xsl:if test="animations" >
                private final String[] ANIMATION_NAMES = {
                <xsl:for-each select="animations" >
                    <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(name, '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                    globals.<xsl:value-of select="$animationName" />_ANIMATION_NAME,
                </xsl:for-each>
                };
                </xsl:if>

                    public <xsl:value-of select="name" />(final String unknown, final int x, final int y, final String name) {
                        super(unknown, x, y, name);
                    }

                    <xsl:if test="animations" >
                    public boolean setAnimation(final String animationName) {
                        final int size = ANIMATION_NAMES.length;
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            if(this.ANIMATION_NAMES[index] == animationName) {
                                //LogUtil.put(LogFactory.getInstance(animationName, this, "setAnimation"));
                                if(this.animation != index) {
                                    this.animation = index;
                                    return true;
                                } else {
                                    return false;
                                }
                            }
                        }
                        return false;
                    }
                    </xsl:if>
                    
                    <xsl:if test="animations/directions/sprites/originPoint/x = 0 and animations/directions/sprites/originPoint/y = 0" >
                    public int Width(final Graphics graphics) {
                        return canvasWidth;
                    }
    
                    public int Height(final Graphics graphics) {
                        return canvasHeight;
                    }
                    </xsl:if>
                    
                    <xsl:for-each select="variables" >
                        <xsl:if test="type = 'string'" >
                            <xsl:if test="number(value) != value" >
                    public String <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                            <xsl:if test="number(value) = value" >
                    //This is supposed to be a string
                    public float <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>

                    <!--
                        <xsl:if test="name = 'player'" >
                        //Hackish FIX ME for GDevelop player1

                    public short Angle(final GDGameLayer gameLayer) {

                        //LogUtil.put(LogFactory.getInstance(new StringBuilder().append(globals.name).append(objectStrings.ANGLE).append(angle).toString(), this, "before"));
                        
                        int adjustedAngle = gameLayer.getRotationAnimationInterface().getAngleInfo().getAngle() - 270;
                        //int adjustedAngle = angle;
                        while(adjustedAngle <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 359) { adjustedAngle -= 360; }
                        while(adjustedAngle <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 0) { adjustedAngle += 360; }
                        this.angle = (short) adjustedAngle;

                        //LogUtil.put(LogFactory.getInstance(new StringBuilder().append(globals.name).append(objectStrings.ANGLE).append(angle).toString(), this, "after"));

                        return this.angle;
                    }
                        </xsl:if>
                    -->
                    
                };

                public GDObject get<xsl:value-of select="name" />(final String unknown, final int x, final int y, final String name) {
                    return new <xsl:value-of select="name" />(unknown, x, y, name);
                }

            </xsl:if>
            <xsl:if test="$typeValue = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />

                //ParticleSystem::ParticleEmitter - GDObject
                public final class <xsl:value-of select="name" /> extends GDObject {
                    
                    public final StringMaker stringMaker = new StringMaker();

                    public <xsl:value-of select="name" />(final String unknown, final int x, final int y, final String name) {
                        super(unknown, x, y, name);
                    }

                    public int Width(final Graphics graphics) {
                        return 0;
                    }

                    public int Height(final Graphics graphics) {
                        return 0;
                    }
                    
                    public String String() {
                        return stringMaker.toString();
                    }
                };

                public GDObject get<xsl:value-of select="name" />(final String unknown, final int x, final int y, final String name) {
                    return new <xsl:value-of select="name" />(unknown, x, y, name);
                }

            </xsl:if>
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />
                
                //TextObject::Text - GDObject
                public final class <xsl:value-of select="name" /> extends GDObject {

                    public <xsl:value-of select="name" />(final String unknown, final int x, final int y, final String name) {
                        super(unknown, x, y, name);
                    }

                    public int Width(final Graphics graphics) {
                        return globals.<xsl:value-of select="name" />TextAnimation.getWidth();
                    }

                    public int Height(final Graphics graphics) {
                        return globals.<xsl:value-of select="name" />TextAnimationSize;
                    }
                };

                public GDObject get<xsl:value-of select="name" />(final String unknown, final int x, final int y, final String name) {
                    return new <xsl:value-of select="name" />(unknown, x, y, name);
                }

            </xsl:if>
            <xsl:if test="$typeValue = 'TextEntryObject::TextEntry'" >
                <xsl:variable name="stringValue" select="string" />

                //TextEntryObject::TextEntry - GDObject
                public final class <xsl:value-of select="name" /> extends GDObject {
                    
                    public final StringMaker stringMaker = new StringMaker();

                    public <xsl:value-of select="name" />(final String unknown, final int x, final int y, final String name) {
                        super(unknown, x, y, name);
                    }

                    public int Width(final Graphics graphics) {
                        return 0;
                    }

                    public int Height(final Graphics graphics) {
                        return 0;
                    }
                    
                    public String String() {
                        return stringMaker.toString();
                    }
                };

                public GDObject get<xsl:value-of select="name" />(final String unknown, final int x, final int y, final String name) {
                    return new <xsl:value-of select="name" />(unknown, x, y, name);
                }

            </xsl:if>

        </xsl:for-each>

        //objectsClassPropertyGDObjects - END

    </xsl:template>

</xsl:stylesheet>
