<?xml version="1.0" encoding="UTF-8"?>

<!--
    Document   : GDLayoutInstances.xsl
    Created on : July 9, 2023, 2:37 PM
    Author     : User
    Description:
        Purpose of transformation follows.
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>

    <xsl:template name="addGlobals">
        <xsl:param name="text" />
        <xsl:param name="layoutIndex" />

        <xsl:choose>
            <xsl:when test="$text = ''" >
            </xsl:when>
            <xsl:otherwise>

<!--        <xsl:variable name="idsFound2" >
        <xsl:for-each select="/game" >
            <xsl:for-each select="objects" >
                <xsl:if test="contains($text, name)"><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />found</xsl:if>
            </xsl:for-each>
            <xsl:for-each select="variables" >
                <xsl:if test="contains($text, name)"><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />found</xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        </xsl:variable>-->

        <xsl:variable name="idsFound" >
        <xsl:for-each select="/game/layouts" >
            <xsl:if test="$layoutIndex = position() - 1" >
<!--            <xsl:for-each select="objects" >
                <xsl:if test="contains($text, name)"><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />found</xsl:if>
            </xsl:for-each>-->
            <xsl:for-each select="variables" >
                <xsl:if test="contains($text, name)"><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />found</xsl:if>
            </xsl:for-each>
            </xsl:if>
        </xsl:for-each>
        </xsl:variable>
        
<!--idsFound2=<xsl:value-of select="$idsFound2" />-->
<!--text=<xsl:value-of select="$text" />
idsFound=<xsl:value-of select="$idsFound" />-->

<!--        <xsl:if test="contains($idsFound2, 'found')" >

        <xsl:for-each select="/game" >
            <xsl:for-each select="objects" >
                
        <xsl:choose>
            <xsl:when test="contains($text, name)">
                <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                <xsl:if test="starts-with($idsFound, $id)" >
                <xsl:value-of select="substring-before($text, name)" />gameGlobals.<xsl:value-of select="name" />

                <xsl:call-template name="addGlobals">
                    <xsl:with-param name="text" select="substring-after($text, name)" />
                    <xsl:with-param name="layoutIndex" select="$layoutIndex" />
                </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>

            </xsl:for-each>
            <xsl:for-each select="variables" >
                
        <xsl:choose>
            <xsl:when test="contains($text, name)">
                <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                <xsl:if test="starts-with($idsFound, $id)" >
                <xsl:value-of select="substring-before($text, name)" />gameGlobals.<xsl:value-of select="name" />

                <xsl:call-template name="addGlobals">
                    <xsl:with-param name="text" select="substring-after($text, name)" />
                    <xsl:with-param name="layoutIndex" select="$layoutIndex" />
                </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>
                
            </xsl:for-each>
        </xsl:for-each>
        
        </xsl:if>-->
        
<!--        <xsl:if test="not(contains($idsFound2, 'found'))" >-->

        <xsl:for-each select="/game/layouts" >
            <xsl:if test="$layoutIndex = position() - 1" >
<!--            <xsl:for-each select="objects" >

        <xsl:choose>
            <xsl:when test="contains($text, name)">
                <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                <xsl:if test="starts-with($idsFound, $id)" >
                <xsl:value-of select="substring-before($text, name)" />globals.<xsl:value-of select="name" />

                <xsl:call-template name="addGlobals">
                    <xsl:with-param name="text" select="substring-after($text, name)" />
                    <xsl:with-param name="layoutIndex" select="$layoutIndex" />
                </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>
                
            </xsl:for-each>-->
            <xsl:for-each select="variables" >
                
        <xsl:choose>
            <xsl:when test="contains($text, name)">
                <xsl:variable name="id" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                <xsl:if test="starts-with($idsFound, $id)" >
                <xsl:value-of select="substring-before($text, name)" />globals.<xsl:value-of select="name" />

                <xsl:call-template name="addGlobals">
                    <xsl:with-param name="text" select="substring-after($text, name)" />
                    <xsl:with-param name="layoutIndex" select="$layoutIndex" />
                </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
            </xsl:otherwise>
        </xsl:choose>

            </xsl:for-each>
            </xsl:if>
        </xsl:for-each>
        
<!--        </xsl:if>-->
                
        <xsl:if test="not(contains($idsFound, 'found'))" >
        <xsl:value-of select="$text" />
        </xsl:if>

            </xsl:otherwise>
        </xsl:choose>
                
    </xsl:template>

    <xsl:template name="globals" >
        <xsl:param name="name" />
        <xsl:param name="layoutIndex" />

        <xsl:variable name="isGlobal" >
        <xsl:for-each select="/game" >
            <xsl:for-each select="objects" >
                <xsl:if test="name = $name" >found</xsl:if>
            </xsl:for-each>
            <xsl:for-each select="variables" >
                <xsl:if test="name = $name" >found</xsl:if>
            </xsl:for-each>
        </xsl:for-each>
