<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/case.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDActionZoomCameraGlobal.xsl" />

    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

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
        <xsl:for-each select="layouts" >
            <xsl:variable name="index" select="position() - 1" />
import gd.res.GD<xsl:value-of select="$index" />GamePlaynResources
        </xsl:for-each>

/**
 *
 * @author User
 */
open class PlatformAssetManager {

    private val instance: PlatformAssetManager = PlatformAssetManager()

    /**
     * @return the instance
     */
    fun getInstance(): PlatformAssetManager {
        return PlatformAssetManager.instance
    }

    protected val logUtil: LogUtil = LogUtil.getInstance()

    fun getResourceAsStream(resource: String): InputStream {
        val resourceUtil: ResourceUtil = ResourceUtil.getInstance()
        val inputStream: InputStream = resourceUtil.getResourceAsStream(resource)
        return this.getText(resource, inputStream)
    }

    private val GET_TEXT: String = "getText"
    //private final String DONE = "ResourceCallback:done"
    //private final String ERROR = "ResourceCallback:error"

    private var textToResource: Map = HashMap()
    //private Map requestToResource = HashMap()

    open class RequestedText {
        var text: String
    }

    fun getTextResource(resource: String): TextResource {
        <xsl:for-each select="layouts" >
            <xsl:variable name="index" select="position() - 1" />

        <xsl:for-each select="objects" >
            <xsl:variable name="typeValue" select="type" />
        <xsl:if test="$typeValue = 'TileMap::TileMap'" >
            <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
            <xsl:variable name="previousCount" ><xsl:value-of select="count(../objects[type = 'TileMap::TileMap' and number(substring(generate-id(), 2) - 65536) &lt; $id])" /></xsl:variable>
            //previousCount=<xsl:value-of select="$previousCount" />
            <xsl:if test="content" >
                <xsl:variable name="lastPosition" ><xsl:value-of select="position()" /></xsl:variable>
                <xsl:variable name="jsonWithExtension" select="content/tilemapJsonFile" />
                <xsl:variable name="json" select="substring-before($jsonWithExtension, '.')" />
        if (GD<xsl:value-of select="$index" />GamePlaynResources.INSTANCE.NAMES[<xsl:value-of select="$previousCount * 2" />].compareTo(resource) == 0) {
        return GD<xsl:value-of select="$index" />GamePlaynResources.INSTANCE.
        <xsl:call-template name="upper-case" >
            <xsl:with-param name="text" >
                <xsl:value-of select="$json" />();</xsl:with-param>
        </xsl:call-template>

        <xsl:variable name="tilesetJsonFileWithExtension" select="content/tilesetJsonFile" />
        } else if (GD<xsl:value-of select="$index" />GamePlaynResources.INSTANCE.NAMES[<xsl:value-of select="($previousCount * 2) + 1" />].compareTo(resource) == 0) {
        return GD<xsl:value-of select="$index" />GamePlaynResources.INSTANCE.<xsl:variable name="tilesetJsonFileN" select="substring-before($tilesetJsonFileWithExtension, '.')" />
        <xsl:call-template name="upper-case" >
            <xsl:with-param name="text" >
                <xsl:value-of select="$tilesetJsonFileN" />();</xsl:with-param>
        </xsl:call-template>

        <xsl:if test="not(content/tilesetJsonFiles)" >
                } else //else1
        </xsl:if>

        <xsl:for-each select="content/tilesetJsonFiles" >
        <xsl:variable name="json" select="substring-before(text(), '.')" />
        } else if (GD<xsl:value-of select="$index" />GamePlaynResources.INSTANCE.NAMES[<xsl:value-of select="($previousCount * 2) + 2" />].compareTo(resource) == 0) {
        return GD<xsl:value-of select="$index" />GamePlaynResources.INSTANCE.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$json" />();</xsl:with-param></xsl:call-template>

    <xsl:for-each select="../../../objects" >
        <xsl:if test="$lastPosition" >
        <xsl:variable name="typeValue" select="type" />
        <xsl:if test="$typeValue = 'TileMap::TileMap'" >
            <xsl:if test="content" >
                <xsl:if test="position() != 1" >
        } else //else2
        <xsl:text>&#10;</xsl:text>
                </xsl:if>
            </xsl:if>
        </xsl:if>
        </xsl:if>
    </xsl:for-each>

        </xsl:for-each>

            </xsl:if>
        </xsl:if>
        </xsl:for-each>

        </xsl:for-each>
        {
            throw RuntimeException(resource)
        }
    }

    fun getText(resource: String, inputStream: InputStream): InputStream {

        val requestedText2: RequestedText = textToResource.get(resource) as RequestedText
        if(requestedText2 != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> requestedText2.text != null) {
            logUtil.putF("Text already loaded: " + resource, this, GET_TEXT)
            val byteArray: Array&lt;Byte&gt; = requestedText2.text.getBytes()
            val byteArrayInputStream: ByteArrayInputStream = ByteArrayInputStream(byteArray)
            //return new Object[] {byteArrayInputStream, text.length()}
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
                logUtil.putF("Loaded Text: " + text.length(), this, GET_TEXT)

//                final ResourceCallback callback = ResourceCallback() {
//                    @Override
//                    public void done(Object resource) {
//                        logUtil.putF(DONE, this, GET_TEXT)
//                        text = resource as String
//                        requestProcessing = false
//                    }
//
//                    @Override
//                    public void error(Throwable e) {
//                        logUtil.putF(CommonStrings.getInstance().EXCEPTION_LABEL + ERROR, this, GET_TEXT)
//                        requestProcessing = false
//                    }
//                }
//
//                PlayN.assetManager().getText(inputStream.getLocator(), callback)

//                final RequestCallback requestCallback = RequestCallback() {
//                    @Override
//                    public void onResponseReceived(Request req, Response resp) {
//                        logUtil.putF(DONE, this, GET_TEXT)
//                        text = resp.getText()
//                        requestProcessing = false
//                    }
//
//                    @Override
//                    public void onError(Request res, Throwable throwable) {
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

    </xsl:template>

</xsl:stylesheet>
