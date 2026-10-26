
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2026 AllBinary 
                *   
                *  By agreeing to this license you and any business entity you represent are 
                *  legally bound to the AllBinary Open License Version 1 legal agreement. 
                *   
                *  You may obtain the AllBinary Open License Version 1 legal agreement from 
                *  AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
                *   
                *  Created By: Travis Berthelot    
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import junit.framework.TestCase
import org.allbinary.logic.NullUtil

open public class GDLanguagePathsTest : TestCase {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    private val gdLanguageFactory: GDLanguageFactory = GDLanguageFactory.getInstance()!!

    open fun create(language: GDLanguage)
        //nullable = true from not(false or (false and false)) = true
: GDPaths{
    //var language = language

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDPaths("..\\", "..\\", "..\\", "Resources\\", "Resources\\", "2d\\res\\raw\\", "3d\\res\\raw\\", language)
}


    open fun testJavaIsUnchanged()
        //nullable = true from not(false or (false and true)) = true
{

    var gdPaths: GDPaths = this.create(this.gdLanguageFactory!!.JAVA)!!


    var xsl: String = "..\\GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobals.xsl"


    var out: String = "..\\GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameGlobals.java"

assertEquals(xsl, gdPaths!!.getXslPath(xsl))
assertEquals(out, gdPaths!!.getLanguagePath(out))
}


    open fun testKotlinXslPath()
        //nullable = true from not(false or (false and true)) = true
{

    var gdPaths: GDPaths = this.create(this.gdLanguageFactory!!.KOTLIN)!!

assertEquals("..\\GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobalsKt.xsl", gdPaths!!.getXslPath("..\\GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGlobals.xsl"))
}


    open fun testKotlinOutputPath()
        //nullable = true from not(false or (false and true)) = true
{

    var gdPaths: GDPaths = this.create(this.gdLanguageFactory!!.KOTLIN)!!

assertEquals("..\\GDGameGeneratedJavaLibraryKtM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameGlobals.kt", gdPaths!!.getLanguagePath("..\\GDGameGeneratedJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\canvas\\GDGameGlobals.java"))
assertEquals("..\\resource\\GDGameResourceJavaLibraryKtM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDResources.kt", gdPaths!!.getLanguagePath("..\\resource\\GDGameResourceJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\gd\\resource\\GDResources.java"))
assertEquals("..\\platformx\\android\\GDGameAndroidApplicationKtM\\src\\main\\AndroidManifest.xml", gdPaths!!.getLanguagePath("..\\platformx\\android\\GDGameAndroidApplicationM\\src\\main\\AndroidManifest.xml"))
assertEquals("..\\platformx\\android\\GDGameAndroidApplicationNoLicensingKtGradle\\app\\build.gradle", gdPaths!!.getLanguagePath("..\\platformx\\android\\GDGameAndroidApplicationNoLicensingGradle\\app\\build.gradle"))
assertEquals("..\\platformx\\android\\GDGameAndroidApplicationNoLicensingKtGradle\\app\\src\\main\\AndroidManifest.xml", gdPaths!!.getLanguagePath("..\\platformx\\android\\GDGameAndroidApplicationNoLicensingKtGradle\\app\\src\\main\\AndroidManifest.xml"))
}


    open fun testOtherLanguageOutputPaths()
        //nullable = true from not(false or (false and true)) = true
{
assertEquals("..\\GDGameBaseJavaLibraryTsM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.ts", this.create(this.gdLanguageFactory!!.TYPESCRIPT)!!.getLanguagePath("..\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java"))
assertEquals("..\\GDGameBaseJavaLibraryCppM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.cpp", this.create(this.gdLanguageFactory!!.CPP)!!.getLanguagePath("..\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java"))
assertEquals("..\\GDGameBaseJavaLibraryErlM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.erl", this.create(this.gdLanguageFactory!!.ERLANG)!!.getLanguagePath("..\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java"))
assertEquals("GDGlobals.rs", this.create(this.gdLanguageFactory!!.RUST)!!.getLanguagePath("GDGlobals.java"))
}


