/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.allbinary.game.gd.init;

import org.allbinary.game.gd.resource.GDGameAndroidEarlyResourceInitialization;
import org.allbinary.game.gd.resource.GDGameAndroidResourceInitialization;

import org.allbinary.game.init.BasicBuildGameInitializerFactory;
import org.allbinary.game.init.GameInitializationInterface;
import org.allbinary.game.resource.ResourceInitialization;

/**
 *
 * @author Berthelot, Travis
 * @version 1.0
 */
public class GDGameStaticInitializerFactory extends BasicBuildGameInitializerFactory
{
    private static GameInitializationInterface STATIC = 
        new GDGameAndroidStaticInitializer(
                new ResourceInitialization[]{
                        new GDGameAndroidEarlyResourceInitialization(),
                        new GDGameAndroidResourceInitialization(),
                        new GDGameAndroidAnimationInterfaceFactoryEarlyResourceInitialization(),
                        new GDGameAndroidAnimationInterfaceFactoryResourceInitialization(),
                        }, 15);

    public GameInitializationInterface getInstance()
    {
        return STATIC;
    }
}
