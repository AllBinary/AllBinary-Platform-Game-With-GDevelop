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
package org.allbinary.gdevelop.loader;

import org.allbinary.time.TimeDelayHelper;

/**
 *
 * @author User
 */
public class GDGenerator {

    public void process() throws Exception {
        //System.setProperty("jdk.xml.xpathExprGrpLimit", "0");
        //System.setProperty("jdk.xml.xpathExprOpLimit", "0");
        System.setProperty("jdk.xml.xpathTotalOpLimit", "0");
        final TimeDelayHelper timeDelayHelper = new TimeDelayHelper(0);
        new GDDelete().process();
//        System.out.println("Delete ElapsedTime: " + timeDelayHelper.getElapsedTNT());
//        timeDelayHelper.setStartTimeTNT();
        new GDCopy().copy();
//        System.out.println("Copy ElapsedTime: " + timeDelayHelper.getElapsedTNT());
//        timeDelayHelper.setStartTimeTNT();
        new GDToAllBinaryGenerationTool().process();
//        System.out.println("GDToAllBinaryGenerationTool ElapsedTime: " + timeDelayHelper.getElapsedTNT());
//        timeDelayHelper.setStartTimeTNT();
        new GDLayoutsToAllBinaryLayoutGenerator().process(0, new GDGetTotalLayouts().process());
//        System.out.println("GDLayoutsToAllBinaryLayoutGenerator Started ElapsedTime: " + timeDelayHelper.getElapsedTNT());
//        timeDelayHelper.setStartTimeTNT();
        System.out.println("Delete, Copy, GDToAllBinaryGenerationTool, GDLayoutsToAllBinaryLayoutGenerator ElapsedTime: " + timeDelayHelper.getElapsedTNT());
        timeDelayHelper.setStartTimeTNT();
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        GDPaths.init();
        new GDGenerator().process();
    }
    
}
