/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
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
package org.allbinary.game.init;

import org.allbinary.game.init.BasicBuildGameInitializerFactory;
import org.allbinary.game.init.GameInitializationInterface;
import org.allbinary.game.resource.ResourceInitialization;
import org.allbinary.game.resource.GDGameJ2MEEarlyResourceInitialization;

/**
 *
 * @author Berthelot, Travis
 * @version 1.0
 */
public class GDGameStaticInitializerFactory 
extends BasicBuildGameInitializerFactory
{
    private static GameInitializationInterface STATIC = new J2MEGDGameStaticInitializer(
            new ResourceInitialization[]{
                        new GDGameJ2MEEarlyResourceInitialization(),
                        new GDGameResourceInitialization(),
                        new GDGameJ2MEAnimationInterfaceFactoryEarlyResourceInitialization(),
                        new GDGameJ2MEAnimationInterfaceFactoryResourceInitialization(),
                        }, 15);

    public GameInitializationInterface getInstance()
    {
        return STATIC;
    }
}
