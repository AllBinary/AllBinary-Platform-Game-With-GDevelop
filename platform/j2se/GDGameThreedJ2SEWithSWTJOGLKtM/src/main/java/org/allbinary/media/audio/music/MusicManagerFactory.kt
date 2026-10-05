
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
        package org.allbinary.media.audio.music




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.media.audio.music.MusicManager
import org.allbinary.util.BasicArrayList

open public class MusicManagerFactory
            : Object
         {
        
companion object {
            
    open fun createMusicManager(soundList: BasicArrayList)
        //nullable = true from not(false or (false and false)) = true
: MusicManager{
    //var soundList = soundList



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return MusicManager(MusicService::class, soundList)
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
}
                
            

