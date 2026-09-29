/* Generated Code Do Not Modify */
import { Object } from 'java/lang/Object.js';
//not plain js import { MyRandomFactory } 
const MyRandomFactory = globalThis.org.allbinary.game.rand.MyRandomFactory;
//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;
//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;
//Current folder imports from return types, extended types, and scope (deduplicated)
export class NewMain extends Object {
    static main(args) {
        var ADULTREDDRAGONMASKENEMY = "AdultRedDragonMaskEnemy";
        ;
        var ANCIENTBLACKDRAGONENEMY = "AncientBlackDragonEnemy";
        ;
        var CYCLOPSENEMY = "CyclopsEnemy";
        ;
        var DEATHKNIGHTENEMY = "DeathKnightEnemy";
        ;
        var DEMONENEMY = "DemonEnemy";
        ;
        var DRYADENEMY = "DryadEnemy";
        ;
        var EFREETENEMY = "EfreetEnemy";
        ;
        var FAERIEDRAGONENEMY = "FaerieDragonEnemy";
        ;
        var FROSTGIANTENEMY = "FrostGiantEnemy";
        ;
        var MANTICOREBISHOPENEMY = "ManticoreBishopEnemy";
        ;
        var OGREENEMY = "OgreEnemy";
        ;
        var OWLBEARENEMY = "OwlBearEnemy";
        ;
        var PLANETARENEMY = "PlanetarEnemy";
        ;
        var YOUNGGREENDRAGONENEMY = "YoungGreenDragonEnemy";
        ;
        var BATMASKENEMY = "BatMaskEnemy";
        ;
        var BHEURHAGENEMY = "BheurhagEnemy";
        ;
        var BLEMMYAEENEMY = "BlemmyaeEnemy";
        ;
        var BLUEWYRMLINGENEMY = "BluewyrmlingEnemy";
        ;
        var DISPLACERBEASTENEMY = "DisplacerBeastEnemy";
        ;
        var ELDERSNAILENEMY = "ElderSnailEnemy";
        ;
        var FIDDLEDOGENEMY = "FiddleDogEnemy";
        ;
        var FROSTSALAMANDERENEMY = "FrostSalamanderEnemy";
        ;
        var GOBLINENEMY = "GoblinEnemy";
        ;
        var GOGENEMY = "GogEnemy";
        ;
        var GRIFFINENEMY = "GriffinEnemy";
        ;
        var HELLHOUNDENEMY = "HellHoundEnemy";
        ;
        var ICEGOLEMENEMY = "IceGolemEnemy";
        ;
        var IMPENEMY = "ImpEnemy";
        ;
        var LICHENEMY = "LichEnemy";
        ;
        var ORCENEMY = "OrcEnemy";
        ;
        var PALADINENEMY = "PaladinEnemy";
        ;
        var PEASANTENEMY = "PeasantEnemy";
        ;
        var PIXIEENEMY = "PixieEnemy";
        ;
        var RABBITSOLDIERENEMY = "RabbitsoldierEnemy";
        ;
        var REDCAPENEMY = "RedcapEnemy";
        ;
        var SATYRENEMY = "SatyrEnemy";
        ;
        var SKELETONENEMY = "SkeletonEnemy";
        ;
        var SKELETONWARRIORENEMY = "SkeletonWarriorEnemy";
        ;
        var VAMPIREENEMY = "VampireEnemy";
        ;
        var WIZARDENEMY = "WizardEnemy";
        ;
        var WOLFRIDERENEMY = "WolfRiderEnemy";
        ;
        var enemyArray = [
            ADULTREDDRAGONMASKENEMY, ANCIENTBLACKDRAGONENEMY, CYCLOPSENEMY, DEATHKNIGHTENEMY, DEMONENEMY, DRYADENEMY, EFREETENEMY, FAERIEDRAGONENEMY, FROSTGIANTENEMY, MANTICOREBISHOPENEMY, OGREENEMY, OWLBEARENEMY, PLANETARENEMY, YOUNGGREENDRAGONENEMY, BATMASKENEMY, BHEURHAGENEMY, BLEMMYAEENEMY, BLUEWYRMLINGENEMY, DISPLACERBEASTENEMY, ELDERSNAILENEMY, FIDDLEDOGENEMY, FROSTSALAMANDERENEMY, GOBLINENEMY, GOGENEMY, GRIFFINENEMY, HELLHOUNDENEMY, ICEGOLEMENEMY, IMPENEMY, LICHENEMY, ORCENEMY, PALADINENEMY, PEASANTENEMY, PIXIEENEMY, RABBITSOLDIERENEMY, REDCAPENEMY, SATYRENEMY, SKELETONENEMY, SKELETONWARRIORENEMY, VAMPIREENEMY, WIZARDENEMY, WOLFRIDERENEMY
        ];
        ;
        var enemySize2Array = [
            BATMASKENEMY, BHEURHAGENEMY, BLEMMYAEENEMY, BLUEWYRMLINGENEMY, DISPLACERBEASTENEMY, ELDERSNAILENEMY, FIDDLEDOGENEMY, FROSTSALAMANDERENEMY, GOBLINENEMY, GOGENEMY, GRIFFINENEMY, HELLHOUNDENEMY, ICEGOLEMENEMY, IMPENEMY, LICHENEMY, ORCENEMY, PALADINENEMY, PEASANTENEMY, PIXIEENEMY, RABBITSOLDIERENEMY, REDCAPENEMY, SATYRENEMY, SKELETONENEMY, SKELETONWARRIORENEMY, VAMPIREENEMY, WIZARDENEMY, WOLFRIDERENEMY
        ];
        ;
        var enemySize3Array = [
            ADULTREDDRAGONMASKENEMY, ANCIENTBLACKDRAGONENEMY, CYCLOPSENEMY, DEATHKNIGHTENEMY, DEMONENEMY, DRYADENEMY, EFREETENEMY, FAERIEDRAGONENEMY, FROSTGIANTENEMY, MANTICOREBISHOPENEMY, OGREENEMY, OWLBEARENEMY, PLANETARENEMY, YOUNGGREENDRAGONENEMY
        ];
        ;
        var enemyReduced = enemySize3Array.length;
        ;
        var enemyMinimum = enemySize3Array.length;
        ;
        var list = new BasicArrayListD();
        ;
        var countArray = new Array(enemyArray.length);
        ;
        var enemyExclusionRatio = 14;
        ;
        for (var index3 = 0; index3 < 1000; index3++) {
            MyRandomFactory.getInstance().setSeed(Date.now());
            for (var index = 0; index < 100; index++) {
                var index2 = enemyMinimum + MyRandomFactory.getInstance().getAbsoluteNextInt((enemyArray.length - 1 - enemyReduced) + 1) / enemyExclusionRatio * enemyExclusionRatio;
                ;
                var enemy = enemyArray[index2];
                ;
                if (list.contains(enemy)) {
                    countArray[list.indexOf(enemy)]++;
                }
                else {
                    list.add(enemy);
                    countArray[list.indexOf(enemy)]++;
                }
            }
            var size = list.size();
            ;
            for (var index = 0; index < size; index++) {
                console.log(list.get(index));
                console.log(countArray[index]);
            }
            console.log();
            list.clear();
            countArray = new Array(enemyArray.length);
        }
    }
}
