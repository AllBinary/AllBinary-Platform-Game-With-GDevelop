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

    <xsl:template name="paintDebugButtons" >
        <xsl:param name="caller" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />
         
        <xsl:variable name="quote" >"</xsl:variable>

        //caller=<xsl:value-of select="$caller" /> - //paintDebugButtons - START
        final BasicColorSetUtil basicColorUtil = BasicColorSetUtil.getInstance();
        basicColorUtil.setBasicColor(
                graphics, BasicColorFactory.getInstance().RED, BasicColorFactory.getInstance().RED.intValue());
        
        <xsl:for-each select="events" >

            <!-- conditions - START -->
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>

                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            //<xsl:value-of select="$conditionAsString" />
                            //SourisSurObjet - debug paint for <xsl:value-of select="text()" />
                            if(globals.<xsl:value-of select="text()" />Rectangle != null) {                            
                                final GPoint rectangePoint = globals.<xsl:value-of select="text()" />Rectangle.getPoint();
                                graphics.drawRect(rectangePoint.getX(), rectangePoint.getY(), globals.<xsl:value-of select="text()" />Rectangle.getWidth(), globals.<xsl:value-of select="text()" />Rectangle.getHeight());
                            }
                        </xsl:if>
                
                    </xsl:for-each>
                            
                </xsl:if>
                
            </xsl:for-each>
            <!-- conditions - END -->

        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>
