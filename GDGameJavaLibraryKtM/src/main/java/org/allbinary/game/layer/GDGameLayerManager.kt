
        /*
                * 
                *  AllBinary Open License Version 1
                *  Copyright (c) 2011 AllBinary
                *  
                *  By agreeing to this license you and any business entity you represent are
                *  legally bound to the AllBinary Open License Version 1 legal agreement.
                *  
                *  You may obtain the AllBinary Open License Version 1 legal agreement from
                *  AllBinary or the root directory of AllBinary's AllBinary Platform repository.
                *  
                *  Created By: Travis Berthelot   
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.game.layer




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.GameInfo
import org.allbinary.graphics.color.BasicColor
import org.allbinary.layer.AllBinaryLayer
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.string.CommonStrings
import org.allbinary.media.graphics.geography.map.BasicGeographicMap
import org.allbinary.media.graphics.geography.map.GeographicMapCellType
import org.allbinary.media.graphics.geography.map.GeographicMapCompositeInterface
import org.allbinary.media.graphics.geography.map.GeographicMapEventHandler

open public class GDGameLayerManager : AllBinaryGameLayerManager
                , GeographicMapCompositeInterface {
        
companion object {
            
    var MAX_LEVEL: Int = 7

        }
            
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private var geographicMapInterfaceArray: Array<BasicGeographicMap?> = BasicGeographicMap.NULL_BASIC_GEOGRAPHIC_MAP_ARRAY

    private var geographicMapCellTypeArray: Array<GeographicMapCellType?> = GeographicMapCellType.NULL_GEOGRAPHIC_MAP_CELL_TYPE_ARRAY

    var layout: Int = 0
public constructor (backgroundBasicColor: BasicColor, foregroundBasicColor: BasicColor, gameInfo: GameInfo)                        

                            : super(backgroundBasicColor, foregroundBasicColor, gameInfo){
    //var backgroundBasicColor = backgroundBasicColor
    //var foregroundBasicColor = foregroundBasicColor
    //var gameInfo = gameInfo


                            //For kotlin this is before the body of the constructor.
                    
}


                @Throws(Exception::class)
            
    override fun remove(layerInterface: AllBinaryLayer)
        //nullable = true from not(false or (false and false)) = true
{
    //var layerInterface = layerInterface

    
                        if(layerInterface == 
                                    null
                                )
                        
                                    {
                                    this.logUtil!!.putF("Remove: null", this, "remove")



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                
super.remove(layerInterface)
}


    override fun getGeographicMapInterface()
        //nullable = true from not(false or (false and true)) = true
: Array<BasicGeographicMap?>{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.geographicMapInterfaceArray
}


    override fun setGeographicMapInterface(geographicMapInterfaceArray: Array<BasicGeographicMap?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var geographicMapInterfaceArray = geographicMapInterfaceArray

    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

this.logUtil!!.putF(commonStrings!!.START +this, this, commonStrings!!.PROCESS)
this.geographicMapInterfaceArray= geographicMapInterfaceArray
this.geographicMapCellTypeArray= arrayOfNulls(this.geographicMapInterfaceArray!!.size)

    var geographicMapEventHandler: GeographicMapEventHandler = GeographicMapEventHandler.getInstance()!!

geographicMapEventHandler!!.fireEvent()
geographicMapEventHandler!!.removeAllListeners()
}


    override fun geographicMapCellTypeArray()
        //nullable = true from not(false or (false and true)) = true
: Array<GeographicMapCellType?>{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.geographicMapCellTypeArray
}


}
                
            

