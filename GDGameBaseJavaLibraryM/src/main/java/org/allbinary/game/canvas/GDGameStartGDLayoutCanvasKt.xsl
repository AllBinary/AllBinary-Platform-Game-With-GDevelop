<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
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
package org.allbinary.game.canvas

import javax.microedition.lcdui.CommandListener

import org.allbinary.animation.special.SpecialAnimation

import org.allbinary.game.init.GDGameStaticInitializerFactory
import org.allbinary.game.input.PlayerGameInput
import org.allbinary.game.input.event.DownKeyEventHandler
import org.allbinary.game.input.event.UpKeyEventHandler
import org.allbinary.game.configuration.GameSpeed
import org.allbinary.game.displayable.canvas.StartCanvas
import org.allbinary.game.identification.GroupFactory
import org.allbinary.game.paint.ColorFillPaintableFactory
import org.allbinary.game.score.BasicHighScoresFactory
import org.allbinary.game.score.NoHighScoresFactory
import org.allbinary.graphics.color.BasicColor
import org.allbinary.graphics.color.BasicColorFactory
import org.allbinary.graphics.form.FormPaintable
import org.allbinary.graphics.paint.NullInitUpdatePaintable
import org.allbinary.graphics.paint.NullPaintable
import org.allbinary.logic.string.StringUtil
import org.allbinary.logic.math.SmallIntegerSingletonFactory
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutName" select="name" />
            <xsl:variable name="index" select="position() - 1" />
            <xsl:if test="number($index) = <GD_CURRENT_INDEX>" >

open class <xsl:value-of select="$layoutName" /> : StartCanvas
{
    private val GD_LAYOUT_COLOR: String = "GDLayout<xsl:value-of select="position()" />Color"

    private val WAIT: Int = ((GameSpeed.getInstance().getDelay() * 3) <xsl:text disable-output-escaping="yes" >&gt;&gt;</xsl:text> 1)

    //protected final LogUtil logUtil = LogUtil.getInstance()
    private val gameInputProcessor: GDGameInputProcessor = GDGameInputProcessor()

    private val downKeyEventHandler: DownKeyEventHandler = DownKeyEventHandler.getInstance()
    private val upKeyEventHandler: UpKeyEventHandler = UpKeyEventHandler.getInstance()
    private val smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()

