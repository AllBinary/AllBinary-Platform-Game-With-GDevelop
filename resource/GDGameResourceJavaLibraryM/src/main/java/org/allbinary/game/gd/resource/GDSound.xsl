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

<!-- File generation template (was GDSound.origin). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />

    <xsl:param name="GDNAME" />
    <xsl:param name="GD_FILE_NAME" />
    <xsl:param name="GD_DURATION" />

    <xsl:template match="/"><xsl:text>
package org.allbinary.game.gd.resource;&#13;
&#13;
import org.allbinary.media.audio.Sound;&#13;
import org.allbinary.media.audio.CompositeSound;&#13;
&#13;
&#13;
public class GD</xsl:text><xsl:value-of select="$GDNAME" /><xsl:text>Sound extends CompositeSound&#13;
{&#13;
   private static Sound soundInterface = new GD</xsl:text><xsl:value-of select="$GDNAME" /><xsl:text>Sound();&#13;
   &#13;
   private GD</xsl:text><xsl:value-of select="$GDNAME" /><xsl:text>Sound()&#13;
   {&#13;
       super("resource:/wav/</xsl:text><xsl:value-of select="$GD_FILE_NAME" /><xsl:text>.wav");&#13;
   }&#13;
   &#13;
   public static Sound getInstance()&#13;
   {&#13;
      return GD</xsl:text><xsl:value-of select="$GDNAME" /><xsl:text>Sound.soundInterface;&#13;
   }&#13;
&#13;
   @Override&#13;
   public int getDuration()&#13;
   {&#13;
	   return </xsl:text><xsl:value-of select="$GD_DURATION" /><xsl:text>;&#13;
   }&#13;
&#13;
}&#13;
</xsl:text></xsl:template>

</xsl:stylesheet>
