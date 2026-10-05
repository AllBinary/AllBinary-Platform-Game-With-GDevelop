
        /*
                *  
                *  To change this license header, choose License Headers in Project Properties. 
                *  To change this template file, choose Tools | Templates  and open the template in the editor.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.logic.system.security.licensing




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.logic.string.StringUtil

open public class InApplicationPurchaseFactory
            : Object
         {
        
companion object {
            
    private val instance: InApplicationPurchaseFactory = InApplicationPurchaseFactory()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: InApplicationPurchaseFactory{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return InApplicationPurchaseFactory.instance
}


        }
            private constructor ()
            : super()
        {
}


    open fun init(anyType: Any, stateObject: Any)
        //nullable = true from not(false or (false and false)) = true
{
var anyType = anyType
var stateObject = stateObject
}


    open fun onCreate(anyType: Any, stateObject: Any)
        //nullable = true from not(false or (false and false)) = true
{
var anyType = anyType
var stateObject = stateObject
}


    open fun onStart()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun onResult(requestCode: Int, resultCode: Int, data: Any)
        //nullable = true from not(false or (false and false)) = true
{
    //var requestCode = requestCode
    //var resultCode = resultCode
    //var data = data
}


    open fun onSaveState(anyType: Any)
        //nullable = true from not(false or (false and false)) = true
{
    //var anyType = anyType
}


    open fun onStop()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun onDestroy()
        //nullable = true from not(false or (false and true)) = true
{
}


    open fun purchase(lockableFeature: LockableFeature)
        //nullable = true from not(false or (false and false)) = true
{
var lockableFeature = lockableFeature
}


    open fun isPurchased(lockableFeature: LockableFeature)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
var lockableFeature = lockableFeature



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


    open fun add(lockableFeature: LockableFeature)
        //nullable = true from not(false or (false and false)) = true
{
var lockableFeature = lockableFeature
}


    open fun getUserName()
        //nullable = true from not(false or (false and true)) = true
: String{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return StringUtil.getInstance()!!.EMPTY_STRING
}


    open fun isEnabled()
        //nullable = true from not(false or (false and true)) = true
: Boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


}
                
            

