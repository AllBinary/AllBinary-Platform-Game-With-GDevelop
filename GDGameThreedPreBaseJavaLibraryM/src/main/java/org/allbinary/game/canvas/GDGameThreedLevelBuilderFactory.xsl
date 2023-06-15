<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    
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
package org.allbinary.game.canvas;

import org.allbinary.util.BasicArrayList;

/**
 *
 * @author User
 */
//private final GDGameThreedLevelBuilderFactory gameThreedLevelBuilderFactory = GDGameThreedLevelBuilderFactory.getInstance();
public class GDGameThreedLevelBuilderFactory {
    
    private static final GDGameThreedLevelBuilderFactory instance = new GDGameThreedLevelBuilderFactory();

    /**
     * @return the instance
     */
    public static GDGameThreedLevelBuilderFactory getInstance() {
        return instance;
    }
    
    
    public final BasicArrayList list = new BasicArrayList();
    
    private GDGameThreedLevelBuilderFactory() {
        <xsl:for-each select="layouts" >
            <xsl:variable name="layoutIndex" select="position() - 1" />
        //Layout name=<xsl:value-of select="name" />
        this.list.add(new GD<xsl:value-of select="$layoutIndex" />GameThreedLevelBuilder());           
        </xsl:for-each>
    }

}        
    </xsl:template>

</xsl:stylesheet>
