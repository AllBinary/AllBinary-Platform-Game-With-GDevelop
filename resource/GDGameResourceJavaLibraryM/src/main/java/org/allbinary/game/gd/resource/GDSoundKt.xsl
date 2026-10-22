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

<!-- File generation template for Kotlin (made from the Java template that was GDSound.origin). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />

    <xsl:param name="GDNAME" />
    <xsl:param name="GD_FILE_NAME" />
    <xsl:param name="GD_DURATION" />

    <xsl:template match="/"><xsl:text>/*&#13;
* AllBinary Open License Version 1&#13;
* Copyright (c) 2011 AllBinary&#13;
* &#13;
* By agreeing to this license you and any business entity you represent are&#13;
* legally bound to the AllBinary Open License Version 1 legal agreement.&#13;
* &#13;
* You may obtain the AllBinary Open License Version 1 legal agreement from&#13;
* AllBinary or the root directory of AllBinary's AllBinary Platform repository.&#13;
* &#13;
* Created By: Travis Berthelot&#13;
* &#13;
 */&#13;
package org.allbinary.game.gd.resource&#13;
&#13;
import org.allbinary.media.audio.Sound&#13;
import org.allbinary.media.audio.CompositeSound&#13;
&#13;
&#13;
open public class GD</xsl:text><xsl:value-of select="$GDNAME" /><xsl:text>Sound : CompositeSound&#13;
{&#13;
   companion object {&#13;
&#13;
      private var soundInterface: Sound = GD</xsl:text><xsl:value-of select="$GDNAME" /><xsl:text>Sound()&#13;
&#13;
      fun getInstance(): Sound&#13;
      {&#13;
         return soundInterface&#13;
      }&#13;
&#13;
   }&#13;
&#13;
   private constructor()&#13;
       : super("resource:/wav/</xsl:text><xsl:value-of select="$GD_FILE_NAME" /><xsl:text>.wav")&#13;
   {&#13;
   }&#13;
&#13;
   override fun getDuration(): Int&#13;
   {&#13;
	   return </xsl:text><xsl:value-of select="$GD_DURATION" /><xsl:text>&#13;
   }&#13;
&#13;
}&#13;
</xsl:text></xsl:template>

</xsl:stylesheet>
