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
    <xsl:output method="text" indent="yes" />

    <xsl:template match="/game">
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutName" select="name" />
            <xsl:variable name="index" select="position() - 1" />
            <!--
            <xsl:if test="number($index) > 1" >
            -->
            <xsl:if test="number($index) = <GD_CURRENT_INDEX>" >
                <xsl:variable name="nameValue" select="name" />
package org.allbinary.game.midlet

import org.allbinary.game.midlet.DemoGameMidlet
import org.allbinary.game.midlet.DemoGameMidletEvent
import org.allbinary.game.midlet.DemoGameMidletEventHandler
import org.allbinary.game.midlet.DemoGameMidletStateFactory
import org.allbinary.string.CommonLabels
import org.allbinary.string.CommonStrings

import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
import org.allbinary.graphics.displayable.command.MyCommandsFactory

open class GDGameStart<xsl:value-of select="$layoutName" />CanvasRunnable : Runnable
{
    val this.logUtil: LogUtil = LogUtil.getInstance()
    private val this.commonStrings: CommonStrings = CommonStrings.getInstance()

    private val demoGameMidlet: GDGameMIDlet

    private val startDemoGameMidletEvent: DemoGameMidletEvent

    constructor(demoGameMidlet: DemoGameMidlet)
    {
        var demoGameMidlet = demoGameMidlet
        this.demoGameMidlet = demoGameMidlet as GDGameMIDlet

        this.startDemoGameMidletEvent =
            DemoGameMidletEvent(this.demoGameMidlet,
                DemoGameMidletStateFactory.getInstance().START_DEMO)
    }

    open fun run()
    {
        try
        {
            this.logUtil.put(
                    CommonLabels.getInstance().START_LABEL +
                    "GDGameStart<xsl:value-of select="$layoutName" />CanvasRunnableInterface",
                    this, this.commonStrings.RUN)

            this.demoGameMidlet.commandAction(
                    MyCommandsFactory.getInstance().SET_DISPLAYABLE,
                    ProgressCanvasFactory.getInstance())

            //ProgressCanvasFactory.getInstance().waitUntilDisplayed()

            // mediaInit()

            this.demoGameMidlet.setGameCanvasRunnableInterface(
                        this.demoGameMidlet.createGDGameStart<xsl:value-of select="$layoutName" />CanvasRunnableInterface())

            this.demoGameMidlet.demoSetup()

            // this.setDisplay((Displayable)
            // this.getGameCanvasRunnableInterface())

            DemoGameMidletEventHandler.getInstance().fireEvent(
                    this.startDemoGameMidletEvent)

            this.demoGameMidlet.startGameCanvasRunnableInterface()

            this.demoGameMidlet.postDemoSetup()

            this.logUtil.putF(this.commonStrings.END_RUNNABLE, this, this.commonStrings.RUN)
        }
        catch(e: Exception)
        {
            this.logUtil.put(this.commonStrings.EXCEPTION, this, this.commonStrings.RUN, e)
        }

    }
}

            </xsl:if>

        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
