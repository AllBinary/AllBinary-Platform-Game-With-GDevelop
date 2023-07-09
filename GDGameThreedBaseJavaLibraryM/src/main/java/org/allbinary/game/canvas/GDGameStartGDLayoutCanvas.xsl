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
package org.allbinary.game.canvas;

import javax.microedition.lcdui.CommandListener;

import org.allbinary.animation.special.SpecialAnimation;
        
import org.allbinary.game.init.GDGameStaticInitializerFactory;
import org.allbinary.game.configuration.GameSpeed;
import org.allbinary.game.configuration.feature.Features;
import org.allbinary.game.configuration.feature.GameFeatureFactory;
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
    private final String GD_LAYOUT_COLOR = "GDLayout<xsl:value-of select="position()" />Color";

    private final int WAIT = ((GameSpeed.getInstance().getDelay() * 3) <xsl:text disable-output-escaping="yes" >&gt;&gt;</xsl:text> 1);

    private final GDGameInputProcessor gameInputProcessor = new GDGameInputProcessor();

    public <GDLayout>(final CommandListener commandListener) throws Exception
    {
        super(commandListener, new BasicHighScoresFactory(GDGameSoftwareInfo.getInstance()),
                NullPaintable.getInstance(), NullInitUpdatePaintable.getInstance(),
                new GDGameStaticInitializerFactory(), false);

        this.setWait(WAIT);

        GD<GD_CURRENT_INDEX>SpecialAnimation.getInstance(this, null);
            
        //force2dCollision = <xsl:value-of select="../properties/force2dCollision" />
        <xsl:if test="../properties/force2dCollision/text() = 'true'" >
        Features.getInstance().addDefault(GameFeatureFactory.getInstance().COLLISIONS_FORCED_TWO_DIMENSIONAL);
        </xsl:if>
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
                    <xsl:variable name="color" >
                        <xsl:for-each select="events" >
                            <xsl:for-each select="actions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SceneBackground'" >
                                    //SceneBackground - moved to actions
                                    <xsl:for-each select="parameters" >
                                        <xsl:value-of select="translate(translate(text(), '\&quot;', ''), ';', ',')" />
                                    </xsl:for-each>,
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
                        <xsl:value-of select="r" />, <xsl:value-of select="v" />, <xsl:value-of select="b" />,
                        </xsl:if>
                        <xsl:if test="string-length(r) = 0" >
                        255, 255, 255, 
                        </xsl:if>
                    </xsl:if>
                    GD_LAYOUT_COLOR), true)
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

    public synchronized void unPause()
    {
        super.unPause();
        this.paintedSpecialAnimationInterface = GD<GD_CURRENT_INDEX>SpecialAnimation.getInstance();
    }
    
    //Hack for GD
    public void end2() {
        this.paintedSpecialAnimationInterface = SpecialAnimation.getInstance();
    }

    protected void processGame() throws Exception
    {
        this.gameInputProcessor.process(null, this.paintedSpecialAnimationInterface);
        super.processGame();
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
