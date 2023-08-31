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
package org.allbinary.logic.system;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import java.util.HashMap;
import java.util.Map;

import com.google.gwt.resources.client.TextResource;

import org.allbinary.data.resource.ResourceUtil;
import org.allbinary.logic.communication.log.LogFactory;
import org.allbinary.logic.communication.log.LogUtil;
        <xsl:for-each select="layouts" >
            <xsl:variable name="index" select="position() - 1" />
import gd.res.GD<xsl:value-of select="$index" />GamePlaynResources;
        </xsl:for-each>

/**
 *
 * @author User
 */
public class PlatformAssetManager {
    
    private static final PlatformAssetManager instance = new PlatformAssetManager();

    /**
     * @return the instance
     */
    public static PlatformAssetManager getInstance() {
        return instance;
    }
    
    public InputStream getResourceAsStream(final String resource) throws Exception {
        final ResourceUtil resourceUtil = ResourceUtil.getInstance();
        final InputStream inputStream = resourceUtil.getResourceAsStream(resource);
        return this.getText(resource, inputStream);
    }
    
    private final String GET_TEXT = "getText";
    //private final String DONE = "ResourceCallback:done";
    //private final String ERROR = "ResourceCallback:error";
    
    private Map textToResource = new HashMap();
    private Map requestToResource = new HashMap();

    class RequestedText {
        public String text;
    };
    
    public TextResource getTextResource(final String resource) {
        <xsl:for-each select="layouts" >
            <xsl:variable name="index" select="position() - 1" />

            //<xsl:if test="position() != 1" >} else </xsl:if>
        
        <xsl:for-each select="objects" ><xsl:variable name="typeValue" select="type" />
        <xsl:if test="$typeValue = 'TileMap::TileMap'" >
            <xsl:if test="content" >
                <xsl:variable name="jsonWithExtension" select="content/tilemapJsonFile" />
                <xsl:variable name="json" select="substring-before($jsonWithExtension, '.')" />
        if (GD<xsl:value-of select="$index" />GamePlaynResources.INSTANCE.NAMES[0].compareTo(resource) == 0) {
        return GD<xsl:value-of select="$index" />GamePlaynResources.INSTANCE.
        <xsl:call-template name="upper-case" >
            <xsl:with-param name="text" >
                <xsl:value-of select="$json" />();</xsl:with-param>
        </xsl:call-template>
        <xsl:variable name="tilesetJsonFileWithExtension" select="content/tilesetJsonFile" />
        } else if (GD<xsl:value-of select="$index" />GamePlaynResources.INSTANCE.NAMES[1].compareTo(resource) == 0) {
        return GD<xsl:value-of select="$index" />GamePlaynResources.INSTANCE.<xsl:variable name="tilesetJsonFileN" select="substring-before($tilesetJsonFileWithExtension, '.')" />
        <xsl:call-template name="upper-case" >
            <xsl:with-param name="text" >
                <xsl:value-of select="$tilesetJsonFileN" />();</xsl:with-param>
        </xsl:call-template>
        
    <xsl:for-each select="content/tilesetJsonFiles" >
    <xsl:variable name="json" select="substring-before(text(), '.')" />
        } else if (GD<xsl:value-of select="$index" />GamePlaynResources.INSTANCE.NAMES[<xsl:value-of select="position() + 1" />].compareTo(resource) == 0) {
        return GD<xsl:value-of select="$index" />GamePlaynResources.INSTANCE.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$json" />();</xsl:with-param></xsl:call-template>
    </xsl:for-each>
        
        </xsl:if>
        </xsl:if>
        </xsl:for-each>
            
        </xsl:for-each>

        } else {
            throw new RuntimeException();
        }
    }
    
    public InputStream getText(final String resource, final InputStream inputStream) {
        
        final RequestedText requestedText2 = (RequestedText) textToResource.get(resource);
        if(requestedText2 != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> requestedText2.text != null) {
            LogUtil.put(LogFactory.getInstance("Text already loaded: " + resource, this, GET_TEXT));
            final byte[] byteArray = requestedText2.text.getBytes();
            final ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(byteArray);
            //return new Object[] {byteArrayInputStream, text.length()};
            return byteArrayInputStream;
        } else {
            
            if(requestedText2 != null) {
                LogUtil.put(LogFactory.getInstance("Already Loading Text: " + resource, this, GET_TEXT));
            } else {
                LogUtil.put(LogFactory.getInstance("Loading Text: " + resource, this, GET_TEXT));

                final String text = this.getTextResource(resource).getText();
                final RequestedText requestedText = new RequestedText();
                requestedText.text = text;
                textToResource.put(resource, requestedText);
                LogUtil.put(LogFactory.getInstance("Loaded Text: " + text.length(), this, GET_TEXT));
                
//                final ResourceCallback callback = new ResourceCallback() {
//                    @Override
//                    public void done(Object resource) {
//                        LogUtil.put(LogFactory.getInstance(DONE, this, GET_TEXT));
//                        text = (String) resource;
//                        requestProcessing = false;
//                    }
//
//                    @Override
//                    public void error(Throwable e) {
//                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION_LABEL + ERROR, this, GET_TEXT));
//                        requestProcessing = false;
//                    }
//                };
//
//                PlayN.assetManager().getText(inputStream.getLocator(), callback);
                
//                final RequestCallback requestCallback = new RequestCallback() {
//                    @Override
//                    public void onResponseReceived(Request req, Response resp) {
//                        LogUtil.put(LogFactory.getInstance(DONE, this, GET_TEXT));
//                        text = resp.getText();
//                        requestProcessing = false;
//                    }
//
//                    @Override
//                    public void onError(Request res, Throwable throwable) {
//                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION_LABEL + ERROR, this, GET_TEXT));
//                        requestProcessing = false;
//                    }
//                };
//
//                try {
//                    PlayN.assetManager().getTextGWT(inputStream.getLocator(), requestCallback);
//                } catch (Exception e) {
//                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, GET_TEXT, e));
//                }
            }
            
            return null;
        }

    }
}

    </xsl:template>

</xsl:stylesheet>
