
        /*
                *  
                *  GDevelop to AllBinary Core 
                *  Copyright 2021 Travis Berthelot (travisberthelot@allbinary.com). All rights  reserved. This project is released under the MIT License.  
        */
        
        /* Generated Code Do Not Modify */
        package org.allbinary.gdevelop.loader




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
                    
        
import org.allbinary.gdevelop.json.GDProject
import org.allbinary.logic.communication.log.LogUtil

open public class GDToAndroidResourceStringsXmlKtGradleGenerator : GDNameFileGenerator {
        

    val logUtil: LogUtil = LogUtil.getInstance()!!

    private var name: String
public constructor ()                        

                            : super(GDPaths.getInstance()!!.ROOT_PATH +"platformx\\android\\GDGameAndroidApplicationNoLicensingKtGradle\\strings.xml.xsl", GDPaths.getInstance()!!.GEN_PATH +"platformx\\android\\GDGameAndroidApplicationNoLicensingKtGradle\\app\\src\\main\\res\\values\\" +"strings.xml"){


                            //For kotlin this is before the body of the constructor.
                    
}


    override fun process(gdProject: GDProject)
        //nullable = true from not(false or (false and false)) = true
{
    //var gdProject = gdProject
this.name= gdProject!!.name
}


                @Throws(Exception::class)
            
    override fun process()
        //nullable = true from not(false or (false and true)) = true
{

    var newFileAsString: String = GDTemplateUtil.getInstance()!!.process(this.originalFilePath, this.GD_KEY, this.NAME, this.name)!!

this.logUtil!!.putF(this.gdToolStrings!!.FILENAME +this.newFilePath, this, this.commonStrings!!.PROCESS)
this.bufferedWriterUtil!!.overwrite(this.newFilePath, newFileAsString)
}


}
                
            

