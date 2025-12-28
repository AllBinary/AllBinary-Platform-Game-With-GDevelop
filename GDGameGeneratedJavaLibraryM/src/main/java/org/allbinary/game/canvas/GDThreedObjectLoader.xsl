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
        <xsl:param name="useExclusionList" />

        //objects - threed loading - cache - START
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            <xsl:if test="$typeValue = 'Sprite' or $typeValue = 'ParticleSystem::ParticleEmitter'" >

                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:if test="(contains($name, 'btn_') and $touch = 'true') or (not(contains($name, 'btn_')) and $touch = 'false')" >
                    
                <xsl:variable name="threedExclusionsFound" ><xsl:for-each select="/game/properties/threedExclusions" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
                <xsl:if test="not(contains($threedExclusionsFound, 'found'))" >
            //Animation Total: <xsl:value-of select="count(animations)" />
            this.add<xsl:value-of select="name" />SpriteAnimations(gl, glInstanceVersion);
                </xsl:if>
                </xsl:if>

            </xsl:if>
            <!--3d TiledLayer-->
            <xsl:if test="$typeValue = 'TileMap::TileMap'" >
            //Animation Total: <xsl:value-of select="count(animations)" />
            this.add<xsl:value-of select="name" />TileMapAnimations(gl, glInstanceVersion);
            </xsl:if>            

        </xsl:for-each>
        //objects - threed loading - cache - END
    </xsl:template>
    
    <xsl:template name="rootImageName" >
        <xsl:param name="image" />
        <xsl:if test="contains($image, 'left')" ><xsl:value-of select="substring-before($image, 'left')" /></xsl:if><xsl:if test="contains($image, 'right')" ><xsl:value-of select="substring-before($image, 'right')" /></xsl:if><xsl:if test="contains($image, 'up')" ><xsl:value-of select="substring-before($image, 'up')" /></xsl:if><xsl:if test="contains($image, 'down')" ><xsl:value-of select="substring-before($image, 'down')" /></xsl:if><xsl:if test="not(contains($image, 'left') or contains($image, 'right') or contains($image, 'up') or contains($image, 'down'))" ><xsl:value-of select="$image" /></xsl:if>
    </xsl:template>

    <xsl:template name="threedResourceLoading" >
        <xsl:param name="enlargeTheImageBthreedResourceLoadingackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="touch" />
        <xsl:param name="useExclusionList" />

        //objects - threed loading - cache - START

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite' or $typeValue = 'ParticleSystem::ParticleEmitter'" >

                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:if test="(contains($name, 'btn_') and $touch = 'true') or (not(contains($name, 'btn_')) and $touch = 'false')" >

                <xsl:variable name="threedExclusionsFound" ><xsl:for-each select="/game/properties/threedExclusions" ><xsl:if test="name = $name" >found</xsl:if></xsl:for-each></xsl:variable>
                <xsl:if test="not(contains($threedExclusionsFound, 'found'))" >

            //Animation Total: <xsl:value-of select="count(animations)" />
            private void add<xsl:value-of select="name" />SpriteAnimations(final GL10 gl, final String glInstanceVersion) throws Exception {

                final AppRendererShaderUpdaterFactory appRendererShaderUpdaterFactory = AppRendererShaderUpdaterFactory.getInstance();
            
                <xsl:variable name="rootAnimationNames" >
                    <xsl:for-each select="animations" >
                    <xsl:variable name="resourceWithExtension" select="directions/sprites/image" />
                    <xsl:variable name="image2" select="substring-before($resourceWithExtension, '.')" />
                    <xsl:variable name="image3" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$image2" /></xsl:with-param><xsl:with-param name="find" >_0</xsl:with-param><xsl:with-param name="replacementText" >_1</xsl:with-param></xsl:call-template></xsl:variable>
                    <xsl:variable name="image" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$image3" /></xsl:with-param><xsl:with-param name="find" >_1</xsl:with-param><xsl:with-param name="replacementText" >_</xsl:with-param></xsl:call-template></xsl:variable>
                    <xsl:if test="string-length($image) > 0" ><xsl:call-template name="rootImageName" ><xsl:with-param name="image" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>:</xsl:if>
                    </xsl:for-each>
                </xsl:variable>
                
                <xsl:for-each select="animations" >
                    <xsl:variable name="resourceWithExtension" select="directions/sprites/image" />
                    <xsl:variable name="image2" select="substring-before($resourceWithExtension, '.')" />
                    <xsl:variable name="image" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$image2" /></xsl:with-param><xsl:with-param name="find" >_0</xsl:with-param><xsl:with-param name="replacementText" >_1</xsl:with-param></xsl:call-template></xsl:variable>
                    <xsl:variable name="image3" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param><xsl:with-param name="find" >_1</xsl:with-param><xsl:with-param name="replacementText" >_</xsl:with-param></xsl:call-template></xsl:variable>

                    <xsl:if test="string-length($image) > 0" >
                        <xsl:variable name="rootImageName" ><xsl:call-template name="rootImageName" ><xsl:with-param name="image" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="rootImageName2" ><xsl:call-template name="rootImageName" ><xsl:with-param name="image" ><xsl:value-of select="$image3" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="imageWithSepX4" ><xsl:value-of select="$rootImageName2" />:<xsl:value-of select="$rootImageName2" />:<xsl:value-of select="$rootImageName2" />:<xsl:value-of select="$rootImageName2" />:</xsl:variable>

                //image=<xsl:value-of select="$image" />
                //imageWithSepX4=<xsl:value-of select="$imageWithSepX4" />
                //rootAnimationNames=<xsl:value-of select="$rootAnimationNames" />

                            <xsl:choose>
                                <xsl:when test="contains($rootAnimationNames, $imageWithSepX4)" >

                                <xsl:choose>
                                    <!-- left is always first -->
                                    <xsl:when test="contains($image, 'left')">

                    Object3d <xsl:value-of select="$image" />Object3dContainer;
                    final Object3d <xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer = <xsl:value-of select="$image" />Object3dContainer = threedLoaderFactory.getObject3dInstance(
                        gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>, gl, glInstanceVersion, modelTypeFactory.MD2, FALSE<xsl:for-each select="/game/properties/custom" ><xsl:if test="name = $name and param" ><xsl:value-of select="param" /></xsl:if></xsl:for-each>);
                      
                    appRendererShaderUpdaterFactory.setShaderComposite(<xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer);
                    
                    //<xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().x = 
                        //<xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().y = 
                        //<xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().z = <xsl:if test="/game/properties/scale3d" ><xsl:value-of select="/game/properties/scale3d" /></xsl:if><xsl:if test="not(/game/properties/scale3d)" >0</xsl:if>f;
                                                                        
                                    </xsl:when>
                                    <xsl:otherwise>
                    final Object3d <xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer = 
                        <xsl:value-of select="$rootImageName2" />left<xsl:if test="contains($image, '_1')" >_1</xsl:if>Object3dContainer;
                                    </xsl:otherwise>
                                </xsl:choose>
                                                                        
                                </xsl:when>
                                <xsl:when test="contains($image, 'attack')" >

                    Object3d <xsl:value-of select="$image" />Object3dContainer;
                    final Object3d <xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer = <xsl:value-of select="$image" />Object3dContainer = threedLoaderFactory.getObject3dInstance(
                        gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>, gl, glInstanceVersion, modelTypeFactory.MD2, FALSE<xsl:for-each select="/game/properties/custom" ><xsl:if test="name = $name and param" ><xsl:value-of select="param" /></xsl:if></xsl:for-each>);

                    appRendererShaderUpdaterFactory.setShaderComposite(<xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer);

                    //<xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().x = 
                        //<xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().y = 
                        //<xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().z = <xsl:if test="/game/properties/scale3d" ><xsl:value-of select="/game/properties/scale3d" /></xsl:if><xsl:if test="not(/game/properties/scale3d)" >0</xsl:if>f;
                         
                                </xsl:when>
                                <xsl:otherwise>

                final Object3d <xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer = threedLoaderFactory.getObject3dInstance(
                    gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>, gl, glInstanceVersion, modelTypeFactory.OBJ, FALSE<xsl:for-each select="/game/properties/custom" ><xsl:if test="name = $name and param" ><xsl:value-of select="param" /></xsl:if></xsl:for-each>);

                appRendererShaderUpdaterFactory.setShaderComposite(<xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer);

                <xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().x = 
                    <xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().y = 
                    <xsl:value-of select="$image" /><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />Object3dContainer.getScale().z = <xsl:if test="/game/properties/scale3d" ><xsl:value-of select="/game/properties/scale3d" /></xsl:if><xsl:if test="not(/game/properties/scale3d)" >0</xsl:if>f;

                                </xsl:otherwise>
                            </xsl:choose>
                    
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

            </xsl:if>

            <!--3d TiledLayer-->
            <xsl:if test="$typeValue = 'TileMap::TileMap'" >
            //Animation Total: <xsl:value-of select="count(animations)" />
            private void add<xsl:value-of select="name" />TileMapAnimations(final GL10 gl, final String glInstanceVersion) throws Exception {

                final AppRendererShaderUpdaterFactory appRendererShaderUpdaterFactory = AppRendererShaderUpdaterFactory.getInstance();

                final Object3d mapCellModelObject3dContainer = 
                        threedLoaderFactory.getObject3dInstance(
                                this.animationInterfaceFactoryInterfaceFactory.MAP_CELL_MODEL, gl, glInstanceVersion, modelTypeFactory.OBJ, FALSE);

                appRendererShaderUpdaterFactory.setShaderComposite(mapCellModelObject3dContainer);

                min3dSceneResourcesFactory.add(this.animationInterfaceFactoryInterfaceFactory.MAP_CELL_MODEL, new Object3d[] {mapCellModelObject3dContainer});

                this.addMapCell(gl, mapCellModelObject3dContainer.cloneImmutable(), this.animationInterfaceFactoryInterfaceFactory.MAP_CELL_MODEL_IMAGE);
            
            }
            </xsl:if>

        </xsl:for-each>
        //objects - threed loading - cache - END
    </xsl:template>

</xsl:stylesheet>
