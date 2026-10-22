package org.allbinary.game.gd.resource

/*
 *  Note that errors may occur even though your importing R correctly
 *  This usually is caused by Duplicate R classes
 *  Solution is usually to move the R class from the org.allbinary.game.game_name
 *  package into the independent src directory not part of the multi process apk
 *  Remark out for independent Activities
 */

import java.io.InputStream
import java.lang.Integer
import org.allbinary.AndroidResources

import org.allbinary.data.resource.ResourceUtil
import org.allbinary.game.resource.ResourceInitialization
import org.allbinary.game.gd.resource.GDResources
import org.allbinary.media.audio.ErrorSound
import org.allbinary.media.audio.SelectSound
import org.allbinary.midlet.MidletIcon
import org.allbinary.util.BasicArrayList

open public class GDGameAndroidEarlyResourceInitialization : ResourceInitialization
{

    public constructor() : super()
    {
    }

    @Throws(Exception::class)
    override fun init()
    {
        super.init()

        val resourceUtil: ResourceUtil = ResourceUtil.getInstance()!!

        val androidResources: AndroidResources = AndroidResources.getInstance()

        //val gdProjectStrings: GDProjectStrings = GDProjectStrings.getInstance()

        val gdResources: GDResources = GDResources.getInstance()

        //resourceUtil.addResource(gdProjectStrings.GAME, Integer(androidResources.raw.game))

        //val gdProject: GDProject = GDProject()

        //val inputStream: InputStream = resourceUtil.getResourceAsStream(gdProjectStrings.GAME)
        //val streamUtil: StreamUtil = StreamUtil.getInstance()
        //val gdGameConfiguration: String = streamUtil.getAsString(inputStream)

        //gdProject.load(gdGameConfiguration)

        resourceUtil.addResource(MidletIcon.RESOURCE, Integer(androidResources.drawable.gd_icon))

        resourceUtil.addResource(SelectSound.getInstance()!!.getResource(), Integer(androidResources.raw.select))

        resourceUtil.addResource(ErrorSound.getInstance()!!.getResource(), Integer(androidResources.raw.error))

        resourceUtil.addResource(gdResources.BLANK, Integer(androidResources.raw.blank))

                resourceUtil.addResource(GDBombLaserretro003Sound.getInstance().getResource(), Integer(androidResources.raw.bomb_laserretro_003))
        resourceUtil.addResource(GDLowrandomSound.getInstance().getResource(), Integer(androidResources.raw.lowrandom))
        resourceUtil.addResource(GDLaserretro004Sound.getInstance().getResource(), Integer(androidResources.raw.laserretro_004))
        resourceUtil.addResource(GDRetroExplosionShort08Sound.getInstance().getResource(), Integer(androidResources.raw.retro_explosion_short_08))
        resourceUtil.addResource(GDRetroExplosionShort07Sound.getInstance().getResource(), Integer(androidResources.raw.retro_explosion_short_07))
        resourceUtil.addResource(GDRetroExplosionShort10Sound.getInstance().getResource(), Integer(androidResources.raw.retro_explosion_short_10))
        resourceUtil.addResource(GDTwotone2Sound.getInstance().getResource(), Integer(androidResources.raw.twotone2))

        resourceUtil.addResource(gdResources.BASE, Integer(androidResources.raw.base))

        resourceUtil.addResource(gdResources.LEFT, Integer(androidResources.raw.left))

        resourceUtil.addResource(gdResources.RIGHT, Integer(androidResources.raw.right))

        resourceUtil.addResource(gdResources.FIRE, Integer(androidResources.raw.fire))

        resourceUtil.addResource(gdResources.BG_2, Integer(androidResources.raw.bg_2))

        resourceUtil.addResource(gdResources.SPACESTATION_002, Integer(androidResources.raw.spacestation_002))

        resourceUtil.addResource(gdResources.BALACTIC_BACKGROUND_H_01_VH, Integer(androidResources.raw.balactic_background_h_01_vh))

        resourceUtil.addResource(gdResources.PLAYER_18_25_SPACE_SHIPS_46, Integer(androidResources.raw.player_18_25_space_ships_46))

        resourceUtil.addResource(gdResources.LASER, Integer(androidResources.raw.laser))

        resourceUtil.addResource(gdResources.BOMB, Integer(androidResources.raw.bomb))

        resourceUtil.addResource(gdResources.A18_25_SPACE_SHIPS_05, Integer(androidResources.raw.a18_25_space_ships_05))

        resourceUtil.addResource(gdResources.A18_25_SPACE_SHIPS_29, Integer(androidResources.raw.a18_25_space_ships_29))

        resourceUtil.addResource(gdResources.A18_25_SPACE_SHIPS_44, Integer(androidResources.raw.a18_25_space_ships_44))


        //resourceUtil.addResource(TestSound.getInstance()!!.getResource(), Integer(androidResources.raw.test))

        //resourceUtil.addResource(ExplosionResources.getInstance().EXPLOSION_60_RESOURCE, Integer(AndroidResources.raw.explosion_sprite_60_by_60))
    }

}

