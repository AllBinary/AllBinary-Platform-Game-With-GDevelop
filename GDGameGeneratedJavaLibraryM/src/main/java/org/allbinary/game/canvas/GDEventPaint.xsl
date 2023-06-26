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

    <xsl:template name="eventsPaint" >
        <xsl:param name="totalRecursions" />
        <xsl:param name="instancesAsString" />

        <xsl:for-each select="events" >
            <!--
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />

            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:value-of select="$parametersAsString" />
            </xsl:for-each>
            -->

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>

                <xsl:if test="$typeValue = 'MettreX'" >
                    <xsl:variable name="name2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="name" >:<xsl:value-of select="$name2" />,</xsl:variable>

                    <xsl:if test="contains($instancesAsString, $name)" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //MettreX
                    if(true) {
                    final int size<xsl:value-of select="$name2" /> = globals.<xsl:value-of select="$name2" />GDObjectList.size();
                    GDObject <xsl:value-of select="$name2" />;
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size<xsl:value-of select="$name2" />; index++) {
                        <xsl:value-of select="$name2" /> = (GDObject) globals.<xsl:value-of select="$name2" />GDObjectList.get(index);
                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGPaint(<xsl:value-of select="$name2" />, graphics);
                    }
                    }
                    </xsl:if>
                    <!--
                    <xsl:if test="not(contains($instancesAsString, $name))" >
                        //globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(<xsl:value-of select="$name2" />, graphics);
                    </xsl:if>
                    -->
                </xsl:if>
                <xsl:if test="$typeValue = 'MettreY'" >
                    <xsl:variable name="name2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="name" >:<xsl:value-of select="$name2" />,</xsl:variable>

                    <xsl:if test="contains($instancesAsString, $name)" >
                    //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                    //MettreY
                    final int size<xsl:value-of select="$name2" /> = globals.<xsl:value-of select="$name2" />GDObjectList.size();
                    GDObject <xsl:value-of select="$name2" />;
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size<xsl:value-of select="$name2" />; index++) {
                        <xsl:value-of select="$name2" /> = (GDObject) globals.<xsl:value-of select="$name2" />GDObjectList.get(index);
                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGPaint(<xsl:value-of select="$name2" />, graphics);
                    }
                    </xsl:if>
                    <!--
                    <xsl:if test="not(contains($instancesAsString, $name))" >
                        //globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(<xsl:value-of select="$name2" />, graphics);
                    </xsl:if>
                    -->
                </xsl:if>
            </xsl:for-each>

            <xsl:call-template name="eventsPaint" >
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
            </xsl:call-template>

        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
