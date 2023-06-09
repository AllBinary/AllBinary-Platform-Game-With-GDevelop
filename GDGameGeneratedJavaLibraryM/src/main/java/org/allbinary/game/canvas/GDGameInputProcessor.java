/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
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

import org.allbinary.game.configuration.feature.InputFeatureFactory;
import org.allbinary.game.input.PlayerGameInput;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.logic.basic.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDGameInputProcessor {

    //protected final boolean isSingleKeyProcessing = 
        //InputFeatureFactory.getInstance().isSingleKeyProcessing();
    
    private final BasicArrayList gameKeyEventList = new BasicArrayList();
    private final BasicArrayList removalGameKeyEventList = new BasicArrayList();
    private final PlayerGameInput playerGameInput = new PlayerGameInput(gameKeyEventList, removalGameKeyEventList, 0);

    public void process(final AllBinaryLayerManager allbinaryLayerManager) throws Exception {
        
        final GD1SpecialAnimationGlobals globals = GD1SpecialAnimationGlobals.getInstance();

        GameKeyEvent gameKeyEvent;
        
        final int size = gameKeyEventList.size();
        //LogUtil.put(LogFactory.getInstance("size: " + size, this, "processInput"));
        for(int index = 0; index < size; index++) {
            gameKeyEvent = (GameKeyEvent) gameKeyEventList.get(index);
            //LogUtil.put(LogFactory.getInstance("press key: " + gameKeyEvent.getKey(), this, "processInput"));
            globals.inputProcessorArray[gameKeyEvent.getKey()].process(allbinaryLayerManager, gameKeyEvent);
        }

        final int size2 = removalGameKeyEventList.size();
        //LogUtil.put(LogFactory.getInstance("size: " + size, this, "processInput"));
        for(int index = 0; index < size2; index++) {
            gameKeyEvent = (GameKeyEvent) removalGameKeyEventList.get(index);
            //LogUtil.put(LogFactory.getInstance("release key: " + gameKeyEvent.getKey(), this, "processInput"));
            globals.inputProcessorArray[gameKeyEvent.getKey()].processReleased(allbinaryLayerManager, gameKeyEvent);
        }
        
        this.processInput(allbinaryLayerManager);
    }
    
    public void processInput(AllBinaryLayerManager allbinaryLayerManager)
            throws Exception
    {
        try
        {
            this.playerGameInput.update();
            //this.playerGameInput.clear();
            //final int size = gameKeyEventList.size();
            //LogUtil.put(LogFactory.getInstance("size: " + size, this, "processInput"));

//            if (isSingleKeyProcessing)
//            {
//                this.playerGameInput.clear();
//            }
//            else
//            {
//                this.playerGameInput.update();
//            }

        }
        catch (Exception e)
        {
            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "processInput"));
        }
    }

    /**
     * @return the playerGameInput
     */
    public PlayerGameInput getPlayerGameInput() {
        return playerGameInput;
    }

    public BasicArrayList getGameKeyEventList()
    {
        return gameKeyEventList;
    }
    
}
