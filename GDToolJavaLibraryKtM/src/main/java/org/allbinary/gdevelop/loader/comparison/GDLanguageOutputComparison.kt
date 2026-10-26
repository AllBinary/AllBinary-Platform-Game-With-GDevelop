
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
        package org.allbinary.gdevelop.loader.comparison




        import java.lang.Object        
        
        import java.lang.Math
        
        import java.lang.System
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import java.io.BufferedWriter
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import java.io.IOException
import java.io.OutputStreamWriter
import java.util.ArrayList
import java.util.Collections

//import java.util.List
import java.util.TreeSet

open public class GDLanguageOutputComparison
            : Object
         {
        
companion object {
            
    private val OPERATOR_ARRAY: Array<String?> = arrayOf("..<","===","!==","!!","?.","?:","::","->","==","!=","<=",">=","&&","||","++","--","+=","-=","*=","/=","%=","..")

    private val NEWLINE: String = "\n"

                @Throws(Exception::class)
            
    open fun main(args: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
{
    //var args = args

    
                        if(args.size < 3)
                        
                                    {
                                    System.out.println("Usage: GDLanguageOutputComparison genPath referencePath outputPath [extension=.kt] [-loose]")
System.exit(1)

                                    }
                                

    var extension: String = ".kt"


    var loose: Boolean = false





                        for (index in 3 until args.size)

        {

    
                        if(args[index]!!.equals("-loose"))
                        
                                    {
                                    loose= true

                                    }
                                
                        else {
                            extension= args[index]!!

                        }
                            
}


    var result: Int = GDLanguageOutputComparison(loose).
                            process(File(args[0]!!), File(args[1]!!), File(args[2]!!), extension)

System.exit(result)
}


open public class Normalized
            : Object
         {
        
/*Static stuff is not allowed for Kotlin inner classescompanion object {
            *//*
        }
            */


            //Auto Generated
            public constructor() : super()
            {
            }            
        
    val importSet: TreeSet<String> = TreeSet<String>()

    var code: String

    override fun toString()
        //nullable =  from not(false or (true and true)) = 
: String{

    var stringBuilder: StringBuilder = StringBuilder()


                    //Otherwise - statement - ForEachStmt

stringBuilder!!.append(this.code)

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return stringBuilder!!.toString()
}


}
                
            
    private val OBJECT_SUPER_TYPE: Array<String?> = arrayOf(":","Any","{")

    private val EMPTY_SUPER_CALL: Array<String?> = arrayOf(":","super","(",")","{")

    private val EMPTY_CONSTRUCTOR: Array<String?> = arrayOf("constructor","(",")","{","}")

    private val MODIFIER_ARRAY: Array<String?> = arrayOf("open","override","private","protected","internal","abstract","final","const","lateinit","inline","data","inner","companion")

        }
            
    private val loose: Boolean
public constructor (loose: Boolean)
            : super()
        {
    //var loose = loose
this.loose= loose
}


                @Throws(Exception::class)
            
    open fun process(genRoot: File, refRoot: File, outputRoot: File, extension: String)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var genRoot = genRoot
    //var refRoot = refRoot
    //var outputRoot = outputRoot
    //var extension = extension

    var genFileList: List<File> = ArrayList<File>()

this.collect(genRoot, extension, genFileList)
Collections.sort(genFileList)

    var genOutputRoot: File = File(outputRoot, "gen")


    var refOutputRoot: File = File(outputRoot, "ref")


    var report: StringBuilder = StringBuilder()


    var same: Int = 0


    var different: Int = 0


    var missing: Int = 0


    var genRootPath: String = genRoot!!.getCanonicalPath()!!


                    //Otherwise - statement - ForEachStmt

report.append("same=")!!.append(same)!!.append(" different=")!!.append(different)!!.append(" missingReference=")!!.append(missing)!!.append(NEWLINE)
this.write(File(outputRoot, "report.txt"), report.toString())
System.out.print(report.toString())

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return if(different > 0) {
                            
                            2
                        
                            } else {
                            0
                            }
    
}


    open fun collect(directory: File, extension: String, fileList: List<File>)
        //nullable = true from not(false or (false and false)) = true
{
    //var directory = directory
    //var extension = extension
    //var fileList = fileList

    var fileArray: Array<File?> = directory.listFiles()!!


    
                        if(fileArray == 
                                    null
                                )
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                

                    //Otherwise - statement - ForEachStmt

}


                @Throws(IOException::class)
            
    open fun read(file: File)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var file = file

    var inputStream: FileInputStream = FileInputStream(file)


        try {
            
    var byteArray: ByteArray = ByteArray(file.length().toInt())


    var offset: Int = 0


        while(offset < byteArray!!.size)
        {

    var read: Int = inputStream!!.read(byteArray, offset, byteArray!!.size -offset)


    
                        if(read < 0)
                        
                                    {
                                    break;

                    

                                    }
                                
offset += read
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return byteArray.decodeToString()""

         finally {
            inputStream!!.close()

         }
        
}


                @Throws(IOException::class)
            
    open fun write(file: File, text: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var file = file
    //var text = text
file.getParentFile()!!.mkdirs()

    var writer: BufferedWriter = BufferedWriter(OutputStreamWriter(FileOutputStream(file), "UTF-8"))


        try {
            writer.write(text)

         finally {
            writer.close()

         }
        
}


    open fun tokenize(text: String)
        //nullable = true from not(false or (false and false)) = true
: List<String>{
    //var text = text

    var tokenList: List<String> = ArrayList<String>()


    var length: Int = text.length


    var index: Int = 0


        while(index < length)
        {

    var c: Char = text[index]


    
                        if(c == '\n')
                        
                                    {
                                    tokenList!!.add(NEWLINE)
index++

                                    }
                                
                             else 
    
                        if(Character.isWhitespace(c))
                        
                                    {
                                    index++

                                    }
                                
                             else 
    
                        if(text.startsWith("//", index))
                        
                                    {
                                    
        while(index < length && text[index] != '\n')
        {
index++
}


                                    }
                                
                             else 
    
                        if(text.startsWith("/*", index))
                        
                                    {
                                    
    var depth: Int = 0


        while(index < length)
        {

    
                        if(text.startsWith("/*", index))
                        
                                    {
                                    depth++
index += 2

                                    }
                                
                             else 
    
                        if(text.startsWith("*/", index))
                        
                                    {
                                    depth--
index += 2

    
                        if(depth == 0)
                        
                                    {
                                    break;

                    

                                    }
                                

                                    }
                                
                        else {
                            index++

                        }
                            
}


                                    }
                                
                             else 
    
                        if(text.startsWith("\"\"\"", index))
                        
                                    {
                                    
    var end: Int = text.indexOf("\"\"\"", index +3)


    var endIndex: Int = if(end < 0) {
                            
                            length
                        
                            } else {
                            end +3
                            }
    

tokenList!!.add(text.substring(index, endIndex))
index= endIndex

                                    }
                                
                             else 
    
                        if(c == '"' || c == '\'')
                        
                                    {
                                    
    var end: Int = index +1


        while(end < length && text[end] != c)
        {

    
                        if(text[end] == '\\')
                        
                                    {
                                    end++

                                    }
                                
end++
}

end= Math.min(end +1, length)
tokenList!!.add(text.substring(index, end))
index= end

                                    }
                                
                             else 
    
                        if(Character.isJavaIdentifierStart(c) || c == '`')
                        
                                    {
                                    
    var end: Int = index +1


        while(end < length && Character.isJavaIdentifierPart(text[end]))
        {
end++
}

tokenList!!.add(text.substring(index, end))
index= end

                                    }
                                
                             else 
    
                        if(Character.isDigit(c))
                        
                                    {
                                    
    var end: Int = index +1


        while(end < length && (Character.isLetterOrDigit(text[end]) || text[end] == '_' || (text[end] == '.' && end +1 < length && Character.isDigit(text[end +1]))))
        {
end++
}

tokenList!!.add(text.substring(index, end))
index= end

                                    }
                                
                        else {
                            
    var operator: String = c.concatToString()

                                    !!


                    //Otherwise - statement - ForEachStmt

tokenList!!.add(operator)
index += operator.length

                        }
                            
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return tokenList
}


    open fun isContinuationEnd(token: String)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var token = token

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return token.equals("(") || token.equals(",") || token.equals("=") || token.equals(".") || token.equals("?.") || token.equals("+") || token.equals("-") || token.equals("*") || token.equals("/") || token.equals("&&") || token.equals("||") || token.equals(":") || token.equals("->") || token.equals("?:") || token.equals("[") || token.equals("<") || token.equals("==") || token.equals("!=") || token.equals("!") || token.equals("override") || token.equals("open") || token.equals("private") || token.equals("protected") || token.equals("internal") || token.equals("abstract") || token.equals("final") || token.startsWith("@") || token.equals("else")
}


    open fun isContinuationStart(token: String)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var token = token

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return token.equals(")") || token.equals(".") || token.equals("?.") || token.equals(":") || token.equals("{") || token.equals(",") || token.equals("]") || token.equals("?:") || token.equals("&&") || token.equals("||") || token.equals("else") || token.equals("catch") || token.equals("finally") || token.equals("!!") || token.equals("+") || token.equals("*") || token.equals("/") || token.equals("as") || token.equals("is") || token.equals("=") || token.equals("(") || token.equals("->")
}


    open fun normalize(text: String)
        //nullable = true from not(false or (false and false)) = true
: Normalized{
    //var text = text

    var tokenList: List<String> = this.tokenize(text)!!


    var normalized: Normalized = Normalized()


    var codeTokenList: List<String> = ArrayList<String>()


    var size: Int = tokenList!!.size





                        for (index in 0 until size)

        {

    var token: String = tokenList!!.get(index)!!


    
                        if(token.equals("import") && (codeTokenList!!.isEmpty() || codeTokenList!!.get(codeTokenList!!.size -1)!!.equals(NEWLINE)))
                        
                                    {
                                    
    var stringBuilder: StringBuilder = StringBuilder()

index++

        while(index < size && !tokenList!!.get(index)!!.equals(NEWLINE) && !tokenList!!.get(index)!!.equals(";"))
        {

    var part: String = tokenList!!.get(index)!!


    
                        if(part.equals("as"))
                        
                                    {
                                    stringBuilder!!.append(' ')!!.append(part)!!.append(' ')

                                    }
                                
                        else {
                            stringBuilder!!.append(part)

                        }
                            
index++
}


    var importString: String = stringBuilder!!.toString()!!


    
                        if(!this.isIgnoredImport(importString))
                        
                                    {
                                    normalized.importSet!!.add(importString)

                                    }
                                


                        continue
                    

                                    }
                                

    
                        if(token.equals("@") && index +1 < size)
                        
                                    {
                                    
    var stringBuilder: StringBuilder = StringBuilder("@")

index++
stringBuilder!!.append(tokenList!!.get(index))

    
                        if(index +1 < size && tokenList!!.get(index +1)!!.equals("("))
                        
                                    {
                                    
    var depth: Int = 0


        while(index +1 < size)
        {
index++

    var part: String = tokenList!!.get(index)!!


    
                        if(part.equals(NEWLINE))
                        
                                    {
                                    

                        continue
                    

                                    }
                                
stringBuilder!!.append(part)

    
                        if(part.equals("("))
                        
                                    {
                                    depth++

                                    }
                                
                             else 
    
                        if(part.equals(")"))
                        
                                    {
                                    depth--

    
                        if(depth == 0)
                        
                                    {
                                    break;

                    

                                    }
                                

                                    }
                                
}


                                    }
                                

    var annotation: String = stringBuilder!!.toString()!!


    
                        if(this.loose && annotation.startsWith("@Throws"))
                        
                                    {
                                    

                        continue
                    

                                    }
                                
codeTokenList!!.add(annotation)


                        continue
                    

                                    }
                                

    
                        if(token.equals("public"))
                        
                                    {
                                    

                        continue
                    

                                    }
                                

    
                        if(this.loose)
                        
                                    {
                                    
    
                        if(token.equals("!!"))
                        
                                    {
                                    

                        continue
                    

                                    }
                                

    
                        if(token.equals("protected") && index +1 < size && tokenList!!.get(index +1)!!.equals("override"))
                        
                                    {
                                    

                        continue
                    

                                    }
                                

    
                        if(token.equals("val"))
                        
                                    {
                                    codeTokenList!!.add("var")


                        continue
                    

                                    }
                                

                                    }
                                
codeTokenList!!.add(token)
}


    
                        if(this.loose)
                        
                                    {
                                    this.removeNeutralConverterIdioms(codeTokenList)

                                    }
                                

    var stringBuilder: StringBuilder = StringBuilder()


    var lineTokenList: List<String> = ArrayList<String>()


    var previous: String = NEWLINE


    var size2: Int = codeTokenList!!.size





                        for (index in 0 until size2)

        {

    var token: String = codeTokenList!!.get(index)!!


    
                        if(token.equals(NEWLINE) || token.equals(";"))
                        
                                    {
                                    
    var next: String = NEWLINE





                        for (index2 in index +1 until size2)

        {

    
                        if(!codeTokenList!!.get(index2)!!.equals(NEWLINE))
                        
                                    {
                                    next= codeTokenList!!.get(index2)!!
break;

                    

                                    }
                                
}


    
                        if(token.equals(";") || (!this.isContinuationEnd(previous) && !this.isContinuationStart(next)))
                        
                                    {
                                    this.endLine(stringBuilder, lineTokenList)

                                    }
                                


                        continue
                    

                                    }
                                

    
                        if(token.equals("}"))
                        
                                    {
                                    this.endLine(stringBuilder, lineTokenList)
lineTokenList!!.add(token)

    var next: String = NEWLINE





                        for (index2 in index +1 until size2)

        {

    
                        if(!codeTokenList!!.get(index2)!!.equals(NEWLINE))
                        
                                    {
                                    next= codeTokenList!!.get(index2)!!
break;

                    

                                    }
                                
}


    
                        if(!next.equals("else") && !next.equals("catch") && !next.equals("finally") && !next.equals(")") && !next.equals(",") && !next.equals("."))
                        
                                    {
                                    this.endLine(stringBuilder, lineTokenList)

                                    }
                                

                                    }
                                
                             else 
    
                        if(token.equals("{"))
                        
                                    {
                                    lineTokenList!!.add(token)
this.endLine(stringBuilder, lineTokenList)

                                    }
                                
                        else {
                            lineTokenList!!.add(token)

                        }
                            
previous= token
}

this.endLine(stringBuilder, lineTokenList)
normalized.code= stringBuilder!!.toString()

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return normalized
}


    open fun match(tokenList: List<String>, start: Int, pattern: Array<String?>)
        //nullable = true from not(false or (false and false)) = true
: Int{
    //var tokenList = tokenList
    //var start = start
    //var pattern = pattern

    var index: Int = start


    var size: Int = tokenList!!.size


                    //Otherwise - statement - ForEachStmt


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return index
}


    open fun previousToken(tokenList: List<String>, start: Int)
        //nullable = true from not(false or (false and false)) = true
: String{
    //var tokenList = tokenList
    //var start = start




                        for (index in start -1 downTo 0)

        {

    
                        if(!tokenList!!.get(index)!!.equals(NEWLINE))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return tokenList!!.get(index)

                                    }
                                
}


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return NEWLINE
}


    open fun removeNeutralConverterIdioms(tokenList: List<String>)
        //nullable = true from not(false or (false and false)) = true
{
    //var tokenList = tokenList




                        for (index in 0 until tokenList!!.size!!)

        {

    var end: Int = this.match(tokenList, index, OBJECT_SUPER_TYPE)


    
                        if(end < 0)
                        
                                    {
                                    end= this.match(tokenList, index, EMPTY_SUPER_CALL)

                                    }
                                

    
                        if(end >= 0)
                        
                                    {
                                    tokenList!!.subList(index, end -1)!!.clear()

                                    }
                                
}





                        for (index in 0 until tokenList!!.size!!)

        {

    var end: Int = this.match(tokenList, index, EMPTY_CONSTRUCTOR)


    
                        if(end >= 0)
                        
                                    {
                                    
    var previous: String = this.previousToken(tokenList, index)!!


    
                        if(!previous.equals("private") && !previous.equals("protected") && !previous.equals("internal"))
                        
                                    {
                                    tokenList!!.subList(index, end)!!.clear()
index--

                                    }
                                

                                    }
                                
}

}


    open fun isModifier(token: String)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var token = token

    
                        if(token.startsWith("@"))
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return true

                                    }
                                

                    //Otherwise - statement - ForEachStmt


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return false
}


    open fun sortModifiers(lineTokenList: List<String>)
        //nullable = true from not(false or (false and false)) = true
{
    //var lineTokenList = lineTokenList

    var end: Int = 0


    var size: Int = lineTokenList!!.size


        while(end < size && this.isModifier(lineTokenList!!.get(end)))
        {
end++
}


    
                        if(end > 1)
                        
                                    {
                                    Collections.sort(lineTokenList!!.subList(0, end))

                                    }
                                
}


    open fun isIgnoredImport(importString: String)
        //nullable = true from not(false or (false and false)) = true
: Boolean{
    //var importString = importString

                        //if statement needs to be on the same line and ternary does not work the same way.
                        return importString!!.startsWith("java.lang.") || importString!!.startsWith("kotlin.")
}


    open fun endLine(stringBuilder: StringBuilder, lineTokenList: List<String>)
        //nullable = true from not(false or (false and false)) = true
{
    //var stringBuilder = stringBuilder
    //var lineTokenList = lineTokenList

    
                        if(lineTokenList!!.isEmpty())
                        
                                    {
                                    
                        //if statement needs to be on the same line and ternary does not work the same way.
                        return 

                                    }
                                
this.sortModifiers(lineTokenList)

    var size: Int = lineTokenList!!.size





                        for (index in 0 until size)

        {

    
                        if(index > 0)
                        
                                    {
                                    stringBuilder!!.append(' ')

                                    }
                                
stringBuilder!!.append(lineTokenList!!.get(index))
}

stringBuilder!!.append(NEWLINE)
lineTokenList!!.clear()
}


}
                
            

