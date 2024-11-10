/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package org.allbinary.game.layer;

import org.allbinary.game.layer.waypoint.FlagGameResources;

/**
 *
 * @author user
 */
public class GDFlagResources extends FlagGameResources
{
    private static final FlagGameResources SINGLETON = new GDFlagResources();

    private GDFlagResources()
    {
        final String ROOT = "/gd_flag";
        final String SMALL = "_64_by_64.png";
        final String MEDIUM = SMALL;
        final String SIZE_FOUR = SMALL;
        final String SIZE_FIVE = SMALL;
        final String SIZE_SIX = SMALL;

        final String[] SIZE = { SMALL, MEDIUM, SIZE_FOUR, SIZE_FIVE, SIZE_SIX };

        super.init(ROOT, SIZE);

        this.NAME = "Player Waypoint";
    }

    public static FlagGameResources getInstance()
    {
        return SINGLETON;
    }
}
