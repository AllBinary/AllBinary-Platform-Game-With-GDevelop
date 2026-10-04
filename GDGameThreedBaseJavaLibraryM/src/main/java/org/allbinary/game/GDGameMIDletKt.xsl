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
package org.allbinary.game

import javax.microedition.lcdui.Command
import javax.microedition.lcdui.Displayable

//import org.allbinary.game.canvas.GDGameStartCanvas
<xsl:variable name="totalLayouts" ><xsl:for-each select="layouts" ><xsl:if test="position() = last()" ><xsl:value-of select="position()" /></xsl:if></xsl:for-each></xsl:variable>
//totalLayouts=<xsl:value-of select="$totalLayouts" />
<xsl:for-each select="layouts" >
    <xsl:variable name="name2" ><xsl:value-of select="translate(name, '_', ' ')" /></xsl:variable>
    <!--
    <xsl:variable name="name3" ><xsl:if test="position() != 2 and $totalLayouts != 1" >GDGameStart</xsl:if><xsl:if test="position() = 2 or $totalLayouts = 1" >GDGame</xsl:if><xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>Canvas</xsl:variable>
    -->
    <xsl:variable name="name3" >GDGame<xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>Canvas</xsl:variable>
    <xsl:variable name="name" ><xsl:value-of select="translate($name3, ' ', '')" /></xsl:variable>
    import org.allbinary.game.canvas.<xsl:value-of select="$name" />
    import org.allbinary.game.midlet.<xsl:value-of select="$name" />Runnable
</xsl:for-each>
import org.allbinary.canvas.RunnableCanvas
import org.allbinary.game.canvas.GDGameInputMappingHelpPaintable
import org.allbinary.game.canvas.GDGameSoftwareInfo
import org.allbinary.game.commands.GameCommandsFactory
import org.allbinary.game.layer.GDGameLayerManager
import org.allbinary.media.audio.GDGameSoundsFactory

import org.allbinary.string.CommonStrings

import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.communication.log.PreLogUtil
import org.allbinary.canvas.GameGlobalsFactory
import org.allbinary.game.GameInfo
import org.allbinary.game.GameMode
import org.allbinary.game.GameTypeFactory
import org.allbinary.game.midlet.LicenseCheckRunnableFactory
import org.allbinary.game.midlet.LicensedDemoSetupFactory
import org.allbinary.game.PlayerTypesFactory
import org.allbinary.game.score.HighScoresCanvasNoInputProcessorFactory
import org.allbinary.game.displayable.canvas.GameCanvasRunnableInterface
import org.allbinary.game.identification.GroupFactory
import org.allbinary.game.layer.AllBinaryGameLayerManager
import org.allbinary.game.layer.identification.GroupLayerManagerListener
//import org.allbinary.game.midlet.DemoGameMidletEvent
//import org.allbinary.game.midlet.DemoGameMidletEventHandler
//import org.allbinary.game.midlet.DemoGameMidletStateFactory
import org.allbinary.game.midlet.LicenseLevelUtil
import org.allbinary.game.midlet.LicenseLoadingTypeFactory
import org.allbinary.game.midlet.SpecialDemoGameMidlet
import org.allbinary.game.paint.help.HelpPaintable
import org.allbinary.game.score.BasicHighScoresFactory
import org.allbinary.game.score.NoHighScoresFactory
import org.allbinary.game.score.HighScoresPaintable
import org.allbinary.game.score.displayable.HighScoresCanvas
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
import org.allbinary.graphics.color.BasicColor
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.system.security.licensing.ClientInformationFactory
import org.allbinary.media.audio.AllBinaryMediaManagerShutdown
import org.allbinary.media.audio.EarlySoundsFactory
import org.allbinary.midlet.MidletStrings
import org.allbinary.thread.PrimaryThreadPool
import org.allbinary.time.GameTickTimeDelayHelper
import org.allbinary.time.GameTickTimeDelayHelperFactory
import org.allbinary.util.ABHashtable

/**
 * @author user
 */
