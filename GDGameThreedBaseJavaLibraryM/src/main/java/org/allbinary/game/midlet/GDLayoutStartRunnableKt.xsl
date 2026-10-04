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
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutName" select="name" />
            <xsl:variable name="index" select="position() - 1" />
            <!--
            <xsl:if test="number($index) > 1" >
            -->
            <xsl:if test="number($index) = <GD_CURRENT_INDEX>" >
                <xsl:variable name="nameValue" select="name" />
/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
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

open class GDGameStart<xsl:value-of select="$layoutName" />CanvasRunnable, Runnable
{
    protected val logUtil: LogUtil = LogUtil.getInstance()

    private val commonStrings: CommonStrings = CommonStrings.getInstance()

    private val demoGameMidlet: GDGameMIDlet

    private val startDemoGameMidletEvent: DemoGameMidletEvent

    constructor(DemoGameMidlet demoGameMidlet)
    {
        this.demoGameMidlet = demoGameMidlet as GDGameMIDlet

        this.startDemoGameMidletEvent =
            DemoGameMidletEvent(this.demoGameMidlet,
                DemoGameMidletStateFactory.getInstance().START_DEMO)
    }

    fun run()
    {
        try
        {
            logUtil.put(
                    CommonLabels.getInstance().START_LABEL +
                    "GDGameStart<xsl:value-of select="$layoutName" />CanvasRunnableInterface",
                    this, commonStrings.RUN)

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

            logUtil.putF(commonStrings.END_RUNNABLE, this, commonStrings.RUN)
        }
        catch(e: Exception)
        {
            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e)
        }

    }
}

            </xsl:if>

        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
