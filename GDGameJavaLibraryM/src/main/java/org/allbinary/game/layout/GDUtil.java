/*
 * AllBinary Open License Version 1
 * Copyright (c) 2026 AllBinary
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
package org.allbinary.game.layout;

import org.allbinary.canvas.GameGlobalsFactory;
import org.allbinary.game.configuration.persistance.GDStructure;
import org.allbinary.game.rand.MyRandomFactory;
import org.allbinary.graphics.displayable.GameTickDisplayInfoSingleton;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.string.StringMaker;
import org.allbinary.string.CommonSeps;
import org.allbinary.time.GameTickTimeDelayHelper;
import org.allbinary.time.TimeDelayHelper;

/**
 *
 * @author User
 */
public class GDUtil {

    private static final GDUtil instance = new GDUtil();

    /**
     * @return the instance
     */
    public static GDUtil getInstance() {
        return instance;
    }

    private final CommonSeps commonSeps = CommonSeps.getInstance();
    private final SmallIntegerSingletonFactory smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
    private final MyRandomFactory randomFactory = MyRandomFactory.getInstance();
    private final GameGlobalsFactory gameGlobalsFactory = GameGlobalsFactory.getInstance();

    private final GameTickDisplayInfoSingleton gameTickDisplayInfoSingleton = GameTickDisplayInfoSingleton.getInstance();
    public final GameTickTimeDelayHelper globalsGameTickTimeDelayHelper = new GameTickTimeDelayHelper(System.currentTimeMillis());
    
    public double TimeDelta() {
        return this.globalsGameTickTimeDelayHelper.timeDelta * .001;
    }

    public int SceneWindowWidth() {
        return this.gameTickDisplayInfoSingleton.getLastWidth();
    }

    public int SceneWindowHeight() {
        return this.gameTickDisplayInfoSingleton.getLastHeight();
    }

    public int Random(final int range) {
        return this.randomFactory.getAbsoluteNextInt(range + 1);
    }

    public float Random(final double range) {
        return ((float) this.randomFactory.getAbsoluteNextInt((int) (range * 1000))) / 1000;
    }

    public float RandomFloatInRange(final double min, final double max) {
        final double next = (max - min);
        //this.logUtil.putF("NEXT: " + next, this, this.commonStrings.PROCESS);
        final float nextF = (float) next * 1000;
        //this.logUtil.putF("NEXTF: " + nextF, this, this.commonStrings.PROCESS);
        final int nextI = Math.round(nextF);
        //this.logUtil.putF("NEXTI: " + nextI, this, this.commonStrings.PROCESS);
        final int random = this.randomFactory.getAbsoluteNextInt(nextI);
        //this.logUtil.putF("RANDOM: " + random, this, this.commonStrings.PROCESS);
        final float randomF = (float) random;
        //this.logUtil.putF("RANDOMF: " + randomF, this, this.commonStrings.PROCESS);
        final float result = (float) min + (randomF / 1000);
        //this.logUtil.putF("RESULT: " + result, this, this.commonStrings.PROCESS);
        return result;
    }

    public float RandomFloatInRange(final float min, final float max) {
        final float nextF = (float) (max - min) * 1000;
        //this.logUtil.putF("NEXTF: " + nextF, this, this.commonStrings.PROCESS);
        final int nextI = Math.round(nextF);
        //this.logUtil.putF("NEXTI: " + nextI, this, this.commonStrings.PROCESS);
        final int random = this.randomFactory.getAbsoluteNextInt(nextI);
        //this.logUtil.putF("RANDOM: " + random, this, this.commonStrings.PROCESS);
        final float randomF = (float) random;
        //this.logUtil.putF("RANDOMF: " + randomF, this, this.commonStrings.PROCESS);
        final float result = (float) min + (randomF / 1000);
        //this.logUtil.putF("RESULT: " + result, this, this.commonStrings.PROCESS);
        return result;
    }

    public int Variable(final int value) {
        return value;
    }

    public float Variable(final float value) {
        return value;
    }

    public double Variable(final double value) {
        return value;
    }

    public String Variable(final String value) {
        return value;
    }

    public String VariableString(final String string) {
        return string;
    }

    public String VariableString(final Object object) {
        return object.toString();
    }

    public int VariableString(final int value) {
        return value;
    }

    public int VariableChildCount(final String[] array) {
        return array.length;
    }

    public int VariableChildCount(final int[] array) {
        return array.length;
    }

    public String GlobalVariable(final String value) {
        return value;
    }

    public float GlobalVariable(final float value) {
        return value;
    }

    public long GlobalVariable(final long value) {
        return value;
    }

    public int GlobalVariable(final int value) {
        return value;
    }

    public String GlobalVariableString(final String value) {
        return value;
    }

    public int GlobalVariableChildCount(final String[] array) {
        return array.length;
    }

