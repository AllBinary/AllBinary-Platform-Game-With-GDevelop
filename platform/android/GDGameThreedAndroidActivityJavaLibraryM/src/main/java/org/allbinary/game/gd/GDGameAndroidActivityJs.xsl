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

<!-- File generation template for JavaScript (made from the Java template that was GDGameAndroidActivity.original). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />

    <xsl:param name="name" />

    <xsl:template match="/"><xsl:text>import { GDGameBaseAndroidActivity } from '../../../GDGameBaseAndroidActivity.js';&#13;
&#13;
export class GDGameAndroidActivity extends GDGameBaseAndroidActivity {&#13;
    &#13;
}&#13;
</xsl:text></xsl:template>

</xsl:stylesheet>
