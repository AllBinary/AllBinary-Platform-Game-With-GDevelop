<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

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

import javax.microedition.lcdui.Command;
import javax.microedition.lcdui.Displayable;

//import org.allbinary.game.canvas.GDGameStartCanvas;
<xsl:for-each select="layouts" >
    <xsl:variable name="name" ><xsl:if test="position() != 1" >GDGameStart</xsl:if><xsl:if test="position() = 1" >GDGame</xsl:if><xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>Canvas</xsl:variable>
    import org.allbinary.game.canvas.<xsl:value-of select="$name" />;
</xsl:for-each>                
import org.allbinary.canvas.RunnableCanvas;
import org.allbinary.game.canvas.GDGameInputMappingHelpPaintable;
import org.allbinary.game.canvas.GDGameSoftwareInfo;
//import org.allbinary.game.canvas.GDGameStartCanvas;
import org.allbinary.game.canvas.GDGameStartMenuCanvas;
import org.allbinary.game.canvas.GDGameAsteroidsCanvas;
import org.allbinary.game.canvas.GDGameStartGameOverCanvas;
import org.allbinary.game.commands.GameCommandsFactory;
import org.allbinary.game.layer.GDGameLayerManager;
import org.allbinary.media.audio.GDGameSoundsFactoryFactory;

import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.game.GameInfo;
import org.allbinary.game.GameMode;
import org.allbinary.game.GameTypeFactory;
import org.allbinary.game.PlayerTypesFactory;
import org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface;
import org.allbinary.game.layer.AllBinaryGameLayerManager;
import org.allbinary.game.midlet.LicenseLevelUtil;
import org.allbinary.game.midlet.LicenseLoadingTypeFactory;
import org.allbinary.game.midlet.SpecialDemoGameMidlet;
import org.allbinary.game.paint.help.HelpPaintable;
import org.allbinary.game.score.BasicHighScoresFactory;
import org.allbinary.game.score.HighScoresPaintable;
import org.allbinary.game.score.displayable.HighScoresCanvas;
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.media.audio.AllBinaryMediaManagerShutdown;
import org.allbinary.media.audio.EarlySoundsFactoryFactory;
import org.allbinary.midlet.MidletStrings;
import org.allbinary.thread.PrimaryThreadPool;

/**
 * @author user
 */
public class GDGameMIDlet extends
   SpecialDemoGameMidlet
   //DemoGameMidlet
{
    private final CommonStrings commonStrings = CommonStrings.getInstance();
    
    private final String GD_LAYOUT_COLOR = "GDLayout2Color";

   public GDGameMIDlet()
   {
       super(LicenseLoadingTypeFactory.getIntance().OTHER);
       //this.setSaveGameForm(SaveGameForm.getInstance(this, "Save Game"));
   }

   protected HelpPaintable getHelpPaintable()
   throws Exception
   {
       //return GDGameHelpPaintable.getInstance();
       return GDGameInputMappingHelpPaintable.getInstance();
   }

<xsl:for-each select="layouts" >
    <xsl:variable name="name" ><xsl:if test="position() != 1" >GDGameStart</xsl:if><xsl:if test="position() = 1" >GDGame</xsl:if><xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>Canvas</xsl:variable>
    <xsl:if test="position() = 1" >
   public GameCanvasRunnableInterface createDemoGameCanvasRunnableInterface() throws Exception
   {
       return new <xsl:value-of select="$name" />(this);
      //return new GDGameStartCanvas(this);
   }
    </xsl:if>
    <xsl:if test="position() = 2" >
   public GameCanvasRunnableInterface createGameCanvasRunnableInterface(
		   AllBinaryGameLayerManager allBinaryGameLayerManager) throws Exception
   {
       return new <xsl:value-of select="$name" />(this, allBinaryGameLayerManager);
       //return new GDGameGameCanvas(this, allBinaryGameLayerManager);
   }        
    </xsl:if>
    <xsl:if test="position() != 1 and position() != 2" >
   public GameCanvasRunnableInterface create<xsl:value-of select="$name" />RunnableInterface() throws Exception
   {
       return new <xsl:value-of select="$name" />(this);
      //return new GDGameStartCanvas(this);
   }

    public synchronized void set<xsl:value-of select="$name" />RunnableInterface() throws Exception
    {
        LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "set<xsl:value-of select="$name" />"));

        ////TWB - Loading Feature Change - Can remove remark after testing
        ProgressCanvasFactory.getInstance().start();

        PrimaryThreadPool.getInstance().runTask(new <xsl:value-of select="$name" />Runnable(this));
        //this.postDemoSetup();
    }        
    </xsl:if>