<!--        <xsl:if test="//actions[type/value/text() = 'SetNumberVariable']/parameters[1]/text() = $name" >found</xsl:if>-->
        </xsl:variable>

<!--        <xsl:variable name="isLayoutGlobal" >
        <xsl:for-each select="/game/layouts" >
            <xsl:if test="$layoutIndex = position() - 1" >
            <xsl:for-each select="objects" >
                <xsl:if test="name = $name" ><xsl:value-of select="name" />found</xsl:if>
            </xsl:for-each>
            <xsl:for-each select="variables" >
                <xsl:if test="name = $name" ><xsl:value-of select="name" />found</xsl:if>
            </xsl:for-each>
            </xsl:if>
        </xsl:for-each>-->
<!--        <xsl:if test="//actions[type/value/text() = 'SetNumberVariable']/parameters[1]/text() = $name" >found</xsl:if>-->
<!--        </xsl:variable>-->

        <!--
        (not($layoutIndex) and not(contains($isGlobal, 'found'))) and ($layoutIndex and contains($isLayoutGlobal, 'found'))
        -->
        <xsl:if test="contains($isGlobal, 'found')" >gameGlobals</xsl:if><xsl:if test="not(contains($isGlobal, 'found'))" >globals</xsl:if>
    </xsl:template>

    <xsl:template name="isGlobalsSep" >
        <xsl:param name="name" />
        <xsl:param name="layoutIndex" />

        <xsl:variable name="isGlobal" >
        <xsl:for-each select="/game" >
            <xsl:for-each select="objects" >
                <xsl:if test="name = $name" >found</xsl:if>
            </xsl:for-each>
            <xsl:for-each select="variables" >
                <xsl:if test="name = $name" >found</xsl:if>
            </xsl:for-each>
        </xsl:for-each>
<!--        <xsl:if test="//actions[type/value/text() = 'SetNumberVariable']/parameters[1]/text() = $name" >found</xsl:if>-->
        </xsl:variable>

<!--        <xsl:variable name="isLayoutGlobal" >
        <xsl:for-each select="/game/layouts" >
            <xsl:if test="$layoutIndex = position() -1" >
            <xsl:for-each select="objects" >
                <xsl:if test="name = $name" ><xsl:value-of select="name" />found</xsl:if>
            </xsl:for-each>
            <xsl:for-each select="variables" >
                <xsl:if test="name = $name" ><xsl:value-of select="name" />found</xsl:if>
            </xsl:for-each>
            </xsl:if>
        </xsl:for-each>-->