open class GDGameMIDlet : SpecialDemoGameMidlet
   //DemoGameMidlet
{
   private val gameTickTimeDelayHelper: GameTickTimeDelayHelper = GameTickTimeDelayHelperFactory.getInstance()
   private val gameGlobalsFactory: GameGlobalsFactory = GameGlobalsFactory.getInstance()

   constructor(clientInformationFactory: ClientInformationFactory) : super(clientInformationFactory, LicenseLoadingTypeFactory.getIntance().OTHER, LicensedDemoSetupFactory(), LicenseCheckRunnableFactory())
   {
       //this.setSaveGameForm(SaveGameForm.getInstance(this, "Save Game"))

       //com.sun.lwuit.Display.init(this)

       //objectsGroups count=<xsl:value-of select="count(//objectsGroups)" /> + //object count=<xsl:value-of select="count(//objects)" /> + 1
       val SIZE: Short = <xsl:value-of select="count(//objectsGroups) + count(//objects) + 1" />
       val groupNames: Array&lt;String&gt; = arrayOfNulls&lt;String&gt;(SIZE)
       val GROUP_: String = "Group "
       val stringBuilder: StringMaker = StringMaker()
       for(index in 0 until SIZE) {
           stringBuilder.delete(0, stringBuilder.length())
           groupNames[index] = stringBuilder.append(GROUP_).appendint(index).toString()
   }
       GroupFactory.getInstance().init(SIZE, groupNames)
       GroupLayerManagerListener.getInstance().init(SIZE)

   }

   protected override fun getHelpPaintable(): HelpPaintable

   {
       //return GDGameHelpPaintable.getInstance()
       return GDGameInputMappingHelpPaintable.getInstance()
   }

<xsl:for-each select="layouts" >
    <xsl:variable name="name2" ><xsl:value-of select="translate(name, '_', ' ')" /></xsl:variable>
    <!--
    <xsl:variable name="name3" ><xsl:if test="position() != 2 and $totalLayouts != 1" >GDGameStart</xsl:if><xsl:if test="position() = 2 or $totalLayouts = 1" >GDGame</xsl:if><xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>Canvas</xsl:variable>
    -->
    <xsl:variable name="name3" >GDGame<xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>Canvas</xsl:variable>
    <xsl:variable name="name" ><xsl:value-of select="translate($name3, ' ', '')" /></xsl:variable>
    <!--
    <xsl:if test="position() = 1 and $totalLayouts > 1" >
   fun createDemoGameCanvasRunnableInterface(): GameCanvasRunnableInterface
   {
       return <xsl:value-of select="$name" />(this.abeClientInformation, this)
      //return GDGameStartCanvas(this.abeClientInformation, this)
   }
    </xsl:if>
    -->
    <!--
    <xsl:if test="position() = 2 or $totalLayouts = 1" >
   fun createGameCanvasRunnable(allBinaryGameLayerManager: AllBinaryGameLayerManager): GameCanvasRunnableInterface
   {
       return <xsl:value-of select="$name" />(this.abeClientInformation, this, allBinaryGameLayerManager)
       //return GDGameGameCanvas(this.abeClientInformation, this, allBinaryGameLayerManager)
   }
    </xsl:if>
    <xsl:if test="position() != 1 and position() != 2" >
   fun create<xsl:value-of select="$name" />RunnableInterface(): GameCanvasRunnableInterface
   {
       return <xsl:value-of select="$name" />(this.abeClientInformation, this)
      //return GDGameStartCanvas(this.abeClientInformation, this)
   }

    @Synchronized fun set<xsl:value-of select="$name" />RunnableInterface()
    {
        logUtil.putF(commonStrings.START, this, "set<xsl:value-of select="$name" />")

        ////TWB - Loading Feature Change - Can remove remark after testing
        ProgressCanvasFactory.getInstance().start()

        PrimaryThreadPool.getInstance().runTask(<xsl:value-of select="$name" />Runnable(this))
        //this.postDemoSetup()
    }
    </xsl:if>
    -->

    <xsl:if test="position() = 1" >
   override fun createDemoGameCanvasRunnableInterface(): GameCanvasRunnableInterface
   {
       return this.create<xsl:value-of select="$name" />RunnableInterface()
   }
    </xsl:if>

    <xsl:if test="position() = 2 or $totalLayouts = 1" >
   override fun createGameCanvasRunnable(allBinaryGameLayerManager: AllBinaryGameLayerManager): GameCanvasRunnableInterface
   {
       return this.create<xsl:value-of select="$name" />RunnableInterface(allBinaryGameLayerManager)
   }
    </xsl:if>

   fun create<xsl:value-of select="$name" />RunnableInterface(): GameCanvasRunnableInterface
   {
       return <xsl:value-of select="$name" />(this.abeClientInformation, this, this.createGameLayerManager())
       //return GDGameGameCanvas(this.abeClientInformation, this, this.createGameLayerManager())
   }

   fun create<xsl:value-of select="$name" />RunnableInterface(allBinaryGameLayerManager: AllBinaryGameLayerManager): GameCanvasRunnableInterface
   {
       return <xsl:value-of select="$name" />(this.abeClientInformation, this, allBinaryGameLayerManager)
       //return GDGameGameCanvas(this.abeClientInformation, this, allBinaryGameLayerManager)
   }

    @Synchronized fun set<xsl:value-of select="$name" />RunnableInterface()
    {
        logUtil.putF(commonStrings.START, this, "set<xsl:value-of select="$name" />")

        ////TWB - Loading Feature Change - Can remove remark after testing
        ProgressCanvasFactory.getInstance().start()

        val hashtable: ABHashtable = this.getStartStateHashtable()
        this.setStartStateHashtable(null)

        PrimaryThreadPool.getInstance().runTask(<xsl:value-of select="$name" />Runnable(this, hashtable))
        //this.postDemoSetup()
    }

</xsl:for-each>

   protected override fun createHighScoresCanvas(): HighScoresCanvas
   {
       val layerManager: AllBinaryGameLayerManager = this.createGameLayerManager()
       return HighScoresCanvas(this,
           layerManager,
           layerManager.getGameInfo(),
               HighScoresPaintable(),
               //BasicHighScoresFactory(GDGameSoftwareInfo.getInstance())
               NoHighScoresFactory.getInstance(),
               HighScoresCanvasNoInputProcessorFactory()
              )
   }

   override fun getHighestLevel(): Int
   {
       PreLogUtil.put("******************Demo Level Limited To: 6", this, "getMaxLevel")
       return LicenseLevelUtil.getInstance().getMaxLevel(GDGameLayerManager.MAX_LEVEL, 6)
   }

   protected override fun createGameLayerManager(): AllBinaryGameLayerManager
   {
       val gameInfo: GameInfo = GameInfo(
               GameTypeFactory.getInstance().SINGLE_PLAYER, GameMode.SERVER,
               PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE,
               this.getHighestLevel(), <xsl:if test="//variables[name/text() = 'level']" >org.allbinary.game.canvas.GDGameGlobals.getInstance().level</xsl:if><xsl:if test="not(//variables[name/text() = 'level'])" >1</xsl:if>)

       val basicColorFactory: BasicColorFactory = BasicColorFactory.getInstance()
       val backgroundBasicColor: BasicColor = basicColorFactory.BLACK
       val foregroundBasicColor: BasicColor = basicColorFactory.WHITE
       return GDGameLayerManager(backgroundBasicColor, foregroundBasicColor, gameInfo)
   }

   /*
   protected fun mediaInit()
   {
   }
   */

   protected override fun mediaShutdown()
   {
        //PrelogUtil.putF(commonStrings.START, this, "mediaShutdown - postStopGameCanvasRunnableInterface")

        logUtil.putF(commonStrings.START, this,
                "mediaShutdown - postStopGameCanvasRunnableInterface")

        AllBinaryMediaManagerShutdown.shutdown(EarlySoundsFactory.getInstance())
        AllBinaryMediaManagerShutdown.shutdown(GDGameSoundsFactory.getInstance())

        logUtil.putF(commonStrings.END, this,
                "mediaShutdown - postStopGameCanvasRunnableInterface")
   }

//    public synchronized void setDemo() throws Exception
//    {
        <!--
        <xsl:if test="$totalLayouts > 1" >
        logUtil.putF(commonStrings.START, this, "setDemo")

        ProgressCanvasFactory.getInstance().start()

        PrimaryThreadPool.getInstance().runTask(StartRunnable(this))
        //this.postDemoSetup()
        </xsl:if>
        <xsl:if test="$totalLayouts = 1" >
        -->
//        final DemoGameMidletEvent startDemoGameMidletEvent =
//            DemoGameMidletEvent(this, DemoGameMidletStateFactory.getInstance().START_DEMO)
//        DemoGameMidletEventHandler.getInstance().fireEvent(startDemoGameMidletEvent)

//        this.createGame()
        <!--
        </xsl:if>
        -->
//    }

    protected override fun setDisplay(newDisplay: Displayable)
    {
        gameGlobalsFactory.newDisplaybleTime = System.currentTimeMillis()
        //logUtil.putF("newDisplaybleTime: " + gameGlobalsFactory.newDisplaybleTime, this, "setDisplay")
        super.setDisplay(newDisplay)
    }

    //private final String NEW_CANVAS = commonStrings.START + "newCanvas"
    override fun startGameCanvasRunnableInterface() {

        //logUtil.putF(NEW_CANVAS, this, "startGameCanvasRunnableInterface")

        gameGlobalsFactory.newCanvas = true
        super.startGameCanvasRunnableInterface()
    }

    override
    @Synchronized fun commandAction(command: Command, displayable2: Displayable) {

        try {

            //PreLogUtil.put(command.getLabel(), this, "commandAction")

            val gdGameCommandFactory: GDGameCommandFactory = GDGameCommandFactory.getInstance()

            val displayable: Displayable = this.getCurrentDisplayable()
            if(displayable is RunnableCanvas) {
                (displayable as RunnableCanvas).end2()
            }

       <xsl:for-each select="layouts" >
           <xsl:variable name="name2" ><xsl:value-of select="translate(name, '_', ' ')" /></xsl:variable>
           <!--
           <xsl:variable name="name3" ><xsl:if test="position() != 2 and $totalLayouts != 1" >GDGameStart</xsl:if><xsl:if test="position() = 2 or $totalLayouts = 1" >GDGame</xsl:if><xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>Canvas</xsl:variable>
           -->
           <xsl:variable name="name3" >GDGame<xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="$name2" /></xsl:with-param></xsl:call-template>Canvas</xsl:variable>
           <xsl:variable name="name" ><xsl:value-of select="translate($name3, ' ', '')" /></xsl:variable>
           <xsl:if test="position() != 1" >} else </xsl:if>if(command.equals(gdGameCommandFactory.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template>_GD_LAYOUT)) {

                if (this.gameStartTimeHelper.isTimeTNT())
                {
                    <!--
                    <xsl:if test="position() = 1 and $totalLayouts > 1" >this.setDemo();</xsl:if>
                    <xsl:if test="position() = 2 or $totalLayouts = 1" >this.createGame();</xsl:if>
                    <xsl:if test="position() != 1 and position() != 2" >this.set<xsl:value-of select="$name" />RunnableInterface();</xsl:if>
                    -->
                    this.set<xsl:value-of select="$name" />RunnableInterface()

                }
                else
                {
                    logUtil.putF("Starting Game Too Often", this, MidletStrings.getInstance().COMMAND_ACTION)
                }

       </xsl:for-each>
            } else {
                super.commandAction(command, displayable2)
            }

        }
        catch(e: Exception)
        {
            logUtil.put(commonStrings.EXCEPTION, this, MidletStrings.getInstance().COMMAND_ACTION, e)
            if (command != GameCommandsFactory.getInstance().EXIT_COMMAND)
            {
                this.exitProgress(false)
            }
        }
    }
}
    </xsl:template>

</xsl:stylesheet>
