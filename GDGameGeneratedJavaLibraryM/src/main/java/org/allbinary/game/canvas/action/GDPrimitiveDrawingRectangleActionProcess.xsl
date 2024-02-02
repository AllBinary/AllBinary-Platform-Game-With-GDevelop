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

    <xsl:template name="primitiveDrawingRectangleActionProcess" >
        <xsl:param name="layoutIndex" />
        
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //PrimitiveDrawing::Rectangle - action
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        return true;
                    }

                    <xsl:variable name="hasCollisionProcessGD" >
                        <xsl:call-template name="hasCollisionProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:call-template name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:call-template name="collisionProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="contains($hasCollisionProcessGD, 'found')" >
                        super.processGDStats(<xsl:call-template name="collisionProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template>GDGameLayer);
                    </xsl:if>
                    <xsl:if test="contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >
                        super.processGDStats(<xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template>GDGameLayer);
                    </xsl:if>
<!--                    
                    <xsl:if test="not(contains($hasCollisionProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                    //PrimitiveDrawing::FillColor - Not from parent collision
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                    </xsl:if>
-->
                        
                        try {

                            <xsl:variable name="gdObjectName" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>

                            final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gdObjectName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gdObjectName" /><xsl:text> </xsl:text><xsl:value-of select="$gdObjectName" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gdObjectName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gdObjectName" />) <xsl:value-of select="$gdObjectName" />GDGameLayer.gdObject;

                            ((GDPrimitiveDrawing) <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>GDGameLayer.primitiveDrawing).addFillRectangle(
                                <xsl:for-each select="parameters" ><xsl:if test="position() > 1" ><xsl:value-of select="text()" /><xsl:if test="position() != last()" >,</xsl:if></xsl:if></xsl:for-each>
                                );
                                
                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                        }
                        return true;                   
                    }
    </xsl:template>

</xsl:stylesheet>
