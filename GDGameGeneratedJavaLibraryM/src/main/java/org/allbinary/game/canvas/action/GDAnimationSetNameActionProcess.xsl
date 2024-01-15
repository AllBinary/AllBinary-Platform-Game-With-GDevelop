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
        <xsl:param name="layoutIndex" />
        
        <xsl:variable name="hasObjectVariable" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), '.Variable')" >found</xsl:if></xsl:for-each></xsl:variable>
        
                    //AnimatableCapability::AnimatableBehavior::SetName
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        <xsl:for-each select="parameters" >
                            <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="position() = 1" >final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size()</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>

                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                        <xsl:for-each select="parameters" >
                            <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="position() = 1" >final GDGameLayer gameLayer = (((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index)))</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        
                        <xsl:text>&#10;</xsl:text>
                        
                        <xsl:if test="not(contains($hasObjectVariable, 'found'))" >
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($fourthParam, 'Variable')" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                if(gameLayer.gdObject.setAnimation(gameLayer.gdObject.getAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:variable name="animationName" >
                                        <xsl:if test="not(contains(text(), 'Variable'))" >
                                        <xsl:call-template name="upper-case" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="translate(text(), '&quot;', '')" />
                                            </xsl:with-param>
                                        </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="contains(text(), 'Variable')" >
                                            <xsl:value-of select="translate(text(), '&quot;', '')" />
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.
                                    <xsl:value-of select="$animationName" />))) gameLayer.resetAnimation();
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="not(contains($fourthParam, 'Variable'))" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                if(gameLayer.gdObject.setAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:variable name="animationName" >
                                        <xsl:if test="not(contains(text(), 'Variable'))" >
                                        <xsl:call-template name="upper-case" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="translate(text(), '&quot;', '')" />
                                            </xsl:with-param>
                                        </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="contains(text(), 'Variable')" >
                                            <xsl:value-of select="translate(text(), '&quot;', '')" />
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.
                                    <xsl:value-of select="$animationName" />)) gameLayer.resetAnimation();
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>

                        </xsl:if>
                        
                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" /><xsl:text> </xsl:text><xsl:value-of select="text()" /> = ((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) gameLayer.gdObject);<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final int offset = (<xsl:value-of select="text()" />.animation_name_array.length * <xsl:value-of select="text()" />.animation_direction_array.length * <xsl:value-of select="text()" />.character);<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >if(gameLayer.gdObject.setAnimation(<xsl:value-of select="text()" />.ANIMATION_NAMES[offset + </xsl:if><xsl:if test="position() = 4" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), ')', '')" /></xsl:with-param><xsl:with-param name="find" >VariableString(</xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>Index])) gameLayer.resetAnimation();<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>

                        </xsl:if>                        
                        }

                        return true;
                    }

                    @Override
                    public void processGD(final GDGameLayer gameLayer, final Graphics graphics) {
                        super.processGDStats(gameLayer);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        <xsl:if test="not(contains($hasObjectVariable, 'found'))" >
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($fourthParam, 'Variable')" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                if(gameLayer.gdObject.setAnimation(gameLayer.gdObject.getAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:variable name="animationName" >
                                        <xsl:if test="not(contains(text(), 'Variable'))" >
                                        <xsl:call-template name="upper-case" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="translate(text(), '&quot;', '')" />
                                            </xsl:with-param>
                                        </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="contains(text(), 'Variable')" >
                                            <xsl:value-of select="translate(text(), '&quot;', '')" />
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.
                                    <xsl:value-of select="$animationName" />))) gameLayer.resetAnimation();
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="not(contains($fourthParam, 'Variable'))" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                if(gameLayer.gdObject.setAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:variable name="animationName" >
                                        <xsl:if test="not(contains(text(), 'Variable'))" >
                                        <xsl:call-template name="upper-case" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="translate(text(), '&quot;', '')" />
                                            </xsl:with-param>
                                        </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="contains(text(), 'Variable')" >
                                            <xsl:value-of select="translate(text(), '&quot;', '')" />
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.
                                    <xsl:value-of select="$animationName" />)) gameLayer.resetAnimation();
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>

                        </xsl:if>
                        
                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" /><xsl:text> </xsl:text><xsl:value-of select="text()" /> = ((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) gameLayer.gdObject);<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final int offset = (<xsl:value-of select="text()" />.animation_name_array.length * <xsl:value-of select="text()" />.animation_direction_array.length * <xsl:value-of select="text()" />.character);<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >if(gameLayer.gdObject.setAnimation(<xsl:value-of select="text()" />.ANIMATION_NAMES[offset + </xsl:if><xsl:if test="position() = 4" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), ')', '')" /></xsl:with-param><xsl:with-param name="find" >VariableString(</xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>Index])) gameLayer.resetAnimation();<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>
                        
                        </xsl:if>
                    }

                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));

                        <xsl:for-each select="parameters" >
                            <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="position() = 1" >if(index <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size()) return false;<xsl:text>&#10;</xsl:text></xsl:if>
                        <xsl:if test="position() = 1" >final GDGameLayer gameLayer = (((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index)))</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        
                        <xsl:text>&#10;</xsl:text>
                        
                        <xsl:if test="not(contains($hasObjectVariable, 'found'))" >
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($fourthParam, 'Variable')" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                if(gameLayer.gdObject.setAnimation(gameLayer.gdObject.getAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:variable name="animationName" >
                                        <xsl:if test="not(contains(text(), 'Variable'))" >
                                        <xsl:call-template name="upper-case" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="translate(text(), '&quot;', '')" />
                                            </xsl:with-param>
                                        </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="contains(text(), 'Variable')" >
                                            <xsl:value-of select="translate(text(), '&quot;', '')" />
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.
                                    <xsl:value-of select="$animationName" />))) gameLayer.resetAnimation();
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="not(contains($fourthParam, 'Variable'))" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                if(gameLayer.gdObject.setAnimation(</xsl:if>
                                <xsl:if test="position() = last()" >
                                    <xsl:variable name="animationName" >
                                        <xsl:if test="not(contains(text(), 'Variable'))" >
                                        <xsl:call-template name="upper-case" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="translate(text(), '&quot;', '')" />
                                            </xsl:with-param>
                                        </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="contains(text(), 'Variable')" >
                                            <xsl:value-of select="translate(text(), '&quot;', '')" />
                                        </xsl:if>
                                    </xsl:variable>
                                    <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.
                                    <xsl:value-of select="$animationName" />)) gameLayer.resetAnimation();
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>

                        </xsl:if>
                        
                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" /><xsl:text> </xsl:text><xsl:value-of select="text()" /> = ((GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="text()" />) gameLayer.gdObject);<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >final int offset = (<xsl:value-of select="text()" />.animation_name_array.length * <xsl:value-of select="text()" />.animation_direction_array.length * <xsl:value-of select="text()" />.character);<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >if(gameLayer.gdObject.setAnimation(<xsl:value-of select="text()" />.ANIMATION_NAMES[offset + </xsl:if><xsl:if test="position() = 4" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), ')', '')" /></xsl:with-param><xsl:with-param name="find" >VariableString(</xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>Index])) gameLayer.resetAnimation();<xsl:text>&#10;</xsl:text></xsl:if>
                        </xsl:for-each>

                        </xsl:if>
                        return true;
                    }

    </xsl:template>

</xsl:stylesheet>
