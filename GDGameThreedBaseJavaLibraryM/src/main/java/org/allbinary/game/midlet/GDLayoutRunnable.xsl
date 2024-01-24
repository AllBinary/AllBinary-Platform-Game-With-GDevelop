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
package org.allbinary.game.midlet;

import java.util.Hashtable;

import org.allbinary.game.GDGameMIDlet;

import org.allbinary.logic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.graphics.displayable.command.MyCommandsFactory;

public class GDGame<GDLayout>CanvasRunnable implements Runnable
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    
    private final GDGameMIDlet demoGameMidlet;
    private final Hashtable hashtable;
    
    private final DemoGameMidletEvent startGameMidletEvent;
    
    public GDGame<GDLayout>CanvasRunnable(DemoGameMidlet demoGameMidlet, Hashtable hashtable)
    {
        this.demoGameMidlet = (GDGameMIDlet) demoGameMidlet;
        this.hashtable = hashtable;
        
        this.startGameMidletEvent = new DemoGameMidletEvent(
                this, DemoGameMidletStateFactory.getInstance().START_GAME);        
    }
    
    public void run()
    {
        try
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.START_RUNNABLE, this, commonStrings.RUN));

            this.demoGameMidlet.commandAction(
                    MyCommandsFactory.getInstance().SET_DISPLAYABLE,
                    ProgressCanvasFactory.getInstance());

            //ProgressCanvasFactory.getInstance().waitUntilDisplayed();

            this.demoGameMidlet.stopGameCanvasRunnableInterface();

            // mediaInit();

            this.demoGameMidlet.setGameCanvasRunnableInterface(
                    this.demoGameMidlet.createGDGame<GDLayout>CanvasRunnableInterface());

            this.demoGameMidlet.getGameCanvasRunnableInterface().setLoadStateHashtable(hashtable);

            // this.setDisplay((Displayable)
            // this.getGameCanvasRunnableInterface());
            
            this.demoGameMidlet.startGameCanvasRunnableInterface();

            DemoGameMidletEventHandler.getInstance().fireEvent(
                    this.startGameMidletEvent);
            
            LogUtil.put(LogFactory.getInstance(commonStrings.END_RUNNABLE, this, commonStrings.RUN));
        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, commonStrings.RUN, e));
        }
    }
}
            </xsl:if>

        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
