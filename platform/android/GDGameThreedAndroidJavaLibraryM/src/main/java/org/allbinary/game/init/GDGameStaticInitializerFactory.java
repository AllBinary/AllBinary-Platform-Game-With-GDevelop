package org.allbinary.game.init;

import org.allbinary.game.resource.GDGameAndroidEarlyResourceInitialization;
import org.allbinary.game.resource.GDGameAndroidResourceInitialization;
import org.allbinary.game.resource.ResourceInitialization;

public class GDGameStaticInitializerFactory
   extends BasicBuildGameInitializerFactory
{
    private static GameInitializationInterface STATIC = 
        new GDGameBaseAndroidStaticInitializer(
                new ResourceInitialization[]{
                        new GDGameAndroidEarlyResourceInitialization(),
                        new GDGameAndroidResourceInitialization(),
                        new GDGameAndroidAnimationInterfaceFactoryEarlyResourceInitialization(),
                        new GDGameAndroidAnimationInterfaceFactoryResourceInitialization(),
                },                
                15);

    public GameInitializationInterface getInstance()
    {
        return STATIC;
    }
}
