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

        //objectsClassProperty - START
        <xsl:for-each select="objects" >

            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" />
                        
            <xsl:if test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:variable name="NAME" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>

                //animations/directions/sprites/originPoint/x <xsl:value-of select="animations/directions/sprites/originPoint/x" />
                //animations/directions/sprites/originPoint/y <xsl:value-of select="animations/directions/sprites/originPoint/y" />
                private final class <xsl:value-of select="name" /> extends GDObject {

                    public <xsl:value-of select="name" />(final String unknown, final int x, final int y, final String name) {
                        super(unknown, x, y, name);
                    }

                    <xsl:if test="animations/directions/sprites/originPoint/x = 0 and animations/directions/sprites/originPoint/y = 0" >
                    public int Width(final Graphics graphics) {
                        return canvasWidth;
                    }
    
                    public int Height(final Graphics graphics) {
                        return canvasHeight;
                    }
                    </xsl:if>
                    
                        <xsl:if test="name = 'player'" >
                        //Hack FIX ME for GDevelop player1

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
                    
                };

                public GDObject get<xsl:value-of select="name" />(final String unknown, final int x, final int y, final String name) {
                    return new <xsl:value-of select="name" />(unknown, x, y, name);
                }

            </xsl:if>
            <xsl:if test="$typeValue = 'TextObject::Text'" >
                <xsl:variable name="stringValue" select="string" />

                private final class <xsl:value-of select="name" /> extends GDObject {

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

        </xsl:for-each>

        //objectsClassProperty - END

    </xsl:template>

</xsl:stylesheet>
