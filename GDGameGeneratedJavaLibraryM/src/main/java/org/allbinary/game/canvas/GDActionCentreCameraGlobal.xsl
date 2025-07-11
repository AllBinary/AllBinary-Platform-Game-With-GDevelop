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
                <xsl:if test="type/value = 'CentreCamera'" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        
        <xsl:variable name="baseLayerScale" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3 and text() = '&quot;&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
        <xsl:variable name="tileMapScale" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera'" ><xsl:for-each select="parameters" ><xsl:if test="text() = '&quot;TileMap&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

        <xsl:if test="string-length($baseLayerScale) > 0" >
                    //CentreCamera - Base layer
        </xsl:if>
        <xsl:if test="string-length($tileMapScale) > 0" >
                    //CentreCamera - TileMap
        </xsl:if>
        <xsl:if test="string-length($baseLayerScale) > 0 or string-length($tileMapScale) > 0" >
                    final int centerCameraX = (int) (SceneWindowWidth() / 2);
                    final int centerCameraY = (int) (SceneWindowHeight() / 2);
                    //logUtil.put("centerCameraX: " + centerCameraX + " centerCameraY: " + centerCameraY, this, commonStrings.PROCESS);
        </xsl:if>
        <xsl:if test="string-length($baseLayerScale) > 0 and string-length($tileMapScale) > 0" >
                    final int centerCameraX = -1;
                    final int centerCameraY = -1;
        </xsl:if>

    </xsl:template>


    <xsl:template name="globalUpdateCentreCameraActions" >
        <xsl:param name="baseLayer" />
        <xsl:param name="tileMap" />

        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'CentreCamera'" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        
        <xsl:variable name="baseLayerScale" ><xsl:if test="$baseLayer = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4 and text() = '&quot;&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>
        <xsl:variable name="baseLayerName" ><xsl:if test="$baseLayer = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera'" ><xsl:if test="parameters[4] = '&quot;&quot;'" ><xsl:value-of select="parameters[2]" /></xsl:if></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>
        <xsl:variable name="tileMapScale" ><xsl:if test="$tileMap = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera'" ><xsl:for-each select="parameters" ><xsl:if test="text() = '&quot;TileMap&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>

        <xsl:if test="string-length($baseLayerScale) > 0" >
                    //CentreCamera - Base layer
        </xsl:if>
        <xsl:if test="string-length($tileMapScale) > 0" >
                    //CentreCamera - TileMap
        </xsl:if>
        <xsl:if test="string-length($baseLayerScale) > 0" >
                            DisplayChangeEventHandler.getInstance().addListener(new DisplayChangeEventListener() {
                                
                                public void onEvent(final AllBinaryEventObject eventObject) {
                                    
                                }

                                public void onDisplayChangeEvent(final DisplayChangeEvent displayChangeEvent) {
                                    //TWB - currently would write over the map positioning in the builder.
                                    //final int centerCameraX = (int) (SceneWindowWidth() / 2);
                                    //final int centerCameraY = (int) (SceneWindowHeight() / 2);
                                    //logUtil.put("centerCameraX: " + centerCameraX + " centerCameraY: " + centerCameraY, this, commonStrings.PROCESS);                                    
                                    //<xsl:value-of select="$baseLayerName" />GDobject2.x = centerCameraX - (<xsl:value-of select="$baseLayerName" />GDobject2.width / 2);
                                    //<xsl:value-of select="$baseLayerName" />GDobject2.y = centerCameraY - (<xsl:value-of select="$baseLayerName" />GDobject2.height / 2);
                                    //logUtil.put("<xsl:value-of select="$baseLayerName" />X: " + <xsl:value-of select="$baseLayerName" />GDobject2.x + " <xsl:value-of select="$baseLayerName" />Y: " + <xsl:value-of select="$baseLayerName" />GDobject2.y, this, commonStrings.PROCESS);
                                    //<xsl:value-of select="$baseLayerName" />GDGameLayer.updatePosition();
                                }
                            });
        </xsl:if>
        <xsl:if test="string-length($tileMapScale) > 0" >

            AllBinaryTiledLayer tiledLayer;
            BasicGeographicMap geographicMapInterface;
            final int size2 = geographicMapInterfaceArray.length;
            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index++) {
                geographicMapInterface = (GDGeographicMap) geographicMapInterfaceArray[index];
                tiledLayer = geographicMapInterface.getAllBinaryTiledLayer();
                tiledLayer.setPosition(centerCameraX - (tiledLayer.getHalfWidth() - 78), centerCameraY - (tiledLayer.getHalfHeight() + 109), 0);
                
                final AllBinaryTiledLayer tiledLayer2 = tiledLayer;
                DisplayChangeEventHandler.getInstance().addListener(new DisplayChangeEventListener() {

                    public void onEvent(final AllBinaryEventObject eventObject) {

                    }

                    public void onDisplayChangeEvent(final DisplayChangeEvent displayChangeEvent) {
                        final int centerCameraX = (int) (SceneWindowWidth() / 2);
                        final int centerCameraY = (int) (SceneWindowHeight() / 2);
                        tiledLayer2.setPosition(centerCameraX - (tiledLayer2.getHalfWidth() - 78), centerCameraY - (tiledLayer2.getHalfHeight() + 109), 0);
                    }
                });

            }

        </xsl:if>

    </xsl:template>

    <xsl:template name="globalUpdateCentreCameraActions2" >
        <xsl:param name="baseLayer" />
        <xsl:param name="tileMap" />

        <xsl:for-each select="events" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'CentreCamera'" >
                    <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        
        <xsl:variable name="baseLayerScale" ><xsl:if test="$baseLayer = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4 and text() = '&quot;&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>
        <xsl:variable name="baseLayerName" ><xsl:if test="$baseLayer = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera'" ><xsl:if test="parameters[4] = '&quot;&quot;'" ><xsl:value-of select="parameters[2]" /></xsl:if></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>
        <xsl:variable name="tileMapScale" ><xsl:if test="$tileMap = 'true'" ><xsl:for-each select="events" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'CentreCamera'" ><xsl:for-each select="parameters" ><xsl:if test="text() = '&quot;TileMap&quot;'" ><xsl:for-each select="../parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:for-each></xsl:if></xsl:variable>

        <xsl:if test="string-length($baseLayerScale) > 0" >
                    //CentreCamera - Base layer
        </xsl:if>
        <xsl:if test="string-length($tileMapScale) > 0" >
                    //CentreCamera - TileMap
        </xsl:if>
        <xsl:if test="string-length($baseLayerScale) > 0 or string-length($tileMapScale) > 0" >
        StaticTileLayerIntoPositionViewPosition.setTiledLayer(geographicMapInterfaceArray[0].getAllBinaryTiledLayer());
        this.setPosition(geographicMapCompositeInterface);
        </xsl:if>

    </xsl:template>

</xsl:stylesheet>
