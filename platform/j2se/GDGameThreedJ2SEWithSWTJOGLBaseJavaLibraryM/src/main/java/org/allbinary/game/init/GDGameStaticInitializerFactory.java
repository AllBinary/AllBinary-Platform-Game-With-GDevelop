package org.allbinary.game.init;

import org.allbinary.game.init.BasicBuildGameInitializerFactory;
import org.allbinary.game.init.GameInitializationInterface;
import org.allbinary.game.gd.resource.GDGameJ2SEWithSWTJOGLEarlyResourceInitialization;
import org.allbinary.game.gd.resource.GDGameJ2SEWithSWTJOGLResourceInitialization;
import org.allbinary.game.resource.ResourceInitialization;

public class GDGameStaticInitializerFactory
   extends BasicBuildGameInitializerFactory
{
    private static GameInitializationInterface STATIC = 
        new GDGameThreedBaseJ2SEWithSWTJOGLStaticInitializer(
                new ResourceInitialization[]{
                        new GDGameJ2SEWithSWTJOGLEarlyResourceInitialization(),
                        new GDGameJ2SEWithSWTJOGLResourceInitialization(),
                        new GDGameThreedJ2SEWithSWTJOGLAnimationInterfaceFactoryEarlyResourceInitialization(),
                        new GDGameThreedJ2SEWithSWTJOGLAnimationInterfaceFactoryResourceInitialization(),
                },                
                15);

    public GameInitializationInterface getInstance()
    {
        return STATIC;
    }
}