    open fun testLanguageLookup()
        //nullable = true from not(false or (false and true)) = true
{
assertSame(this.gdLanguageFactory!!.KOTLIN, this.gdLanguageFactory!!.get("kotlin"))
assertSame(this.gdLanguageFactory!!.KOTLIN, this.gdLanguageFactory!!.get("Kt"))
assertSame(this.gdLanguageFactory!!.CSHARP, this.gdLanguageFactory!!.get("C#"))
assertSame(this.gdLanguageFactory!!.CPP, this.gdLanguageFactory!!.get("c++"))
assertSame(this.gdLanguageFactory!!.C, this.gdLanguageFactory!!.get("C"))
assertSame(this.gdLanguageFactory!!.ERLANG, this.gdLanguageFactory!!.get("Erlang"))
assertSame(this.gdLanguageFactory!!.JAVA, this.gdLanguageFactory!!.get("1"))
assertEquals("kotlin", this.gdLanguageFactory!!.KOTLIN.name)
assertEquals("perl", this.gdLanguageFactory!!.PERL.name)
assertEquals("c#", this.gdLanguageFactory!!.CSHARP.name)
assertEquals("rust", this.gdLanguageFactory!!.RUST.name)
assertSame(this.gdLanguageFactory!!.KOTLIN, this.gdLanguageFactory!!.get("kt"))
assertSame(this.gdLanguageFactory!!.CSHARP, this.gdLanguageFactory!!.get("cs"))
assertSame(this.gdLanguageFactory!!.RUST, this.gdLanguageFactory!!.get("rs"))
assertSame(this.gdLanguageFactory!!.ADA, this.gdLanguageFactory!!.get("ada"))
assertSame(this.gdLanguageFactory!!.PERL, this.gdLanguageFactory!!.get("pl"))
assertSame(this.gdLanguageFactory!!.C, this.gdLanguageFactory!!.get("c"))
assertSame(this.gdLanguageFactory!!.JAVA, this.gdLanguageFactory!!.get("java"))
assertSame(this.gdLanguageFactory!!.COBOL, this.gdLanguageFactory!!.get("COBOL"))
assertSame(this.gdLanguageFactory!!.COBOL, this.gdLanguageFactory!!.get("cob"))
assertSame(this.gdLanguageFactory!!.FORTRAN, this.gdLanguageFactory!!.get("FORTRAN"))
assertSame(this.gdLanguageFactory!!.FORTRAN, this.gdLanguageFactory!!.get("f90"))
assertSame(this.gdLanguageFactory!!.DART, this.gdLanguageFactory!!.get("Dart"))
assertSame(this.gdLanguageFactory!!.ELIXIR, this.gdLanguageFactory!!.get("Elixir"))
assertSame(this.gdLanguageFactory!!.ELIXIR, this.gdLanguageFactory!!.get("exs"))
assertEquals("..\\GDGameBaseJavaLibraryDartM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.dart", this.create(this.gdLanguageFactory!!.DART)!!.getLanguagePath("..\\GDGameBaseJavaLibraryM\\src\\main\\java\\org\\allbinary\\game\\GDGameMIDlet.java"))
assertSame(NullUtil.getInstance()!!.NULL_OBJECT, this.gdLanguageFactory!!.get("Smalltalk"))
}


                @Throws(Exception::class)
            
    open fun testSelectionFromArgs()
        //nullable = true from not(false or (false and true)) = true
{

    var selection: GDLanguageSelection = GDLanguageSelection.getInstance()!!

assertSame(this.gdLanguageFactory!!.TYPESCRIPT, selection.getFromArgs(arrayOf("-language=TypeScript")))
assertSame(this.gdLanguageFactory!!.GO, selection.getFromArgs(arrayOf("--language","go")))
assertSame(NullUtil.getInstance()!!.NULL_OBJECT, selection.getFromArgs(arrayOf()))

        try {
            selection.getFromArgs(arrayOf("-language=Smalltalk"))
fail()
} catch(e: Exception)
            {
}

}


}
                
            

