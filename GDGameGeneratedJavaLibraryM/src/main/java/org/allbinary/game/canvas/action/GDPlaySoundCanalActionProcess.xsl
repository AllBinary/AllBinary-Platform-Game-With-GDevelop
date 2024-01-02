<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="playSoundCanalActionProcess" >

                    //PlaySoundCanal - action
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();
                    
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        <xsl:variable name="fileName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:call-template name="after-lastIndexOf"><xsl:with-param name="string" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="char" >/</xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="fileName2" ><xsl:value-of select="translate(substring-before($fileName, '.'), '_', ' ')" /></xsl:variable>
                        <xsl:variable name="fileName3" ><xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="$fileName2" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="fileName4" ><xsl:value-of select="translate($fileName3, ' ', '')" /></xsl:variable>

                        <xsl:variable name="volume" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        try {
                        
                            final Sound sound = <xsl:if test="$fileName4 = 'Select' or $fileName4 = 'Error'" >org.allbinary.media.audio.</xsl:if><xsl:if test="not($fileName4 = 'Select' or $fileName4 = 'Error')" >org.allbinary.game.resource.GD</xsl:if><xsl:value-of select="$fileName4" />Sound.getInstance();
                            final BasicPlayer player = sound.getPlayer();
                            
                            <xsl:if test="string-length($volume) > 0" >
                            final int volume = <xsl:value-of select="$volume" />;
                            final int leftVolume = volume;
                            final int rightVolume = volume;
                            player.setVolume(leftVolume, rightVolume);
                            </xsl:if>

                            if(!gameGlobals.channelSoundArray[<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>].contains(sound)) {
                                gameGlobals.channelSoundArray[<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>].add(sound);
                            }

                            player.start();

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                        }

                        return true;
                    }
        
    </xsl:template>

</xsl:stylesheet>
