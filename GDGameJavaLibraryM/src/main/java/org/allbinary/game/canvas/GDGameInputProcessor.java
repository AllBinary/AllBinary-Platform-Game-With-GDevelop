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

import org.allbinary.animation.Animation;
import org.allbinary.animation.special.SpecialAnimation;
import org.allbinary.game.input.GameInputStrings;
import org.allbinary.game.input.PlayerGameInput;
import org.allbinary.game.input.PlayerInput;
import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.layer.AllBinaryLayerManager;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDGameInputProcessor {

    private final GameInputStrings gameInputStrings = GameInputStrings.getInstance();
    
    //protected final boolean isSingleKeyProcessing = 
        //InputFeatureFactory.getInstance().isSingleKeyProcessing();
    
    private final BasicArrayList gameKeyEventList = new BasicArrayList();
    private final BasicArrayList removalGameKeyEventList = new BasicArrayList();
    private final BasicArrayList keyEventList = new BasicArrayList();
    private final BasicArrayList removalKeyEventList = new BasicArrayList();
    private final PlayerGameInput playerGameInput = new PlayerInput(keyEventList, removalKeyEventList, gameKeyEventList, removalGameKeyEventList, 0);

    public void process(final AllBinaryLayerManager allbinaryLayerManager, final Animation specialAnimation) throws Exception {

        if(specialAnimation == SpecialAnimation.getInstance()) {
            //LogUtil.put(LogFactory.getInstance("Animation is SpecialAnimation", this, gameInputStrings.PROCESS_INPUT));
            return;
        }
        
//        if(allbinaryLayerManager == null) {
//            LogUtil.put(LogFactory.getInstance("TWB allbinaryLayerManager is null", this, gameInputStrings.PROCESS_INPUT));
//            return;
//        }
//
//        if(specialAnimation == null) {
//            LogUtil.put(LogFactory.getInstance("TWB specialAnimation is null", this, gameInputStrings.PROCESS_INPUT));
//            return;
//        }
        
        final GDSceneGlobals globals = ((GDSpecialAnimation) specialAnimation).getGlobals();

//        if(globals == null) {
//            LogUtil.put(LogFactory.getInstance("TWB globals is null", this, gameInputStrings.PROCESS_INPUT));
//            return;
//        }
        
        GameKeyEvent gameKeyEvent;
        
        final int size = gameKeyEventList.size();
        //LogUtil.put(LogFactory.getInstance("size: " + size, this, gameInputStrings.PROCESS_INPUT));
        for(int index = 0; index < size; index++) {
            gameKeyEvent = (GameKeyEvent) gameKeyEventList.get(index);
            //LogUtil.put(LogFactory.getInstance("press key: " + gameKeyEvent.getKey(), this, gameInputStrings.PROCESS_INPUT));
            globals.inputProcessorArray[gameKeyEvent.getKey()].process(allbinaryLayerManager, gameKeyEvent);
        }

        final int size2 = removalGameKeyEventList.size();
        //LogUtil.put(LogFactory.getInstance("size: " + size, this, gameInputStrings.PROCESS_INPUT));
        for(int index = 0; index < size2; index++) {
            gameKeyEvent = (GameKeyEvent) removalGameKeyEventList.get(index);
            //LogUtil.put(LogFactory.getInstance("release key: " + gameKeyEvent.getKey(), this, gameInputStrings.PROCESS_INPUT));
            globals.inputProcessorArray[gameKeyEvent.getKey()].processReleased(allbinaryLayerManager, gameKeyEvent);
        }

        Integer keyAsInteger;
        final int size3 = keyEventList.size();
        //LogUtil.put(LogFactory.getInstance("size: " + size, this, gameInputStrings.PROCESS_INPUT));
        for(int index = 0; index < size3; index++) {
            keyAsInteger = (Integer) keyEventList.get(index);
            //LogUtil.put(LogFactory.getInstance("press key: " + gameKeyEvent.getKey(), this, gameInputStrings.PROCESS_INPUT));
            globals.unmappedInputProcessorArray[keyAsInteger.intValue()].process(allbinaryLayerManager, keyAsInteger);
        }

        final int size4 = removalKeyEventList.size();
        //LogUtil.put(LogFactory.getInstance("size: " + size, this, gameInputStrings.PROCESS_INPUT));
        for(int index = 0; index < size4; index++) {
            keyAsInteger = (Integer) removalKeyEventList.get(index);
            //LogUtil.put(LogFactory.getInstance("release key: " + gameKeyEvent.getKey(), this, gameInputStrings.PROCESS_INPUT));
            globals.unmappedInputProcessorArray[keyAsInteger.intValue()].processReleased(allbinaryLayerManager, keyAsInteger);
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
            //LogUtil.put(LogFactory.getInstance("size: " + size, this, gameInputStrings.PROCESS_INPUT));

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
            final CommonStrings commonStrings = CommonStrings.getInstance();
            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION, this, gameInputStrings.PROCESS_INPUT));
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
