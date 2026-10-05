
        /*
                *  
                *  To change this template, choose Tools | Templates  and open the template in the editor.  
        */
        
        /* Generated Code Do Not Modify */
        package playn.core




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.canvas.Processor
import org.allbinary.game.gd.resource.GDLazyResources
import org.allbinary.game.gd.resource.GDResources
import org.allbinary.graphics.canvas.transition.progress.ProgressCanvasFactory
import org.allbinary.image.ImageCache
import org.allbinary.image.ImageCacheFactory
import org.allbinary.input.motion.button.TouchScreenFactory
import org.allbinary.playn.processors.GameHtmlHasLoadedResourcesProcessor
import org.allbinary.playn.processors.GameHtmlLoadResourcesProcessor
import org.allbinary.playn.processors.MidletStartupProcessor
import org.allbinary.util.BasicArrayList

open public class GDGameProcessor : Processor {
        

    private val list: BasicArrayList
public constructor (list: BasicArrayList){
    //var list = list
this.list= list
}


                @Throws(Exception::class)
            
    override fun process()
        //nullable = true from not(false or (false and true)) = true
{
this.list.removeAt(0)

    
                        if(TouchScreenFactory.getInstance()!!.isTouch())
                        
                                    {
                                    
    var imageCache: ImageCache = ImageCacheFactory.getInstance()!!


    var gdResources: GDResources = GDResources.getInstance()!!


    var gdLazyResources: GDLazyResources = GDLazyResources.getInstance()!!


    var resourceStringArray: Array<String?> = gdLazyResources!!.requiredResourcesBeforeLoadingArray


    
                        if(imageCache!!.isLazy())
                        
                                    {
                                    
                                    }
                                
                        else {
                            resourceStringArray= gdResources!!.resourceStringArray

                        }
                            
this.list.add(GameHtmlLoadResourcesProcessor(this.list, resourceStringArray))

    var gameHtmlHasLoadedResourcesProcessor: Processor = GameHtmlHasLoadedResourcesProcessor(this.list, resourceStringArray)

this.list.add(gameHtmlHasLoadedResourcesProcessor)

                                    }
                                
this.list.add(MidletStartupProcessor(this.list))
ProgressCanvasFactory.getInstance()!!.addNormalPortion(10, "Loading")
}


}
                
            

