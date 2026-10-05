
        /*
                *  
                *  AllBinary Open License Version 1 
                *  Copyright (c) 2022 AllBinary 
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
        package org.allbinary.game.input




        import java.lang.Object        
        
        import java.lang.Integer
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.game.input.event.DownKeyEventListenerInterface
import org.allbinary.game.input.event.UpKeyEventListenerInterface
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.util.BasicArrayList

open public class PlayerInput : PlayerGameInput
                , DownKeyEventListenerInterface
                , UpKeyEventListenerInterface {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val keyEventList: BasicArrayList

    private val removalKeyEventList: BasicArrayList
public constructor (keyEventList: BasicArrayList, removalKeyEventList: BasicArrayList, gameKeyEventList: BasicArrayList, removalGameKeyEventList: BasicArrayList, playerInputId: Int)                        

                            : super(gameKeyEventList, removalGameKeyEventList, playerInputId){
    //var keyEventList = keyEventList
    //var removalKeyEventList = removalKeyEventList
    //var gameKeyEventList = gameKeyEventList
    //var removalGameKeyEventList = removalGameKeyEventList
    //var playerInputId = playerInputId


                            //For kotlin this is before the body of the constructor.
                    
this.keyEventList= keyEventList
this.removalKeyEventList= removalKeyEventList
}

@Synchronized //TWB - This is not allowed for Kotlin native. Instead use Coroutine logic instead.

    override fun onDownKey(keyInteger: Integer)
        //nullable = true from not(false or (false and false)) = true
{
    //var keyInteger = keyInteger

    
                        if(keyInteger!!.toInt() > 0)
                        
                                    {
                                    this.addKey(keyInteger)

                                    }
                                
                        else {
                            
                        }
                            
}

@Synchronized //TWB - This is not allowed for Kotlin native. Instead use Coroutine logic instead.

    override fun onUpKeyEvent(keyInteger: Integer)
        //nullable = true from not(false or (false and false)) = true
{
    //var keyInteger = keyInteger

    
                        if(keyInteger!!.toInt() > 0)
                        
                                    {
                                    this.addKeyForRemoval(keyInteger)

                                    }
                                
                        else {
                            
                        }
                            
}

@Synchronized //TWB - This is not allowed for Kotlin native. Instead use Coroutine logic instead.

    open fun addKey(keyInteger: Integer)
        //nullable = true from not(false or (false and false)) = true
{
var keyInteger = keyInteger

    
                        if(this.isRemoveDuplicateKeyPresses && this.keyEventList!!.contains(keyInteger))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    
                        if(keyInteger != 
                                    null
                                )
                        
                                    {
                                    this.keyEventList!!.add(keyInteger)

                                    }
                                
                        else {
                            this.logUtil!!.putF("Danger Passed Null KeyEvent", this, this.commonStrings!!.ADD)

                        }
                            
}

@Synchronized //TWB - This is not allowed for Kotlin native. Instead use Coroutine logic instead.

    open fun addKeyForRemoval(keyInteger: Integer)
        //nullable = true from not(false or (false and false)) = true
{
var keyInteger = keyInteger
this.removalKeyEventList!!.add(keyInteger)
}

@Synchronized //TWB - This is not allowed for Kotlin native. Instead use Coroutine logic instead.

    open fun isKeyForRemoval(keyInteger: Integer)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
var keyInteger = keyInteger



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.removalKeyEventList!!.contains(keyInteger)
}

@Synchronized //TWB - This is not allowed for Kotlin native. Instead use Coroutine logic instead.

    override fun clear()
        //nullable = true from not(false or (false and true)) = true
{
super.clear()
this.keyEventList!!.clear()
}

@Synchronized //TWB - This is not allowed for Kotlin native. Instead use Coroutine logic instead.

    override fun removeNonAIInputGameKeyEvents()
        //nullable = true from not(false or (false and true)) = true
{
super.removeNonAIInputGameKeyEvents()

    var list: BasicArrayList = this.keyEventList





                        for (index in list.size()!!  - 1  downTo 0)

        {
list.removeAt(index)
}

}

@Synchronized //TWB - This is not allowed for Kotlin native. Instead use Coroutine logic instead.

    override fun update()
        //nullable = true from not(false or (false and true)) = true
{
super.update()

    var removeList: BasicArrayList = this.removalKeyEventList


    var list: BasicArrayList = this.keyEventList


    var size: Int = removeList!!.size()!!





                        for (index in 0 until size)

        {

    var anyType: Any = removeList!!.objectArray[index]!!





                        for (index2 in list.size()!!  - 1  downTo 0)

        {

    
                        if(list.objectArray[index2] == anyType)
                        
                                    {
                                    list.removeAt(index2)

                                    }
                                
}

}

removeList!!.clear()
}


}
                
            

