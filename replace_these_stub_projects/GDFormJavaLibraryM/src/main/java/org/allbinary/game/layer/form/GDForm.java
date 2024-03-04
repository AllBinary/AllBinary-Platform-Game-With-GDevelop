package org.allbinary.game.layer.form;

import org.allbinary.game.input.event.GameKeyEvent;
import org.allbinary.game.input.event.RawKeyEventListener;
import org.allbinary.game.layer.GDGameLayer;
import org.allbinary.logic.util.event.AllBinaryEventObject;

public class GDForm
    implements RawKeyEventListener //GameKeyEventListenerInterface 
{

    private static final GDForm instance = new GDForm();

    /**
     * @return the instance
     */
    public static GDForm getInstance() {
        return instance;
    }

    public GDForm() {
        
    }

    @Override
    public void onEvent(final int keyCode, final int deviceId, final boolean repeated) {
    }

    public void submit() {

    }

    public void open() {
    }

    public void close() throws Exception {
    }

    public void onPressGameKeyEvent(GameKeyEvent gameKeyEvent) {
    }

    public void onDownGameKeyEvent(GameKeyEvent gameKeyEvent) {
    }

    public void onUpGameKeyEvent(GameKeyEvent gameKeyEvent) {
    }

    public void onEvent(AllBinaryEventObject eventObject) {
    }

    public int append(GDGameLayer gameLayerAsItem) {
        return -1;
    }

    public void delete(int itemNum) {
    }

    public void deleteAll() {
    }

    public GDGameLayer get(int itemNum) {
        return null;
    }

    public int getHeight() {
        return -1;
    }

    public int getWidth() {
        return -1;
    }

    public void insert(int itemNum, GDGameLayer gameLayerAsItem) {
    }

    public void set(int itemNum, GDGameLayer gameLayerAsItem) {
    }

    public void setItemStateListener(GDGameLayerItemStateListener iListener) {
    }

    public int size() {
        return 0;
    }

    void fireItemStateListener(GDGameLayer gameLayerAsItem) {
    }

    void fireItemStateListener() {
    }

    public void hideNotify() {
    }

    public void keyPressed(int keyCode) {
    }

    public void keyReleased(int keyCode) {
    }

    public void keyRepeated(int keyCode) {
    }

    public void keyPressed(int keyCode, int deviceId) {
    }
    
    public void keyReleased(int keyCode, int deviceId) {
    }

    public void showNotify() {
    }

    int traverse(int keyCode, int top, int bottom) {
        return -1;
    }

    private int getTopVisibleIndex(int top) {
        return -1;
    }

    private int getBottomVisibleIndex(int bottom) {
        return -1;
    }

    private int getHeightToItem(int itemIndex) {
        return -1;
    }

    public void reset() {

    }
    
}
