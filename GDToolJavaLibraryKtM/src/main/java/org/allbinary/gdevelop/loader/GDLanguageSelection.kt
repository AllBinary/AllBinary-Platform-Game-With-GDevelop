
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
        
        import java.lang.System
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import java.io.BufferedReader
import java.io.InputStreamReader
import org.allbinary.logic.NullUtil

open public class GDLanguageSelection
            : Object
         {
        
companion object {
            
    private val instance: GDLanguageSelection = GDLanguageSelection()

    open fun getInstance()
        //nullable =  from not(true or (false and true)) = 
: GDLanguageSelection{

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return instance
}


        }
            
            //Auto Generated
            public constructor() : super()
            {
            }            
        
    private val ARG_PREFIX_ARRAY: Array<String?> = arrayOf("-language=","--language=","-l=")

    private val ARG_NAME_ARRAY: Array<String?> = arrayOf("-language","--language","-l")

    private val TEST_ARG_ARRAY: Array<String?> = arrayOf("-test","--test","-t")

    private val YES: String = "y"

    private val YES_LONG: String = "yes"

    private val gdLanguageFactory: GDLanguageFactory = GDLanguageFactory.getInstance()!!

    private var bufferedReader: BufferedReader

    open fun getBufferedReader()
        //nullable = true from not(false or (false and true)) = true
: BufferedReader{

    
                        if(this.bufferedReader == 
                                    null
                                )
                        
                                    {
                                    this.bufferedReader= BufferedReader(InputStreamReader(System.in))

                                    }
                                

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.bufferedReader
}


                @Throws(Exception::class)
            
    open fun selectTestExtension(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var args = args

    var size: Int = args.size
                





                        for (index in 0 until size)

        {




                        for (index2 in 0 until this.TEST_ARG_ARRAY.size)

        {

    
                        if(args[index]!!.equals(this.TEST_ARG_ARRAY[index2]!!, ignoreCase = true))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                
}

}


    
                        if(this.getFromArgs(args) != NullUtil.getInstance()!!.NULL_OBJECT)
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                                    }
                                

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.promptTestExtension()
}


                @Throws(Exception::class)
            
    open fun promptTestExtension()
        //nullable = true from not(false or (false and true)) = true
: Boolean{
System.out.print("Add t to the end of the file extension for testing (y/N)?\n> ")
System.out.flush()

    var line: String = this.getBufferedReader()!!.readLine()!!


    
                        if(line == 
                                    null
                                )
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false

                                    }
                                

    var trimmed: String = line.trim()!!


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return trimmed.equals(this.YES, ignoreCase = true) || trimmed.equals(this.YES_LONG, ignoreCase = true)
}


                @Throws(Exception::class)
            
    open fun select(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
: GDLanguage{
    //var args = args

    var argLanguage: Any = this.getFromArgs(args)!!


    
                        if(argLanguage != NullUtil.getInstance()!!.NULL_OBJECT)
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return argLanguage as GDLanguage

                                    }
                                

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.prompt()
}


                @Throws(Exception::class)
            
    open fun getFromArgs(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
: Any{
    //var args = args

    var size: Int = args.size
                


    var value: String = 
                null
            





                        for (index in 0 until size)

        {

    var arg: String = args[index]!!





                        for (index2 in 0 until this.ARG_PREFIX_ARRAY.size)

        {

    
                        if(arg.lowercase()!!.startsWith(this.ARG_PREFIX_ARRAY[index2]!!))
                        
                                    {
                                    value= arg.substring(this.ARG_PREFIX_ARRAY[index2]!!.length())!!

                                    }
                                
}





                        for (index2 in 0 until this.ARG_NAME_ARRAY.size)

        {

    
                        if(arg.equals(this.ARG_NAME_ARRAY[index2]!!, ignoreCase = true) && index +1 < size)
                        
                                    {
                                    value= args[index +1]!!

                                    }
                                
}

}


    
                        if(value == 
                                    null
                                )
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return NullUtil.getInstance()!!.NULL_OBJECT

                                    }
                                

    var language: Any = this.gdLanguageFactory!!.get(value)!!


    
                        if(language == NullUtil.getInstance()!!.NULL_OBJECT)
                        
                                    {
                                    


                            throw Exception("Unknown language: " +value +"\n" +this.getLanguageListAsString())

                                    }
                                

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return language
}


                @Throws(Exception::class)
            
    open fun prompt()
        //nullable = true from not(false or (false and true)) = true
: GDLanguage{

    var bufferedReader: BufferedReader = this.getBufferedReader()!!


        while(true)
        {
System.out.print("Select the language to generate (Enter for Java):\n" +this.getLanguageListAsString() +"> ")
System.out.flush()

    var line: String = bufferedReader!!.readLine()!!


    
                        if(line == 
                                    null
                                 || line.trim()!!.length() == 0)
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.gdLanguageFactory!!.JAVA

                                    }
                                

    var language: Any = this.gdLanguageFactory!!.get(line)!!


    
                        if(language != NullUtil.getInstance()!!.NULL_OBJECT)
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return language as GDLanguage

                                    }
                                
System.out.println("Unknown language: " +line)
}

}


    open fun getLanguageListAsString()
        //nullable = true from not(false or (false and true)) = true
: String{

    var stringBuilder: StringBuilder = StringBuilder()


    var languageArray: Array<GDLanguage?> = this.gdLanguageFactory!!.LANGUAGE_ARRAY


    var size: Int = languageArray!!.size
                





                        for (index in 0 until size)

        {

    var language: GDLanguage = languageArray[index]!!

stringBuilder!!.append("  ")!!.append(index +1)!!.append(") ")!!.append(language.name)!!.append(" [")!!.append(if(language.shortName!!.length() == 0) {
                            
                            "-"
                        
                            } else {
                            language.shortName
                            }
    )!!.append(", ")!!.append(language.extension)!!.append("]\n")
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuilder!!.toString()
}


}
                
            

