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
    
    <xsl:template name="imageProperties" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="windowWidth" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="touch" />

        //objects - START
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            <xsl:variable name="name" select="name" />
            <xsl:variable name="stringValue" select="string" />
            //Object touch = <xsl:value-of select="$touch" /> name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="(contains($name, 'btn_') and $touch = 'true') or (not(contains($name, 'btn_')) and $touch = 'false')" >
    
            <xsl:if test="$typeValue = 'Sprite' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
                
                //Animation Total: <xsl:value-of select="count(animations)" /><xsl:text>&#10;</xsl:text>
                
                public Rectangle <xsl:value-of select="$name" />Rectangle;
                
                    <!--
                <xsl:for-each select="animations" >
                public final String[] <xsl:value-of select="$name" /><xsl:value-of select="name" />ResourceArray;

                public Image[] <xsl:value-of select="$name" /><xsl:value-of select="name" />ImageArray;
                </xsl:for-each>
                    -->
                public final String[] <xsl:value-of select="$name" />ResourceArray;

                public Image[] <xsl:value-of select="$name" />ImageArray;

            </xsl:if>

            <xsl:if test="$typeValue = 'TileMap::CollisionMask'" >
                
                //Animation Total: <xsl:value-of select="count(animations)" /><xsl:text>&#10;</xsl:text>
                
                public Rectangle <xsl:value-of select="$name" />Rectangle;

                public Image[] <xsl:value-of select="$name" />ImageArray;

            </xsl:if>

            <xsl:if test="$typeValue = 'TileMap::TileMap'" >

                //Animation Total: <xsl:value-of select="count(animations)" /><xsl:text>&#10;</xsl:text>
                
                public Rectangle <xsl:value-of select="name" />Rectangle;
                
                public final String[] <xsl:value-of select="name" />ResourceArray;

                public Image[] <xsl:value-of select="name" />ImageArray;

                public final String[] <xsl:value-of select="name" />JSONResourceArray;
            </xsl:if>

            </xsl:if>

        </xsl:for-each>
        //objects - END
    </xsl:template>

    <xsl:template name="imageCache" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="windowWidth" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="touch" />

        <xsl:call-template name="globalZoomCameraActions" >
            <xsl:with-param name="baseLayer" >true</xsl:with-param>
            <xsl:with-param name="tileMap" >true</xsl:with-param>
        </xsl:call-template>
        
        //objects - image - cache - START
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            <xsl:variable name="name" select="name" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>
            <xsl:text>&#10;</xsl:text>

            <xsl:if test="(contains($name, 'btn_') and $touch = 'true') or (not(contains($name, 'btn_')) and $touch = 'false')" >
    
            <xsl:if test="$typeValue = 'Sprite' or $typeValue = 'ParticleSystem::ParticleEmitter' or $typeValue = 'TileMap::TileMap'" >
                //type found
                <xsl:variable name="stringValue" select="string" />
                //Animation Total: <xsl:value-of select="count(animations)" />
                <xsl:text>&#10;</xsl:text>

                <xsl:if test="$typeValue = 'Sprite' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
                this.<xsl:value-of select="$name" />ResourceArray = new String[] {
                <xsl:for-each select="animations" >
                    <!--
                this.<xsl:value-of select="$name" /><xsl:value-of select="name" />ResourceArray = new String[] {
                    <xsl:for-each select="directions/sprites/image" >
                    <xsl:variable name="imageWithExtension" select="text()" />
                    -->
                    <xsl:variable name="imageWithExtension" select="directions/sprites/image" />
                    <xsl:variable name="image2" select="substring-before($imageWithExtension, '.')" />
                    <xsl:variable name="image" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$image2" /></xsl:with-param><xsl:with-param name="find" >_0</xsl:with-param><xsl:with-param name="replacementText" >_1</xsl:with-param></xsl:call-template></xsl:variable>
                    <xsl:if test="string-length($image) > 0" >
                    gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>,
                    </xsl:if>
                    <xsl:if test="string-length($image) = 0" >
                    //Named animation without Sprites/Images.
                    gdResources.BLANK,
                    </xsl:if>
                    <!--
                    </xsl:for-each>
                };
                    -->
                </xsl:for-each>
                };
                </xsl:if>

                <xsl:if test="$typeValue = 'TileMap::TileMap'" >
                this.<xsl:value-of select="name" />ResourceArray = new String[] {
                <xsl:if test="content" >
                    //TileMap::TileMap:content
                    <xsl:variable name="imageWithExtension" select="content/tilemapAtlasImage" />
                    <xsl:variable name="image" select="substring-before($imageWithExtension, '.')" />
                    gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>,
                </xsl:if>
                };
                </xsl:if>

                <xsl:for-each select="animations" >
                    <xsl:variable name="animationName" ><xsl:value-of select="name" /></xsl:variable>
                    <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                    <xsl:if test="contains($instancesAsString, $name2) or $enlargeTheImageBackgroundForRotation = 'false'" >
                    <!--
                    <xsl:for-each select="directions/sprites/image" >
                    final Image <xsl:value-of select="$name" /><xsl:value-of select="$animationName" />Image<xsl:value-of select="position() - 1" /> = imageCache.get(<xsl:value-of select="$name" /><xsl:value-of select="$animationName" />ResourceArray[<xsl:value-of select="position() - 1" />]);