<!--        <xsl:if test="//actions[type/value/text() = 'SetNumberVariable']/parameters[1]/text() = $name" >found</xsl:if>-->
<!--        </xsl:variable>-->

        <!--
        (not($layoutIndex) and not(contains($isGlobal, 'found'))) and ($layoutIndex and contains($isLayoutGlobal, 'found'))
        -->
        <xsl:if test="contains($isGlobal, 'found')" >.</xsl:if><xsl:if test="not(contains($isGlobal, 'found'))" >.</xsl:if>
    </xsl:template>

    <xsl:template name="globalResource" >
        <xsl:param name="name" />
        <xsl:variable name="isGlobal" >
        <xsl:for-each select="/game" >
            <xsl:for-each select="objects" >
                <xsl:if test="name = $name" >found</xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        </xsl:variable>
        <xsl:if test="contains($isGlobal, 'found')" >globalResources</xsl:if><xsl:if test="not(contains($isGlobal, 'found'))" >resources</xsl:if>
    </xsl:template>

    <xsl:template name="globalImageResource" >
        <xsl:param name="name" />
        <xsl:variable name="isGlobal" >
        <xsl:for-each select="/game" >
            <xsl:for-each select="objects" >
                <xsl:if test="name = $name" >found</xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        </xsl:variable>
        <xsl:if test="contains($isGlobal, 'found')" >globalImageResources</xsl:if><xsl:if test="not(contains($isGlobal, 'found'))" >imageResources</xsl:if>
    </xsl:template>

    <xsl:template name="objectFactory" >
        <xsl:param name="name" />
        <xsl:param name="layoutIndex" />
        <xsl:variable name="isGlobal" >
        <xsl:for-each select="/game" >
            <xsl:for-each select="objects" >
                <xsl:if test="name = $name" >found</xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        </xsl:variable>
        <xsl:if test="contains($isGlobal, 'found')" >Globals</xsl:if><xsl:if test="not(contains($isGlobal, 'found'))" ><xsl:value-of select="$layoutIndex" /></xsl:if>
    </xsl:template>

    <xsl:template name="objectFactoryFromProperty" >
        <xsl:param name="name" />
        <xsl:variable name="isGlobal" >
        <xsl:for-each select="/game" >
            <xsl:for-each select="objects" >
                <xsl:if test="name = $name" >found</xsl:if>
            </xsl:for-each>
        </xsl:for-each>
        </xsl:variable>
        <xsl:if test="contains($isGlobal, 'found')" >gdGlobalsObjectsFactory</xsl:if><xsl:if test="not(contains($isGlobal, 'found'))" >gdObjectsFactory</xsl:if>
    </xsl:template>

    <xsl:template name="variables" >
                        <xsl:for-each select="variables" >
                            <xsl:variable name="name" ><xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                            //variable - //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />
                            <xsl:if test="type = 'structure'" >
                        public final GDStructure<xsl:value-of select="name" /><xsl:text> </xsl:text><xsl:value-of select="name" /> = new GDStructure<xsl:value-of select="name" />();
                            </xsl:if>
                            <xsl:if test="type = 'string'" >
                                <xsl:if test="number(value) != value" >
                        public String <xsl:value-of select="name" /> = <xsl:if test="value = ''" >stringUtil.EMPTY_STRING</xsl:if><xsl:if test="value != ''" >"<xsl:value-of select="value" />"</xsl:if>;
                                </xsl:if>
                                <xsl:if test="number(value) = value" >
                        public int <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                            </xsl:if>
                            <xsl:if test="type = 'boolean'" >
                        public boolean <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                            <xsl:if test="type = 'number'" >
                                <xsl:if test="contains($name, 'speed')" >
                        //TWB - speed hack
                                    <xsl:if test="contains($name, '_speed')" >
                        public float <xsl:value-of select="name" /> = <xsl:value-of select="value" /> * ((SWTUtil.isSWT || AndroidUtil.isAndroid()) ? 2 : 3);
                                    </xsl:if>
                                    <xsl:if test="contains($name, 'speed') and not(contains($name, '_speed'))" >
                        public int <xsl:value-of select="name" /> = <xsl:value-of select="value" /> * ((SWTUtil.isSWT || AndroidUtil.isAndroid()) ? 2 : 3);
                                    </xsl:if>
                                </xsl:if>
                                <xsl:if test="not(contains(name, 'time') or contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains($name, 'speed') or contains(name, 'Long'))" >
                        public int <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                                <xsl:if test="contains(name, 'time') or contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains(name, 'Long')" >
                                    <xsl:if test="value != '9223372036854776000'" >
                        public long <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                    </xsl:if>
                                    <xsl:if test="value = '9223372036854776000'" >
                        //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                        public long <xsl:value-of select="name" /> = 9223372036854775807L;
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>
                        //array
                        <xsl:if test="type = 'array'" >
                            <xsl:if test="contains(name, 'BoolArray')" >
                        public boolean[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                        <xsl:value-of select="value" />,
                            </xsl:for-each>
                        };
                            </xsl:if>
                            <xsl:if test="contains(name, 'IntArray')" >
                        public int[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                                <xsl:if test="contains(value, ';')" >
                            basicColorUtil.get(<xsl:value-of select="translate(translate(value, '\&quot;', ''), ';', ',')" />),
                                </xsl:if>
                                <xsl:if test="not(contains(value, ';'))" >
                            <xsl:value-of select="value" />,
                                </xsl:if>
                            </xsl:for-each>
                        };
                            </xsl:if>
                            <xsl:if test="contains(name, 'LongArray')" >
                        public long[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                            <xsl:value-of select="value" />,
                            </xsl:for-each>
                        };
                            </xsl:if>
                            <xsl:if test="contains(name, 'highScoresNameArray')" >
                                                        
                        public String[] <xsl:value-of select="name" /> = {
<!--                                        <xsl:for-each select="children" >
                                        <xsl:value-of select="value" />,
                                        <xsl:text>&#10;</xsl:text>
                                        </xsl:for-each>                                        -->
                        };

                            </xsl:if>

                            <xsl:if test="not(contains(name, 'IntArray') or contains(name, 'LongArray') or contains(name, 'BoolArray') or contains(name, 'highScoresNameArray'))" >
                                
                                <xsl:if test="contains(name, 'Size2') or contains(name, 'Size3')" >
                                    //TWB - Hack skipping strings that should be defined already.
                                </xsl:if>
                                <xsl:if test="not(contains(name, 'Size2') or contains(name, 'Size3'))" >
                                <xsl:for-each select="children" >
                                    <xsl:if test="not(preceding::variables/children/value = value)" >
                        public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="value" /></xsl:with-param></xsl:call-template> = "<xsl:value-of select="value" />";
                                    </xsl:if>
                                </xsl:for-each>
                                </xsl:if>
                        
                        public final String[] <xsl:value-of select="name" /> = {
                                        <xsl:for-each select="children" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="value" /></xsl:with-param></xsl:call-template>,
                                        <xsl:text>&#10;</xsl:text>
                                        </xsl:for-each>                                        
                        };

