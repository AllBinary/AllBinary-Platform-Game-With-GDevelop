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
package org.allbinary.gdevelop.loader;

import org.allbinary.data.tree.dom.document.DomDocumentHelper;

/**
 * Generates the language specific (for example Kt.xsl) output into a scratch directory
 * so it can be compared with GDLanguageOutputComparison against the converter generated modules.
 * Resource processing, delete and copy steps are skipped.
 *
 * Usage: GDLanguageGenerationHarness genPath [-language=Kotlin]
 */
public class GDLanguageGenerationHarness {

    public static void main(final String[] args) throws Exception {
        if (args.length < 1) {
            System.out.println("Usage: GDLanguageGenerationHarness genPath [-language=Kotlin]");
            System.exit(1);
        }

        String genPath = args[0];
        if (!genPath.endsWith("\\") && !genPath.endsWith("/")) {
            genPath = genPath + "\\";
        }

        DomDocumentHelper.init();
        final GDLanguage language = GDLanguageSelection.getInstance().select(args);
        GDPaths.initGenPath(genPath, language);

        new GDToAllBinaryGenerationTool().process();
        final GDGameInfo gdGameInfo = new GDGenerateGDGameInfo().process();
        final boolean[] finished = new boolean[9];
        new GDLayoutsToAllBinaryLayoutGenerator().process(0, gdGameInfo, finished);

        boolean done = false;
        while (!done) {
            Thread.sleep(250);
            done = true;
            for (int index = 0; index < finished.length; index++) {
                if (!finished[index]) {
                    done = false;
                }
            }
        }
        System.out.println("GDLanguageGenerationHarness finished: " + genPath);
        System.exit(0);
    }

}
