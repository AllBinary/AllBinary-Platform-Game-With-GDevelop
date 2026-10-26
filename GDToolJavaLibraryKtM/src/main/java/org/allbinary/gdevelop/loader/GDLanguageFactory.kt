
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
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import org.allbinary.logic.NullUtil
import org.allbinary.logic.string.StringUtil
import org.allbinary.logic.io.file.CommonDataFileStrings

open public class GDLanguageFactory
            : Object
         {
        
companion object {
            
    private val instance: GDLanguageFactory = GDLanguageFactory()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDLanguageFactory{

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    private val NO_ALIASES: Array<String?> = arrayOf()

    private val commonDataFileStrings: CommonDataFileStrings = CommonDataFileStrings.getInstance()!!

    val JAVA: GDLanguage = GDLanguage(this.commonDataFileStrings!!.JAVA, StringUtil.getInstance()!!.EMPTY_STRING, this.commonDataFileStrings!!._JAVA, NO_ALIASES)

    val KOTLIN: GDLanguage = GDLanguage(this.commonDataFileStrings!!.KOTLIN, this.commonDataFileStrings!!.KT_SHORT_NAME, this.commonDataFileStrings!!._KT, arrayOf(this.commonDataFileStrings!!.KTS))

    val TYPESCRIPT: GDLanguage = GDLanguage(this.commonDataFileStrings!!.TYPESCRIPT, this.commonDataFileStrings!!.TS_SHORT_NAME, this.commonDataFileStrings!!._TS, NO_ALIASES)

    val JAVASCRIPT: GDLanguage = GDLanguage(this.commonDataFileStrings!!.JAVASCRIPT, this.commonDataFileStrings!!.JS_SHORT_NAME, this.commonDataFileStrings!!._JS, NO_ALIASES)

    val CPP: GDLanguage = GDLanguage(this.commonDataFileStrings!!.C_PLUS_PLUS, this.commonDataFileStrings!!.CPP_SHORT_NAME, this.commonDataFileStrings!!._CPP, arrayOf(this.commonDataFileStrings!!.CPLUSPLUS), arrayOf(this.commonDataFileStrings!!._H))

    val PYTHON: GDLanguage = GDLanguage(this.commonDataFileStrings!!.PYTHON, this.commonDataFileStrings!!.PY_SHORT_NAME, this.commonDataFileStrings!!._PY, NO_ALIASES)

    val GO: GDLanguage = GDLanguage(this.commonDataFileStrings!!.GO, this.commonDataFileStrings!!.GO_SHORT_NAME, this.commonDataFileStrings!!._GO, arrayOf(this.commonDataFileStrings!!.GOLANG))

    val CSHARP: GDLanguage = GDLanguage(this.commonDataFileStrings!!.C_SHARP, this.commonDataFileStrings!!.CS_SHORT_NAME, this.commonDataFileStrings!!._CSHARP, arrayOf(this.commonDataFileStrings!!.CSHARP_ALIAS))

    val ADA: GDLanguage = GDLanguage(this.commonDataFileStrings!!.ADA, this.commonDataFileStrings!!.ADA_SHORT_NAME, this.commonDataFileStrings!!._ADB, arrayOf(this.commonDataFileStrings!!.ADB,this.commonDataFileStrings!!.ADS), arrayOf(this.commonDataFileStrings!!._ADS))

    val RUST: GDLanguage = GDLanguage(this.commonDataFileStrings!!.RUST_NAME, this.commonDataFileStrings!!.RUST_SHORT_NAME, this.commonDataFileStrings!!._RUST, NO_ALIASES)

    val LUA: GDLanguage = GDLanguage(this.commonDataFileStrings!!.LUA, this.commonDataFileStrings!!.LUA_SHORT_NAME, this.commonDataFileStrings!!._LUA, NO_ALIASES)

    val C: GDLanguage = GDLanguage(this.commonDataFileStrings!!.C, this.commonDataFileStrings!!.C_SHORT_NAME, this.commonDataFileStrings!!._C, arrayOf(this.commonDataFileStrings!!.C23,this.commonDataFileStrings!!.H), arrayOf(this.commonDataFileStrings!!._H))

    val ZIG: GDLanguage = GDLanguage(this.commonDataFileStrings!!.ZIG, this.commonDataFileStrings!!.ZIG_SHORT_NAME, this.commonDataFileStrings!!._ZIG, NO_ALIASES)

    val RUBY: GDLanguage = GDLanguage(this.commonDataFileStrings!!.RUBY, this.commonDataFileStrings!!.RB_SHORT_NAME, this.commonDataFileStrings!!._RB, NO_ALIASES)

    val PERL: GDLanguage = GDLanguage(this.commonDataFileStrings!!.PERL, this.commonDataFileStrings!!.PL_SHORT_NAME, this.commonDataFileStrings!!._PM, arrayOf(this.commonDataFileStrings!!.PL), arrayOf(this.commonDataFileStrings!!._PL))

    val OBJECT_PASCAL: GDLanguage = GDLanguage(this.commonDataFileStrings!!.OBJECT_PASCAL, this.commonDataFileStrings!!.PAS_SHORT_NAME, this.commonDataFileStrings!!._PAS, arrayOf(this.commonDataFileStrings!!.OBJECT_PASCAL_ALIAS,this.commonDataFileStrings!!.PASCAL))

    val OCAML: GDLanguage = GDLanguage(this.commonDataFileStrings!!.OCAML, this.commonDataFileStrings!!.ML_SHORT_NAME, this.commonDataFileStrings!!._ML, NO_ALIASES)

    val HASKELL: GDLanguage = GDLanguage(this.commonDataFileStrings!!.HASKELL, this.commonDataFileStrings!!.HS_SHORT_NAME, this.commonDataFileStrings!!._HS, NO_ALIASES)

    val HAXE: GDLanguage = GDLanguage(this.commonDataFileStrings!!.HAXE, this.commonDataFileStrings!!.HX_SHORT_NAME, this.commonDataFileStrings!!._HX, NO_ALIASES)

    val ERLANG: GDLanguage = GDLanguage(this.commonDataFileStrings!!.ERLANG, this.commonDataFileStrings!!.ERL_SHORT_NAME, this.commonDataFileStrings!!._ERL, NO_ALIASES)

    val COBOL: GDLanguage = GDLanguage(this.commonDataFileStrings!!.COBOL, this.commonDataFileStrings!!.CBL_SHORT_NAME, this.commonDataFileStrings!!._CBL, arrayOf(this.commonDataFileStrings!!.COB), arrayOf(this.commonDataFileStrings!!._COB))

    val FORTRAN: GDLanguage = GDLanguage(this.commonDataFileStrings!!.FORTRAN, this.commonDataFileStrings!!.F90_SHORT_NAME, this.commonDataFileStrings!!._F90, arrayOf(this.commonDataFileStrings!!.F), arrayOf(this.commonDataFileStrings!!._F))

    val DART: GDLanguage = GDLanguage(this.commonDataFileStrings!!.DART, this.commonDataFileStrings!!.DART_SHORT_NAME, this.commonDataFileStrings!!._DART, NO_ALIASES)

    val ELIXIR: GDLanguage = GDLanguage(this.commonDataFileStrings!!.ELIXIR, this.commonDataFileStrings!!.EX_SHORT_NAME, this.commonDataFileStrings!!._EX, arrayOf(this.commonDataFileStrings!!.EXS), arrayOf(this.commonDataFileStrings!!._EXS))

    val LANGUAGE_ARRAY: Array<GDLanguage?> = arrayOf(JAVA,KOTLIN,TYPESCRIPT,JAVASCRIPT,CPP,PYTHON,GO,CSHARP,ADA,RUST,LUA,C,ZIG,RUBY,PERL,OBJECT_PASCAL,OCAML,HASKELL,HAXE,ERLANG,COBOL,FORTRAN,DART,ELIXIR)

    open fun get(value: String)
        //nullable = true from not(false or (false and false)) = true
: Any{
    //var value = value

    var trimmed: String = value.trim()!!


    var size: Int = this.LANGUAGE_ARRAY.size
                





                        for (index in 0 until size)

        {

    
                        if(this.LANGUAGE_ARRAY[index]!!.matches(trimmed))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.LANGUAGE_ARRAY[index]!!

                                    }
                                
}


        try {
            
    var number: Int = trimmed.toInt()
    


    
                        if(number >= 1 && number <= size)
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.LANGUAGE_ARRAY[number -1]!!

                                    }
                                
} catch(e: NumberFormatException)
            {
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return NullUtil.getInstance()!!.NULL_OBJECT
}


}
                
            