//                    if(<xsl:value-of select="$name" /><xsl:value-of select="$animationName" />Image<xsl:value-of select="position() - 1" /> == null) {
//                        throw new RuntimeException();
//                    }
                    -->
                    final Image <xsl:value-of select="$name" /><xsl:value-of select="$animationName" />Image<xsl:value-of select="position() - 1" /> = imageCache.get(<xsl:value-of select="$name" />ResourceArray[<xsl:value-of select="position() - 1" />]);
//                    if(<xsl:value-of select="$name" />Image<xsl:value-of select="position() - 1" /> == null) {
//                        throw new RuntimeException();
//                    }
                    <!--
                    </xsl:for-each>
                    -->
                    </xsl:if>
                    <xsl:if test="not(contains($instancesAsString, $name2)) and $enlargeTheImageBackgroundForRotation = 'true'" >
                    <!--
                    <xsl:for-each select="directions/sprites/image" >
                    final Image <xsl:value-of select="$name" /><xsl:value-of select="$animationName" />Image<xsl:value-of select="position() - 1" /> = imageCache.get(<xsl:value-of select="$name" /><xsl:value-of select="$animationName" />ResourceArray[<xsl:value-of select="position() - 1" />]);
//                    if(<xsl:value-of select="$name" /><xsl:value-of select="$animationName" />Image<xsl:value-of select="position() - 1" /> == null) {
//                        throw new RuntimeException();
//                    }
                    -->
                    final Image <xsl:value-of select="$name" />Image<xsl:value-of select="position() - 1" /> = imageCache.get(<xsl:value-of select="$name" />ResourceArray[<xsl:value-of select="position() - 1" />]);
//                    if(<xsl:value-of select="$name" />Image<xsl:value-of select="position() - 1" /> == null) {
//                        throw new RuntimeException();
//                    }
                    <!--
                    </xsl:for-each>
                    -->
                    </xsl:if>
                </xsl:for-each>

                <xsl:if test="content" >
                    //TileMap::TileMap:content
                    <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                    <xsl:if test="contains($instancesAsString, $name2) or $enlargeTheImageBackgroundForRotation = 'false'" >
                    final Image <xsl:value-of select="$name" />Image<xsl:value-of select="position() - 1" /> = imageCache.get(<xsl:value-of select="$name" />ResourceArray[0]);
//                    if(<xsl:value-of select="$name" />Image<xsl:value-of select="position() - 1" /> == null) {
//                        throw new RuntimeException();
//                    }
                    </xsl:if>
                    <xsl:if test="not(contains($instancesAsString, $name2)) and $enlargeTheImageBackgroundForRotation = 'true'" >
                    final Image <xsl:value-of select="$name" />Image<xsl:value-of select="position() - 1" /> = imageCache.get(<xsl:value-of select="$name" />ResourceArray[0]);
