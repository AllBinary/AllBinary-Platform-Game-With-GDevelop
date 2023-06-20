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

/**
 *
 * @author User
 */
public class GDGenerator {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        //System.setProperty("jdk.xml.xpathExprGrpLimit", "0");
        //System.setProperty("jdk.xml.xpathExprOpLimit", "0");
        System.setProperty("jdk.xml.xpathTotalOpLimit", "0");
        new GDDelete().process();
        new GDToAllBinaryGenerationTool().process();
        new GDLayoutsToAllBinaryGenerator().process(new GDGetTotalLayouts().process());
    }
    
}
