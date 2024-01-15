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
        </xsl:variable>
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
        <xsl:if test="contains($isGlobal, 'found')" >globalResources.</xsl:if><xsl:if test="not(contains($isGlobal, 'found'))" >resources.</xsl:if>
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
        <xsl:if test="contains($isGlobal, 'found')" >gdGlobalsObjectsFactory.</xsl:if><xsl:if test="not(contains($isGlobal, 'found'))" >gdObjectsFactory.</xsl:if>
    </xsl:template>

    <xsl:template name="variables" >
                        <xsl:for-each select="variables" >
                            //<xsl:value-of select="type" />
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
                                <xsl:if test="not(contains(name, 'Time') or contains(name, 'Delay'))" >
                        public int <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
                                </xsl:if>
                                <xsl:if test="contains(name, 'Time') or contains(name, 'Delay')" >
                        public long <xsl:value-of select="name" /> = <xsl:value-of select="value" />;
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

</xsl:stylesheet>