<!--                                
                        public String[] <xsl:value-of select="name" /> = {
                            <xsl:for-each select="children" >
                            "<xsl:value-of select="value" />",
                            </xsl:for-each>
                        };
-->

                            </xsl:if>
                            </xsl:if>

                        </xsl:for-each>
    </xsl:template>

    <xsl:template name="resetVariables" >
        //resetVariables
        public void reset() {
                        <xsl:for-each select="variables" >
                            <xsl:variable name="name" ><xsl:call-template name="lower-case" ><xsl:with-param name="text" ><xsl:value-of select="name" /></xsl:with-param></xsl:call-template></xsl:variable>
                            //resetVariables - //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />

                            <xsl:if test="type = 'structure'" >
                        //this.<xsl:value-of select="name" /> = new GDStructure<xsl:value-of select="name" />();
                            </xsl:if>
                            <xsl:if test="type = 'string'" >
                                <xsl:if test="number(value) != value" >
                        this.<xsl:value-of select="name" /> = <xsl:if test="value = ''" >stringUtil.EMPTY_STRING</xsl:if><xsl:if test="value != ''" >"<xsl:value-of select="value" />"</xsl:if>;
                                </xsl:if>
                                <xsl:if test="number(value) = value" >
                        this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                            </xsl:if>
                            <xsl:if test="type = 'boolean'" >
                        this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                            <xsl:if test="type = 'number'" >
                                <xsl:if test="contains(name, 'scale')" >
                        //Skip resetting scale
                                </xsl:if>
                                <xsl:if test="not(contains(name, 'scale'))" >
                                <xsl:if test="contains($name, 'speed')" >
                        //TWB - speed hack
                        this.<xsl:value-of select="name" /> = <xsl:value-of select="value" /> * ((SWTUtil.isSWT || AndroidUtil.isAndroid()) ? 2 : 3);
                                </xsl:if>
                                <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains($name, 'speed'))" >
                        this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                                <xsl:if test="contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE')" >
                                    <xsl:if test="value != '9223372036854776000'" >
                        this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                    </xsl:if>
                                    <xsl:if test="value = '9223372036854776000'" >
                        //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                        this.<xsl:value-of select="name" /> = 9223372036854775807L;
                                    </xsl:if>
                                </xsl:if>
                                </xsl:if>
                            </xsl:if>
                            <xsl:if test="type = 'array'" >
                        //array
                            <xsl:if test="contains(name, 'BoolArray')" >
                        this.<xsl:value-of select="name" /> = new boolean[] {
                            <xsl:for-each select="children" >
                            "<xsl:value-of select="value" />",
                            </xsl:for-each>
                        };
                            </xsl:if>
                            <xsl:if test="contains(name, 'IntArray')" >
                        this.<xsl:value-of select="name" /> = new int[] {
                            <xsl:for-each select="children" >
                                <xsl:if test="contains(value, ';')" >
                            basicColorUtil.get(<xsl:value-of select="translate(translate(value, '\&quot;', ''), ';', ',')" />),
                                </xsl:if>
                                <xsl:if test="not(contains(value, ';'))" >
                            <xsl:value-of select="value" />,
                                </xsl:if>
                            </xsl:for-each>
                        };
                            </xsl:if>
                            <xsl:if test="contains(name, 'LongArray')" >
                        this.<xsl:value-of select="name" /> = new long[] {
                            <xsl:for-each select="children" >
                            <xsl:value-of select="value" />,
                            </xsl:for-each>
                        };
                            </xsl:if>
<!--                            <xsl:if test="not(contains(name, 'IntArray') or contains(name, 'LongArray') or contains(name, 'BoolArray'))" >
                                <xsl:for-each select="children" >
                        this.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="value" /></xsl:with-param></xsl:call-template> = "<xsl:value-of select="value" />";
                                </xsl:for-each>
                        
                        this.<xsl:value-of select="name" /> = new String[] {
                                        <xsl:for-each select="children" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="value" /></xsl:with-param></xsl:call-template>,
                                        <xsl:text>&#10;</xsl:text>
                                        </xsl:for-each>                                        
                        };-->

<!--            
                        this.<xsl:value-of select="name" /> = new String[] {
                            <xsl:for-each select="children" >
                        "<xsl:value-of select="value" />",
                            </xsl:for-each>
                    };
-->
<!--                            </xsl:if>-->
                            </xsl:if>

                        </xsl:for-each>
        }
    </xsl:template>


</xsl:stylesheet>
