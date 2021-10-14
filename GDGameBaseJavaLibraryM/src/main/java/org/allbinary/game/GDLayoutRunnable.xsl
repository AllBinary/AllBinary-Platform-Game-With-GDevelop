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
            <xsl:if test="number($index) > 1" >
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
package org.allbinary.game;

import org.allbinary.game.midlet.DemoGameMidlet;
import org.allbinary.game.midlet.DemoGameMidletEvent;
import org.allbinary.game.midlet.DemoGameMidletEventHandler;
import org.allbinary.game.midlet.DemoGameMidletStateFactory;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.graphics.displayable.command.MyCommandsFactory;

public class GDGameStart<GD_CURRENT_INDEX>CanvasRunnable implements Runnable
{
    private final GDGameMIDlet demoGameMidlet;

    private final DemoGameMidletEvent startDemoGameMidletEvent;

    public GDGameStart<GD_CURRENT_INDEX>CanvasRunnable(DemoGameMidlet demoGameMidlet)
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
            LogUtil.put(LogFactory.getInstance(
                    CommonStrings.getInstance().START_LABEL +
                    "GDGameStart<GD_CURRENT_INDEX>CanvasRunnableInterface",
                    this, CommonStrings.getInstance().RUN));

            this.demoGameMidlet.commandAction(
                    MyCommandsFactory.getInstance().SET_DISPLAYABLE,
                    ProgressCanvasFactory.getInstance());

            //ProgressCanvasFactory.getInstance().waitUntilDisplayed();

            // mediaInit();
            
            this.demoGameMidlet.setGameCanvasRunnableInterface(
                    this.demoGameMidlet.createGDGameStart<GD_CURRENT_INDEX>CanvasRunnableInterface());

            this.demoGameMidlet.demoSetup();
            
            // this.setDisplay((Displayable)
            // this.getGameCanvasRunnableInterface());

            DemoGameMidletEventHandler.getInstance().fireEvent(
                    this.startDemoGameMidletEvent);

            this.demoGameMidlet.startGameCanvasRunnableInterface();
            
            this.demoGameMidlet.postDemoSetup();

            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().END_RUNNABLE, this, CommonStrings.getInstance().RUN));
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().RUN, e));
        }

    }
}                    
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