    constructor(abeClientInformation: AbeClientInformationInterface, commandListener: CommandListener) : super(abeClientInformation, commandListener, //BasicHighScoresFactory(abeClientInformation,, GDGameSoftwareInfo.getInstance()), NoHighScoresFactory.getInstance(), NullPaintable.getInstance(), NullInitUpdatePaintable.getInstance(), GDGameStaticInitializerFactory(), false)
    {

        this.setWait(WAIT)

        <!--
            <xsl:variable name="layoutTotal" ><xsl:for-each select="../layouts" ><xsl:if test="position() = last()" ><xsl:value-of select="position()" /></xsl:if></xsl:for-each></xsl:variable>
            //layoutTotal=<xsl:value-of select="$layoutTotal" />
            <xsl:if test="number($layoutTotal) = 1" >
        GroupFactory.getInstance().init(10.toShort(), StringUtil.getInstance().getArrayInstance())
            </xsl:if>
        -->

        GD<GD_CURRENT_INDEX>SpecialAnimation.getInstance(this, null)
    }

    fun initPostPaint()
    {
        //logUtil.put("initPostPaint", this, "initPostPaint")

        //this.setBasicGameDemoPaintable(
                //GDGameMenuPaintable(FormPaintable(this.getMenuForm()))
                //)

        this.setSpecialAnimationInterface(
                GD<xsl:value-of select="$index" />SpecialAnimation.getInstance()
                )

        this.setDefaultPaintableInterface(
                //ColorFillPaintableFactory.getInstance().getInstance(BasicColorFactory.getInstance().RED)
                ColorFillPaintableFactory.getInstance().getInstance(smallBasicColorCacheFactory.getAndOrCreate(
                                basicColorUtil.getARGB(255,
                    <xsl:variable name="color" >
                        <xsl:for-each select="events" >
                            <xsl:for-each select="actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SceneBackground'" >
                                    //SceneBackground - moved to actions
                                    <xsl:for-each select="parameters" >
                                        <xsl:value-of select="translate(translate(text(), '\&quot;', ''), ';', ',')" />
                                    </xsl:for-each>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:variable>
                    <xsl:if test="string-length($color) != 0" >
                        <xsl:value-of select="$color" />
                    </xsl:if>
                    <xsl:if test="string-length($color) = 0" >
                        <xsl:if test="string-length(r) > 0" >
                        //Using Layout Color before any - //SceneBackground Action
                        <xsl:value-of select="r" />, <xsl:value-of select="v" />, <xsl:value-of select="b" />
                        </xsl:if>
                        <xsl:if test="string-length(r) = 0" >
                        255, 255, 255
                        </xsl:if>
                    </xsl:if>), false)
                    //GD_LAYOUT_COLOR
                )
        this.setPaintableInterface(this.getDefaultPaintableInterface())
    }

    fun open()
    {
        super.open()
        GD<xsl:value-of select="$index" />SpecialAnimation.getInstance().open()
    }

    fun close()
    {
        super.close()
        GD<xsl:value-of select="$index" />SpecialAnimation.getInstance().close()
    }

    @Synchronized fun unPause()
    {
        super.unPause()
        this.paintedSpecialAnimationInterface = GD<xsl:value-of select="$index" />SpecialAnimation.getInstance()
    }

    //Hack for GD
    fun end2() {
        this.paintedSpecialAnimationInterface = SpecialAnimation.getInstance()
    }

    protected fun processGame()
    {
        this.gameInputProcessor.process(null, this.paintedSpecialAnimationInterface)
        super.processGame()
    }

    fun handleRawKey(keyCode: Int, deviceId: Int, repeated: Boolean) {
        val keyCodeAsInteger: Integer = smallIntegerSingletonFactory.getInstance(keyCode)
        this.upKeyEventHandler.fireEvent(keyCodeAsInteger)
        this.upKeyEventHandler.getInstance(deviceId).fireEvent(keyCodeAsInteger)
    }

    fun addKeyInputListener(playerGameInput: PlayerGameInput) {
        super.addKeyInputListener(playerGameInput)

        this.downKeyEventHandler.getInstanceForPlayer(playerGameInput.getPlayerInputId()).addListenerSingleThreaded(playerGameInput)
    }

    <xsl:if test="number($layoutIndex) != 1" >
    //Do not remove on build for this layout
    protected fun removeAllGameKeyInputListenersOnBuild() {
    }
    </xsl:if>

    fun removeKeyInputListener(playerGameInput: PlayerGameInput) {
        super.removeKeyInputListener(playerGameInput)

        this.downKeyEventHandler.removeListener(playerGameInput)
    }

//    protected int getNextRandom()
//    {
//        PreLogUtil.put("******************Demo Next Random Is Always 1", this, "getNextRandom")
//        // return MyRandom.getAbsoluteNextInt(Integer.MAX_VALUE / 10) + 1
//        return 1
//    }
//
//    protected AllBinaryGameLayerManager createGameLayerManager(int randomValue) throws Exception
//    {
//        GameInfo gameInfo = GameInfo(GameTypeFactory.getInstance().BOT, GameMode.SERVER, PlayerTypesFactory
//                .getInstance().PLAYER_TYPE_ONE, GDGameLayerManager.MAX_LEVEL, randomValue)
//
//        return GDGameLayerManager(gameInfo)
//    }
//
//    public GameCanvasRunnableInterface createRunnable(int randomValue) throws Exception
//    {
//        return GDGameGameCanvas(this.createGameLayerManager(this.getNextRandom()))
//    }

}
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
