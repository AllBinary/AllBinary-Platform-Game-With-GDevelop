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

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/case.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/indexof.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/replace.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/reverse.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/split.xsl" />
    
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src/main/java/org/allbinary/game/canvas/GDGlobalCalls.xsl" />

    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDObjectAtIndex.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDAction.xsl" />
    <xsl:import href="../GDGameGeneratedJavaLibraryM/src\main/java/org/allbinary/game/canvas/GDEventCreateAssignGDObject.xsl" />
        
    <xsl:output method="html" indent="yes" />

    <xsl:template match="/game">
        //game
        <xsl:variable name="windowWidth" select="properties/windowWidth" />
                
package org.allbinary.media.audio;

import org.allbinary.util.BasicArrayList;
import org.allbinary.util.BasicArrayListD;
        
public class GDGameSounds
extends BaseSoundsFactory
{
    private Sound[] soundInterfaceArray = new Sound[0];
    
    @Override
    public void init() 
    {
        //soundInterfaceArray = new Sound[1];
        int index = 0;

        final BasicArrayList list = new BasicArrayListD();
        
    list.add(SelectSound.getInstance());
    list.add(ErrorSound.getInstance());

<xsl:for-each select="layouts" >        
    final GD<xsl:value-of select="position() - 1" />GameMusicFactory gd<xsl:value-of select="position() - 1" />GameMusicFactory = GD<xsl:value-of select="position() - 1" />GameMusicFactory.getInstance();
    list.addAllList(gd<xsl:value-of select="position() - 1" />GameMusicFactory.soundList);
                
    final GD<xsl:value-of select="position() - 1" />GameSoundsFactory gd<xsl:value-of select="position() - 1" />GameSoundsFactory = GD<xsl:value-of select="position() - 1" />GameSoundsFactory.getInstance();
    list.addAllList(gd<xsl:value-of select="position() - 1" />GameSoundsFactory.soundList);
</xsl:for-each>

        //soundInterfaceArray = (Sound[]) list.toArrayType(new Sound[list.size()]);
        final int size = list.size();
        this.soundInterfaceArray = new Sound[size];
        for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index2++) {
            this.soundInterfaceArray[index2] = (Sound) list.get(index2);
        }
        
    }
    
    @Override
    public Sound[] getSoundInterfaceArray() throws Exception
    {
        return this.soundInterfaceArray;
    }
}
    </xsl:template>

    <xsl:key name="objectsByName" match="objects" use="name" />

    <xsl:key name="objectsGroupsByName" match="objectsGroups" use="name" />

</xsl:stylesheet>
