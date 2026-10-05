
        /*
                *  
                *  To change this template, choose Tools | Templates  and open the template in the editor.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.game.layer




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.animation.AnimationInterfaceFactoryInterface
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.animation.NullRotationAnimationFactory
import org.allbinary.animation.ProceduralAnimationInterfaceFactoryInterface
import org.allbinary.game.identification.Group
import org.allbinary.game.layer.special.GDConditionWithGroupActions
import org.allbinary.game.layout.GDObject
import org.allbinary.graphics.Rectangle
import org.allbinary.graphics.RectangleFactory
import org.allbinary.layer.AllBinaryLayer
import org.allbinary.layer.LayerInterfaceFactoryInterface
import org.allbinary.util.ABHashtable
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDFlagLayerInterfaceFactory
            : Object
        
                , LayerInterfaceFactoryInterface {
        
companion object {
            
    private val instance: GDFlagLayerInterfaceFactory = GDFlagLayerInterfaceFactory()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDFlagLayerInterfaceFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDFlagLayerInterfaceFactory.instance
}


    private val NAME: String = "GDFlagLayerInterfaceFactory"

        }
            
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private var index: Int = 0
private constructor ()
            : super()
        {
}


                @Throws(Exception::class)
            
    override fun getNextInstance(hashtable: ABHashtable, x: Int, y: Int, z: Int)
        //nullable = true from not(false or (false and false)) = true
: AllBinaryLayer{
    //var hashtable = hashtable
    //var x = x
    //var y = y
    //var z = z

    var gameLayerList: BasicArrayList = BasicArrayListD()


    var gameLayerDestroyedList: BasicArrayList = BasicArrayListD()


    var behaviorList: BasicArrayList = BasicArrayListD()


    var groupInterface: Array<Group?> = arrayOf()


    var animationInterfaceFactoryInterfaceArray: Array<AnimationInterfaceFactoryInterface?> = arrayOf(NullRotationAnimationFactory.getFactoryInstance())


    var proceduralAnimationInterfaceFactoryInterfaceArray: Array<ProceduralAnimationInterfaceFactoryInterface?> = arrayOf(NullRotationAnimationFactory.getFactoryInstance())


    var layerInfo: Rectangle = RectangleFactory.SINGLETON


    var rectangleArrayOfArrays: Array<Array<Rectangle?>?> = Array(0) { arrayOfNulls<Rectangle?>(0) }
                                                            


    var gameLayerFactory: GDGameLayerFactory = GDGameLayerFactory(gameLayerList, gameLayerDestroyedList, groupInterface, behaviorList, animationInterfaceFactoryInterfaceArray, proceduralAnimationInterfaceFactoryInterfaceArray, layerInfo, rectangleArrayOfArrays, false)


    var gdObject: GDObject = GDObject(0, 0, GDFlagLayerInterfaceFactory.NAME, 
                            null)

gdObject!!.set(
                            null, x, y, z)

    var layer: GDGameLayer = gameLayerFactory!!.create( -1, GDFlagLayerInterfaceFactory.NAME, gdObject, 0, 0, GDConditionWithGroupActions())!!

layer.setAllBinaryGameLayerManager(hashtable.get(AllBinaryGameLayerManager.ID) as AllBinaryGameLayerManager)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return layer
}


}
                
            

