
        /* Generated Code Do Not Modify */

        


            import { Object } from 'java/lang/Object.js';
        
            import { System } from 'java/lang/System.js';
        
//not plain js import { MyRandomFactory } 
const MyRandomFactory = globalThis.org.allbinary.game.rand.MyRandomFactory;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

//not plain js import { BasicArrayListD } 
const BasicArrayListD = globalThis.org.allbinary.util.BasicArrayListD;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        
export class NewMain
            extends Object
         {
        

    public static main(args: string[]){

    var ADULTREDDRAGONMASKENEMY: string = "AdultRedDragonMaskEnemy";;
    

    var ANCIENTBLACKDRAGONENEMY: string = "AncientBlackDragonEnemy";;
    

    var CYCLOPSENEMY: string = "CyclopsEnemy";;
    

    var DEATHKNIGHTENEMY: string = "DeathKnightEnemy";;
    

    var DEMONENEMY: string = "DemonEnemy";;
    

    var DRYADENEMY: string = "DryadEnemy";;
    

    var EFREETENEMY: string = "EfreetEnemy";;
    

    var FAERIEDRAGONENEMY: string = "FaerieDragonEnemy";;
    

    var FROSTGIANTENEMY: string = "FrostGiantEnemy";;
    

    var MANTICOREBISHOPENEMY: string = "ManticoreBishopEnemy";;
    

    var OGREENEMY: string = "OgreEnemy";;
    

    var OWLBEARENEMY: string = "OwlBearEnemy";;
    

    var PLANETARENEMY: string = "PlanetarEnemy";;
    

    var YOUNGGREENDRAGONENEMY: string = "YoungGreenDragonEnemy";;
    

    var BATMASKENEMY: string = "BatMaskEnemy";;
    

    var BHEURHAGENEMY: string = "BheurhagEnemy";;
    

    var BLEMMYAEENEMY: string = "BlemmyaeEnemy";;
    

    var BLUEWYRMLINGENEMY: string = "BluewyrmlingEnemy";;
    

    var DISPLACERBEASTENEMY: string = "DisplacerBeastEnemy";;
    

    var ELDERSNAILENEMY: string = "ElderSnailEnemy";;
    

    var FIDDLEDOGENEMY: string = "FiddleDogEnemy";;
    

    var FROSTSALAMANDERENEMY: string = "FrostSalamanderEnemy";;
    

    var GOBLINENEMY: string = "GoblinEnemy";;
    

    var GOGENEMY: string = "GogEnemy";;
    

    var GRIFFINENEMY: string = "GriffinEnemy";;
    

    var HELLHOUNDENEMY: string = "HellHoundEnemy";;
    

    var ICEGOLEMENEMY: string = "IceGolemEnemy";;
    

    var IMPENEMY: string = "ImpEnemy";;
    

    var LICHENEMY: string = "LichEnemy";;
    

    var ORCENEMY: string = "OrcEnemy";;
    

    var PALADINENEMY: string = "PaladinEnemy";;
    

    var PEASANTENEMY: string = "PeasantEnemy";;
    

    var PIXIEENEMY: string = "PixieEnemy";;
    

    var RABBITSOLDIERENEMY: string = "RabbitsoldierEnemy";;
    

    var REDCAPENEMY: string = "RedcapEnemy";;
    

    var SATYRENEMY: string = "SatyrEnemy";;
    

    var SKELETONENEMY: string = "SkeletonEnemy";;
    

    var SKELETONWARRIORENEMY: string = "SkeletonWarriorEnemy";;
    

    var VAMPIREENEMY: string = "VampireEnemy";;
    

    var WIZARDENEMY: string = "WizardEnemy";;
    

    var WOLFRIDERENEMY: string = "WolfRiderEnemy";;
    

    var enemyArray: string[] = 
                                                        [
                                                            ADULTREDDRAGONMASKENEMY,ANCIENTBLACKDRAGONENEMY,CYCLOPSENEMY,DEATHKNIGHTENEMY,DEMONENEMY,DRYADENEMY,EFREETENEMY,FAERIEDRAGONENEMY,FROSTGIANTENEMY,MANTICOREBISHOPENEMY,OGREENEMY,OWLBEARENEMY,PLANETARENEMY,YOUNGGREENDRAGONENEMY,BATMASKENEMY,BHEURHAGENEMY,BLEMMYAEENEMY,BLUEWYRMLINGENEMY,DISPLACERBEASTENEMY,ELDERSNAILENEMY,FIDDLEDOGENEMY,FROSTSALAMANDERENEMY,GOBLINENEMY,GOGENEMY,GRIFFINENEMY,HELLHOUNDENEMY,ICEGOLEMENEMY,IMPENEMY,LICHENEMY,ORCENEMY,PALADINENEMY,PEASANTENEMY,PIXIEENEMY,RABBITSOLDIERENEMY,REDCAPENEMY,SATYRENEMY,SKELETONENEMY,SKELETONWARRIORENEMY,VAMPIREENEMY,WIZARDENEMY,WOLFRIDERENEMY
                                                        ];;
    

    var enemySize2Array: string[] = 
                                                        [
                                                            BATMASKENEMY,BHEURHAGENEMY,BLEMMYAEENEMY,BLUEWYRMLINGENEMY,DISPLACERBEASTENEMY,ELDERSNAILENEMY,FIDDLEDOGENEMY,FROSTSALAMANDERENEMY,GOBLINENEMY,GOGENEMY,GRIFFINENEMY,HELLHOUNDENEMY,ICEGOLEMENEMY,IMPENEMY,LICHENEMY,ORCENEMY,PALADINENEMY,PEASANTENEMY,PIXIEENEMY,RABBITSOLDIERENEMY,REDCAPENEMY,SATYRENEMY,SKELETONENEMY,SKELETONWARRIORENEMY,VAMPIREENEMY,WIZARDENEMY,WOLFRIDERENEMY
                                                        ];;
    

    var enemySize3Array: string[] = 
                                                        [
                                                            ADULTREDDRAGONMASKENEMY,ANCIENTBLACKDRAGONENEMY,CYCLOPSENEMY,DEATHKNIGHTENEMY,DEMONENEMY,DRYADENEMY,EFREETENEMY,FAERIEDRAGONENEMY,FROSTGIANTENEMY,MANTICOREBISHOPENEMY,OGREENEMY,OWLBEARENEMY,PLANETARENEMY,YOUNGGREENDRAGONENEMY
                                                        ];;
    

    var enemyReduced: number = enemySize3Array!.length
                ;;
    

    var enemyMinimum: number = enemySize3Array!.length
                ;;
    

    var list: BasicArrayList = new BasicArrayListD();;
    

    var countArray: number[] = new Array(enemyArray!.length);;
    

    var enemyExclusionRatio: number = 14;;
    




                        for (
    var index3: number = 0;index3 < 1000; index3++)
        {
MyRandomFactory.getInstance()!.setSeed(Date.now());
    




                        for (
    var index: number = 0;index < 100; index++)
        {

    var index2: number = enemyMinimum +MyRandomFactory.getInstance()!.getAbsoluteNextInt((enemyArray!.length -1 -enemyReduced) +1) /enemyExclusionRatio *enemyExclusionRatio;;
    

    var enemy: string = enemyArray[index2]!;;
    

                        if(list.contains(enemy))
                        
                                    {
                                    countArray[list.indexOf(enemy)]++;
    

                                    }
                                
                        else {
                            list.add(enemy);
    
countArray[list.indexOf(enemy)]++;
    

                        }
                            
}


    var size: number = list.size()!;;
    




                        for (
    var index: number = 0;index < size; index++)
        {
console.log(list.get(index));
    
console.log(countArray[index]!);
    
}

console.log();
    
list.clear();
    
countArray= new Array(enemyArray!.length);
    
}

}


}



