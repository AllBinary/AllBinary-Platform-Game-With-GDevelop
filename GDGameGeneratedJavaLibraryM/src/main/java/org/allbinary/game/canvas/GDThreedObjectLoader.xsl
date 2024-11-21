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

    <xsl:template name="threedResourceLoadingCalls" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="touch" />

        //objects - threed loading - cache - START
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            <xsl:if test="$typeValue = 'Sprite' or $typeValue = 'ParticleSystem::ParticleEmitter'" >

                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:if test="(contains($name, 'btn_') and $touch = 'true') or (not(contains($name, 'btn_')) and $touch = 'false')" >
            //Animation Total: <xsl:value-of select="count(animations)" />
            this.add<xsl:value-of select="name" />SpriteAnimations();
                </xsl:if>

            </xsl:if>

        </xsl:for-each>
        //objects - threed loading - cache - END
    </xsl:template>
    
    <xsl:template name="threedResourceLoading" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="touch" />

        //objects - threed loading - cache - START

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            //3d TiledLayer?  or $typeValue = 'TileMap::TileMap'
            <xsl:if test="$typeValue = 'Sprite' or $typeValue = 'ParticleSystem::ParticleEmitter'" >

                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:if test="(contains($name, 'btn_') and $touch = 'true') or (not(contains($name, 'btn_')) and $touch = 'false')" >
            //Animation Total: <xsl:value-of select="count(animations)" />
            private void add<xsl:value-of select="name" />SpriteAnimations() throws Exception {

                <xsl:for-each select="animations" >
                    <xsl:variable name="resourceWithExtension" select="directions/sprites/image" />
                    <xsl:variable name="image2" select="substring-before($resourceWithExtension, '.')" />
                    <xsl:variable name="image" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$image2" /></xsl:with-param><xsl:with-param name="find" >_0</xsl:with-param><xsl:with-param name="replacementText" >_1</xsl:with-param></xsl:call-template></xsl:variable>                    
                    <xsl:if test="string-length($image) > 0" >
                        
                final Object3d <xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer = threedLoaderFactory.getObject3dInstance(
                    gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>, gl, glInstanceVersion, OBJ, FALSE<xsl:for-each select="/game/properties/threedAnimationOptions" ><xsl:if test="name = $name" ><xsl:value-of select="param" /></xsl:if></xsl:for-each>);
                      
                <xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().x = 
                    <xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().y = 
                    <xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().z = <xsl:if test="/game/properties/scale3d" ><xsl:value-of select="/game/properties/scale3d" /></xsl:if><xsl:if test="not(/game/properties/scale3d)" >0</xsl:if>f;
                    
                    </xsl:if>

                </xsl:for-each>
                
                final Object3d[] <xsl:value-of select="$name" />Object3dContainerArray = {
                <xsl:for-each select="animations" >
                    <xsl:variable name="resourceWithExtension" select="directions/sprites/image" />
                    <xsl:variable name="image2" select="substring-before($resourceWithExtension, '.')" />
                    <xsl:variable name="image" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$image2" /></xsl:with-param><xsl:with-param name="find" >_0</xsl:with-param><xsl:with-param name="replacementText" >_1</xsl:with-param></xsl:call-template></xsl:variable>
                    <xsl:if test="string-length($image) > 0" >
                    <xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer,
                    </xsl:if>
                </xsl:for-each>
                
                };

                min3dSceneResourcesFactory.add(animationInterfaceFactoryInterfaceFactory.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME, <xsl:value-of select="$name" />Object3dContainerArray);

            }
                </xsl:if>

            </xsl:if>

        </xsl:for-each>
        //objects - threed loading - cache - END
    </xsl:template>

</xsl:stylesheet>
