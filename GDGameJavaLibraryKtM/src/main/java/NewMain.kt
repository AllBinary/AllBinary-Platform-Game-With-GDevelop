
        /* Generated Code Do Not Modify */
        



        import java.lang.Object        
        
        import java.lang.System
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.rand.MyRandomFactory
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class NewMain
            : Object
         {
        
companion object {
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args

    var ADULTREDDRAGONMASKENEMY: String = "AdultRedDragonMaskEnemy"


    var ANCIENTBLACKDRAGONENEMY: String = "AncientBlackDragonEnemy"


    var CYCLOPSENEMY: String = "CyclopsEnemy"


    var DEATHKNIGHTENEMY: String = "DeathKnightEnemy"


    var DEMONENEMY: String = "DemonEnemy"


    var DRYADENEMY: String = "DryadEnemy"


    var EFREETENEMY: String = "EfreetEnemy"


    var FAERIEDRAGONENEMY: String = "FaerieDragonEnemy"


    var FROSTGIANTENEMY: String = "FrostGiantEnemy"


    var MANTICOREBISHOPENEMY: String = "ManticoreBishopEnemy"


    var OGREENEMY: String = "OgreEnemy"


    var OWLBEARENEMY: String = "OwlBearEnemy"


    var PLANETARENEMY: String = "PlanetarEnemy"


    var YOUNGGREENDRAGONENEMY: String = "YoungGreenDragonEnemy"


    var BATMASKENEMY: String = "BatMaskEnemy"


    var BHEURHAGENEMY: String = "BheurhagEnemy"


    var BLEMMYAEENEMY: String = "BlemmyaeEnemy"


    var BLUEWYRMLINGENEMY: String = "BluewyrmlingEnemy"


    var DISPLACERBEASTENEMY: String = "DisplacerBeastEnemy"


    var ELDERSNAILENEMY: String = "ElderSnailEnemy"


    var FIDDLEDOGENEMY: String = "FiddleDogEnemy"


    var FROSTSALAMANDERENEMY: String = "FrostSalamanderEnemy"


    var GOBLINENEMY: String = "GoblinEnemy"


    var GOGENEMY: String = "GogEnemy"


    var GRIFFINENEMY: String = "GriffinEnemy"


    var HELLHOUNDENEMY: String = "HellHoundEnemy"


    var ICEGOLEMENEMY: String = "IceGolemEnemy"


    var IMPENEMY: String = "ImpEnemy"


    var LICHENEMY: String = "LichEnemy"


    var ORCENEMY: String = "OrcEnemy"


    var PALADINENEMY: String = "PaladinEnemy"


    var PEASANTENEMY: String = "PeasantEnemy"


    var PIXIEENEMY: String = "PixieEnemy"


    var RABBITSOLDIERENEMY: String = "RabbitsoldierEnemy"


    var REDCAPENEMY: String = "RedcapEnemy"


    var SATYRENEMY: String = "SatyrEnemy"


    var SKELETONENEMY: String = "SkeletonEnemy"


    var SKELETONWARRIORENEMY: String = "SkeletonWarriorEnemy"


    var VAMPIREENEMY: String = "VampireEnemy"


    var WIZARDENEMY: String = "WizardEnemy"


    var WOLFRIDERENEMY: String = "WolfRiderEnemy"


    var enemyArray: Array<String?> = arrayOf(ADULTREDDRAGONMASKENEMY,ANCIENTBLACKDRAGONENEMY,CYCLOPSENEMY,DEATHKNIGHTENEMY,DEMONENEMY,DRYADENEMY,EFREETENEMY,FAERIEDRAGONENEMY,FROSTGIANTENEMY,MANTICOREBISHOPENEMY,OGREENEMY,OWLBEARENEMY,PLANETARENEMY,YOUNGGREENDRAGONENEMY,BATMASKENEMY,BHEURHAGENEMY,BLEMMYAEENEMY,BLUEWYRMLINGENEMY,DISPLACERBEASTENEMY,ELDERSNAILENEMY,FIDDLEDOGENEMY,FROSTSALAMANDERENEMY,GOBLINENEMY,GOGENEMY,GRIFFINENEMY,HELLHOUNDENEMY,ICEGOLEMENEMY,IMPENEMY,LICHENEMY,ORCENEMY,PALADINENEMY,PEASANTENEMY,PIXIEENEMY,RABBITSOLDIERENEMY,REDCAPENEMY,SATYRENEMY,SKELETONENEMY,SKELETONWARRIORENEMY,VAMPIREENEMY,WIZARDENEMY,WOLFRIDERENEMY)


    var enemySize2Array: Array<String?> = arrayOf(BATMASKENEMY,BHEURHAGENEMY,BLEMMYAEENEMY,BLUEWYRMLINGENEMY,DISPLACERBEASTENEMY,ELDERSNAILENEMY,FIDDLEDOGENEMY,FROSTSALAMANDERENEMY,GOBLINENEMY,GOGENEMY,GRIFFINENEMY,HELLHOUNDENEMY,ICEGOLEMENEMY,IMPENEMY,LICHENEMY,ORCENEMY,PALADINENEMY,PEASANTENEMY,PIXIEENEMY,RABBITSOLDIERENEMY,REDCAPENEMY,SATYRENEMY,SKELETONENEMY,SKELETONWARRIORENEMY,VAMPIREENEMY,WIZARDENEMY,WOLFRIDERENEMY)


    var enemySize3Array: Array<String?> = arrayOf(ADULTREDDRAGONMASKENEMY,ANCIENTBLACKDRAGONENEMY,CYCLOPSENEMY,DEATHKNIGHTENEMY,DEMONENEMY,DRYADENEMY,EFREETENEMY,FAERIEDRAGONENEMY,FROSTGIANTENEMY,MANTICOREBISHOPENEMY,OGREENEMY,OWLBEARENEMY,PLANETARENEMY,YOUNGGREENDRAGONENEMY)


    var enemyReduced: Int = enemySize3Array!!.size
                


    var enemyMinimum: Int = enemySize3Array!!.size
                


    var list: BasicArrayList = BasicArrayListD()


    var countArray: IntArray = IntArray(enemyArray!!.size)


    var enemyExclusionRatio: Int = 14





                        for (index3 in 0 until 1000)

        {
MyRandomFactory.getInstance()!!.setSeed(System.currentTimeMillis())




                        for (index in 0 until 100)

        {

    var index2: Int = enemyMinimum +MyRandomFactory.getInstance()!!.getAbsoluteNextInt((enemyArray!!.size -1 -enemyReduced) +1) /enemyExclusionRatio *enemyExclusionRatio


    var enemy: String = enemyArray[index2]!!


    
                        if(list.contains(enemy))
                        
                                    {
                                    countArray[list.indexOf(enemy)]++

                                    }
                                
                        else {
                            list.add(enemy)
countArray[list.indexOf(enemy)]++

                        }
                            
}


    var size: Int = list.size()!!





                        for (index in 0 until size)

        {
System.out.print(list.get(index))
System.out.println(countArray[index]!!)
}

System.out.println()
list.clear()
countArray= IntArray(enemyArray!!.size)
}

}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
}
                
            

