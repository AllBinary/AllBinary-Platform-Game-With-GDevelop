/*
* AllBinary Open License Version 1
* Copyright (c) 2011 AllBinary
* 
* By agreeing to this license you and any business entity you represent are
* legally bound to the AllBinary Open License Version 1 legal agreement.
* 
* You may obtain the AllBinary Open License Version 1 legal agreement from
* AllBinary or the root directory of AllBinary's AllBinary Platform repository.
* 
* Created By: Travis Berthelot
* 
*/
package org.allbinary.game.configuration.persistance;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;

import javax.microedition.rms.RecordEnumeration;
import javax.microedition.rms.RecordStore;

import org.allbinary.logic.string.StringMaker;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
import org.allbinary.logic.math.SmallIntegerSingletonFactory;
import org.allbinary.logic.system.security.licensing.AbeClientInformationInterface;

public class JSONPersistance extends BasicPersitance
{
    private static final String JSON_ = "JSON ";

    public JSONPersistance(final String recordId)
    {
        super(recordId);
    }
        
    public void loadAll(final AbeClientInformationInterface abeClientInformation) throws Exception
    {
        this.loadAll(abeClientInformation, 1);
    }
    
    public void loadAll(final AbeClientInformationInterface abeClientInformation, int size) throws Exception
    {
        final RecordStore recordStore = RecordStore.openRecordStore(
                this.getRecordId(abeClientInformation), true);

        final RecordEnumeration recordEnum = 
            recordStore.enumerateRecords(null, null,true);
        
        LogUtil.put(LogFactory.getInstance(new StringMaker().append(this.persistanceStrings.NUMBER_OF_RECORDS).append(recordEnum.numRecords()).toString(), this, this.persistanceStrings.LOAD_ALL));
        
        final SmallIntegerSingletonFactory smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        final StringMaker stringBuffer = new StringMaker();
        
        ByteArrayInputStream byteArrayInputStream;
        DataInputStream inputStream;        
        String value;
        int id;
        while (recordEnum.hasNextElement())
        {
            id = recordEnum.nextRecordId();

            stringBuffer.delete(0, stringBuffer.length());
            LogUtil.put(LogFactory.getInstance(stringBuffer.append(JSON_).append(this.persistanceStrings.LOADING_ID).append(id).toString(), this, this.persistanceStrings.LOAD_ALL));
            
            byteArrayInputStream = 
                new ByteArrayInputStream(recordStore.getRecord(id));
            inputStream = new DataInputStream(byteArrayInputStream);

            for (int index = 0; index < size; index++)
            {
                value = inputStream.readUTF();
                LogUtil.put(LogFactory.getInstance(value, this, this.persistanceStrings.LOAD_ALL));
                valueList.add(value);
            }

            this.idList.add(smallIntegerSingletonFactory.getInstance(id));
        }

        recordStore.closeRecordStore();
    }
    
    public void save(final AbeClientInformationInterface abeClientInformation, final String stringAsJSON) throws Exception
    {
        LogUtil.put(LogFactory.getInstance(new StringMaker().append(JSON_).append(this.persistanceStrings.SAVING).append(stringAsJSON).toString(), this, this.persistanceStrings.SAVE));
        
        final RecordStore recordStore = RecordStore.openRecordStore(
                this.getRecordId(abeClientInformation), true);

        final ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        final DataOutputStream outputStream = new DataOutputStream(
                byteArrayOutputStream);

        outputStream.writeUTF((String) stringAsJSON);

        //final byte[] savedGameBytes = byteArrayOutputStream.toString().getBytes();
        final byte[] savedGameBytes = byteArrayOutputStream.toByteArray();

        recordStore.addRecord(savedGameBytes, 0, savedGameBytes.length);

        recordStore.closeRecordStore();
    }

    public String getJSONAsString() {
        if(this.valueList.size() > 0) {
            return (String) valueList.get(0);
        }
        return null;
    }
}
