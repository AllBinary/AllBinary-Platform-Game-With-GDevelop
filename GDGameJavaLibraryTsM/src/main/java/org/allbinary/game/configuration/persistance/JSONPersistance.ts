
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
type StringMaker<T = any, U = any> = typeof StringMaker extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringMaker;

import { SmallIntegerSingletonFactory } from '../../../../../org/allbinary/logic/math/SmallIntegerSingletonFactory.js';
//not GWT import const SmallIntegerSingletonFactory

//not plain js import { StringUtil } 
const StringUtil = globalThis.org.allbinary.logic.string.StringUtil;
type StringUtil<T = any, U = any> = typeof StringUtil extends abstract new (...args: any[]) => infer Instance ? Instance : typeof StringUtil;

import { AbeClientInformationInterface } from '../../../../../org/allbinary/logic/system/security/licensing/AbeClientInformationInterface.js';
//not GWT import const AbeClientInformationInterface

















                                        
        //Current folder imports from return types, extended types, and scope (deduplicated)
        import { BasicPersitance } from './BasicPersitance.js';
//not GWT import - same folder const BasicPersitance
import { NullRecordFilter } from './NullRecordFilter.js';
//not GWT import - same folder const NullRecordFilter
import { NullRecordComparator } from './NullRecordComparator.js';
//not GWT import - same folder const NullRecordComparator

export class JSONPersistance extends BasicPersitance {
        

    private static readonly JSON_: string = "JSON ";

    private readonly tsUtil: TsUtil = TsUtil.getInstance()!;

public constructor (recordId: string){
            super(recordId);
                    

                            //For kotlin this is before the body of the constructor.
                    
}

loadAll(...args: any[]): any {
   
    if (args.length === 1) return this.loadAll$overload1(args[0]);
   
    if (args.length === 2 && typeof args[1] === 'number') return this.loadAll$overload2(args[0], args[1]);
   
   throw new TypeError('No matching overload: loadAll'); }
  
                //@Throws(Exception.constructor)
            
    public loadAll$overload1(abeClientInformation: AbeClientInformationInterface){
this.loadAll(abeClientInformation, 1);
    
}


                //@Throws(Exception.constructor)
            
    public loadAll$overload2(abeClientInformation: AbeClientInformationInterface, size: number){

    let recordStore: RecordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true)!;;
    

    let recordEnum: RecordEnumeration = recordStore!.enumerateRecords(NullRecordFilter.NULL_RECORD_FILTER, NullRecordComparator.NULL_RECORD_COMPARATOR, true)!;;
    
this.logUtil!.putF(new StringMaker().append(this.persistanceStrings!.NUMBER_OF_RECORDS)!.appendint(recordEnum!.numRecords())!.toString(), this, this.persistanceStrings!.LOAD_ALL);
    

    let smallIntegerSingletonFactory: SmallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance()!;;
    

    let stringBuffer: StringMaker = new StringMaker();;
    

    let byteArrayInputStream: ByteArrayInputStream;;
    

    let inputStream: DataInputStream;;
    

    let value: string;;
    

    let id: number= 0;;
    

        while(recordEnum!.hasNextElement())
        {
id= recordEnum!.nextRecordId();
    
stringBuffer!.delete(0, stringBuffer!.length());
    
this.logUtil!.putF(stringBuffer!.append(JSONPersistance.JSON_)!.append(this.persistanceStrings!.LOADING_ID)!.appendint(id)!.toString(), this, this.persistanceStrings!.LOAD_ALL);
    
byteArrayInputStream= new ByteArrayInputStream(this.tsUtil!.getRecord(recordStore, id));
    
inputStream= new DataInputStream(byteArrayInputStream);
    




                        for (
    let index: number = 0;index < size; index++)
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
    

    let recordStore: RecordStore = RecordStore.openRecordStore(this.getRecordId(abeClientInformation), true)!;;
    

    let byteArrayOutputStream: ByteArrayOutputStream = new ByteArrayOutputStream();;
    

    let outputStream: DataOutputStream = new DataOutputStream(byteArrayOutputStream);;
    
outputStream!.writeUTF(stringAsJSON as string);
    

    let savedGameBytes: number[] = byteArrayOutputStream!.toByteArray()!;;
    
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

