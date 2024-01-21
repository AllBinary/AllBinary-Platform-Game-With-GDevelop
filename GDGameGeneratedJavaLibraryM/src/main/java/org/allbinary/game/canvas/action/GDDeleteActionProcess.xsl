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

    <xsl:template name="deleteActionProcess" >

                        private final String ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "processGD - " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
                        <xsl:variable name="ACTION_AS_STRING_GD_" >ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        //Delete - action
                        @Override
                        public void addForDelete(final GDGameLayer gdGameLayer) {
                            //if(!<xsl:value-of select="$name" />RemoveList.contains(gdGameLayer)) {
                                <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />RemoveList.add(gdGameLayer);
                            //} else {
                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + " Already added for deletion from LayerManager: " + gdGameLayer, this, commonStrings.PROCESS));
                            //}
                        }

                        @Override
                        public boolean process() throws Exception {
            
                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />RemoveList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                this.processGD((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />RemoveList.get(index), globals.graphics);
                            }

                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />RemoveList.clear();
                            
                            return true;
                        }
            
                        @Override
                        public void processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer, final Graphics graphics) {
                            super.processGDStats(<xsl:value-of select="$name" />GDGameLayer);
                        
                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size()</xsl:if></xsl:for-each>, this, commonStrings.PROCESS));

                                    //Parameters - 5
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            //<xsl:value-of select="text()" /><xsl:text>&#10;</xsl:text>
                                                                            
                                            //if(allBinaryGameLayerManager.getLayerManager().contains(<xsl:value-of select="text()" />GDGameLayer)) {
                                                //allBinaryGameLayerManager.remove(<xsl:value-of select="text()" />GDGameLayer);
                                                <xsl:value-of select="text()" />GDGameLayer.setDestroyed(true);
                                            //} else {
                                                //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="$ACTION_AS_STRING_GD_" /> + " LayerManager does not have (probably already removed/destroyed): " + <xsl:value-of select="text()" />GDGameLayer, this, commonStrings.PROCESS));
                                            //}
                                                        
                                        </xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                            //11
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                        }
                
    </xsl:template>

</xsl:stylesheet>
