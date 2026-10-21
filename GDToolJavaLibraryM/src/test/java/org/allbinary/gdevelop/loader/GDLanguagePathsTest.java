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

import junit.framework.TestCase;

import org.allbinary.logic.NullUtil;

public class GDLanguagePathsTest extends TestCase {

    private final GDLanguageFactory gdLanguageFactory = GDLanguageFactory.getInstance();

    private GDPaths create(final GDLanguage language) {
        return new GDPaths("..\\", "..\\", "..\\", "Resources\\", "Resources\\", "2d\\res\\raw\\", "3d\\res\\raw\\", language);
    }

    public void testJavaIsUnchanged() {
        final GDPaths gdPaths = this.create(this.gdLanguageFactory.JAVA);
        final String xsl = "..\\GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobals.xsl";
        final String out = "..\\GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameGlobals.java";
        assertEquals(xsl, gdPaths.getXslPath(xsl));
        assertEquals(out, gdPaths.getLanguagePath(out));
    }

    public void testKotlinXslPath() {
        final GDPaths gdPaths = this.create(this.gdLanguageFactory.KOTLIN);
        assertEquals("..\\GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalsKt.xsl",
            gdPaths.getXslPath("..\\GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobals.xsl"));
    }

    public void testKotlinOutputPath() {
        final GDPaths gdPaths = this.create(this.gdLanguageFactory.KOTLIN);
        assertEquals("..\\GDGameGeneratedJavaLibraryKtM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameGlobals.kt",
            gdPaths.getLanguagePath("..\\GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameGlobals.java"));
        assertEquals("..\\resource\\GDGameResourceJavaLibraryKtM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDResources.kt",
            gdPaths.getLanguagePath("..\\resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDResources.java"));
        assertEquals("..\\platformx\\android\\GDGameAndroidApplicationKtM\\src\\main\\AndroidManifest.xml",
            gdPaths.getLanguagePath("..\\platformx\\android\\GDGameAndroidApplicationM\\src\\main\\AndroidManifest.xml"));
        assertEquals("..\\platformx\\android\\GDGameAndroidApplicationNoLicensingKtGradle\\app\\build.gradle",
            gdPaths.getLanguagePath("..\\platformx\\android\\GDGameAndroidApplicationNoLicensingGradle\\app\\build.gradle"));
        assertEquals("..\\platformx\\android\\GDGameAndroidApplicationNoLicensingKtGradle\\app\\src\\main\\AndroidManifest.xml",
            gdPaths.getLanguagePath("..\\platformx\\android\\GDGameAndroidApplicationNoLicensingKtGradle\\app\\src\\main\\AndroidManifest.xml"));
    }

    public void testOtherLanguageOutputPaths() {
        assertEquals("..\\GDGameBaseJavaLibraryTsM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.ts",
            this.create(this.gdLanguageFactory.TYPESCRIPT).getLanguagePath("..\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java"));
        assertEquals("..\\GDGameBaseJavaLibraryCppM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.cpp",
            this.create(this.gdLanguageFactory.CPP).getLanguagePath("..\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java"));
        assertEquals("..\\GDGameBaseJavaLibraryErlM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.erl",
            this.create(this.gdLanguageFactory.ERLANG).getLanguagePath("..\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java"));
        assertEquals("GDGlobals.rs", this.create(this.gdLanguageFactory.RUST).getLanguagePath("GDGlobals.java"));
    }

    public void testLanguageLookup() {
        assertSame(this.gdLanguageFactory.KOTLIN, this.gdLanguageFactory.get("kotlin"));
        assertSame(this.gdLanguageFactory.KOTLIN, this.gdLanguageFactory.get("Kt"));
        assertSame(this.gdLanguageFactory.CSHARP, this.gdLanguageFactory.get("C#"));
        assertSame(this.gdLanguageFactory.CPP, this.gdLanguageFactory.get("c++"));
        assertSame(this.gdLanguageFactory.C, this.gdLanguageFactory.get("C"));
        assertSame(this.gdLanguageFactory.ERLANG, this.gdLanguageFactory.get("Erlang"));
        assertSame(this.gdLanguageFactory.JAVA, this.gdLanguageFactory.get("1"));
        assertEquals("kotlin", this.gdLanguageFactory.KOTLIN.name);
        assertEquals("perl", this.gdLanguageFactory.PERL.name);
        assertEquals("c#", this.gdLanguageFactory.CSHARP.name);
        assertEquals("rust", this.gdLanguageFactory.RUST.name);
        assertSame(this.gdLanguageFactory.KOTLIN, this.gdLanguageFactory.get("kt"));
        assertSame(this.gdLanguageFactory.CSHARP, this.gdLanguageFactory.get("cs"));
        assertSame(this.gdLanguageFactory.RUST, this.gdLanguageFactory.get("rs"));
        assertSame(this.gdLanguageFactory.ADA, this.gdLanguageFactory.get("ada"));
        assertSame(this.gdLanguageFactory.PERL, this.gdLanguageFactory.get("pl"));
        assertSame(this.gdLanguageFactory.C, this.gdLanguageFactory.get("c"));
        assertSame(this.gdLanguageFactory.JAVA, this.gdLanguageFactory.get("java"));
        assertSame(this.gdLanguageFactory.COBOL, this.gdLanguageFactory.get("COBOL"));
        assertSame(this.gdLanguageFactory.COBOL, this.gdLanguageFactory.get("cob"));
        assertSame(this.gdLanguageFactory.FORTRAN, this.gdLanguageFactory.get("FORTRAN"));
        assertSame(this.gdLanguageFactory.FORTRAN, this.gdLanguageFactory.get("f90"));
        assertSame(this.gdLanguageFactory.DART, this.gdLanguageFactory.get("Dart"));
        assertSame(this.gdLanguageFactory.ELIXIR, this.gdLanguageFactory.get("Elixir"));
        assertSame(this.gdLanguageFactory.ELIXIR, this.gdLanguageFactory.get("exs"));
        assertEquals("..\\GDGameBaseJavaLibraryDartM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.dart",
            this.create(this.gdLanguageFactory.DART).getLanguagePath("..\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java"));
        assertSame(NullUtil.getInstance().NULL_OBJECT, this.gdLanguageFactory.get("Smalltalk"));
    }

    public void testSelectionFromArgs() throws Exception {
        final GDLanguageSelection selection = GDLanguageSelection.getInstance();
        assertSame(this.gdLanguageFactory.TYPESCRIPT, selection.getFromArgs(new String[] {"-language=TypeScript"}));
        assertSame(this.gdLanguageFactory.GO, selection.getFromArgs(new String[] {"--language", "go"}));
        assertSame(NullUtil.getInstance().NULL_OBJECT, selection.getFromArgs(new String[] {}));
        try {
            selection.getFromArgs(new String[] {"-language=Smalltalk"});
            fail();
        } catch (Exception e) {
            //expected
        }
    }
}
