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
            <xsl:variable name="index" select="position() - 1" />
            <!--
            <xsl:if test="number($index) > 1" >
            -->
            <xsl:if test="number($index) = <GD_CURRENT_INDEX>" >
                <xsl:variable name="nameValue" select="name" />
package org.allbinary.game.midlet;

import org.allbinary.game.midlet.DemoGameMidlet;
import org.allbinary.game.midlet.DemoGameMidletEvent;
import org.allbinary.game.midlet.DemoGameMidletEventHandler;
import org.allbinary.game.midlet.DemoGameMidletStateFactory;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.graphics.displayable.command.MyCommandsFactory;

public class GDGameStart<GDLayout>CanvasRunnable implements Runnable
{
    protected final LogUtil logUtil = LogUtil.getInstance();
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    
    private final GDGameMIDlet demoGameMidlet;

    private final DemoGameMidletEvent startDemoGameMidletEvent;

    public GDGameStart<GDLayout>CanvasRunnable(DemoGameMidlet demoGameMidlet)
    {
        this.demoGameMidlet = (GDGameMIDlet) demoGameMidlet;

        this.startDemoGameMidletEvent =
            new DemoGameMidletEvent(this.demoGameMidlet,
                DemoGameMidletStateFactory.getInstance().START_DEMO);
    }

    public void run()
    {
        try
        {
            logUtil.put(
                    CommonLabels.getInstance().START_LABEL +
                    "GDGameStart<GDLayout>CanvasRunnableInterface",
                    this, commonStrings.RUN);

            this.demoGameMidlet.commandAction(
                    MyCommandsFactory.getInstance().SET_DISPLAYABLE,
                    ProgressCanvasFactory.getInstance());

            //ProgressCanvasFactory.getInstance().waitUntilDisplayed();

            // mediaInit();

            this.demoGameMidlet.setGameCanvasRunnableInterface(
                        this.demoGameMidlet.createGDGameStart<GDLayout>CanvasRunnableInterface());

            this.demoGameMidlet.demoSetup();

            // this.setDisplay((Displayable)
            // this.getGameCanvasRunnableInterface());

            DemoGameMidletEventHandler.getInstance().fireEvent(
                    this.startDemoGameMidletEvent);

            this.demoGameMidlet.startGameCanvasRunnableInterface();

            this.demoGameMidlet.postDemoSetup();

            logUtil.put(commonStrings.END_RUNNABLE, this, commonStrings.RUN);
        }
        catch (Exception e)
        {
            logUtil.put(commonStrings.EXCEPTION, this, commonStrings.RUN, e);
        }

    }
}

            </xsl:if>

        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
