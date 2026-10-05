
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
        package org.allbinary.logic.system.security.licensing




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.logic.string.StringUtil

open public class ThirdPartyInApplicationPurchase
            : Object
        
                , ThirdPartyInApplicationPurchaseInterface {
        

            //Auto Generated
            public constructor() : super()
            {
            }            
        
    override fun isPurchased(lockableFeature: LockableFeature)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
var lockableFeature = lockableFeature



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


    override fun onCreate(anyType: Any, stateObject: Any)
        //nullable = true from not(false or (false and false)) = true
{
var anyType = anyType
var stateObject = stateObject
}


    override fun onDestroy()
        //nullable = true from not(false or (false and true)) = true
{
}


    override fun onStart()
        //nullable = true from not(false or (false and true)) = true
{
}


    override fun onActivityResult(requestCode: Int, resultCode: Int, dataObject: Any)
        //nullable = true from not(false or (false and false)) = true
{
    //var requestCode = requestCode
    //var resultCode = resultCode
    //var dataObject = dataObject
}


    override fun onSaveInstanceState(anyType: Any)
        //nullable = true from not(false or (false and false)) = true
{
var anyType = anyType
}


    override fun onStop()
        //nullable = true from not(false or (false and true)) = true
{
}


    override fun requestPurchase(lockableFeature: LockableFeature)
        //nullable = true from not(false or (false and false)) = true
{
var lockableFeature = lockableFeature
}


    override fun requestReceipts()
        //nullable = true from not(false or (false and true)) = true
{
}


    override fun add(lockableFeature: LockableFeature)
        //nullable = true from not(false or (false and false)) = true
{
var lockableFeature = lockableFeature
}


    override fun getUserName()
        //nullable = true from not(false or (false and true)) = true
: String{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return StringUtil.getInstance()!!.EMPTY_STRING
}


    override fun isEnabled()
        //nullable = true from not(false or (false and true)) = true
: Boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


    open fun requestProducts()
        //nullable = true from not(false or (false and true)) = true
{
}


}
                
            

