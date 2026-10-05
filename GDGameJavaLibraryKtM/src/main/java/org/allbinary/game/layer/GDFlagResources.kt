
        /*
                *  
                *  To change this template, choose Tools | Templates  and open the template in the editor.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.game.layer




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.layer.waypoint.FlagGameResources

open public class GDFlagResources : FlagGameResources {
        
companion object {
            
    private val SINGLETON: FlagGameResources = GDFlagResources()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: FlagGameResources{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDFlagResources.SINGLETON
}


        }
            private constructor (){

    var ROOT: String = "/gd_flag"


    var SMALL: String = "_64_by_64.png"


    var MEDIUM: String = SMALL


    var SIZE_FOUR: String = SMALL


    var SIZE_FIVE: String = SMALL


    var SIZE_SIX: String = SMALL


    var SIZE: Array<String?> = arrayOf(SMALL,MEDIUM,SIZE_FOUR,SIZE_FIVE,SIZE_SIX)

super.init(ROOT, SIZE)
this.NAME= "Player Waypoint"
}


}
                
            

