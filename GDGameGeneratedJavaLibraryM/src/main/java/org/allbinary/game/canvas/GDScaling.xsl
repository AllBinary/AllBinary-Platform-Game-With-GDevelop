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
        
                            //<xsl:variable name="windowWidth" select="/game/properties/windowWidth" />
                            //<xsl:variable name="windowHeight" select="/game/properties/windowHeight" />
                            //final int scaleWidth = (displayUtil.width2 / <xsl:value-of select="$windowWidth" />);
                            //final int scaleHeight = (displayUtil.height2 / <xsl:value-of select="$windowHeight" />);

                            //LogUtil.put(LogFactory.getInstance(new StringMaker().append("displayUtil.width2: ").append(displayUtil.height2).append("displayUtil.height2: ").append(displayUtil.width2).toString(), this, commonStrings.CONSTRUCTOR));
                            
                            //int scale2 = (scaleWidth <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> scaleHeight) ? scaleWidth : scaleHeight;
                            //if(scale2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 2) scale2 = 2;
                            //final int scale = scale2;
                            final int scale = org.allbinary.AndroidUtil.isAndroid() ? 1 : 2;
                            final int scaleNominator = scale;
                            final int scaleDenominator = 2;
                            LogUtil.put(LogFactory.getInstance(new StringMaker().append("scale: ").append(scale).toString(), this, commonStrings.CONSTRUCTOR));

                            final int scaleLayout = <xsl:if test="not(contains($layoutName, 'Scaled')) or contains($layoutIndex, 'Global')" >1</xsl:if><xsl:if test="contains($layoutName, 'Scaled')" >2</xsl:if>;
                            <xsl:variable name="name2" ><xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="$layoutName" /></xsl:with-param></xsl:call-template></xsl:variable>
                            final int scaleTouchButtons = <xsl:if test="number($layoutIndex) = 0 or contains($name2, 'options') or contains($name2, 'score') or contains($name2, 'over')" >1</xsl:if><xsl:if test="not(number($layoutIndex) = 0 or contains($name2, 'options') or contains($name2, 'score') or contains($name2, 'over'))" >scale + 1</xsl:if>;
<!--                            final int scaleTouch = (scaleWidth <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> scaleHeight) ? scaleWidth * scaleTouchButtons : scaleHeight * scaleTouchButtons;-->
                            LogUtil.put(LogFactory.getInstance(new StringMaker().append("scaleTouchButtons - scale: ").append(scaleTouchButtons).toString(), this, commonStrings.CONSTRUCTOR));
    </xsl:template>

    <xsl:template name="scaleProperty" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />
                            //scaleProperty
                            private final int scale = org.allbinary.AndroidUtil.isAndroid() ? 1 : 2;
    </xsl:template>

</xsl:stylesheet>