</xsl:for-each>                


   protected HighScoresCanvas createHighScoresCanvas() throws Exception
   {
       return new HighScoresCanvas(this,
               this.createGameLayerManager(),
               new HighScoresPaintable(),
               new BasicHighScoresFactory(GDGameSoftwareInfo.getInstance()));
   }

   public int getHighestLevel()
   {
	   PreLogUtil.put("******************Demo Level Limited To: 6", this, "getMaxLevel");
       return LicenseLevelUtil.getInstance().getMaxLevel(GDGameLayerManager.MAX_LEVEL, 6);
   }

   protected AllBinaryGameLayerManager createGameLayerManager()
   {
       final GameInfo gameInfo = new GameInfo(
               GameTypeFactory.getInstance().SINGLE_PLAYER, GameMode.SERVER,
               PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE,
               this.getHighestLevel(), 1);

       <xsl:for-each select="layouts" >
           <xsl:if test="position() = 2" >
               <xsl:for-each select="events" >
                   <xsl:for-each select="events" >
                       <xsl:for-each select="events" >
                           <xsl:for-each select="actions" >
                               <xsl:variable name="typeValue" select="type/value" />
                               <xsl:if test="$typeValue = 'SceneBackground'" >
       final BasicColor backgroundBasicColor = new BasicColor(255,
                               <xsl:for-each select="parameters" ><xsl:value-of select="translate(translate(text(), '\&quot;', ''), ';', ',')" /></xsl:for-each>,
                               GD_LAYOUT_COLOR);
       final BasicColor foregroundBasicColor = new BasicColor(255, 255-backgroundBasicColor.red, 255-backgroundBasicColor.green, 255-backgroundBasicColor.blue,
                               GD_LAYOUT_COLOR);
       return new GDGameLayerManager(backgroundBasicColor, foregroundBasicColor, gameInfo);
                               </xsl:if>
                           </xsl:for-each>
                       </xsl:for-each>
                   </xsl:for-each>
               </xsl:for-each>
           </xsl:if>
       </xsl:for-each>
   }

   /*
   protected void mediaInit() throws Exception
   {
   }
   */

   protected void mediaShutdown() throws Exception
   {
        //PreLogUtil.put(commonStrings.START, this, "mediaShutdown - postStopGameCanvasRunnableInterface");

        LogUtil.put(LogFactory.getInstance(commonStrings.START, this,
                "mediaShutdown - postStopGameCanvasRunnableInterface"));

        AllBinaryMediaManagerShutdown.shutdown(
           EarlySoundsFactoryFactory.getInstance());
        AllBinaryMediaManagerShutdown.shutdown(
           GDGameSoundsFactoryFactory.getInstance());

        LogUtil.put(LogFactory.getInstance(commonStrings.END, this,
                "mediaShutdown - postStopGameCanvasRunnableInterface"));
   }

    public synchronized void setDemo() throws Exception
    {
        LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "setDemo"));

        ////TWB - Loading Feature Change - Can remove remark after testing
        ProgressCanvasFactory.getInstance().start();

        PrimaryThreadPool.getInstance().runTask(new StartRunnable(this));
        //this.postDemoSetup();
    }

    public synchronized void commandAction(final Command command, final Displayable displayable2) {

        try {

            //PreLogUtil.put(layoutName, this, "setGDLayout");

            final GDGameCommandFactory gdGameCommandFactory = GDGameCommandFactory.getInstance();

            final Displayable displayable = this.getCurrentDisplayable();
            if(displayable instanceof RunnableCanvas) {
                ((RunnableCanvas) displayable).end2();
            }

       <xsl:for-each select="layouts" >
           <xsl:variable name="name" ><xsl:if test="position() != 1" >GDGameStart</xsl:if><xsl:if test="position() = 1" >GDGame</xsl:if><xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>Canvas</xsl:variable>
           <xsl:if test="position() != 1" >} else </xsl:if>if(command.equals(gdGameCommandFactory.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_GD_LAYOUT)) {
           <xsl:if test="position() = 1" >this.setDemo();</xsl:if>
           <xsl:if test="position() = 2" >this.createGame();</xsl:if>
           <xsl:if test="position() != 1 and position() != 2" >this.set<xsl:value-of select="$name" />RunnableInterface();</xsl:if>
       </xsl:for-each>                
            } else {
                super.commandAction(command, displayable2);
            }

        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, MidletStrings.getInstance().COMMAND_ACTION, e));
            if (command != GameCommandsFactory.getInstance().EXIT_COMMAND)
            {
                this.exit(false);
            }
        }
    }
}
    </xsl:template>

</xsl:stylesheet>
