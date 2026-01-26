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

    <xsl:template name="addForceXYActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

                                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //AddForceXY - action
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        try {
                
                            //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

            <xsl:if test="../actions" >
                            //if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList != null) {
                            if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.objectArray != nullUtil.NULL_OBJECT_ARRAY) {
                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.size();

                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                //logUtil.put(commonLabels.INDEX_LABEL + index, this, commonStrings.PROCESS);
            </xsl:if>
                <xsl:call-template name="gameLayerList" >
                    <xsl:with-param name="name" >
                        <xsl:value-of select="$name"/>
                    </xsl:with-param>
                </xsl:call-template>

                                this.processGD(<xsl:value-of select="$name" />GDGameLayer, null, globals.graphics);

            <xsl:if test="../actions" >
                                }
                            } else {
                                //logUtil.put("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$name" />GDGameLayerList was null", this, commonStrings.PROCESS);
                            }
            </xsl:if>

                        } catch(Exception e) {
                            logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                        }

                        return true;
                    }

                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);
                
                        //logUtil.put(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

            <xsl:if test="../actions" >
                        //if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList != null) {
                        if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.objectArray != nullUtil.NULL_OBJECT_ARRAY) {
                            if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.size() != 0) {

                            //logUtil.put(commonLabels.INDEX_LABEL + index, this, commonStrings.PROCESS);
            </xsl:if>
                <xsl:call-template name="gameLayerList" >
                    <xsl:with-param name="name" >
                        <xsl:value-of select="$name"/>
                    </xsl:with-param>
                </xsl:call-template>

                            this.processGD(<xsl:value-of select="$name" />GDGameLayer, null, globals.graphics);
                            return true;

            <xsl:if test="../actions" >
                            } else {
                                //logUtil.put("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$name" />GDGameLayerList was empty", this, commonStrings.PROCESS);
                            }
                        } else {
                            //logUtil.put("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$name" />GDGameLayerList was null", this, commonStrings.PROCESS);
                        }                
            </xsl:if>
                        return false;
                    }

                        @Override
                        public boolean processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                            super.processGDStats(<xsl:value-of select="$name" />GDGameLayer);

                                //logUtil.put(ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                                    <xsl:variable name="hasPermanentVelocity" >
                                        <xsl:for-each select="parameters" >
                                            <xsl:if test="position() = 4" >
                                                <xsl:if test="text() = 1" >found</xsl:if>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </xsl:variable>

                                <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /></xsl:variable>

                                    //name=<xsl:value-of select="$name" />
                                    //final <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$name" /> = (<xsl:value-of select="$gdObjectFactory" />) <xsl:value-of select="$name" />GDGameLayer.gdObject;
                                    <xsl:text>&#10;</xsl:text>

                                    <xsl:if test="contains($hasPermanentVelocity, 'found')" >

                                    //Parameters - 6
                                    
                                        <xsl:for-each select="parameters" >
                                            <xsl:if test="position() = 1" >
                                                <xsl:value-of select="text()" />GDGameLayer.velocityBehavior = NoDragVelocityBehavior.instance;</xsl:if>
                                        </xsl:for-each>

                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            <xsl:value-of select="text()" />GDGameLayer.AddForce(</xsl:if>
                                        <xsl:if test="position() != 1 and position() != last()" >
                                            <xsl:value-of select="text()" /><xsl:if test="position() = 2" >, (int)</xsl:if>
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >
                                            );
                                        </xsl:if>
                                    </xsl:for-each>                                    
                                    
                                    <xsl:text>&#10;</xsl:text>
                                    //updateGDObject - 4
                                    <xsl:value-of select="$name" />GDGameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);
                                    <xsl:text>&#10;</xsl:text>
                                
                                    </xsl:if>

                                    <xsl:if test="not(contains($hasPermanentVelocity, 'found'))" >
                                    <xsl:value-of select="$name" />GDGameLayer.setPosition(<xsl:value-of select="$name" />GDGameLayer.getXP() + (int) (<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each> * TimeDelta()),
                                        <xsl:value-of select="$name" />GDGameLayer.getYP() + (int) (<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each> * TimeDelta()), 
                                        <xsl:value-of select="$name" />GDGameLayer.getZP());

                                    </xsl:if>

                            return true;
                        }
        
    </xsl:template>

</xsl:stylesheet>
