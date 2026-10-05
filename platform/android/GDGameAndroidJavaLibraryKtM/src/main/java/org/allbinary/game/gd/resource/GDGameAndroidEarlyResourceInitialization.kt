
        /* Generated Code Do Not Modify */
        package org.allbinary.game.gd.resource




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import java.io.InputStream
import org.allbinary.AndroidResources
import org.allbinary.data.resource.ResourceUtil
import org.allbinary.game.resource.ResourceInitialization
import org.allbinary.game.gd.resource.GDResources
import org.allbinary.media.audio.ErrorSound
import org.allbinary.media.audio.SelectSound
import org.allbinary.midlet.MidletIcon
import org.allbinary.util.BasicArrayList

open public class GDGameAndroidEarlyResourceInitialization : ResourceInitialization {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
                @Throws(Exception::class)
            
    open fun init()
        //nullable = true from not(false or (false and true)) = true
{
super.init()

    var resourceUtil: ResourceUtil = ResourceUtil.getInstance()!!


    var androidResources: AndroidResources = AndroidResources.getInstance()!!


    var gdResources: GDResources = GDResources.getInstance()!!

resourceUtil!!.addResource(MidletIcon.RESOURCE, Integer(Integer.valueOf(androidResources!!.drawable.gd_icon)))
resourceUtil!!.addResource(SelectSound.getInstance()!!.getResource(), Integer(Integer.valueOf(androidResources!!.raw.select)))
resourceUtil!!.addResource(ErrorSound.getInstance()!!.getResource(), Integer(Integer.valueOf(androidResources!!.raw.error)))
resourceUtil!!.addResource(gdResources!!.BLANK, Integer(Integer.valueOf(androidResources!!.raw.blank)))
resourceUtil!!.addResource(GDBombLaserretro003Sound.getInstance()!!.getResource(), Integer(Integer.valueOf(androidResources!!.raw.bomb_laserretro_003)))
resourceUtil!!.addResource(GDLowrandomSound.getInstance()!!.getResource(), Integer(Integer.valueOf(androidResources!!.raw.lowrandom)))
resourceUtil!!.addResource(GDLaserretro004Sound.getInstance()!!.getResource(), Integer(Integer.valueOf(androidResources!!.raw.laserretro_004)))
resourceUtil!!.addResource(GDRetroExplosionShort08Sound.getInstance()!!.getResource(), Integer(Integer.valueOf(androidResources!!.raw.retro_explosion_short_08)))
resourceUtil!!.addResource(GDRetroExplosionShort07Sound.getInstance()!!.getResource(), Integer(Integer.valueOf(androidResources!!.raw.retro_explosion_short_07)))
resourceUtil!!.addResource(GDRetroExplosionShort10Sound.getInstance()!!.getResource(), Integer(Integer.valueOf(androidResources!!.raw.retro_explosion_short_10)))
resourceUtil!!.addResource(GDTwotone2Sound.getInstance()!!.getResource(), Integer(Integer.valueOf(androidResources!!.raw.twotone2)))
resourceUtil!!.addResource(gdResources!!.BASE, Integer(Integer.valueOf(androidResources!!.raw.base)))
resourceUtil!!.addResource(gdResources!!.LEFT, Integer(Integer.valueOf(androidResources!!.raw.left)))
resourceUtil!!.addResource(gdResources!!.RIGHT, Integer(Integer.valueOf(androidResources!!.raw.right)))
resourceUtil!!.addResource(gdResources!!.FIRE, Integer(Integer.valueOf(androidResources!!.raw.fire)))
resourceUtil!!.addResource(gdResources!!.BG_2, Integer(Integer.valueOf(androidResources!!.raw.bg_2)))
resourceUtil!!.addResource(gdResources!!.SPACESTATION_002, Integer(Integer.valueOf(androidResources!!.raw.spacestation_002)))
resourceUtil!!.addResource(gdResources!!.BALACTIC_BACKGROUND_H_01_VH, Integer(Integer.valueOf(androidResources!!.raw.balactic_background_h_01_vh)))
resourceUtil!!.addResource(gdResources!!.PLAYER_18_25_SPACE_SHIPS_46, Integer(Integer.valueOf(androidResources!!.raw.player_18_25_space_ships_46)))
resourceUtil!!.addResource(gdResources!!.LASER, Integer(Integer.valueOf(androidResources!!.raw.laser)))
resourceUtil!!.addResource(gdResources!!.BOMB, Integer(Integer.valueOf(androidResources!!.raw.bomb)))
resourceUtil!!.addResource(gdResources!!.A18_25_SPACE_SHIPS_05, Integer(Integer.valueOf(androidResources!!.raw.a18_25_space_ships_05)))
resourceUtil!!.addResource(gdResources!!.A18_25_SPACE_SHIPS_29, Integer(Integer.valueOf(androidResources!!.raw.a18_25_space_ships_29)))
resourceUtil!!.addResource(gdResources!!.A18_25_SPACE_SHIPS_44, Integer(Integer.valueOf(androidResources!!.raw.a18_25_space_ships_44)))
}


}
                
            

