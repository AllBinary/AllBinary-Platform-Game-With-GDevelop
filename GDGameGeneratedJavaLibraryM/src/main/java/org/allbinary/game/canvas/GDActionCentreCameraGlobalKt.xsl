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

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="globalCentreCameraActions" >

        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'CentreCamera' or type/value = 'CenterCameraOnObject'" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        
        <xsl:variable name="baseLayerScale" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera' or type/value = 'CenterCameraOnObject'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3 and text() = '&quot;&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
        <xsl:variable name="tileMapScale" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera' or type/value = 'CenterCameraOnObject'" ><xsl:for-each select="parameters" ><xsl:if test="text() = '&quot;TileMap&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

        <xsl:if test="string-length($baseLayerScale) > 0" >
                    //CentreCamera - Base layer
        </xsl:if>
        <xsl:if test="string-length($tileMapScale) > 0" >
                    //CentreCamera - TileMap
        </xsl:if>
        <xsl:if test="string-length($baseLayerScale) > 0 or string-length($tileMapScale) > 0" >
                    val centerCameraX: Int = (SceneWindowWidth() / 2).toInt()
                    val centerCameraY: Int = (SceneWindowHeight() / 2).toInt()
                    //this.logUtil.putF("centerCameraX: " + centerCameraX + " centerCameraY: " + centerCameraY, this, this.commonStrings.PROCESS)
        </xsl:if>
        <xsl:if test="string-length($baseLayerScale) > 0 and string-length($tileMapScale) > 0" >
                    val centerCameraX: Int = -1
                    val centerCameraY: Int = -1
        </xsl:if>

    </xsl:template>


    <xsl:template name="globalUpdateCentreCameraActions" >
        <xsl:param name="baseLayer" />
        <xsl:param name="tileMap" />

        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'CentreCamera' or type/value = 'CenterCameraOnObject'" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        
        <xsl:variable name="baseLayerScale" ><xsl:if test="$baseLayer = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera' or type/value = 'CenterCameraOnObject'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4 and text() = '&quot;&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>
        <xsl:variable name="baseLayerName" ><xsl:if test="$baseLayer = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera' or type/value = 'CenterCameraOnObject'" ><xsl:if test="parameters[4] = '&quot;&quot;'" ><xsl:value-of select="parameters[2]" /></xsl:if></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>
        <xsl:variable name="tileMapScale" ><xsl:if test="$tileMap = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera' or type/value = 'CenterCameraOnObject'" ><xsl:for-each select="parameters" ><xsl:if test="text() = '&quot;TileMap&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>

        <xsl:if test="string-length($baseLayerScale) > 0" >
                    //CentreCamera - Base layer
        </xsl:if>
        <xsl:if test="string-length($tileMapScale) > 0" >
                    //CentreCamera - TileMap
        </xsl:if>
        <xsl:if test="string-length($baseLayerScale) > 0" >
                            DisplayChangeEventHandler.getInstance().addListener(object : DisplayChangeEventListener {
                                
                                override fun onEvent(eventObject: AllBinaryEventObject) {
                                    
                                }

                                override fun onDisplayChangeEvent(displayChangeEvent: DisplayChangeEvent) {
                                    //TWB - currently would write over the map positioning in the builder.
                                    //val centerCameraX: Int = (SceneWindowWidth() / 2).toInt()
                                    //val centerCameraY: Int = (SceneWindowHeight() / 2).toInt()
                                    //this.logUtil.putF("centerCameraX: " + centerCameraX + " centerCameraY: " + centerCameraY, this, this.commonStrings.PROCESS)
                                    //<xsl:value-of select="$baseLayerName" />.x = centerCameraX - (<xsl:value-of select="$baseLayerName" />.width / 2)
                                    //<xsl:value-of select="$baseLayerName" />.y = centerCameraY - (<xsl:value-of select="$baseLayerName" />.height / 2)
                                    //this.logUtil.putF("<xsl:value-of select="$baseLayerName" />X: " + <xsl:value-of select="$baseLayerName" />.x + " <xsl:value-of select="$baseLayerName" />Y: " + <xsl:value-of select="$baseLayerName" />.y, this, this.commonStrings.PROCESS)
                                    //<xsl:value-of select="$baseLayerName" />GDGameLayer.updatePosition()
                                }
                            })
        </xsl:if>
        <xsl:if test="string-length($tileMapScale) > 0" >

            val size2: Int = geographicMapInterfaceArray.size
            for(index in 0 until<xsl:text disable-output-escaping="yes" ></xsl:text> size2) {
                val geographicMapInterface: BasicGeographicMap = geographicMapInterfaceArray[index] as GDGeographicMap
                val tiledLayer: AllBinaryTiledLayer = geographicMapInterface.getAllBinaryTiledLayer()
                tiledLayer.setPosition(centerCameraX - (tiledLayer.getHalfWidth() - 78), centerCameraY - (tiledLayer.getHalfHeight() + 109), 0)
                
                val tiledLayer2: AllBinaryTiledLayer = tiledLayer
                DisplayChangeEventHandler.getInstance().addListener(object : DisplayChangeEventListener {

                    override fun onEvent(eventObject: AllBinaryEventObject) {

                    }

                    override fun onDisplayChangeEvent(displayChangeEvent: DisplayChangeEvent) {
                        val centerCameraX: Int = (SceneWindowWidth() / 2).toInt()
                        val centerCameraY: Int = (SceneWindowHeight() / 2).toInt()
                        tiledLayer2.setPosition(centerCameraX - (tiledLayer2.getHalfWidth() - 78), centerCameraY - (tiledLayer2.getHalfHeight() + 109), 0)
                    }
                })

            }

        </xsl:if>

    </xsl:template>

    <xsl:template name="globalUpdateCentreCameraActions2" >
        <xsl:param name="baseLayer" />
        <xsl:param name="tileMap" />

        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'CentreCamera' or type/value = 'CenterCameraOnObject'" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        
        <xsl:variable name="baseLayerScale" ><xsl:if test="$baseLayer = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera' or type/value = 'CenterCameraOnObject'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4 and text() = '&quot;&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>
        <xsl:variable name="baseLayerName" ><xsl:if test="$baseLayer = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera' or type/value = 'CenterCameraOnObject'" ><xsl:if test="parameters[4] = '&quot;&quot;'" ><xsl:value-of select="parameters[2]" /></xsl:if></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>
        <xsl:variable name="tileMapScale" ><xsl:if test="$tileMap = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera' or type/value = 'CenterCameraOnObject'" ><xsl:for-each select="parameters" ><xsl:if test="text() = '&quot;TileMap&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>

        <xsl:if test="string-length($baseLayerScale) > 0" >
                    //CentreCamera - Base layer
        </xsl:if>
        <xsl:if test="string-length($tileMapScale) > 0" >
                    //CentreCamera - TileMap
        </xsl:if>
        <xsl:if test="string-length($baseLayerScale) > 0 or string-length($tileMapScale) > 0" >
        StaticTileLayerIntoPositionViewPosition.setTiledLayer(geographicMapInterfaceArray[0].getAllBinaryTiledLayer())
        this.setPosition(geographicMapCompositeInterface)
        </xsl:if>

    </xsl:template>

</xsl:stylesheet>
