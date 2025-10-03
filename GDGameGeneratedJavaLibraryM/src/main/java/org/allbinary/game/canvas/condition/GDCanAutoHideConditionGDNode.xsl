<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2022 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" indent="yes" />

    <xsl:template name="canAutoHideConditionGDNode" >
        <xsl:param name="parametersAsString" />

        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
        
        <xsl:variable name="quote" >"</xsl:variable>
                    //canAutoHideConditionGDNode - //Condition - //TouchScreen::isAutoHide - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        private final GenericOperatingSystem operatingSystem = OperatingSystemFactory.getInstance().getOperatingSystemInstance();
                        private final boolean isHTML = Features.getInstance().isDefault(HTMLFeatureFactory.getInstance().HTML);

                        //TouchScreen::isAutoHide - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                            //logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                            return operatingSystem.isAutoHide() || isHTML;
                        }
                            
                        @Override
                        public boolean process(final int index) throws Exception {
                            super.processStats(index);

                            ////logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "index", this, commonStrings.PROCESS);

                            return this.process();
                        }

                        @Override
                        public boolean processGD(final GDGameLayer gameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                            super.processGDStats(gameLayer);

                            ////logUtil.put(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, commonStrings.PROCESS);

                            return this.process();
                        }
                            
                    };
        
    </xsl:template>

</xsl:stylesheet>
