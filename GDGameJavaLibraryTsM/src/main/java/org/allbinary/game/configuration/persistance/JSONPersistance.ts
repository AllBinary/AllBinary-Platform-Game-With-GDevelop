
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

        


            import { Exception } from '../../../../../java/lang/Exception.js';
        
import { ByteArrayInputStream } from '../../../../../java/io/ByteArrayInputStream.js';
//not GWT import const ByteArrayInputStream

import { ByteArrayOutputStream } from '../../../../../java/io/ByteArrayOutputStream.js';
//not GWT import const ByteArrayOutputStream

import { DataInputStream } from '../../../../../java/io/DataInputStream.js';
//not GWT import const DataInputStream

import { DataOutputStream } from '../../../../../java/io/DataOutputStream.js';
//not GWT import const DataOutputStream

import { RecordEnumeration } from '../../../../../javax/microedition/rms/RecordEnumeration.js';
//not GWT import const RecordEnumeration

import { RecordStore } from '../../../../../javax/microedition/rms/RecordStore.js';
//not GWT import const RecordStore

import { TsUtil } from '../../../../../org/allbinary/TsUtil.js';
//not GWT import const TsUtil

//not plain js import { StringMaker } 
const StringMaker = globalThis.org.allbinary.logic.string.StringMaker;

//not plain js import { LogUtil } 
const LogUtil = globalThis.org.allbinary.logic.communication.log.LogUtil;

import { SmallIntegerSingletonFactory } from '../../../../../org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const SmallIntegerSingletonFactory

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;

import { AbeClientInformationInterface } from '../../../../../org/allbinary/logic/system/security/licensing/AbeClientInformationInterface.js';
//not GWT import const AbeClientInformationInterface

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { BasicPersitance } from './BasicPersitance.js';
//not GWT import - same folder const BasicPersitance

export class JSONPersistance extends BasicPersitance {
        

    private static readonly JSON_: string = "JSON ";

    readonly logUtil: LogUtil = LogUtil.getInstance()!;

    private readonly tsUtil: TsUtil = TsUtil.getInstance()!;

public constructor (recordId: string){
            super(recordId);
                    

                            //For kotlin this is before the body of the constructor.
                    
}


                //@Throws(Exception.constructor)
            
    public loadAll(abeClientInformation: AbeClientInformationInterface){
this.loadAll(abeClientInformation, 1);
    
}


                //@Throws(Exception.constructor)
            
    public loadAll(abeClientInformation: AbeClientInformationInterface, size: number){

    var recordStore: RecordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true)!;;
    

    var recordEnum: RecordEnumeration = recordStore!.enumerateRecords(
                            null, 
                            null, true)!;;
    
this.logUtil!.putF(new StringMaker().append(this.persistanceStrings!.NUMBER_OF_RECORDS)!.appendint(recordEnum!.numRecords())!.toString(), this, this.persistanceStrings!.LOAD_ALL);
    

    var smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()!;;
    

    var stringBuffer: StringMaker = new StringMaker();;
    

    var byteArrayInputStream: ByteArrayInputStream;;
    

    var inputStream: DataInputStream;;
    

    var value: string;;
    

    var id: number= 0;;
    

        while(recordEnum!.hasNextElement())
        {
id= recordEnum!.nextRecordId();
    
stringBuffer!.delete(0, stringBuffer!.length());
    
this.logUtil!.putF(stringBuffer!.append(JSONPersistance.JSON_)!.append(this.persistanceStrings!.LOADING_ID)!.appendint(id)!.toString(), this, this.persistanceStrings!.LOAD_ALL);
    
byteArrayInputStream= new ByteArrayInputStream(this.tsUtil!.getRecord(recordStore, id));
    
inputStream= new DataInputStream(byteArrayInputStream);
    




                        for (
    var index: number = 0;index < size; index++)
        {
value= inputStream!.readUTF();
    
this.logUtil!.putF(value, this, this.persistanceStrings!.LOAD_ALL);
    
this.valueList!.add(value);
    
}

this.idList!.add(smallIntegerSingletonFactory!.getAt(id));
    
}

recordStore!.closeRecordStore();
    
}


                //@Throws(Exception.constructor)
            
    public save(abeClientInformation: AbeClientInformationInterface, stringAsJSON: string){
this.logUtil!.putF(new StringMaker().append(JSONPersistance.JSON_)!.append(this.persistanceStrings!.SAVING)!.append(stringAsJSON)!.toString(), this, this.commonStrings!.SAVE);
    

    var recordStore: RecordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true)!;;
    

    var byteArrayOutputStream: ByteArrayOutputStream = new ByteArrayOutputStream();;
    

    var outputStream: DataOutputStream = new DataOutputStream(byteArrayOutputStream);;
    
outputStream!.writeUTF(stringAsJSON as string);
    

    var savedGameBytes: number[] = byteArrayOutputStream!.toByteArray()!;;
    
recordStore!.addRecord(savedGameBytes, 0, savedGameBytes!.length);
    
recordStore!.closeRecordStore();
    
}


    public getJSONAsString(): string{

                        if(this.valueList!.size() > 0)
                        
                                    {
                                    


                        //if statement needs to be on the same line and ternary does not work the same way.
                        return this.valueList!.get(0) as string;
    

                                    }
                                



                        //if statement needs to be on the same line and ternary does not work the same way.
                        return StringUtil.getInstance()!.EMPTY_STRING;
    
}


}



