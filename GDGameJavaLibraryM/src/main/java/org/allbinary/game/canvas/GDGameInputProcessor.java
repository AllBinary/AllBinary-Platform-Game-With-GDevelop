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
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class GDGameInputProcessor {
    protected final LogUtil logUtil = LogUtil.getInstance();


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
            //logUtil.put("Animation is SpecialAnimation", this, gameInputStrings.PROCESS_INPUT);
            return;
        }
        
//        if(allbinaryLayerManager == null) {
//            logUtil.put("allbinaryLayerManager is null", this, gameInputStrings.PROCESS_INPUT);
//            return;
//        }
//
//        if(specialAnimation == null) {
//            logUtil.put("specialAnimation is null", this, gameInputStrings.PROCESS_INPUT);
//            return;
//        }
        
        final GDSceneGlobals globals = ((GDSpecialAnimation) specialAnimation).getGlobals();

//        if(globals == null) {
//            logUtil.put("globals is null", this, gameInputStrings.PROCESS_INPUT);
//            return;
//        }
        
        GameKeyEvent gameKeyEvent;
        
        final int size = gameKeyEventList.size();
        //logUtil.put("size: " + size, this, gameInputStrings.PROCESS_INPUT);
        for(int index = 0; index < size; index++) {
            gameKeyEvent = (GameKeyEvent) gameKeyEventList.get(index);
            //logUtil.put("press key: " + gameKeyEvent.getKey(), this, gameInputStrings.PROCESS_INPUT);
            globals.inputProcessorArray[gameKeyEvent.getKey()].process(allbinaryLayerManager, gameKeyEvent);
        }

        final int size2 = removalGameKeyEventList.size();
        //logUtil.put("size: " + size, this, gameInputStrings.PROCESS_INPUT);
        for(int index = 0; index < size2; index++) {
            gameKeyEvent = (GameKeyEvent) removalGameKeyEventList.get(index);
            //logUtil.put("release key: " + gameKeyEvent.getKey(), this, gameInputStrings.PROCESS_INPUT);
            globals.inputProcessorArray[gameKeyEvent.getKey()].processReleased(allbinaryLayerManager, gameKeyEvent);
        }

        Integer keyAsInteger;
        final int size3 = keyEventList.size();
        //logUtil.put("size: " + size, this, gameInputStrings.PROCESS_INPUT);
        for(int index = 0; index < size3; index++) {
            keyAsInteger = (Integer) keyEventList.get(index);
            //logUtil.put("press key: " + gameKeyEvent.getKey(), this, gameInputStrings.PROCESS_INPUT);
            globals.unmappedInputProcessorArray[keyAsInteger.intValue()].process(allbinaryLayerManager, keyAsInteger);
        }

        final int size4 = removalKeyEventList.size();
        //logUtil.put("size: " + size, this, gameInputStrings.PROCESS_INPUT);
        for(int index = 0; index < size4; index++) {
            keyAsInteger = (Integer) removalKeyEventList.get(index);
            //logUtil.put("release key: " + gameKeyEvent.getKey(), this, gameInputStrings.PROCESS_INPUT);
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
            //logUtil.put("size: " + size, this, gameInputStrings.PROCESS_INPUT);

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
            logUtil.put(commonStrings.EXCEPTION, this, gameInputStrings.PROCESS_INPUT);
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
