<?xml version="1.0" encoding="UTF-8" ?>

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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
 *
 * By agreeing to this license you and any business entity you represent are
 * legally bound to the AllBinary Open License Version 1 legal agreement.
 *
 * You may obtain the AllBinary Open License Version 1 legal agreement from
 * AllBinary or the root directory of AllBinary's AllBinary Platform repository.
 *
 * Created By: Travis Berthelot
 *
 */
package org.allbinary.game.canvas

/**
 *
 * @author User
 */
open class GDGameThreedAnimationResources {

    private val instance: GDGameThreedAnimationResources = GDGameThreedAnimationResources()

    /**
     * @return the instance
     */
    fun getInstance(): GDGameThreedAnimationResources {
        return GDGameThreedAnimationResources.instance
    }

    private constructor() {
    }


        <xsl:for-each select="properties/customTextures" >
    //name=<xsl:value-of select="name" />
    val <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(texture, '.', '_')" /></xsl:with-param></xsl:call-template>: String = "<xsl:value-of select="texture" />"
        </xsl:for-each>


}
    </xsl:template>

</xsl:stylesheet>
