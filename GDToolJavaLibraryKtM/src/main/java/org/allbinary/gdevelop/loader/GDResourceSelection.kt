
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
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.io.file.AbFileSystem
import org.allbinary.string.CommonSeps
import org.allbinary.logic.string.StringMaker
import org.allbinary.string.CommonStrings

open public class GDResourceSelection
            : Object
         {
        
companion object {
            
    val instance: GDResourceSelection = GDResourceSelection()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDResourceSelection{



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return GDResourceSelection.instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val commonSeps: CommonSeps = CommonSeps.getInstance()!!

    private val gdPaths: GDPaths = GDPaths.getInstance()!!

    private val gdToolStrings: GDToolStrings = GDToolStrings.getInstance()!!

    private val FOUND: String = "found"

    private val SIZE: Int = 100

    open fun appendCommentIfNeeded0(name: String, resource: String, resourceStringMaker: StringMaker, hasRotationImages: Boolean)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var name = name
    //var resource = resource
    //var resourceStringMaker = resourceStringMaker
    //var hasRotationImages = hasRotationImages

    var used: Boolean = true


    
                        if(resource.uppercase()!!.indexOf(this.gdToolStrings!!._BLANK_) >= 0)
                        
                                    {
                                    used= false
resourceStringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                

    
                        if(name.endsWith(this.gdToolStrings!!.UNDERSCORE_0) && name.indexOf(this.gdToolStrings!!._TOUCH_) < 0)
                        
                                    {
                                    used= false
resourceStringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                

    
                        if(!hasRotationImages)
                        
                                    {
                                    



                        for (index2 in 2 until this.SIZE)

        {

    
                        if(name.endsWith(this.commonSeps!!.UNDERSCORE +index2) && name.indexOf(this.gdToolStrings!!._TOUCH_) < 0)
                        
                                    {
                                    used= false
resourceStringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                
}


                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return used
}


    open fun appendCommentIfNeeded(name: String, resource: String, resourceStringMaker: StringMaker, hasRotationImages: Boolean)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var name = name
    //var resource = resource
    //var resourceStringMaker = resourceStringMaker
    //var hasRotationImages = hasRotationImages

    var used: Boolean = true


    
                        if(resource.indexOf(this.gdToolStrings!!._JSON) >= 0 || resource.indexOf(this.gdToolStrings!!._T) >= 0)
                        
                                    {
                                    used= false
resourceStringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                

    
                        if(resource.uppercase()!!.indexOf(this.gdToolStrings!!._BLANK_) >= 0)
                        
                                    {
                                    used= false
resourceStringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                

    
                        if(name.endsWith(this.gdToolStrings!!.UNDERSCORE_0) && name.indexOf(this.gdToolStrings!!._TOUCH_) < 0)
                        
                                    {
                                    used= false
resourceStringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                

    
                        if(!hasRotationImages)
                        
                                    {
                                    



                        for (index2 in 2 until this.SIZE)

        {

    
                        if(name.endsWith(this.commonSeps!!.UNDERSCORE +index2) && name.indexOf(this.gdToolStrings!!._TOUCH_) < 0)
                        
                                    {
                                    used= false
resourceStringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                
}


                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return used
}


    open fun appendCommentIfNeeded2(name: String, resource: String, resourceStringMaker: StringMaker, hasRotationImages: Boolean)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var name = name
    //var resource = resource
    //var resourceStringMaker = resourceStringMaker
    //var hasRotationImages = hasRotationImages

    var used: Boolean = true


    
                        if(resource.indexOf(this.gdToolStrings!!._JSON) >= 0 || resource.indexOf(this.gdToolStrings!!._T) >= 0)
                        
                                    {
                                    used= false
resourceStringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                

    
                        if(name.endsWith(this.gdToolStrings!!.UNDERSCORE_0) && name.indexOf(this.gdToolStrings!!._TOUCH_) < 0)
                        
                                    {
                                    used= false
resourceStringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                

    
                        if(!hasRotationImages)
                        
                                    {
                                    



                        for (index2 in 2 until this.SIZE)

        {

    
                        if(name.endsWith(this.commonSeps!!.UNDERSCORE +index2) && name.indexOf(this.gdToolStrings!!._TOUCH_) < 0)
                        
                                    {
                                    used= false
resourceStringMaker!!.append(this.commonSeps!!.COMMENT)

                                    }
                                
}


                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return used
}


    private var hasRead: Boolean= false

    private var hasRotationImages: Boolean= false

    open fun hasRotationImages()
        //nullable = true from not(false or (false and true)) = true
: Boolean{

    
                        if(!this.hasRead)
                        
                                    {
                                    this.hasRead= true

    var fileUtil: AbFileSystem = AbFileSystem.getInstance()!!


    var fileAsString: String = fileUtil!!.readAsString(this.gdPaths!!.ROTATION_ANIMATION_FILE_PATH)!!


    
                        if(fileAsString!!.indexOf(this.FOUND) >= 0)
                        
                                    {
                                    this.hasRotationImages= true

                                    }
                                
                        else {
                            this.hasRotationImages= false

                        }
                            

    var stringMaker: StringMaker = StringMaker()


    var commonStrings: CommonStrings = CommonStrings.getInstance()!!

this.logUtil!!.putF(stringMaker!!.append("hasRotationImages: ")!!.appendboolean(this.hasRotationImages)!!.toString(), this, commonStrings!!.PROCESS)

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.hasRotationImages
}


}
                
            

