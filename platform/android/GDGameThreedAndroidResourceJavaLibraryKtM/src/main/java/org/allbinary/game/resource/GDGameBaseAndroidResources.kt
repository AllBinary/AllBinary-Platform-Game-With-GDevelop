
        /* Generated Code Do Not Modify */
        package org.allbinary.game.resource




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.AndroidResources
import org.allbinary.data.resource.ResourceUtil
import org.allbinary.media.audio.GameYouLoseSound
import org.allbinary.media.audio.GameYouWinSound

open public class GDGameBaseAndroidResources
            : Object
         {
        
protected constructor ()
            : super()
        {
}


                @Throws(Exception::class)
            
    open fun init()
        //nullable = true from not(false or (false and true)) = true
{

    var resourceUtil: ResourceUtil = ResourceUtil.getInstance()!!


    var androidResources: AndroidResources = AndroidResources.getInstance()!!

}


                @Throws(Exception::class)
            
    open fun initImages(RESOURCES: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var RESOURCES = RESOURCES



                            throw Exception("No Impl")
}


    open fun init(RESOURCES: Array<String?>, ANDROID_RESOURCES: IntArray)
        //nullable = true from not(false or (false and false)) = true
{
var RESOURCES = RESOURCES
var ANDROID_RESOURCES = ANDROID_RESOURCES

    var resourceUtil: ResourceUtil = ResourceUtil.getInstance()!!





                        for (index in 0 until RESOURCES.size)

        {
resourceUtil!!.addResource(RESOURCES[index]!!, Integer(Integer.valueOf(ANDROID_RESOURCES[index]!!)))
}

}


}
                
            

