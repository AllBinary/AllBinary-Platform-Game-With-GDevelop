

/*
 * AllBinary Open License Version 1
 * Copyright (c) 2022 AllBinary
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
package org.allbinary.logic.system

import java.io.ByteArrayInputStream
import java.io.InputStream

import java.util.HashMap
import java.util.Map

import com.google.gwt.resources.client.TextResource

import org.allbinary.data.resource.ResourceUtil
import org.allbinary.logic.communication.log.LogFactory
import org.allbinary.logic.communication.log.LogUtil
        
import gd.res.GD0GamePlaynResources
        
import gd.res.GD1GamePlaynResources
        

/**
 *
 * @author User
 */
open class PlatformAssetManager {

    companion object {

    private val instance: PlatformAssetManager = PlatformAssetManager()

    /**
     * @return the instance
     */
    open fun getInstance(): PlatformAssetManager {
        return PlatformAssetManager.instance
    }

    }

    val logUtil: LogUtil = LogUtil.getInstance()

    open fun getResourceAsStream(resource: String): InputStream {
        val resourceUtil: ResourceUtil = ResourceUtil.getInstance()
        val inputStream: InputStream = resourceUtil.getResourceAsStream(resource)
        return this.getText(resource, inputStream)
    }

    private val GET_TEXT: String = "getText"
    //private val DONE: String = "ResourceCallback:done"
    //private val ERROR: String = "ResourceCallback:error"

    private var textToResource: Map = HashMap<Any, Any>()
    //private var requestToResource: Map = HashMap()

    open inner class RequestedText {
        var text: String
    }

    open fun getTextResource(resource: String): TextResource {
        
        {
            throw RuntimeException(resource)
        }
    }

    open fun getText(resource: String, inputStream: InputStream): InputStream? {

        val requestedText2: RequestedText = textToResource.get(resource) as RequestedText
        if(requestedText2 != null && requestedText2.text != null) {
            logUtil.putF("Text already loaded: " + resource, this, GET_TEXT)
            val byteArray: ByteArray = requestedText2.text.encodeToByteArray()
            val byteArrayInputStream: ByteArrayInputStream = ByteArrayInputStream(byteArray)
            //return arrayOf(byteArrayInputStream, text.length)
            return byteArrayInputStream
        } else {

            if(requestedText2 != null) {
                logUtil.putF("Already Loading Text: " + resource, this, GET_TEXT)
            } else {
                logUtil.putF("Loading Text: " + resource, this, GET_TEXT)

                val text: String = this.getTextResource(resource).getText()
                val requestedText: RequestedText = RequestedText()
                requestedText.text = text
                textToResource.put(resource, requestedText)
                logUtil.putF("Loaded Text: " + text.length, this, GET_TEXT)

//                var callback: ResourceCallback = object: ResourceCallback() {
//                    override fun done(resource: Object) {
//                        logUtil.putF(DONE, this, GET_TEXT)
//                        text = resource as String
//                        requestProcessing = false
//                    }
//
//                    override fun error(e: Throwable) {
//                        logUtil.putF(CommonStrings.getInstance().EXCEPTION_LABEL + ERROR, this, GET_TEXT)
//                        requestProcessing = false
//                    }
//                }
//
//                PlayN.assetManager().getText(inputStream.getLocator(), callback)

//                var requestCallback: RequestCallback = object: RequestCallback() {
//                    override fun onResponseReceived(req: Request, resp: Response) {
//                        logUtil.putF(DONE, this, GET_TEXT)
//                        text = resp.getText()
//                        requestProcessing = false
//                    }
//
//                    override fun onError(res: Request, throwable: Throwable) {
//                        logUtil.putF(CommonStrings.getInstance().EXCEPTION_LABEL + ERROR, this, GET_TEXT)
//                        requestProcessing = false
//                    }
//                }
//
//                try {
//                    PlayN.assetManager().getTextGWT(inputStream.getLocator(), requestCallback)
//                } catch(e: Exception) {
//                    logUtil.put(CommonStrings.getInstance().EXCEPTION, this, GET_TEXT, e)
//                }
            }

            //logUtil.putF("Null Text May not have loaded yet: " + resource, this, GET_TEXT)
            return null
        }

    }
}

    
