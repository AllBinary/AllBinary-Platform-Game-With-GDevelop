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

    <xsl:template name="waitOnImageCache" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="windowWidth" />
        <xsl:param name="instancesAsString" />

        //objects - SPRITES - cache - START

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" />
            //With tags <xsl:for-each select="tags" >?</xsl:for-each>
            //With variables <xsl:for-each select="variables" >?</xsl:for-each>
            //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                //Animation Total: <xsl:value-of select="count(animations)" />

                <xsl:for-each select="animations" >
                    <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                    <xsl:if test="contains($instancesAsString, $name2) or $enlargeTheImageBackgroundForRotation = 'false'" >
                    imageCompleteUtil.waitFor((Image) imageHashMap.get(imageResources.<xsl:value-of select="$name" />ResourceArray[<xsl:value-of select="position() - 1" />]), imageResources.<xsl:value-of select="$name" />ResourceArray[<xsl:value-of select="position() - 1" />]);
                    </xsl:if>
                    <xsl:if test="not(contains($instancesAsString, $name2)) and $enlargeTheImageBackgroundForRotation = 'true'" >
                    imageCompleteUtil.waitFor((Image) imageHashMap.get(imageResources.<xsl:value-of select="$name" />ResourceArray[<xsl:value-of select="position() - 1" />]), imageResources.<xsl:value-of select="$name" />ResourceArray[<xsl:value-of select="position() - 1" />]);
                    </xsl:if>
                </xsl:for-each>

                imageResources.<xsl:value-of select="name" />ImageArray = new Image[] {
                <xsl:for-each select="animations" >
                    <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                    <xsl:if test="contains($instancesAsString, $name2) or $enlargeTheImageBackgroundForRotation = 'false'" >
                    (Image) imageHashMap.get(imageResources.<xsl:value-of select="$name" />ResourceArray[<xsl:value-of select="position() - 1" />]),
                    </xsl:if>
                    <xsl:if test="not(contains($instancesAsString, $name2)) and $enlargeTheImageBackgroundForRotation = 'true'" >
                    imageCopyUtil.createImage((Image) imageHashMap.get(imageResources.<xsl:value-of select="$name" />ResourceArray[<xsl:value-of select="position() - 1" />]), 1.44f, true),
                    </xsl:if>
                </xsl:for-each>
                };

                hashTable.put(animationInterfaceFactoryInterfaceFactory.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME, imageResources.<xsl:value-of select="name" />ImageArray);
            </xsl:if>

        </xsl:for-each>
        //objects - SPRITES - cache - END
    </xsl:template>

</xsl:stylesheet>
