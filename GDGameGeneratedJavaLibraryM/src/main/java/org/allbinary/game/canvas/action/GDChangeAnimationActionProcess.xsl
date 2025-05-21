<?xml version="1.0" encoding="windows-1252"?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >

    <xsl:template name="changeAnimationActionProcess" >
        
                    //ChangeAnimation
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        final int animationIndex<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>

                        final GDGameLayer gdGameLayer = <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >(((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size() - 1)))</xsl:if></xsl:for-each>;
//                        if(animationIndex <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> gdGameLayer.getIndexedAnimationInterfaceArray().length) {
//                            LogUtil.put(LogFactory.getInstance(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(gdGameLayer.toString()).append(" invalid animation index: ").append(animationIndex).toString(), this, commonStrings.PROCESS, new Exception()));
//                        }
                        
                        gdGameLayer.gdObject.animation = animationIndex;

                        return true;
                    }
        
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                        
                        final int animationIndex<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>

                        final GDGameLayer gdGameLayer = <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >(((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index)))</xsl:if></xsl:for-each>;
//                        if(animationIndex <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> gdGameLayer.getIndexedAnimationInterfaceArray().length) {
//                            LogUtil.put(LogFactory.getInstance(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(gdGameLayer.toString()).append(" invalid animation index: ").append(animationIndex).toString(), this, commonStrings.PROCESS, new Exception()));
//                        }
                        
                        gdGameLayer.gdObject.animation = animationIndex;
                        
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >(((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject.animation</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        return true;
                    }

<!--
                    @Override
                    public boolean processGD(final GDGameLayer gdGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                    
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                        
                        final int animationIndex<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>

//                        if(animationIndex <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> gdGameLayer.getIndexedAnimationInterfaceArray().length) {
//                            LogUtil.put(LogFactory.getInstance(new StringMaker().append(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(gdGameLayer.toString()).append(" invalid animation index: ").append(animationIndex).toString(), this, commonStrings.PROCESS, new Exception()));
//                        }
                        
                        gdGameLayer.gdObject.animation = animationIndex;
                                                
                        return true;                   
                    }
-->

    </xsl:template>

</xsl:stylesheet>
