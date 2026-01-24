<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="cameraYActionProcess" >
        <xsl:param name="layoutIndex" />

        <xsl:variable name="quote" >"</xsl:variable>

        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        //CameraY - action
                        @Override
                        public boolean process() throws Exception {

                            logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                            final ABToGBUtil abToGBUtil = ABToGBUtil.getInstance();
                            final AllBinaryGameLayerManager allBinaryGameLayerManager = abToGBUtil.allBinaryGameLayerManager;
                            final int size = allBinaryGameLayerManager.getSize();
                            GDGameLayer gameLayer;
                            for (int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++)
                            {
                                gameLayer = (GDGameLayer) allBinaryGameLayerManager.getLayerAt(index);
                                gameLayer.setPosition(gameLayer.getXP(), gameLayer.getYP() -<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each> (int) (<xsl:for-each select="parameters" ><xsl:if test="position() > 2" ><xsl:value-of select="translate(text(), $quote, '')" /></xsl:if> </xsl:for-each>), gameLayer.getZP());
                            }

                            return true;
                        }

                    @Override
                    public boolean process(final int index) throws Exception {
                        //this.processStats();
                            
                        return this.process();
                    }

                    @Override
                    public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                        this.processGDStats(gameLayer);
                            
                        return this.process();
                    }

    </xsl:template>

</xsl:stylesheet>
