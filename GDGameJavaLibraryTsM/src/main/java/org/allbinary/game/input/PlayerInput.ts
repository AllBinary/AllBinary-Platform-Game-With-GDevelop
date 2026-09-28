
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

        


            import { Integer } from '../../../../java/lang/Integer.js';
        
import { DownKeyEventListenerInterface } from '../../../../org/allbinary/game/input/event/DownKeyEventListenerInterface.js';
//not GWT import const DownKeyEventListenerInterface

import { UpKeyEventListenerInterface } from '../../../../org/allbinary/game/input/event/UpKeyEventListenerInterface.js';
//not GWT import const UpKeyEventListenerInterface

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

//not plain js import { BasicArrayList } 
const BasicArrayList = globalThis.org.allbinary.util.BasicArrayList;

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { PlayerGameInput } from './PlayerGameInput.js';
//not GWT import - same folder const PlayerGameInput

export class PlayerInput extends PlayerGameInput implements DownKeyEventListenerInterface, UpKeyEventListenerInterface {
        

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly keyEventList: BasicArrayList;

    private readonly removalKeyEventList: BasicArrayList;

public constructor (keyEventList: BasicArrayList, removalKeyEventList: BasicArrayList, gameKeyEventList: BasicArrayList, removalGameKeyEventList: BasicArrayList, playerInputId: number){
            super(gameKeyEventList, removalGameKeyEventList, playerInputId);
                    

                            //For kotlin this is before the body of the constructor.
                    
this.keyEventList= keyEventList;
    
this.removalKeyEventList= removalKeyEventList;
    
}

//@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.

    public onDownKey(keyInteger: Integer){

                        if(keyInteger!.intValue() > 0)
                        
                                    {
                                    this.addKey(keyInteger);
    

                                    }
                                
                        else {
                            
                        }
                            
}

//@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.

    public onUpKeyEvent(keyInteger: Integer){

                        if(keyInteger!.intValue() > 0)
                        
                                    {
                                    this.addKeyForRemoval(keyInteger);
    

                                    }
                                
                        else {
                            
                        }
                            
}

//@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.

    public addKey(keyInteger: Integer){

                        if(this.isRemoveDuplicateKeyPresses && this.keyEventList!.contains(keyInteger))
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return ;
    

                                    }
                                

                        if(keyInteger != 
                                    null
                                )
                        
                                    {
                                    this.keyEventList!.add(keyInteger);
    

                                    }
                                
                        else {
                            this.logUtil!.putF("Danger Passed Null KeyEvent", this, this.commonStrings!.ADD);
    

                        }
                            
}

//@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.

    public addKeyForRemoval(keyInteger: Integer){
this.removalKeyEventList!.add(keyInteger);
    
}

//@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.

    public isKeyForRemoval(keyInteger: Integer): boolean{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.removalKeyEventList!.contains(keyInteger);;
    
}

//@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.

    public clear(){
super.clear();
    
this.keyEventList!.clear();
    
}

//@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.

    public removeNonAIInputGameKeyEvents(){
super.removeNonAIInputGameKeyEvents();
    

    var list: BasicArrayList = this.keyEventList;;
    




                        for (
    var index: number = list.size()!;--index >= 0; )
        {
list.removeAt(index);
    
}

}

//@Synchronized //TWB - This is not allowed for TypeScript native. Instead use Coroutine logic instead.

    public update(){
super.update();
    

    var removeList: BasicArrayList = this.removalKeyEventList;;
    

    var list: BasicArrayList = this.keyEventList;;
    

    var size: number = removeList!.size()!;;
    




                        for (
    var index: number = 0;index < size; index++)
        {

    var anyType: any = removeList!.objectArray[index]!;;
    




                        for (
    var index2: number = list.size()!;--index2 >= 0; )
        {

                        if(list.objectArray[index2] == anyType)
                        
                                    {
                                    list.removeAt(index2);
    

                                    }
                                
}

}

removeList!.clear();
    
}


}



