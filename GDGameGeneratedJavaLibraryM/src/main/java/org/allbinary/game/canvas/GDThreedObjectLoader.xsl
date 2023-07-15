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

    <xsl:template name="threedResourceLoading" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="windowWidth" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="touch" />

        //objects - threed loading - cache - START

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite' or $typeValue = 'ParticleSystem::ParticleEmitter' or $typeValue = 'TileMap::TileMap'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:if test="(contains($name, 'btn_') and $touch = 'true') or (not(contains($name, 'btn_')) and $touch = 'false')" >
                //Animation Total: <xsl:value-of select="count(animations)" />

                <xsl:for-each select="animations" ><xsl:for-each select="directions" ><xsl:for-each select="sprites" >
                final Object3d <xsl:value-of select="substring-before(image, '.')" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer = threedLoaderFactory.getObject3dInstance(
                    gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="substring-before(image, '.')" /></xsl:with-param></xsl:call-template>, gl, glInstanceVersion, OBJ, FALSE<xsl:for-each select="/game/properties/threedAnimationOptions" ><xsl:if test="name = $name" ><xsl:value-of select="param" /></xsl:if></xsl:for-each>);
                      
                <xsl:value-of select="substring-before(image, '.')" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().x = 
                    <xsl:value-of select="substring-before(image, '.')" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().y = 
                    <xsl:value-of select="substring-before(image, '.')" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().z = <xsl:if test="/game/properties/scale3d" ><xsl:value-of select="/game/properties/scale3d" /></xsl:if><xsl:if test="not(/game/properties/scale3d)" >0</xsl:if>f;

                </xsl:for-each></xsl:for-each></xsl:for-each>
                
                final Object3d[] <xsl:value-of select="$name" />Object3dContainerArray = {
                <xsl:for-each select="animations" ><xsl:for-each select="directions" ><xsl:for-each select="sprites" >
                    <xsl:value-of select="substring-before(image, '.')" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer,
                </xsl:for-each></xsl:for-each></xsl:for-each>
                
                };

                min3dSceneResourcesFactory.add(animationInterfaceFactoryInterfaceFactory.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME, <xsl:value-of select="$name" />Object3dContainerArray);

                </xsl:if>

            </xsl:if>

        </xsl:for-each>
        //objects - threed loading - cache - END
    </xsl:template>

</xsl:stylesheet>
