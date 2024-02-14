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

    <xsl:template name="rectangleProperties" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="touch" />

        //objects - START
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>
            <xsl:variable name="stringValue" select="string" />
            <xsl:variable name="name" select="name" />

            <xsl:if test="$typeValue = 'Sprite' or $typeValue = 'TileMap::TileMap' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
                <xsl:if test="(contains($name, 'btn_') and $touch = 'true') or (not(contains($name, 'btn_')) and $touch = 'false')" >
                //Animation Total: <xsl:value-of select="count(animations)" />
                public final String[] <xsl:value-of select="name" />ResourceArray;

                public Rectangle[] <xsl:value-of select="name" />ImageArray;
                </xsl:if>

            </xsl:if>

            <xsl:if test="$typeValue = 'TileMap::CollisionMask'" >
                <xsl:if test="(contains($name, 'btn_') and $touch = 'true') or (not(contains($name, 'btn_')) and $touch = 'false')" >
                //Animation Total: <xsl:value-of select="count(animations)" />
                //public final String[] <xsl:value-of select="name" />ResourceArray;

                public Rectangle[] <xsl:value-of select="name" />ImageArray;
                </xsl:if>

            </xsl:if>

            <xsl:if test="$typeValue = 'TileMap::TileMap'" >
                public final String[] <xsl:value-of select="name" />JSONResourceArray;
            </xsl:if>

        </xsl:for-each>
        //objects - END
    </xsl:template>

    <xsl:template name="rectangleCache" >
        <xsl:param name="enlargeTheImageBackgroundForRotation" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="touch" />

        //objects - threed object - cache - START

        int size;
        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
            //Object name = <xsl:value-of select="name" /> as <xsl:value-of select="$typeValue" /> - //With tags <xsl:for-each select="tags" >?</xsl:for-each> - //With variables <xsl:for-each select="variables" >?</xsl:for-each> - //With effects <xsl:for-each select="effects" >?</xsl:for-each>

            <xsl:if test="$typeValue = 'Sprite' or $typeValue = 'TileMap::TileMap' or $typeValue = 'ParticleSystem::ParticleEmitter'" >
                <xsl:variable name="stringValue" select="string" />
                <xsl:variable name="name" select="name" />
                <xsl:if test="(contains($name, 'btn_') and $touch = 'true') or (not(contains($name, 'btn_')) and $touch = 'false')" >
                //Animation Total: <xsl:value-of select="count(animations)" />

                this.<xsl:value-of select="name" />ResourceArray = new String[] {
                <xsl:for-each select="animations" >
                    <xsl:for-each select="directions" >
                    //looping=<xsl:value-of select="looping" /> timeBetweenFrames=<xsl:value-of select="timeBetweenFrames" />
                    </xsl:for-each>
                    <xsl:variable name="resourceWithExtension" select="directions/sprites/image" />                    
                    <xsl:variable name="image2" select="substring-before($resourceWithExtension, '.')" />
                    <xsl:variable name="image" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$image2" /></xsl:with-param><xsl:with-param name="find" >_0</xsl:with-param><xsl:with-param name="replacementText" >_1</xsl:with-param></xsl:call-template></xsl:variable>                    
                    <xsl:if test="string-length($image) > 0" >
                    gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>,
                    </xsl:if>
                    
                </xsl:for-each>
                
                <xsl:if test="content" >
                    //TileMap::TileMap:content
                    <xsl:variable name="imageWithExtension" select="content/tilemapAtlasImage" />
                    <xsl:variable name="image" select="substring-before($imageWithExtension, '.')" />
                    gdResources.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$image" /></xsl:with-param></xsl:call-template>,
                </xsl:if>
                };

                //Duplicate logic of the AnimationFactory
                <xsl:value-of select="name" />ImageArray = new Rectangle[] {
                <xsl:for-each select="animations" >
                    <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                    <xsl:if test="contains($instancesAsString, $name2) or $enlargeTheImageBackgroundForRotation = 'false'" >
                        //TWB - int the future add image dimensions to the game.xml.
                        <xsl:for-each select="directions" >
                            <xsl:for-each select="sprites" >
                    new Rectangle(pointFactory.ZERO_ZERO, 
                                <xsl:if test="originPoint/x = 0" >0</xsl:if>
                                <xsl:if test="originPoint/x != 0" ><xsl:value-of select="originPoint/x" /> * 2</xsl:if>, // * scale
                                <xsl:if test="originPoint/y = 0" >0</xsl:if>
                                <xsl:if test="originPoint/y != 0" ><xsl:value-of select="originPoint/y" /> * 2</xsl:if>  * scale
                                ),
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:if>
                    <xsl:if test="not(contains($instancesAsString, $name2)) and $enlargeTheImageBackgroundForRotation = 'true'" >
                        <xsl:for-each select="directions" >
                            <xsl:for-each select="sprites" >
                    //new Rectangle(pointFactory.ZERO_ZERO, (int) (<xsl:value-of select="originPoint/x" /> * 2 * 1.44f), (int) (<xsl:value-of select="originPoint/x" /> * 2 * 1.44f)),
                    new Rectangle(pointFactory.ZERO_ZERO, 
                                <xsl:if test="originPoint/x = 0" >0</xsl:if>
                                <xsl:if test="originPoint/x != 0" ><xsl:value-of select="originPoint/x" /> * 2</xsl:if>,
                                <xsl:if test="originPoint/y = 0" >0</xsl:if>
                                <xsl:if test="originPoint/y != 0" ><xsl:value-of select="originPoint/y" /> * 2</xsl:if>
                               ),
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>
                };

                //animationInterfaceFactoryInterfaceFactory.addRectangle(animationInterfaceFactoryInterfaceFactory.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_RECTANGLE_NAME, <xsl:value-of select="name" />ImageArray[0]);
                //hashTable.put(animationInterfaceFactoryInterfaceFactory.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_IMAGE_ARRAY_NAME, <xsl:value-of select="name" />ImageArray);
                </xsl:if>

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

                size = this.<xsl:value-of select="name" />JSONResourceArray.length;
                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    PlatformAssetManager.getInstance().getResourceAsStream(this.<xsl:value-of select="name" />JSONResourceArray[index]);
                }                

            </xsl:if>

        </xsl:for-each>
        //objects - threed object - cache - END
    </xsl:template>

</xsl:stylesheet>
