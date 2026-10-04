<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : GDLayoutInstances.xsl
    Created on : July 9, 2023, 2:37 PM
    Author     : User
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template name="scale" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />
        <xsl:if test="contains($layoutIndex, 'Global')" >
            //Can Globals have scaling?
            //$layoutIndex != 1
            val scale: Float = if (org.allbinary.AndroidUtil.isAndroid()) <xsl:value-of select="/game/properties/scale/android" /> else if (org.allbinary.J2MEUtil.isHTML()) <xsl:value-of select="/game/properties/scale/html" /> else <xsl:value-of select="/game/properties/scale/j2se" />
        </xsl:if>
        <xsl:if test="not(contains($layoutIndex, 'Global'))" >
                            //<xsl:variable name="windowWidth" select="/game/properties/windowWidth" />
                            //<xsl:variable name="windowHeight" select="/game/properties/windowHeight" />
                            //final int scaleWidth = (displayUtil.width2 / <xsl:value-of select="$windowWidth" />)
                            //final int scaleHeight = (displayUtil.height2 / <xsl:value-of select="$windowHeight" />)

                            //this.logUtil.put(StringMaker().append("displayUtil.width2: ").append(displayUtil.height2).append("displayUtil.height2: ").append(displayUtil.width2).toString(), this, this.commonStrings.CONSTRUCTOR)

                            //int scale2 = if ((scaleWidth <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> scaleHeight)) scaleWidth else scaleHeight
                            //if(scale2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 2) scale2 = 2
                            //final int scale = scale2
                            val scale: Float = GD<xsl:value-of select="$layoutIndex" />LayoutUtil.getInstance().scale
                            //final int scaleNominator = scale
                            //final int scaleDenominator = 2
                            this.logUtil.putF(StringMaker().append("scale: ").append(scale).toString(), this, this.commonStrings.CONSTRUCTOR)

                            val scaleLayout: Int = <xsl:if test="not(contains($layoutName, 'Scaled')) or contains($layoutIndex, 'Global')" >1</xsl:if><xsl:if test="contains($layoutName, 'Scaled')" >2</xsl:if>
                            <xsl:variable name="name2" ><xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template></xsl:variable>
<!--                            number($layoutIndex) = 0 or contains($name2, 'options')  or contains($name2, 'about') or contains($name2, 'score') or contains($name2, 'over')-->
                            val scaleTouchButtons: Float = if (<xsl:if test="not(number($layoutIndex) = 1)" >1.0f</xsl:if><xsl:if test="number($layoutIndex) = 1" >org.allbinary.AndroidUtil.isAndroid()) <xsl:value-of select="/game/properties/scaletouch/android" /> else if (org.allbinary.J2MEUtil.isHTML()) <xsl:value-of select="/game/properties/scaletouch/html" /> else <xsl:value-of select="/game/properties/scaletouch/j2se" /></xsl:if>
<!--                            final int scaleTouch = (scaleWidth <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> scaleHeight) ? scaleWidth * scaleTouchButtons : scaleHeight * scaleTouchButtons;-->
                            this.logUtil.putF(StringMaker().append("scaleTouchButtons - scale: ").append(scaleTouchButtons).toString(), this, this.commonStrings.CONSTRUCTOR)
        </xsl:if>

    </xsl:template>

    <xsl:template name="scaleProperty" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />
        <xsl:param name="type" />

        //scaleProperty
        <xsl:if test="contains($layoutIndex, 'Global')" >
            //Can Globals have scaling?
            //$layoutIndex != 1
            public val scale: Float = if (org.allbinary.AndroidUtil.isAndroid()) <xsl:value-of select="/game/properties/scale/android" /> else if (org.allbinary.J2MEUtil.isHTML()) <xsl:value-of select="/game/properties/scale/html" /> else <xsl:value-of select="/game/properties/scale/j2se" />
        </xsl:if>
        <xsl:if test="not(contains($layoutIndex, 'Global'))" >
                            private val scale: Float = GD<xsl:value-of select="$layoutIndex" />LayoutUtil.getInstance().scale

                            private val halfScale: Float = (scale.toFloat()) / 2
                            private val scaleTouchButtons: Float = if (<xsl:if test="not(number($layoutIndex) = 1)" >1 //same as org.allbinary.AndroidUtil.isAndroid()) scale else if (scale / 2.0f</xsl:if><xsl:if test="number($layoutIndex) = 1" >org.allbinary.AndroidUtil.isAndroid()) <xsl:value-of select="/game/properties/scaletouch/android" /> else if (org.allbinary.J2MEUtil.isHTML()) <xsl:value-of select="/game/properties/scaletouch/html" /> else <xsl:value-of select="/game/properties/scaletouch/j2se" /></xsl:if>
        </xsl:if>

    </xsl:template>

    <xsl:template name="scaleProperties" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />
        <xsl:param name="type" />

            <xsl:if test="$layoutIndex = 1" >
                    public val scale: Float = if (org.allbinary.AndroidUtil.isAndroid()) <xsl:value-of select="/game/properties/scale1/android" /> else if (org.allbinary.J2MEUtil.isHTML()) <xsl:value-of select="/game/properties/scale1/html" /> else <xsl:value-of select="/game/properties/scale1/j2se" />
            </xsl:if>
            <xsl:if test="$layoutIndex != 1" >
                    public val scale: Float = if (org.allbinary.AndroidUtil.isAndroid()) <xsl:value-of select="/game/properties/scale/android" /> else if (org.allbinary.J2MEUtil.isHTML()) <xsl:value-of select="/game/properties/scale/html" /> else <xsl:value-of select="/game/properties/scale/j2se" />
            </xsl:if>

    </xsl:template>

</xsl:stylesheet>
