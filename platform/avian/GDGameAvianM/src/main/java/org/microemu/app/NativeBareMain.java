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
package org.microemu.app;

/**
 *
 * @author User
 */
public class NativeBareMain {

    public static void main(final String args[]) {
        BareMain.main2(args, "GDGameMIDlet", "/gd_icon.ico", 1366, 768, true, false);
    }

}
