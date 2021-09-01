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
import org.allbinary.game.paint.ColorFillPaintableFactory;
import org.allbinary.game.score.BasicHighScoresFactory;
import org.allbinary.graphics.color.BasicColor;
import org.allbinary.graphics.form.FormPaintable;
import org.allbinary.graphics.paint.NullInitUpdatePaintable;
import org.allbinary.graphics.paint.NullPaintable;

public class GDGameStartMenuCanvas extends StartCanvas
{
    private final String GD_LAYOUT_COLOR = "GDLayoutColor";

    private final int WAIT = ((GameSpeed.getInstance().getDelay() * 3) >> 1);

    public GDGameStartMenuCanvas(final CommandListener commandListener) throws Exception
    {
        super(commandListener, new BasicHighScoresFactory(GDGameSoftwareInfo.getInstance()),
                NullPaintable.getInstance(), NullInitUpdatePaintable.getInstance(),
                new GDGameStaticInitializerFactory(), false);

        this.setWait(WAIT);
    }

    public void initPostPaint() throws Exception
    {
        this.setBasicGameDemoPaintable(
                new GDGameMenuPaintable(new FormPaintable(this.getMenuForm()))
                );

        this.setSpecialAnimationInterface(
                GD0SpecialAnimation.getInstance()
                );

        this.setDefaultPaintableInterface(
                //ColorFillPaintableFactory.getInstance(BasicColorFactory.getInstance().RED)
                ColorFillPaintableFactory.getInstance(new BasicColor(255, 209, 209, 209, GD_LAYOUT_COLOR))
                );
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
