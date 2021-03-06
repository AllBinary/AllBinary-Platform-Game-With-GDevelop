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

import org.allbinary.game.canvas.GDGameGameCanvas;
import org.allbinary.game.canvas.GDGameInputMappingHelpPaintable;
import org.allbinary.game.canvas.GDGameSoftwareInfo;
import org.allbinary.game.canvas.GDGameStartCanvas;
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
import org.allbinary.media.audio.AllBinaryMediaManagerShutdown;
import org.allbinary.media.audio.EarlySoundsFactoryFactory;

/**
 * @author user
 */
public class GDGameMIDlet extends
   SpecialDemoGameMidlet
   //DemoGameMidlet
{
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
   
   public GameCanvasRunnableInterface createDemoGameCanvasRunnableInterface() throws Exception
   {
      return new GDGameStartCanvas(this);
   }

   protected GameCanvasRunnableInterface createGameCanvasRunnableInterface(
		   AllBinaryGameLayerManager allBinaryGameLayerManager) throws Exception
   {
	   return new GDGameGameCanvas(this, allBinaryGameLayerManager);
   }
   
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
       GameInfo gameInfo = new GameInfo(
               GameTypeFactory.getInstance().SINGLE_PLAYER, GameMode.SERVER,
               PlayerTypesFactory.getInstance().PLAYER_TYPE_ONE,
               this.getHighestLevel(), 1);

       return new GDGameLayerManager(null, null, gameInfo);
   }

   /*
   protected void mediaInit() throws Exception
   {
   }
   */

   protected void mediaShutdown() throws Exception
   {
        //PreLogUtil.put(CommonStrings.getInstance().START, this, "mediaShutdown - postStopGameCanvasRunnableInterface");

        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this,
                "mediaShutdown - postStopGameCanvasRunnableInterface"));

        AllBinaryMediaManagerShutdown.shutdown(
           EarlySoundsFactoryFactory.getInstance());
        AllBinaryMediaManagerShutdown.shutdown(
           GDGameSoundsFactoryFactory.getInstance());

        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().END, this,
                "mediaShutdown - postStopGameCanvasRunnableInterface"));
   }
}