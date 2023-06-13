<?xml version="1.0" encoding="UTF-8" ?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">

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
package org.allbinary.game;

import javax.microedition.lcdui.Command;

public class GDGameCommandFactory {
    
    private static final GDGameCommandFactory instance = new GDGameCommandFactory();

    /**
     * @return the instance
     */
    public static GDGameCommandFactory getInstance() {
        return instance;
    }
    
    <GDLayoutCommand/>

}
    </xsl:template>

</xsl:stylesheet>