//                    if(<xsl:value-of select="$name" />Image<xsl:value-of select="position() - 1" /> == null) {
//                        throw new RuntimeException();
//                    }
                    </xsl:if>
                </xsl:if>
                    
                <xsl:value-of select="$name" />ImageArray = new Image[] {
                <xsl:for-each select="animations" >
                    <xsl:variable name="animationName" ><xsl:value-of select="name" /></xsl:variable>
                    <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                    <!--
                <xsl:value-of select="$name" /><xsl:value-of select="$animationName" />ImageArray = new Image[] {
                    <xsl:for-each select="directions/sprites/image" >
                    -->
                    <xsl:if test="contains($instancesAsString, $name2) or $enlargeTheImageBackgroundForRotation = 'false'" >
                    <xsl:value-of select="$name" />Image<xsl:value-of select="position() - 1" />,
                    </xsl:if>
                    <xsl:if test="not(contains($instancesAsString, $name2)) and $enlargeTheImageBackgroundForRotation = 'true'" >
                    //imageCopyUtil.createImage(<xsl:value-of select="$name" /><xsl:value-of select="$animationName" />Image<xsl:value-of select="position() - 1" />, 1.44f, true),
                    imageScaleUtil.createImage(imageCache, <xsl:value-of select="$name" />Image<xsl:value-of select="position() - 1" />, baseLayerScale, 1, baseLayerScale, 1, true),
                    </xsl:if>
                    <!--
                    </xsl:for-each>
                };
                    -->
                </xsl:for-each>
                };
                
                <xsl:if test="content" >
                    //TileMap::TileMap:content
                <xsl:value-of select="$name" />ImageArray = new Image[] {
                    <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                    <xsl:if test="contains($instancesAsString, $name2) or $enlargeTheImageBackgroundForRotation = 'false'" >
                    <xsl:value-of select="$name" />Image<xsl:value-of select="position() - 1" />,
                    </xsl:if>
                    <xsl:if test="not(contains($instancesAsString, $name2)) and $enlargeTheImageBackgroundForRotation = 'true'" >
                    imageScaleUtil.createImage(imageCache, <xsl:value-of select="$name" />Image<xsl:value-of select="position() - 1" />, tileMapScale, 1, tileMapScale, 1, true),
                    </xsl:if>
                };  
                </xsl:if>

                //this.validateSprites(animationInterfaceFactoryInterfaceFactory.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME, <xsl:value-of select="name" />ResourceArray, <xsl:value-of select="name" />ImageArray);
                hashTable.put(animationInterfaceFactoryInterfaceFactory.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME, <xsl:value-of select="name" />ImageArray);
                <xsl:value-of select="$name" />Rectangle = new Rectangle(PointFactory.getInstance().ZERO_ZERO, <xsl:value-of select="name" />ImageArray[0].getWidth(), <xsl:value-of select="name" />ImageArray[0].getHeight());

            </xsl:if>

            <xsl:if test="$typeValue = 'TileMap::CollisionMask'" >
                <xsl:value-of select="$name" />ImageArray = new Image[] {
                };
                hashTable.put(animationInterfaceFactoryInterfaceFactory.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME, <xsl:value-of select="name" />ImageArray);
                <xsl:value-of select="$name" />Rectangle = new Rectangle(PointFactory.getInstance().ZERO_ZERO, 0, 0);
            </xsl:if>

            <xsl:if test="$typeValue = 'TileMap::TileMap'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                //TileMap::TileMap - JSON

                this.<xsl:value-of select="name" />JSONResourceArray = new String[] {
                <xsl:if test="content" >
                    //TileMap::TileMap:content
                    <xsl:variable name="jsonWithExtension" select="content/tilemapJsonFile" />
                    <xsl:variable name="json" select="substring-before($jsonWithExtension, '.')" />
                    gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$json" /></xsl:with-param></xsl:call-template>,
                    <xsl:variable name="tilesetJsonFileWithExtension" select="content/tilesetJsonFile" />
                    <xsl:variable name="tilesetJsonFile" select="substring-before($tilesetJsonFileWithExtension, '.')" />
                    <xsl:if test="string-length(content/tilesetJsonFile) > 1" >
                    gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tilesetJsonFile" /></xsl:with-param></xsl:call-template>,
                    </xsl:if>

                    <xsl:for-each select="content/tilesetJsonFiles" >
                        <xsl:variable name="tileSetJSON" select="substring-before(text(), '.')" />
                    gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$tileSetJSON" /></xsl:with-param></xsl:call-template>,                        
                    </xsl:for-each>
                </xsl:if>
                };
                
                final int size = this.<xsl:value-of select="name" />JSONResourceArray.length;
                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    PlatformAssetManager.getInstance().getResourceAsStream(this.<xsl:value-of select="name" />JSONResourceArray[index]);
                }                
                
            </xsl:if>

            </xsl:if>

        </xsl:for-each>
        //objects - image - cache - END
    </xsl:template>

</xsl:stylesheet>
