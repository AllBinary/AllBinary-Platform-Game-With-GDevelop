
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
        

interface ThirdPartyInApplicationPurchaseInterface {
        

    open fun isPurchased(lockableFeature: LockableFeature)
        //nullable = true from not(false or (false and false)) = true
: Boolean

    open fun onCreate(anyType: Any, stateObject: Any)
        //nullable = true from not(false or (false and false)) = true


    open fun onDestroy()
        //nullable = true from not(false or (false and true)) = true


    open fun onStart()
        //nullable = true from not(false or (false and true)) = true


    open fun onActivityResult(requestCode: Int, resultCode: Int, dataObject: Any)
        //nullable = true from not(false or (false and false)) = true


    open fun onSaveInstanceState(anyType: Any)
        //nullable = true from not(false or (false and false)) = true


    open fun onStop()
        //nullable = true from not(false or (false and true)) = true


    open fun requestPurchase(lockableFeature: LockableFeature)
        //nullable = true from not(false or (false and false)) = true


    open fun requestReceipts()
        //nullable = true from not(false or (false and true)) = true


    open fun add(lockableFeature: LockableFeature)
        //nullable = true from not(false or (false and false)) = true


    open fun getUserName()
        //nullable = true from not(false or (false and true)) = true
: String

    open fun isEnabled()
        //nullable = true from not(false or (false and true)) = true
: Boolean

}
                
            

