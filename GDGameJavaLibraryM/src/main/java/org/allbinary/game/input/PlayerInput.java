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
package org.allbinary.game.input;

import org.allbinary.game.input.event.DownKeyEventListenerInterface;
import org.allbinary.game.input.event.UpKeyEventListenerInterface;
import org.allbinary.string.CommonLabels;
import org.allbinary.string.CommonStrings;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.communication.log.PreLogUtil;
import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
public class PlayerInput extends PlayerGameInput 
        implements DownKeyEventListenerInterface, 
        UpKeyEventListenerInterface {
    protected final LogUtil logUtil = LogUtil.getInstance();


    private final BasicArrayList keyEventList;
    private final BasicArrayList removalKeyEventList;

    public PlayerInput(final BasicArrayList keyEventList, final BasicArrayList removalKeyEventList,
            final BasicArrayList gameKeyEventList, final BasicArrayList removalGameKeyEventList, final int playerInputId) {

        super(gameKeyEventList, removalGameKeyEventList, playerInputId);

        this.keyEventList = keyEventList;
        this.removalKeyEventList = removalKeyEventList;
    }

    @Override
    public synchronized void onDownKeyEvent(final Integer keyInteger) {
        //PreLogUtil.put(new StringMaker().append(CommonLabels.getInstance().START_LABEL).append(keyInteger.toString()).toString(), this, "onDownKeyEvent");
        if(keyInteger.intValue() > 0) {
            this.addKey(keyInteger);
        } else {
            //PreLogUtil.put(new StringMaker().append("Ignoring: ").append(keyInteger.toString()).toString(), this, "onDownKeyEvent");
        }
    }

    @Override
    public synchronized void onUpKeyEvent(final Integer keyInteger) {
        //PreLogUtil.put(new StringMaker().append(CommonLabels.getInstance().START_LABEL).append(keyInteger.toString()).toString(), this, "onUpKeyEvent");
        if(keyInteger.intValue() > 0) {
            this.addKeyForRemoval(keyInteger);
        } else {
            //PreLogUtil.put(new StringMaker().append("Ignoring: ").append(keyInteger.toString()).toString(), this, "onUpKeyEvent");
        }
    }

    public synchronized void addKey(Integer keyInteger) {

        //TODO TWB - fix all null and duplicate issue for better performance
        if (this.isRemoveDuplicateKeyPresses && this.keyEventList.contains(keyInteger)) {
            //logUtil.put("Danger Danger Danger: Duplicate GameKeyEvent", this, commonStrings.ADD);
            return;
        }

        if (keyInteger != null) {
            this.keyEventList.add(keyInteger);
        } else {
            logUtil.put("Danger Passed Null KeyEvent", this, commonStrings.ADD);
        }
    }

    public synchronized void addKeyForRemoval(Integer keyInteger) {
        this.removalKeyEventList.add(keyInteger);
    }

    public synchronized boolean isKeyForRemoval(Integer keyInteger) {
        return this.removalKeyEventList.contains(keyInteger);
    }

    public synchronized void clear() {
        super.clear();
        
        this.keyEventList.clear();
    }

    public synchronized void removeNonAIInputGameKeyEvents() {
        super.removeNonAIInputGameKeyEvents();

        final BasicArrayList list = this.keyEventList;

        //System.out.println("List Size Before: " + list.size());
        //Integer keyInteger;
        for (int index = list.size(); --index >= 0;) {
            //keyInteger = (Integer) list.objectArray[index];
            list.remove(index);
        }
        //System.out.println("List Size After: " + list.size());
    }

    public synchronized void update() {
        super.update();

        BasicArrayList removeList = this.removalKeyEventList;
        BasicArrayList list = this.keyEventList;
        int size = removeList.size();
        for (int index = 0; index < size; index++) {
            Object object = removeList.objectArray[index];
            for (int index2 = list.size(); --index2 >= 0;) {
                if (list.objectArray[index2] == object) {
                    //logUtil.put("TWB keyup2: " + object, this, commonStrings.PROCESS);
                    list.remove(index2);
                }
            }
        }

        //GameKeyEvent GAMEKEYEVENT_NONE = GameKeyEventFactory.getInstance(this, gameKeyFactory.NONE);
        //this.gameKeyEventList.remove();
        removeList.clear();
    }

}
