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
        <xsl:if test="//actions[type/value/text() = 'ModVarGlobal']/parameters[1]/text() = $name" >found</xsl:if>
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
                            //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />
                            <xsl:if test="type = 'structure'" >
                        public final GDStructure<xsl:value-of select="name" /><xsl:text> </xsl:text><xsl:value-of select="name" /> = new GDStructure<xsl:value-of select="name" />();
                            </xsl:if>
                            <xsl:if test="type = 'string'" >
                                <xsl:if test="number(value) != value" >
                                    public String <xsl:value-of select="name" /> = <xsl:if test="value = ''" >StringUtil.getInstance().EMPTY_STRING</xsl:if><xsl:if test="value != ''" >"<xsl:value-of select="value" />"</xsl:if>;
                                </xsl:if>
                                <xsl:if test="number(value) = value" >
                        public int <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                            </xsl:if>
                            <xsl:if test="type = 'boolean'" >
                        public boolean <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                            <xsl:if test="type = 'number'" >
                                <xsl:if test="contains(name, 'speed')" >
                        public int <xsl:value-of select="name" /> = <xsl:value-of select="value" /> * 3;
                                </xsl:if>
                                <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains(name, 'speed'))" >
                        public int <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                                <xsl:if test="contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE')" >
                                    <xsl:if test="value != '9223372036854776000'" >
                        public long <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                    </xsl:if>
                                    <xsl:if test="value = '9223372036854776000'" >
                        //Long.MAX_VALUE = 9223372036854776000 GD does not like the real value 9223372036854775807L
                        public long <xsl:value-of select="name" /> = 9223372036854775807L;
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>
                            <xsl:if test="type = 'array'" >
                        //array
                                <xsl:for-each select="children" >
                        public final String <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="value" /></xsl:with-param></xsl:call-template> = "<xsl:value-of select="value" />";
                                </xsl:for-each>
                        
                        public String[] <xsl:value-of select="name" /> = {
                                        <xsl:for-each select="children" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="value" /></xsl:with-param></xsl:call-template>,
                                        <xsl:text>&#10;</xsl:text>
                                        </xsl:for-each>                                        
                        };
                        
                            </xsl:if>

                        </xsl:for-each>
    </xsl:template>

    <xsl:template name="resetVariables" >
        //resetVariables
        public void reset() {
                        <xsl:for-each select="variables" >
                            //variable - //<xsl:value-of select="type" /> - name=<xsl:value-of select="name" /> - value=<xsl:value-of select="value" />

                            <xsl:if test="type = 'structure'" >
                        //this.<xsl:value-of select="name" /> = new GDStructure<xsl:value-of select="name" />();
                            </xsl:if>
                            <xsl:if test="type = 'string'" >
                                <xsl:if test="number(value) != value" >
                        this.<xsl:value-of select="name" /> = <xsl:if test="value = ''" >StringUtil.getInstance().EMPTY_STRING</xsl:if><xsl:if test="value != ''" >"<xsl:value-of select="value" />"</xsl:if>;
                                </xsl:if>
                                <xsl:if test="number(value) = value" >
                        this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                            </xsl:if>
                            <xsl:if test="type = 'boolean'" >
                        this.<xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                            </xsl:if>
                            <xsl:if test="type = 'number'" >
                                <xsl:if test="contains(name, 'speed')" >
                        this.<xsl:value-of select="name" /> = <xsl:value-of select="value" /> * 3;
                                </xsl:if>
                                <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay') or contains(name, 'MAX_VALUE') or contains(name, 'speed'))" >
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
                            <xsl:if test="type = 'array'" >
                        //array
                                <xsl:for-each select="children" >
                        //this.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="value" /></xsl:with-param></xsl:call-template> = "<xsl:value-of select="value" />";
                                </xsl:for-each>
                        
                        this.<xsl:value-of select="name" /> = new String[] {
                                        <xsl:for-each select="children" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="value" /></xsl:with-param></xsl:call-template>,
                                        <xsl:text>&#10;</xsl:text>
                                        </xsl:for-each>                                        
                        };
                        
                            </xsl:if>

                        </xsl:for-each>
        }
    </xsl:template>


</xsl:stylesheet>
