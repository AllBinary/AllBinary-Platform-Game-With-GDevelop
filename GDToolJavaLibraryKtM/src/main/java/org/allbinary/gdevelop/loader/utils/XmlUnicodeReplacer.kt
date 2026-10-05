
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader.utils




        import java.lang.Object        
        
        import java.lang.System
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import java.io.IOException
import java.nio.charset.Charset
import java.nio.charset.StandardCharsets
import java.nio.file.Files
import java.nio.file.Path
import java.nio.file.Paths
import java.util.ArrayList
import java.util.List
import org.allbinary.gdevelop.loader.GDPaths

open public class XmlUnicodeReplacer
            : Object
         {
        
companion object {
            
    private val ASCII_MAX: Int = 0x7F

    private val REPLACEMENT: String = "foundUNICODEchar"

    private val EMPTY: String = ""

    private val INPUT_FILE_NOT_FOUND_PREFIX: String = "Input file not found: "

    private val OUTPUT_WRITTEN_PREFIX: String = "Output written to: "

    private val TARGET_UNICODE_RANGE: String = "Target Unicode range: non-ASCII characters (U+0080 and above)"

    private val FOUND_NON_ASCII_PREFIX: String = "Found non-ASCII occurrences: "

    private val FIRST_PREFIX: String = "First "

    private val FIRST_SUFFIX: String = " occurrence(s):"

    private val POSITION_PREFIX: String = "  "

    private val REPLACED_PREFIX: String = "Replaced all non-ASCII characters with: "

    private val NO_NON_ASCII: String = "No non-ASCII characters were found. File content unchanged."

    private val UNICODE_FORMAT: String = "U+%04X"

    private val POSITION_LINE_PREFIX: String = "line "

    private val POSITION_COLUMN_PREFIX: String = ", column "

    private val POSITION_INDEX_PREFIX: String = ", index "

    private val POSITION_UNICODE_PREFIX: String = ", "

    private val USAGE: String = "Usage: java XmlUnicodeReplacer <inputXmlPath> [outputXmlPath] [charsetName]"

    private val EXAMPLES: String = "Examples:"

    private val EXAMPLE_1: String = "  java XmlUnicodeReplacer g:/mnt/bc/mydev/GDGamesP/game.xml"

    private val EXAMPLE_2: String = "  java XmlUnicodeReplacer g:/mnt/bc/mydev/GDGamesP/game.xml g:/mnt/bc/mydev/GDGamesP/game.cleaned.xml"

    private val EXAMPLE_3: String = "  java XmlUnicodeReplacer g:/mnt/bc/mydev/GDGamesP/game.xml g:/mnt/bc/mydev/GDGamesP/game.cleaned.xml UTF-8"

                @Throws(IOException::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
var args = args
GDPaths.init()

    
                        if(args.size < 1 || args.size > 3)
                        
                                    {
                                    XmlUnicodeReplacer.printUsageAndExit()



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    var inputPath: Path = Paths.get(args[0]!!)!!


    var outputPath: Path = if((args.size >= 2)) {
                            
                            Paths.get(args[1]!!)
                        
                            } else {
                            inputPath
                            }
    


    var charset: Charset = if((args.size == 3)) {
                            
                            Charset.forName(args[2]!!).kotlin
                        
                            } else {
                            StandardCharsets.UTF_8
                            }
    


    
                        if(!Files.exists(inputPath))
                        
                                    {
                                    
    var messageBuilder: StringBuilder = StringBuilder()

messageBuilder!!.append(XmlUnicodeReplacer.INPUT_FILE_NOT_FOUND_PREFIX)
messageBuilder!!.append(inputPath)
System.err.println(messageBuilder!!.toString())
System.exit(2)



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

    var content: String = Files.readString(inputPath, charset)!!


    var replaced: String = XmlUnicodeReplacer.sanitize(content)!!

Files.writeString(outputPath, replaced, charset)

    var messageBuilder: StringBuilder = StringBuilder()

messageBuilder!!.append(XmlUnicodeReplacer.OUTPUT_WRITTEN_PREFIX)
messageBuilder!!.append(outputPath!!.toAbsolutePath())
System.out.println(messageBuilder!!.toString())
}


    open fun sanitize(content: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var content = content

    var positions: List<String> = XmlUnicodeReplacer.findNonAsciiPositions(content, 20)!!


    var totalCount: Int = XmlUnicodeReplacer.countNonAsciiOccurrences(content)!!

System.out.println(XmlUnicodeReplacer.TARGET_UNICODE_RANGE)

    var foundCountBuilder: StringBuilder = StringBuilder()

foundCountBuilder!!.append(XmlUnicodeReplacer.FOUND_NON_ASCII_PREFIX)
foundCountBuilder!!.append(totalCount)
System.out.println(foundCountBuilder!!.toString())

    
                        if(!positions.isEmpty())
                        
                                    {
                                    
    var firstBuilder: StringBuilder = StringBuilder()

firstBuilder!!.append(XmlUnicodeReplacer.FIRST_PREFIX)
firstBuilder!!.append(positions.size)
firstBuilder!!.append(XmlUnicodeReplacer.FIRST_SUFFIX)
System.out.println(firstBuilder!!.toString())

                    //Otherwise - statement - ForEachStmt


                                    }
                                

    var replaced: String = XmlUnicodeReplacer.replaceNonAscii(content)!!


    
                        if(totalCount > 0)
                        
                                    {
                                    
    var replacedBuilder: StringBuilder = StringBuilder()

replacedBuilder!!.append(XmlUnicodeReplacer.REPLACED_PREFIX)
replacedBuilder!!.append(XmlUnicodeReplacer.REPLACEMENT)
System.out.println(replacedBuilder!!.toString())

                                    }
                                
                        else {
                            System.out.println(XmlUnicodeReplacer.NO_NON_ASCII)

                        }
                            



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return replaced
}


    open fun countNonAsciiOccurrences(content: String)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var content = content

    var count: Int = 0





                        for (i in 0 until content.length!!)

        {

    
                        if(content[i] > XmlUnicodeReplacer.ASCII_MAX)
                        
                                    {
                                    count++

                                    }
                                
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return count
}


    open fun replaceNonAscii(content: String)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var content = content

    var stringBuilder: StringBuilder = StringBuilder(content.length)





                        for (i in 0 until content.length!!)

        {

    var current: Char = content[i]!!


    
                        if(current > XmlUnicodeReplacer.ASCII_MAX)
                        
                                    {
                                    stringBuilder!!.append(XmlUnicodeReplacer.REPLACEMENT)

                                    }
                                
                        else {
                            stringBuilder!!.append(current)

                        }
                            
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuilder!!.toString()
}


    open fun findNonAsciiPositions(content: String, limit: Int)
        //nullable = true from not(false or (false and false)) = true
: List<String>{
    //var content = content
    //var limit = limit

    var positions: List<String> = ArrayList<>()


    var line: Int = 1


    var column: Int = 1





                        for (i in 0 until content.length!!)

        {

    var current: Char = content[i]!!


    
                        if(current > XmlUnicodeReplacer.ASCII_MAX)
                        
                                    {
                                    
    var unicode: String = String.format(XmlUnicodeReplacer.UNICODE_FORMAT, current.toInt())!!


    var positionBuilder: StringBuilder = StringBuilder()

positionBuilder!!.append(XmlUnicodeReplacer.POSITION_LINE_PREFIX)
positionBuilder!!.append(line)
positionBuilder!!.append(XmlUnicodeReplacer.POSITION_COLUMN_PREFIX)
positionBuilder!!.append(column)
positionBuilder!!.append(XmlUnicodeReplacer.POSITION_INDEX_PREFIX)
positionBuilder!!.append(i)
positionBuilder!!.append(XmlUnicodeReplacer.POSITION_UNICODE_PREFIX)
positionBuilder!!.append(unicode)
positions.add(positionBuilder!!.toString())

    
                        if(positions.size >= limit)
                        
                                    {
                                    break;

                    

                                    }
                                

                                    }
                                

    
                        if(current == '\n')
                        
                                    {
                                    line++
column= 1

                                    }
                                
                        else {
                            column++

                        }
                            
}




                        //if statement needs to be on the same line and ternary does not work the same way.
                        return positions
}


    open fun printUsageAndExit()
        //nullable = true from not(false or (false and true)) = true
{
System.err.println(XmlUnicodeReplacer.USAGE)
System.err.println(XmlUnicodeReplacer.EXAMPLES)
System.err.println(XmlUnicodeReplacer.EXAMPLE_1)
System.err.println(XmlUnicodeReplacer.EXAMPLE_2)
System.err.println(XmlUnicodeReplacer.EXAMPLE_3)
System.exit(1)
}


        }
            private constructor ()
            : super()
        {
}


}
                
            

