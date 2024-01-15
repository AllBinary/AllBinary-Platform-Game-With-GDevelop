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

    <xsl:template name="resetObjectTimerActionProcess" >

                    //ResetObjectTimer
                    @Override
                    public boolean process() throws Exception {
                        throw new RuntimeException();
<!--                        super.processStats();
                    
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />ObjectTimeDelay.delay = 0;</xsl:if>
                        </xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />ObjectTimeDelayHelper.setStartTime(globals.lastStartTime);</xsl:if>
                        </xsl:for-each>

                        return true;
-->
                    }

                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats();
                    
                        LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        <xsl:variable name="paramOne" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        
                        if(index <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template><xsl:value-of select="$paramOne" />ObjectTimeDelayHelperList.size()) {
                        
                            if(index <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template><xsl:value-of select="$paramOne" />PortionElapsedTotalArray.length - 1) {
                                //LogUtil.put(LogFactory.getInstance(, this, commonStrings.PROCESS));
                                final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template><xsl:value-of select="$paramOne" />PortionElapsedTotalArray.length;
                                final float[] floatArray = new float[size * 2];
                                System.arraycopy(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template><xsl:value-of select="$paramOne" />PortionElapsedTotalArray, 0, floatArray, 0, size);
                                <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template><xsl:value-of select="$paramOne" />PortionElapsedTotalArray = floatArray;
                            }

                            final TimeDelayHelper <xsl:value-of select="$paramOne" />ObjectTimeDelayHelper = new TimeDelayHelper(Integer.MAX_VALUE);
                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template><xsl:value-of select="$paramOne" />ObjectTimeDelayHelperList.add(<xsl:value-of select="$paramOne" />ObjectTimeDelayHelper);
                        }

                        ((TimeDelayHelper) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template><xsl:value-of select="$paramOne" />ObjectTimeDelayHelperList.get(index)).delay = 0;
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text>((TimeDelayHelper) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template><xsl:value-of select="$paramOne" />ObjectTimeDelayHelperList.get(index)).setStartTime(globals.lastStartTime);


                        return true;
                    }
                
    </xsl:template>

</xsl:stylesheet>
