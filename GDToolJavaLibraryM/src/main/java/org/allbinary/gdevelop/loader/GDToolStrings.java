/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package org.allbinary.gdevelop.loader;

/**
 *
 * @author User
 */
public class GDToolStrings {
    
    private static final GDToolStrings instance = new GDToolStrings();

    /**
     * @return the instance
     */
    public static GDToolStrings getInstance() {
        return instance;
    }
    
    public final String FILENAME = "fileName: ";
    
    public final String ROOT_PATH = "..\\";

    public final String GAME_XML_PATH = this.ROOT_PATH + "game.xml";
}
