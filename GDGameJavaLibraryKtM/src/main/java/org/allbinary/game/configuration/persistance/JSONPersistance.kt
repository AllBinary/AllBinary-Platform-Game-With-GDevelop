
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
        package org.allbinary.game.configuration.persistance




        import java.lang.Object        
        
        
        import kotlin.Array
        import kotlin.reflect.KClass
        
import java.io.ByteArrayInputStream
import java.io.ByteArrayOutputStream
import java.io.DataInputStream
import java.io.DataOutputStream
import javax.microedition.rms.RecordEnumeration
import javax.microedition.rms.RecordStore
import org.allbinary.TsUtil
import org.allbinary.logic.string.StringMaker
import org.allbinary.logic.communication.log.LogUtil
import org.allbinary.logic.math.SmallIntegerSingletonFactory
import org.allbinary.logic.string.StringUtil
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface

open public class JSONPersistance : BasicPersitance {
        
companion object {
            
    private val JSON_: String = "JSON "

        }
            
    val logUtil: LogUtil = LogUtil.getInstance()!!

    private val tsUtil: TsUtil = TsUtil.getInstance()!!
public constructor (recordId: String)                        

                            : super(recordId){
    //var recordId = recordId


                            //For kotlin this is before the body of the constructor.
                    
}


                @Throws(Exception::class)
            
    open fun loadAll(abeClientInformation: AbeClientInformationInterface)
        //nullable = true from not(false or (false and false)) = true
{
    //var abeClientInformation = abeClientInformation
this.loadAll(abeClientInformation, 1)
}


                @Throws(Exception::class)
            
    open fun loadAll(abeClientInformation: AbeClientInformationInterface, size: Int)
        //nullable = true from not(false or (false and false)) = true
{
    //var abeClientInformation = abeClientInformation
var size = size

    var recordStore: RecordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true)!!


    var recordEnum: RecordEnumeration = recordStore!!.enumerateRecords(
                            null, 
                            null, true)!!

this.logUtil!!.putF(StringMaker().
                            append(this.persistanceStrings!!.NUMBER_OF_RECORDS)!!.appendint(recordEnum!!.numRecords())!!.toString(), this, this.persistanceStrings!!.LOAD_ALL)

    var smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()!!


    var stringBuffer: StringMaker = StringMaker()


    var byteArrayInputStream: ByteArrayInputStream


    var inputStream: DataInputStream


    var value: String


    var id: Int= 0


        while(recordEnum!!.hasNextElement())
        {
id= recordEnum!!.nextRecordId()
stringBuffer!!.delete(0, stringBuffer!!.length())
this.logUtil!!.putF(stringBuffer!!.append(JSONPersistance.JSON_)!!.append(this.persistanceStrings!!.LOADING_ID)!!.appendint(id)!!.toString(), this, this.persistanceStrings!!.LOAD_ALL)
byteArrayInputStream= ByteArrayInputStream(this.tsUtil!!.getRecord(recordStore, id))
inputStream= DataInputStream(byteArrayInputStream)




                        for (index in 0 until size)

        {
value= inputStream!!.readUTF()
this.logUtil!!.putF(value, this, this.persistanceStrings!!.LOAD_ALL)
this.valueList!!.add(value)
}

this.idList!!.add(smallIntegerSingletonFactory!!.getAt(id))
}

recordStore!!.closeRecordStore()
}


                @Throws(Exception::class)
            
    open fun save(abeClientInformation: AbeClientInformationInterface, stringAsJSON: String)
        //nullable = true from not(false or (false and false)) = true
{
    //var abeClientInformation = abeClientInformation
    //var stringAsJSON = stringAsJSON
this.logUtil!!.putF(StringMaker().
                            append(JSONPersistance.JSON_)!!.append(this.persistanceStrings!!.SAVING)!!.append(stringAsJSON)!!.toString(), this, this.commonStrings!!.SAVE)

    var recordStore: RecordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true)!!


    var byteArrayOutputStream: ByteArrayOutputStream = ByteArrayOutputStream()


    var outputStream: DataOutputStream = DataOutputStream(byteArrayOutputStream)

outputStream!!.writeUTF(stringAsJSON as String)

    var savedGameBytes: ByteArray = byteArrayOutputStream!!.toByteArray()!!

recordStore!!.addRecord(savedGameBytes, 0, savedGameBytes!!.size)
recordStore!!.closeRecordStore()
}


    open fun getJSONAsString()
        //nullable = true from not(false or (false and true)) = true
: String{

    
                        if(this.valueList!!.size() > 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.valueList!!.get(0) as String

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return StringUtil.getInstance()!!.EMPTY_STRING
}


}
                
            

