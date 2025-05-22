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

    <xsl:template name="scalableBehaviorSetYActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />

                                <xsl:variable name="paramOne" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:variable name="paramFour" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /><xsl:if test="number(text()) = text()" >f</xsl:if></xsl:if></xsl:for-each></xsl:variable>
        
                        //ScalableCapability::ScalableBehavior::SetY - action
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                                
                                final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template><xsl:value-of select="$paramOne" />GDGameLayerList.size();
                                GDGameLayer gameLayer;
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    gameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template><xsl:value-of select="$paramOne" />GDGameLayerList.get(index);
                                    gameLayer.gdObject.scaleY = <xsl:value-of select="$paramFour" />;
                                    gameLayer.setScalable();
                                    gameLayer.updateGDObject(globals.globalsGameTickTimeDelayHelper.timeDelta);
                                }

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

                        @Override
                        public boolean process(final int index) throws Exception {
                            super.processStats();

                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                final GDGameLayer gameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$paramOne" /></xsl:with-param></xsl:call-template><xsl:value-of select="$paramOne" />GDGameLayerList.get(index);
                                gameLayer.gdObject.scaleY = <xsl:value-of select="$paramFour" />;
                                gameLayer.setScalable();

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

    </xsl:template>

</xsl:stylesheet>