    public int GlobalVariableChildCount(final int[] array) {
        return array.length;
    }

    public int GlobalVariableChildCount(final long[] array) {
        return array.length;
    }

    public String GlobalVarToJSON(final String value) {
        return value;
    }

    public String GlobalVarToJSON(final int value) {
        return Integer.toString(value);
    }

    public String GlobalVarToJSON(final long value) {
        return Long.toString(value);
    }

    public int ToJSONType(final GDStructure value) {
        return value.getJSONType();
    }

    public String ToJSON(final GDStructure value) {
        return value.toJSONAsString();
    }

    public String ToJSON(final String value) {
        return value;
    }

    public String ToJSON(final int value) {
        return Integer.toString(value);
    }

    public String ToJSON(final long value) {
        return Long.toString(value);
    }

    public int SceneInstancesCount(final int size) {
        return size;
    }

    public int MouseX() {

        return this.gameGlobalsFactory.point.getX();
    }

    public int MouseY() {

        return this.gameGlobalsFactory.point.getY();
    }

    public int MouseX(final String string, int value) {

        return this.gameGlobalsFactory.point.getX();
    }

    public int MouseY(final String string, int value) {

        return this.gameGlobalsFactory.point.getY();
    }

    public int CameraX(final String string, int value) {

        return 0;
    }

    public int CameraY(final String string, int value) {

        return 0;
    }

    public int CameraWidth(final String string, int value) {

        return this.gameTickDisplayInfoSingleton.getLastWidth();
    }

    public long TimerElapsedTime(final TimeDelayHelper timeDelayHelper) {
        return timeDelayHelper.getElapsed(this.globalsGameTickTimeDelayHelper.lastStartTime) / 1000;
    }

    public int floor(final int value) {
        return value;
    }

    public float floor(final long value) {
        return (float) value;
    }

    public float floor(final float value) {
        return (float) Math.floor((double) value);
    }

    public int mod(final int value, final int mod) {
        return value % mod;
    }

    public int round(final int value) {
        return value;
    }

    public long round(final long value) {
        return value;
    }

    public float round(final float value) {
        return (float) Math.round(value);
    }

    public int abs(final int value) {
        return Math.abs(value);
    }

    public float abs(final float value) {
        return Math.abs(value);
    }

    public double log2(final int value) {
        return Math.log((double) value);
    }

    public double sin(final double angle) {
        return Math.sin(angle);
    }

    public double cos(final double angle) {
        return Math.cos(angle);
    }

    public int min(final int min, final int max) {
        return Math.min(min, max);
    }

    public int max(final int min, final int max) {
        return Math.max(min, max);
    }

    public int ceil(final double value) {
        return (int) Math.ceil(value);
    }

    public double ToRad(final double angdeg) {
        //return Math.toRadians(angdeg);
        return angdeg;
    }

    public long TimeFromStart() {
        return this.globalsGameTickTimeDelayHelper.getTimeFromStart() / 100;
    }

    public String NewLine() {
        return this.commonSeps.NEW_LINE;
    }

    public int LastTouchId() {
        return 0;
    }

    public int LastEndedTouchId() {
        return 0;
    }

    public int TouchX(final int touchId, final String name, final int unknown) {
        return 0;
    }

    public int TouchY(final int touchId, final String name, final int unknown) {
        return 0;
    }

    public float ToNumber(final String string) {
        return Float.parseFloat(string);
    }

    public int StrLength(final String string) {
        return string.length();
    }

    public int StrFind(final String string, final String key) {
        return string.indexOf(key);
    }

    public String StrReplaceAll(final String string, final String find, final String replace) {
        return string.replace(find, replace);
    }

    public String SubStr(final String string, final int startIndex, final int endIndex) {
        return string.substring(startIndex, endIndex);
    }

    public String ToString(final String value) {
        return value;
    }

    public String ToString(final int value) {
        if (this.abs(value) > 499) {
            return Integer.toString(value);
        } else {
            return this.smallIntegerSingletonFactory.getString(value);
        }
    }

    public String ToString(final long value) {
        //this.primitiveLongUtil = new PrimitiveLongUtil(max + 1);
        return Long.toString(value);
    }

    public String LargeNumberToString(final long value) {
        //this.primitiveLongUtil = new PrimitiveLongUtil(max + 1);
        return Long.toString(value);
    }

    public String LargeNumberToString(final float value) {
        //this.primitiveLongUtil = new PrimitiveLongUtil(max + 1);
        return Long.toString((long) value);
    }

    private final StringMaker fStringMaker = new StringMaker();

    public String ToString(final float value) {
        this.fStringMaker.delete(0, this.fStringMaker.length());
        return this.fStringMaker.appendfloat(value).toString();
    }

    public int ToNotString(final int value) {
        return value;
    }

}
