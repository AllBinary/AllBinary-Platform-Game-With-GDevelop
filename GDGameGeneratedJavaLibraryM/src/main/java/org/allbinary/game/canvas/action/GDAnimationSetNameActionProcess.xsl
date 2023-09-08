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

    <xsl:template name="animatableCapabilityAnimatableBehaviorSetNameActionProcess" >
        
                    //AnimatableCapability::AnimatableBehavior::SetName
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        this.process(0);

                        return true;
                    }

                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                        <xsl:for-each select="parameters" >
                            <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:with-param></xsl:call-template>_ANIMATION_NAME</xsl:variable>
                        <xsl:if test="position() = 1" >(((GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject.setAnimation(</xsl:if><xsl:if test="position() = last()" >globals.<xsl:value-of select="$animationName" />);</xsl:if>
                        </xsl:for-each>
                        return true;
                    }

    </xsl:template>

</xsl:stylesheet>
