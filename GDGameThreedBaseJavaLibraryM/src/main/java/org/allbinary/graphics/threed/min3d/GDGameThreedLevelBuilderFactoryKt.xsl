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
package org.allbinary.graphics.threed.min3d

import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
import org.allbinary.game.canvas.GD<xsl:value-of select="$layoutIndex" />GameThreedLevelBuilder
        </xsl:for-each>



/**
 *
 * @author User
 */
//private final GDGameThreedLevelBuilderFactory gameThreedLevelBuilderFactory = GDGameThreedLevelBuilderFactory.getInstance()
open class GDGameThreedLevelBuilderFactory {

    private val instance: GDGameThreedLevelBuilderFactory = GDGameThreedLevelBuilderFactory()

    /**
     * @return the instance
     */
    fun getInstance(): GDGameThreedLevelBuilderFactory {
        return GDGameThreedLevelBuilderFactory.instance
    }


    val list: BasicArrayList = BasicArrayListD()
    val cameraList: BasicArrayList = BasicArrayListD()

    private constructor() {
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
        //Layout name=<xsl:value-of select="name" />
        this.list.add(GD<xsl:value-of select="$layoutIndex" />GameThreedLevelBuilder())
        this.cameraList.add(GD<xsl:value-of select="$layoutIndex" />GameCameraSetup.getInstance())
        </xsl:for-each>
    }

}
    </xsl:template>

</xsl:stylesheet>
