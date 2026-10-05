
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2026 AllBinary 
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
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.logic.string.StringMaker
import org.allbinary.string.CommonSeps
import org.allbinary.util.BasicArrayList
import org.allbinary.util.BasicArrayListD

open public class GDGameInfo
            : Object
         {
        

    var layoutTotal: Int= 0

    val externalLayoutsTotalPerLayoutPositionList: BasicArrayList = BasicArrayListD()

    val externalLayoutsIndexPerLayoutPositionList: BasicArrayList = BasicArrayListD()

    val instanceTotalPerLayoutPositionList: BasicArrayList = BasicArrayListD()

    val instanceTotalPerExternalLayoutPositionList: BasicArrayList = BasicArrayListD()
public constructor ()
            : super()
        {
}


    open fun getExternalLayoutTotal(layoutIndex: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var layoutIndex = layoutIndex

    var integer: Integer = this.externalLayoutsTotalPerLayoutPositionList!!.get(layoutIndex) as Integer




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return integer.toInt()
}


    open fun getExternalLayoutIndex(layoutIndex: Int, atIndex: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var layoutIndex = layoutIndex
    //var atIndex = atIndex

    var externalLayoutIndexList: BasicArrayList = this.externalLayoutsIndexPerLayoutPositionList!!.get(layoutIndex) as BasicArrayList


    var integer: Integer = externalLayoutIndexList!!.get(atIndex) as Integer




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return integer.toInt()
}


    open fun getLayoutInstanceTotal(layoutIndex: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var layoutIndex = layoutIndex

    var integer: Integer = this.instanceTotalPerLayoutPositionList!!.get(layoutIndex) as Integer




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return integer.toInt()
}


    open fun getExternalLayoutInstanceTotal(externalLayoutIndex: Int)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var externalLayoutIndex = externalLayoutIndex

    var integer: Integer = this.instanceTotalPerExternalLayoutPositionList!!.get(externalLayoutIndex) as Integer




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return integer.toInt()
}


    override fun toString()
        //nullable =  from not(false or (true and true)) = 
: String{

    var LAYOUT: String = "layout at: "


    var WITH: String = " with externalLayouts: "


    var AT_INDEX: String = " at index: "


    var INSTANCE_TOTAL: String = " instanceTotal: "


    var commonSeps: CommonSeps = CommonSeps.getInstance()!!


    var stringMaker: StringMaker = StringMaker()

stringMaker!!.append("layoutTotal: ")!!.appendint(this.layoutTotal)

    var size: Int = this.externalLayoutsTotalPerLayoutPositionList!!.size()!!


    var externalLayoutTotal: Integer


    var externalLayoutIndexList: BasicArrayList


    var externalLayoutIndex: Int= 0





                        for (index in 0 until size)

        {
externalLayoutTotal= this.externalLayoutsTotalPerLayoutPositionList!!.get(index) as Integer
stringMaker!!.append(commonSeps!!.NEW_LINE)!!.append(LAYOUT)!!.appendint(index)!!.append(WITH)!!.append(externalLayoutTotal!!.toString())!!.append(INSTANCE_TOTAL)!!.appendint(this.getLayoutInstanceTotal(index))
externalLayoutIndexList= this.externalLayoutsIndexPerLayoutPositionList!!.get(index) as BasicArrayList

    var size2: Int = externalLayoutIndexList!!.size()!!





                        for (indexListIndex in 0 until size2)

        {
externalLayoutIndex= get = externalLayoutIndexList!!.get(indexListIndex)get as Integer
get.
                    toInt()
stringMaker!!.append(AT_INDEX)!!.appendint(externalLayoutIndex)!!.append(INSTANCE_TOTAL)!!.appendint(this.getExternalLayoutInstanceTotal(externalLayoutIndex))
}

}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringMaker!!.toString()
}


}
                
            

