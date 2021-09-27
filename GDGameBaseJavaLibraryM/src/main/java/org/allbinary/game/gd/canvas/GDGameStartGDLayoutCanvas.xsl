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
package org.allbinary.game.gd.canvas;

import javax.microedition.lcdui.CommandListener;

import org.allbinary.game.gd.init.GDGameStaticInitializerFactory;

import org.allbinary.game.configuration.GameSpeed;
import org.allbinary.game.displayable.canvas.StartCanvas;
import org.allbinary.game.identification.GroupFactory;
import org.allbinary.game.paint.ColorFillPaintableFactory;
import org.allbinary.game.score.BasicHighScoresFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.form.FormPaintable;
import org.allbinary.graphics.paint.NullInitUpdatePaintable;
import org.allbinary.graphics.paint.NullPaintable;
import org.allbinary.logic.basic.string.StringUtil;
        
        <xsl:for-each select="layouts" >
            <xsl:variable name="index" select="position() - 1" />
            <xsl:if test="number($index) = <GD_CURRENT_INDEX>" >
                
public class <GDLayout> extends StartCanvas
{
    private final String GD_LAYOUT_COLOR = "GDLayout<GD_CURRENT_INDEX>Color";

    private final int WAIT = ((GameSpeed.getInstance().getDelay() * 3) <xsl:text disable-output-escaping="yes" >&gt;&gt;</xsl:text> 1);

    public <GDLayout>(final CommandListener commandListener) throws Exception
    {
        super(commandListener, new BasicHighScoresFactory(GDGameSoftwareInfo.getInstance()),
                NullPaintable.getInstance(), NullInitUpdatePaintable.getInstance(),
                new GDGameStaticInitializerFactory(), false);

        this.setWait(WAIT);
    }

    public void initPostPaint() throws Exception
    {
        //LogUtil.put(LogFactory.getInstance("initPostPaint", this, "initPostPaint"));

        //this.setBasicGameDemoPaintable(
                //new GDGameMenuPaintable(new FormPaintable(this.getMenuForm()))
                //);

        this.setSpecialAnimationInterface(
                GD<GD_CURRENT_INDEX>SpecialAnimation.getInstance()
                );

        this.setDefaultPaintableInterface(
                //ColorFillPaintableFactory.getInstance(BasicColorFactory.getInstance().RED)
                ColorFillPaintableFactory.getInstance(new BasicColor(255, 
                    <xsl:for-each select="events" >
                        <xsl:for-each select="actions" >
                            <xsl:variable name="typeValue" select="type/value" />
                            <xsl:if test="$typeValue = 'SceneBackground'" >
                            <xsl:for-each select="parameters" ><xsl:value-of select="translate(translate(text(), '\&quot;', ''), ';', ',')" /></xsl:for-each>,
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:for-each>
                    GD_LAYOUT_COLOR))
                );
        this.setPaintableInterface(this.getDefaultPaintableInterface());
    }

    public void open()
    {
        super.open();
        GD<GD_CURRENT_INDEX>SpecialAnimation.getInstance().open();
    }

    public void close()
    {
        super.close();
        GD<GD_CURRENT_INDEX>SpecialAnimation.getInstance().close();
    }

//    protected int getNextRandom()
//    {
//    	PreLogUtil.put("******************Demo Next Random Is Always 1", this, "getNextRandom");
//        // return MyRandom.getAbsoluteNextInt(Integer.MAX_VALUE / 10) + 1;
//        return 1;
//    }
//
//    protected AllBinaryGameLayerManager createGameLayerManager(int randomValue) throws Exception
//    {
//        GameInfo gameInfo = new GameInfo(GameTypeFactory.getInstance().BOT, GameMode.SERVER, PlayerTypesFactory
//                .getInstance().PLAYER_TYPE_ONE, GDGameLayerManager.MAX_LEVEL, randomValue);
//
//        return new GDGameLayerManager(gameInfo);
//    }
//
//    public GameCanvasRunnableInterface createRunnable(int randomValue) throws Exception
//    {
//        return new GDGameGameCanvas(this.createGameLayerManager(this.getNextRandom()));
//    }

}
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

</xsl:stylesheet>
