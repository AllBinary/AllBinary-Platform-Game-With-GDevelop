<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2026 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<!-- File generation template (was strings.xml.original). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />

    <xsl:param name="name" />

    <xsl:template match="/"><xsl:text>&lt;?xml version="1.0" encoding="utf-8"?&gt;&#13;
&lt;resources&gt;&#13;
    &lt;string name="gd_app_name"&gt;</xsl:text><xsl:value-of select="$name" /><xsl:text>&lt;/string&gt;&#13;
    &lt;string name="progressbar_in_title_string"&gt;&lt;/string&gt;&#13;
&lt;/resources&gt;&#13;
</xsl:text></xsl:template>

</xsl:stylesheet>
