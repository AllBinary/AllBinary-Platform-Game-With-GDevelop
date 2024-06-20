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
        
        final String LOADING_ID = "Loading id: ";
        final String METHOD_NAME = "loadAll";
        
        LogUtil.put(LogFactory.getInstance(new StringMaker().append("Number of records: ").append(recordEnum.numRecords()).toString(), this, METHOD_NAME));
        
        ByteArrayInputStream byteArrayInputStream;
        DataInputStream inputStream;
        
        String value;

        final SmallIntegerSingletonFactory smallIntegerSingletonFactory = SmallIntegerSingletonFactory.getInstance();
        
        while (recordEnum.hasNextElement())
        {
            final int id = recordEnum.nextRecordId();

            LogUtil.put(LogFactory.getInstance(new StringMaker().append(LOADING_ID).append(id).toString(), this, METHOD_NAME));
            
            byteArrayInputStream = 
                new ByteArrayInputStream(recordStore.getRecord(id));
            inputStream = new DataInputStream(byteArrayInputStream);

            for (int index = 0; index < size; index++)
            {
                value = inputStream.readUTF();
                LogUtil.put(LogFactory.getInstance(value, this, METHOD_NAME));
                this.getList().add(value);
            }

            this.getIds().add(smallIntegerSingletonFactory.getInstance(id));
        }

        recordStore.closeRecordStore();
    }
    
    public void save(final AbeClientInformationInterface abeClientInformation, final String stringAsJSON) throws Exception
    {
        LogUtil.put(LogFactory.getInstance(new StringMaker().append("Saving: ").append(stringAsJSON).toString(), this, "save"));
        
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
        if(this.getList().size() > 0) {
            return (String) this.getList().get(0);
        }
        return null;
    }
}
