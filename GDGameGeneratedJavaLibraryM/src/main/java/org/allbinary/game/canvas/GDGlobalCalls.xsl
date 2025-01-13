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

<!-- 
       <xsl:variable name="isScene" >
        <xsl:for-each select="/game" >
            <xsl:for-each select="layouts" >
            <xsl:for-each select="objects" >
                <xsl:if test="name = $name" >found</xsl:if>
            </xsl:for-each>
            <xsl:for-each select="variables" >
                <xsl:if test="name = $name" >found</xsl:if>
            </xsl:for-each>
            </xsl:for-each>
        </xsl:for-each>
        <xsl:if test="//actions[type/value/text() = 'ModVarScene']/parameters[1]/text() = $name" >found</xsl:if>
        </xsl:variable>
-->

        <!--contains($isScene, 'found')-->
        <xsl:if test="contains($isGlobal, 'found')" >gameGlobals</xsl:if><xsl:if test="not(contains($isGlobal, 'found'))" >globals<xsl:value-of select="$layoutIndex" /></xsl:if>
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
                        public int <xsl:value-of select="name" /> = <xsl:value-of select="value" /> * ((SWTUtil.isSWT || AndroidUtil.isAndroid()) ? 2 : 3);
                                </xsl:if>
                                <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains($name, 'speed') or contains(name, 'score'))" >
                        public int <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                                <xsl:if test="contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains(name, 'score')" >
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
                        public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="value" /></xsl:with-param></xsl:call-template> = "<xsl:value-of select="value" />";
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
