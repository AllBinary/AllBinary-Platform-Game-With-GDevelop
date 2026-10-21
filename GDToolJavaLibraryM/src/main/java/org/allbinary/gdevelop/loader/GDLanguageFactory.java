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

import org.allbinary.logic.NullUtil;
import org.allbinary.logic.string.StringUtil;
import org.allbinary.logic.io.file.CommonDataFileStrings;

/**
 *
 * @author User
 */
public class GDLanguageFactory {

    private static final GDLanguageFactory instance = new GDLanguageFactory();

    /**
     * @return the instance
     */
    public static GDLanguageFactory getInstance() {
        return instance;
    }

    private final String[] NO_ALIASES = {};

    private final CommonDataFileStrings commonDataFileStrings = CommonDataFileStrings.getInstance();    
    
    public final GDLanguage JAVA = new GDLanguage(this.commonDataFileStrings.JAVA, StringUtil.getInstance().EMPTY_STRING, this.commonDataFileStrings._JAVA, NO_ALIASES);
    public final GDLanguage KOTLIN = new GDLanguage(this.commonDataFileStrings.KOTLIN, this.commonDataFileStrings.KT_SHORT_NAME, this.commonDataFileStrings._KT, new String[] {this.commonDataFileStrings.KTS});
    public final GDLanguage TYPESCRIPT = new GDLanguage(this.commonDataFileStrings.TYPESCRIPT, this.commonDataFileStrings.TS_SHORT_NAME, this.commonDataFileStrings._TS, NO_ALIASES);
    public final GDLanguage JAVASCRIPT = new GDLanguage(this.commonDataFileStrings.JAVASCRIPT, this.commonDataFileStrings.JS_SHORT_NAME, this.commonDataFileStrings._JS, NO_ALIASES);
    public final GDLanguage CPP = new GDLanguage(this.commonDataFileStrings.C_PLUS_PLUS, this.commonDataFileStrings.CPP_SHORT_NAME, this.commonDataFileStrings._CPP, new String[] {this.commonDataFileStrings.CPLUSPLUS});
    public final GDLanguage PYTHON = new GDLanguage(this.commonDataFileStrings.PYTHON, this.commonDataFileStrings.PY_SHORT_NAME, this.commonDataFileStrings._PY, NO_ALIASES);
    public final GDLanguage GO = new GDLanguage(this.commonDataFileStrings.GO, this.commonDataFileStrings.GO_SHORT_NAME, this.commonDataFileStrings._GO, new String[] {this.commonDataFileStrings.GOLANG});
    public final GDLanguage CSHARP = new GDLanguage(this.commonDataFileStrings.C_SHARP, this.commonDataFileStrings.CS_SHORT_NAME, this.commonDataFileStrings._CSHARP, new String[] {this.commonDataFileStrings.CSHARP_ALIAS});
    public final GDLanguage ADA = new GDLanguage(this.commonDataFileStrings.ADA, this.commonDataFileStrings.ADA_SHORT_NAME, this.commonDataFileStrings._ADB, new String[] {this.commonDataFileStrings.ADB, this.commonDataFileStrings.ADS});
    public final GDLanguage RUST = new GDLanguage(this.commonDataFileStrings.RUST_NAME, this.commonDataFileStrings.RUST_SHORT_NAME, this.commonDataFileStrings._RUST, NO_ALIASES);
    public final GDLanguage LUA = new GDLanguage(this.commonDataFileStrings.LUA, this.commonDataFileStrings.LUA_SHORT_NAME, this.commonDataFileStrings._LUA, NO_ALIASES);
    public final GDLanguage C = new GDLanguage(this.commonDataFileStrings.C, this.commonDataFileStrings.C_SHORT_NAME, this.commonDataFileStrings._C, new String[] {this.commonDataFileStrings.C23, this.commonDataFileStrings.H});
    public final GDLanguage ZIG = new GDLanguage(this.commonDataFileStrings.ZIG, this.commonDataFileStrings.ZIG_SHORT_NAME, this.commonDataFileStrings._ZIG, NO_ALIASES);
    public final GDLanguage RUBY = new GDLanguage(this.commonDataFileStrings.RUBY, this.commonDataFileStrings.RB_SHORT_NAME, this.commonDataFileStrings._RB, NO_ALIASES);
    public final GDLanguage PERL = new GDLanguage(this.commonDataFileStrings.PERL, this.commonDataFileStrings.PL_SHORT_NAME, this.commonDataFileStrings._PM, new String[] {this.commonDataFileStrings.PL});
    public final GDLanguage OBJECT_PASCAL = new GDLanguage(this.commonDataFileStrings.OBJECT_PASCAL, this.commonDataFileStrings.PAS_SHORT_NAME, this.commonDataFileStrings._PAS, new String[] {this.commonDataFileStrings.OBJECT_PASCAL_ALIAS, this.commonDataFileStrings.PASCAL});
    public final GDLanguage OCAML = new GDLanguage(this.commonDataFileStrings.OCAML, this.commonDataFileStrings.ML_SHORT_NAME, this.commonDataFileStrings._ML, NO_ALIASES);
    public final GDLanguage HASKELL = new GDLanguage(this.commonDataFileStrings.HASKELL, this.commonDataFileStrings.HS_SHORT_NAME, this.commonDataFileStrings._HS, NO_ALIASES);
    public final GDLanguage HAXE = new GDLanguage(this.commonDataFileStrings.HAXE, this.commonDataFileStrings.HX_SHORT_NAME, this.commonDataFileStrings._HX, NO_ALIASES);
    public final GDLanguage ERLANG = new GDLanguage(this.commonDataFileStrings.ERLANG, this.commonDataFileStrings.ERL_SHORT_NAME, this.commonDataFileStrings._ERL, NO_ALIASES);
    public final GDLanguage COBOL = new GDLanguage(this.commonDataFileStrings.COBOL, this.commonDataFileStrings.CBL_SHORT_NAME, this.commonDataFileStrings._CBL, new String[] {this.commonDataFileStrings.COB});
    public final GDLanguage FORTRAN = new GDLanguage(this.commonDataFileStrings.FORTRAN, this.commonDataFileStrings.F90_SHORT_NAME, this.commonDataFileStrings._F90, new String[] {this.commonDataFileStrings.F});
    public final GDLanguage DART = new GDLanguage(this.commonDataFileStrings.DART, this.commonDataFileStrings.DART_SHORT_NAME, this.commonDataFileStrings._DART, NO_ALIASES);
    public final GDLanguage ELIXIR = new GDLanguage(this.commonDataFileStrings.ELIXIR, this.commonDataFileStrings.EX_SHORT_NAME, this.commonDataFileStrings._EX, new String[] {this.commonDataFileStrings.EXS});

    public final GDLanguage[] LANGUAGE_ARRAY = {
        JAVA, KOTLIN, TYPESCRIPT, JAVASCRIPT, CPP, PYTHON, GO, CSHARP, ADA, RUST,
        LUA, C, ZIG, RUBY, PERL, OBJECT_PASCAL, OCAML, HASKELL, HAXE, ERLANG,
        COBOL, FORTRAN, DART, ELIXIR,
    };

    /**
     * @return the language matching the name, short name, extension, alias, or 1 based list number. Otherwise NULL_OBJECT.
     */
    public Object get(final String value) {
        final String trimmed = value.trim();
        final int size = this.LANGUAGE_ARRAY.length;
        for (int index = 0; index < size; index++) {
            if (this.LANGUAGE_ARRAY[index].matches(trimmed)) {
                return this.LANGUAGE_ARRAY[index];
            }
        }

        try {
            final int number = Integer.parseInt(trimmed);
            if (number >= 1 && number <= size) {
                return this.LANGUAGE_ARRAY[number - 1];
            }
        } catch (NumberFormatException e) {
            //not a list number
        }

        return NullUtil.getInstance().NULL_OBJECT;
    }

}
