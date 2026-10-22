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

<!-- File generation template for TypeScript (made from the Java template that was AndroidResources.original). The text is output as is: &#13; keeps the windows line endings.
     The generator fills the parameters. -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="text" encoding="UTF-8" />

    <xsl:param name="name" />

    <xsl:template match="/"><xsl:text>import { Object } from '../../java/lang/Object.js';&#13;
import { R } from '../../org/allbinary/game/gd/</xsl:text><xsl:value-of select="translate($name, '.', '/')" /><xsl:text>/R.js';&#13;
&#13;
export class AndroidResources extends Object&#13;
{&#13;
    private static readonly instance: AndroidResources = new AndroidResources();&#13;
    &#13;
    /**&#13;
     * @return the instance&#13;
     */&#13;
    public static getInstance(): AndroidResources&#13;
    {&#13;
        return AndroidResources.instance;&#13;
    }&#13;
    &#13;
    public drawable = new R.drawable();&#13;
&#13;
    public id = new R.id();&#13;
&#13;
    public layout = new R.layout();&#13;
&#13;
    public raw = new R.raw();&#13;
&#13;
    public string = new R.string();&#13;
}&#13;
</xsl:text></xsl:template>

</xsl:stylesheet>
