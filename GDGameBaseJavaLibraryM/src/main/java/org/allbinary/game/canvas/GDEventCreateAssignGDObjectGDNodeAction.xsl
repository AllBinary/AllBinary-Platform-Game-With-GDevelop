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

    <xsl:template name="eventsCreateAssignGDObjectGDNodesAction" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />
         
        <xsl:variable name="quote" >"</xsl:variable>
        
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />

            <xsl:variable name="eventAsString" >
            private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
            <xsl:text>&#10;</xsl:text>
            </xsl:variable>

            <xsl:variable name="logString" >EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                        
            <!-- //Hackish - actionWithTextObjectString is probably bad idea -->
            <xsl:variable name="actionWithTextObjectString" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="$typeValue = 'TextObject::String'" >found:<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:if>
                </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="hasAssociatedSiblingCondition" select="conditions/type/value = 'MouseButtonReleased' or conditions/type/value = 'SourisBouton' or conditions/type/value = 'VarScene' or conditions/type/value = 'Timer'" />
            <xsl:variable name="parentEventType" ><xsl:for-each select="../../events" ><xsl:value-of select="type" /></xsl:for-each></xsl:variable>
            <xsl:variable name="actionTypesAsString" ><xsl:for-each select="actions" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="type/value" />,</xsl:for-each></xsl:variable>
            <xsl:variable name="parametersAsString" ><xsl:for-each select="actions" ><xsl:for-each select="parameters" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each></xsl:for-each></xsl:variable>

            <xsl:variable name="actionAsStringsStrings" >
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:if test="$typeValue != 'PauseTimer' and $typeValue != 'PlaySoundCanal'" >
                private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        </xsl:if>
                        <xsl:if test="$typeValue != 'ModVarScene' and $typeValue != 'AddForceAL' and $typeValue != 'PlaySoundCanal' and $typeValue != 'StopSoundCanal'" >
                private final String ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" /> at: ";
                        </xsl:if>
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="thisNodeArray" >
                <xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:if></xsl:for-each>
            </xsl:variable>

            <!-- actions - START -->
            <xsl:for-each select="actions" >
                <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="thisNodeIndex" select="number(substring(generate-id(), 2) - 65536)" />
                <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                //Action - GDNode - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>

                    //Action - GDNode - for Condition totalRecursions=<xsl:value-of select="$totalRecursions" /> eventPosition=<xsl:value-of select="$eventPosition" /> conditionEventPosition=<xsl:value-of select="$conditionEventPosition" /> hasAssociatedSiblingCondition=<xsl:value-of select="$hasAssociatedSiblingCondition" />
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                    <xsl:variable name="nodeAsString" ><xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                    <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "B: <xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                        <xsl:if test="$typeValue != 'ModVarScene' and $typeValue != 'AddForceAL' and $typeValue != 'PlaySoundCanal' and $typeValue != 'StopSoundCanal'" >
                        private final String ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "B: <xsl:value-of select="translate($actionAsString, $quote, ' ')" /> at: ";
                        </xsl:if>
                        <xsl:if test="$typeValue = 'ModVarObjet' or $typeValue = 'Opacity'" >
                        //private final String ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "B: <xsl:value-of select="translate($actionAsString, $quote, ' ')" /> is: ";
                        </xsl:if>
                        <xsl:text>&#10;</xsl:text>

                <xsl:if test="contains($actionWithTextObjectString, 'found')" >
                    <xsl:if test="$typeValue = 'TextObject::String'" >
                        //TextObject::String - START
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            //Parameters - 2
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >globals.<xsl:value-of select="text()" />TextAnimation</xsl:if>
                                <xsl:if test="position() = 2" ><xsl:if test="text() = '='" >.setText(</xsl:if></xsl:if>
                                <xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if>
                                <xsl:if test="position() = last()" >);</xsl:if>
                            </xsl:for-each>
                            
                            return true;
                        }
                        //TextObject::String - END
                    </xsl:if>
                    
                </xsl:if>

                <xsl:if test="$typeValue = 'SceneBackground'" >
                    //SceneBackground - Handled in Midlet
                </xsl:if>
                <xsl:if test="$typeValue = 'ChangeAnimation'" >
                    //ChangeAnimation
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >(((GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject.animation</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        return true;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'ModVarObjet'" >
                    <xsl:variable name="secondParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //ModVarObjet - //<xsl:value-of select="$secondParam" />
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        <!-- <xsl:if test="$secondParam = 'opacity'" > -->
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        <!-- </xsl:if> -->
                        <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >(((GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject.</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >(((GDGameLayer) globals.<xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>GDGameLayerList.get(index))).gdObject.<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        <!-- <xsl:if test="$secondParam = 'opacity'" > -->
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >(((GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject.</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                        <!-- </xsl:if> -->
                        return true;
                    }
                </xsl:if>                
                <xsl:if test="$typeValue = 'HideLayer'" >
                    //HideLayer
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        LogUtil.put(LogFactory.getInstance(commonStrings.NOT_IMPLEMENTED, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        
                        return true;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'PlaySound'" >
                    //PlaySound
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();
                    
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        <xsl:variable name="fileName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:call-template name="after-lastIndexOf"><xsl:with-param name="string" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="char" >/</xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="fileName2" ><xsl:value-of select="translate(substring-before($fileName, '.'), '_', ' ')" /></xsl:variable>
                        <xsl:variable name="fileName3" ><xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="$fileName2" /></xsl:with-param></xsl:call-template></xsl:variable>
                        
                        try {
                            org.allbinary.game.resource.GD<xsl:value-of select="translate($fileName3, ' ', '')" />Sound.getInstance().getPlayer().start();
                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                        }

                        return true;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'PlaySoundCanal'" >
                    //PlaySoundCanal
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();
                    
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        <xsl:variable name="fileName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:call-template name="after-lastIndexOf"><xsl:with-param name="string" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="char" >/</xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="fileName2" ><xsl:value-of select="translate(substring-before($fileName, '.'), '_', ' ')" /></xsl:variable>
                        <xsl:variable name="fileName3" ><xsl:call-template name="camelcase" ><xsl:with-param name="text" ><xsl:value-of select="$fileName2" /></xsl:with-param></xsl:call-template></xsl:variable>

                        try {
                            final Sound sound = org.allbinary.game.resource.GD<xsl:value-of select="translate($fileName3, ' ', '')" />Sound.getInstance();
                            if(!globals.channelSoundArray[<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>].contains(sound)) {
                                globals.channelSoundArray[<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>].add(sound);
                            }
                            sound.getPlayer().start();
                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                        }

                        return true;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'StopSoundCanal'" >
                    //StopSoundCanal
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        try {
                            final BasicArrayList list = globals.channelSoundArray[<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>];
                            final int size = list.size();

                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                ((Sound) list.get(index)).getPlayer().stop();
                            }

                        } catch(Exception e) {
                            LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                        }

                        return true;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'ResetTimer'" >
                    //ResetTimer
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();
                    
                        LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >globals.<xsl:value-of select="translate(text(), '&quot;', '')" />TimeDelayHelper.setStartTime();</xsl:if>
                        </xsl:for-each>

                        return true;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'PauseTimer'" >
                    //PauseTimer
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();
                    
                        LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                        
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >globals.<xsl:value-of select="translate(text(), '&quot;', '')" />TimeDelayHelper.pause();</xsl:if>
                        </xsl:for-each>
                        
                        return true;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'Opacity'" >
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //Opacity
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();
                        
                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final int size = globals.<xsl:value-of select="text()" />GDGameLayerList.size();</xsl:if></xsl:for-each>
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GDGameLayer gameLayer = (((GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index)));</xsl:if></xsl:for-each>
                            this.processGD(gameLayer, globals.graphics);
                            gameLayer.updateGDObject(globals.timeDelta);
                        }

                        return true;
                    }

                    @Override
                    public void processGD(final GDGameLayer gameLayer, final Graphics graphics) {
                        super.processGDStats(gameLayer);

                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GDObject <xsl:value-of select="text()" /> = gameLayer.gdObject;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
<xsl:text>                        </xsl:text><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.opacity</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:if test="not(contains(text(), 'Variable('))" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="contains(text(), 'Variable(')" ><xsl:value-of select="substring-before(text(), 'Variable(')" />Variable(<xsl:value-of select="$name" />.<xsl:value-of select="substring-after(text(), 'Variable(')" /></xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >(((GDGameLayer) globals.<xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>GDGameLayerList.get(index))).gdObject.<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.opacity</xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                    }
                                                            
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                        <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >final GDObject <xsl:value-of select="text()" /> = (((GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>

<xsl:text>                        </xsl:text><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.opacity</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:if test="not(contains(text(), 'Variable('))" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="contains(text(), 'Variable(')" ><xsl:value-of select="substring-before(text(), 'Variable(')" />Variable(<xsl:value-of select="$name" />.<xsl:value-of select="substring-after(text(), 'Variable(')" /></xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >(((GDGameLayer) globals.<xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>GDGameLayerList.get(index))).gdObject.<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                        <xsl:text>&#10;</xsl:text>
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_IS_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.opacity</xsl:if></xsl:for-each>, this, commonStrings.PROCESS));

                        return true;
                    }
                </xsl:if>                
                <xsl:if test="$typeValue = 'Create'" >

                    //param1=<xsl:value-of select="$param" />
                        <xsl:if test="contains($actionWithTextObjectString, $param)" >
                    //Create - GDObject with TextObject::String - START
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();
                            
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    <xsl:call-template name="createGDObject" >
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeAsString" >
                            <xsl:value-of select="$nodeAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        globals.<xsl:value-of select="$name" />GDObjectList.add(<xsl:value-of select="$name" />2);
                        
                        return true;
                    }
                    //Create - GDObject with TextObject::String - END
                        </xsl:if>
                        
                        <xsl:if test="not(contains($actionWithTextObjectString, $param))" >
                    //Create
                    @Override
                    public boolean processCreate(final GDObject gdObject) throws Exception {
                        super.processCreateStats(gdObject);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 2" >globals.<xsl:value-of select="text()" />GDGameLayerList.size()</xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                        
                    <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            final StringBuilder stringBuilder = new StringBuilder();
                            stringBuilder.delete(0, stringBuilder.length());
                            final int index = globals.<xsl:value-of select="text()" />GDGameLayerList.size();
                            final GDGameLayer <xsl:value-of select="text()" />GDGameLayer = resources.<xsl:value-of select="text()" />GDGameLayerFactory.create(stringBuilder.append(globals.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>).append(CommonSeps.getInstance().UNDERSCORE).append(index).toString(), gdObject, globals.<xsl:value-of select="text()" />GDConditionWithGroupActions);
                            //stringBuilder.delete(0, stringBuilder.length());
                            //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="$nodeId" /> for globals.<xsl:value-of select="text()" />GDGameLayerList.add(<xsl:value-of select="text()" />GDGameLayer); at: ").append(index).toString(), this, commonStrings.PROCESS));
                            //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="text()" />GDGameLayer.toString(), this, commonStrings.PROCESS));

                            globals.<xsl:value-of select="text()" />GDGameLayerList.add(<xsl:value-of select="text()" />GDGameLayer);
                        </xsl:if>
                    </xsl:for-each>
                        return false;
                    }
                        </xsl:if>
                </xsl:if>

                <xsl:if test="$typeValue = 'SetAngle'" >
                    //SetAngle
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));

                    <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                    //Hackish method 1st param or list - 2
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >(((GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index)).gdObject).setAngle(</xsl:if><xsl:if test="position() = 2" > (short)</xsl:if><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >(((GDGameLayer) globals.<xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>GDGameLayerList.get(0))).gdObject.<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >, (GDGameLayer) globals.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(index));</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                         return true;
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                    //ChangePlan - index
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >(((GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject.zOrder</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                        return true;
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeColor'" >
                    //ChangeColor - index
                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >(((GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject.basicColor = new BasicColor(</xsl:if><xsl:if test="position() != 1" >255, <xsl:value-of select="translate(translate(text(), '\&quot;', ''), ';', ',')" />, <xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >);</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                        return true;
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'Create'" >
                    <xsl:if test="not(contains($actionWithTextObjectString, $param))" >
                    //Create End
                    @Override
                    public void processEnd(final int index) throws Exception {
                        super.processEndStats(index);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.END));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:variable name="layerName" ><xsl:value-of select="text()" /></xsl:variable>
                            <xsl:variable name="gameLayer" ><xsl:value-of select="text()" />GDGameLayer</xsl:variable>

                            final GDGameLayer <xsl:value-of select="$gameLayer" /> = (GDGameLayer) globals.<xsl:value-of select="$gameLayer" />List.get(index);
                            
                            if(<xsl:value-of select="$gameLayer" /> != null) {
                                //updateGDObject - 3
                                <xsl:value-of select="$gameLayer" />.updateGDObject(globals.timeDelta);
                                
                                allBinaryGameLayerManager.insert(<xsl:value-of select="$gameLayer" />);

                                //objectsGroupsGDGameLayer - START
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                        <xsl:variable name="layoutIndex2" select="position() - 1" />
                                        <xsl:if test="number($layoutIndex2) = $layoutIndex" >

                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:variable name="groupName">
                                                    <xsl:value-of select="name" />
                                                </xsl:variable>
                                                <xsl:for-each select="objects" >
                                                    <xsl:if test="name = $layerName" >
                                                        //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$nodeId" /> for globals.<xsl:value-of select="$groupName" />GDGameLayerList.add(<xsl:value-of select="$gameLayer" />); at: " + index, this, commonStrings.PROCESS));
                                                        globals.<xsl:value-of select="$groupName" />GDGameLayerList.add(<xsl:value-of select="$gameLayer" />);
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:for-each>

                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                //objectsGroupsGDGameLayer - END

                            } else {
                                //final String message = "<xsl:value-of select="$nodeId" /> <xsl:value-of select="$gameLayer" /> warning: not initialized";
                                //LogUtil.put(LogFactory.getInstance(message, this, message));
                            }

                        </xsl:if>
                    </xsl:for-each>
                    }
                    </xsl:if>
                </xsl:if>

                <xsl:if test="$typeValue = 'Scene'" >

                        //Scene
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            <xsl:if test="$typeValue = 'Scene'" >
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                            //<xsl:value-of select="translate(text(), '\&quot;', '')" />
                            </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                            
                            <xsl:variable name="command" >
                            <xsl:if test="$typeValue = 'Scene'" >
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '\&quot;', '')" /></xsl:with-param></xsl:call-template>_GD_LAYOUT</xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                            </xsl:variable>

                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                canvas.getCustomCommandListener().commandAction(GDGameCommandFactory.getInstance().<xsl:value-of select="$command" />, ProgressCanvasFactory.getInstance());

                            } catch(Exception e) {
                                //3
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

                </xsl:if>

                                <xsl:if test="$typeValue != 'Scene' and $typeValue != 'MettreX' and $typeValue != 'MettreY' and $typeValue != 'SceneBackground' and $typeValue != 'Rotate'" >

                                </xsl:if>

                                <xsl:if test="$typeValue = 'MettreX'" >

                        private final String ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "G: " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        //MettreX
                        @Override
                        public boolean processG(final GDObject gdObject, final Graphics graphics) {

                            try {
                                super.processGStats(gdObject, graphics);

                                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                                
                                //if(gdObject == null) {
                                //    LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "gdObject was null", this, commonStrings.PROCESS));
                                //    return;
                                //}

                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                                //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="$name" />.toString(), this, commonStrings.PROCESS));

                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setX(</xsl:if>
                                <xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if>
                                </xsl:for-each>);

                                //<xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.x</xsl:if></xsl:for-each>;

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                globals.<xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    PointFactory.getInstance().getInstance(<xsl:value-of select="$name" />.x, <xsl:value-of select="$name" />.y),
                                    <xsl:value-of select="$name" />.Width(globals.graphics), <xsl:value-of select="$name" />.Height(globals.graphics));
                                </xsl:if>

                            } catch(Exception e) {
                                //4
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }
                                </xsl:if>
                                <xsl:if test="$typeValue = 'MettreY'" >

                        private final String ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "G: " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        //MettreY
                        @Override
                        public boolean processG(final GDObject gdObject, final Graphics graphics) {


                            try {
                                super.processGStats(gdObject, graphics);

                                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                //if(gdObject == null) {
                                //    LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "gdObject was null", this, commonStrings.PROCESS));
                                //    return;
                                //}
                                
                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                                
                                //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="$name" />.toString(), this, commonStrings.PROCESS));

                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.setY(</xsl:if>
                                <xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if>
                                </xsl:for-each>);
                                
                                //<xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.y</xsl:if></xsl:for-each>;

                                //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="$name" />.toString(), this, commonStrings.PROCESS));

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                globals.<xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    PointFactory.getInstance().getInstance(<xsl:value-of select="$name" />2.x, <xsl:value-of select="$name" />2.y),
                                    <xsl:value-of select="$name" />2.Width(globals.graphics), <xsl:value-of select="$name" />2.Height(globals.graphics));
                                </xsl:if>

                            } catch(Exception e) {
                                //5
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }
                                
                            return true;
                        }
                                </xsl:if>
                                <xsl:if test="$typeValue = 'MettreXY'" >

                        private final String ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "G: " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        //MettreXY
                        @Override
                        public boolean processG(final GDObject gdObject, final Graphics graphics) {


                            try {
                                super.processGStats(gdObject, graphics);

                                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                //if(gdObject == null) {
                                //    LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_G_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "gdObject was null", this, commonStrings.PROCESS));
                                //    return;
                                //}
                                
                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                                //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="$name" />.toString(), this, commonStrings.PROCESS));

                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.x</xsl:if><xsl:if test="position() = 2 or position() = 3" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;<xsl:text>&#10;</xsl:text></xsl:if>
                                </xsl:for-each>
                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.y</xsl:if><xsl:if test="position() > 3" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                                </xsl:for-each>

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                globals.<xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    PointFactory.getInstance().getInstance(<xsl:value-of select="$name" />2.x, <xsl:value-of select="$name" />2.y),
                                    <xsl:value-of select="$name" />2.Width(globals.graphics), <xsl:value-of select="$name" />2.Height(globals.graphics));
                                </xsl:if>

                            } catch(Exception e) {
                                //6
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'UnPauseTimer'" >

                        //UnPauseTimer
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                            
                            try {

                                <xsl:for-each select="parameters" ><xsl:if test="position() = 2" >if(globals.<xsl:value-of select="translate(text(), '&quot;', '')" />TimeDelayHelper.resume()) { </xsl:if></xsl:for-each>
                                    LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                                    return true; 
                                }

                            } catch(Exception e) {
                            //6
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }
                            
                            return false;
                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'SetAngle'" >
                        //SetAngle
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                    <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                final int size = globals.<xsl:value-of select="$gameLayerName" />GDGameLayerList.size();
                    <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //Hackish method 1st param or list - 3
                                    (((GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject.setAngle(</xsl:if><xsl:if test="position() = 2" > (short)</xsl:if><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >(((GDGameLayer) globals.<xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>GDGameLayerList.get(0))).gdObject.<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >, (GDGameLayer) globals.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(index));<xsl:text>&#10;</xsl:text>
                                }
                            </xsl:if>
                    </xsl:for-each>

                            } catch(Exception e) {
                            //7
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'ChangePlan'" >

                        //ChangePlan
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                    <xsl:for-each select="parameters" >
                        //<xsl:if test="position() = 1" >((GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index))).gdObject.zOrder</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>

                            } catch(Exception e) {
                            //8
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'ModVarScene'" >

                        //ModVarScene
                    <xsl:for-each select="parameters" >
                        <xsl:if test="contains(text(), 'angle')" >
                        //Update angle with rotation
                        </xsl:if>
                    </xsl:for-each>
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                            
                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                                
                    <xsl:variable name="gameObjectNames" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() > 2" >
                            <xsl:if test="contains(text(), '.')" >
                                <xsl:variable name="objectNameWithSeps" >:<xsl:value-of select="substring-before(text(), '.')" />,</xsl:variable>
                                <xsl:if test="contains($objectsAsString, $objectNameWithSeps)" >
                                    <xsl:value-of select="substring-before(text(), '.')" />,
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>                    
                    </xsl:variable>
                    
                    <xsl:if test="$gameObjectNames != ''" >
                        <xsl:variable name="gameObjectName" ><xsl:value-of select="substring-before($gameObjectNames, ',')" /></xsl:variable>
                                //This may need to loop through more than 1 game object found 2: <xsl:value-of select="$gameObjectName" /> 
                                GDGameLayer playerGDGameLayer = null;
                                GDObject player = null;
                                if(globals.playerGDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                    playerGDGameLayer = ((GDGameLayer) globals.playerGDGameLayerList.get(0));
                                    player = (GDObject) playerGDGameLayer.gdObject;
                                } else {
                                    return false;
                                }
                    </xsl:if>

                    <xsl:text>&#10;</xsl:text>
                        //Parameters
                    <xsl:for-each select="parameters" >
                        <xsl:variable name="textValue" ><xsl:value-of select="text()" /></xsl:variable>
                        <xsl:variable name="textValue3" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" >player_</xsl:with-param><xsl:with-param name="replacementText" >globals.player_</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:variable name="textValue2" ><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:if test="position() = 1" >globals.</xsl:if><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" >(</xsl:with-param><xsl:with-param name="replacementText" >(globals.</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="position() = 1" >globals.</xsl:if><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="$textValue" /></xsl:with-param><xsl:with-param name="find" >Angle()</xsl:with-param><xsl:with-param name="replacementText" >Angle(playerGDGameLayer)</xsl:with-param></xsl:call-template><xsl:if test="$textValue = '+'" >=</xsl:if><xsl:if test="$textValue = '-'" >=</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                    <!--
                    <xsl:if test="((number(parameters[3]) = 0 or number(parameters[3])) and substring-after(parameters[3]/text(), '.') = '') or not(number(parameters[3]))" >
                    <xsl:for-each select="parameters" >
                        //<xsl:if test="position() = 1" >globals.<xsl:value-of select="text()" />_updated = true;</xsl:if>
                    </xsl:for-each>
                    </xsl:if>
                    -->

                            } catch(Exception e) {
                            //9
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }
                                
                            return true;
                        }

                                </xsl:if>

                                <xsl:if test="$typeValue = 'TextObject::ChangeColor'" >

                        //TextObject::ChangeColor
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();

                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            globals.<xsl:value-of select="text()" />TextAnimation.setBasicColor(new BasicColor(255, </xsl:if>
                                        <xsl:if test="position() = 2" >
                                            <xsl:value-of select="translate(substring(text(), 2, string-length(text()) - 2), ';', ',')" />
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >, "<xsl:value-of select="$typeValue" />"));</xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                            //10
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return true;
                        }

                                </xsl:if>

                                <xsl:if test="$typeValue = 'Delete'" >
                        private final String ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "processGD - " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        private final BasicArrayList removeList = new BasicArrayList();

                        //Delete
                        @Override
                        public void addForDelete(final GDGameLayer gdGameLayer) {
                            removeList.add(gdGameLayer);
                        }

                        @Override
                        public boolean process() throws Exception {
            
                            final int size = removeList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                this.processGD((GDGameLayer) removeList.get(index), globals.graphics);
                            }

                            removeList.clear();
                            
                            return true;
                        }
            
                        @Override
                        public void processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer, final Graphics graphics) {
                            super.processGDStats(<xsl:value-of select="$name" />GDGameLayer);
                        
                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 1" >globals.<xsl:value-of select="text()" />GDGameLayerList.size()</xsl:if></xsl:for-each>, this, commonStrings.PROCESS));

                                    //Parameters - 5
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            //<xsl:value-of select="text()" /><xsl:text>&#10;</xsl:text>
                                            
                                            globals.<xsl:value-of select="text()" />GDGameLayerList.remove(<xsl:value-of select="text()" />GDGameLayer);
                                            //allBinaryGameLayerManager.remove(<xsl:value-of select="text()" />GDGameLayer);
                                            <xsl:value-of select="text()" />GDGameLayer.setDestroyed(true);
                                            
                                        </xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                            //11
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                        }

                                </xsl:if>

                                <xsl:if test="$typeValue = 'AddForceAL'" >

                                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //AddForceAL
                    /*
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        try {
                
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

            <xsl:if test="../actions" >
                            //if(globals.<xsl:value-of select="$name" />GDGameLayerList != null) {
                            if(globals.<xsl:value-of select="$name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            final int size = globals.<xsl:value-of select="$name" />GDGameLayerList.size();

                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                //LogUtil.put(LogFactory.getInstance(CommonLabels.getInstance().INDEX_LABEL + index, this, commonStrings.PROCESS));
            </xsl:if>
                <xsl:call-template name="gameLayerList" >
                    <xsl:with-param name="name" >
                        <xsl:value-of select="$name"/>
                    </xsl:with-param>
                </xsl:call-template>

                                this.processGD(<xsl:value-of select="$name" />GDGameLayer, globals.graphics);

            <xsl:if test="../actions" >
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$name" />GDGameLayerList was null", this, commonStrings.PROCESS));
                            }
            </xsl:if>

                        } catch(Exception e) {
                        //12
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                        }

                        return true;
                    }
                    */

                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);
                
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

            <xsl:if test="../actions" >
                        //if(globals.<xsl:value-of select="$name" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="$name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            if(globals.<xsl:value-of select="$name" />GDGameLayerList.size() != 0) {

                            //LogUtil.put(LogFactory.getInstance(CommonLabels.getInstance().INDEX_LABEL + index, this, commonStrings.PROCESS));
            </xsl:if>
                <xsl:call-template name="gameLayerList" >
                    <xsl:with-param name="name" >
                        <xsl:value-of select="$name"/>
                    </xsl:with-param>
                </xsl:call-template>

                            this.processGD(<xsl:value-of select="$name" />GDGameLayer, globals.graphics);
                            return true;

            <xsl:if test="../actions" >
                            } else {
                                LogUtil.put(LogFactory.getInstance("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$name" />GDGameLayerList was empty", this, commonStrings.PROCESS));
                            }                
                        } else {
                            //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$name" />GDGameLayerList was null", this, commonStrings.PROCESS));
                        }                
            </xsl:if>
                        return false;
                    }

                        private final String ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "processGD - " + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        @Override
                        public void processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer, final Graphics graphics) {
                            super.processGDStats(<xsl:value-of select="$name" />GDGameLayer);

                            try {

                                //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_GD_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                    //name=<xsl:value-of select="$name" />
                                    final GDObject <xsl:value-of select="$name" /> = <xsl:value-of select="$name" />GDGameLayer.gdObject;
                                    <xsl:text>&#10;</xsl:text>

                                    <!--
                                    <xsl:variable name="length" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="substring-before(substring-after(text(), 'Variable('), ')')" /></xsl:if></xsl:for-each></xsl:variable>
                                    <xsl:if test="string-length($length) > 0" >
                                    if(<xsl:value-of select="$length" />_updated) {
                                        <xsl:value-of select="$length" />_updated = false;
                                    </xsl:if>
                                    -->
                                    //Parameters - 6
                                    
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            <xsl:value-of select="text()" />GDGameLayer.AddForceUsingPolarCoordinates(</xsl:if>
                                        <xsl:if test="position() != 1 and position() != last()" >
                                            <xsl:variable name="paramText" select="text()" />

                                            <xsl:variable name="key" >
                                                <xsl:for-each select="/game/variables/value" >
                                                    <xsl:variable name="variable" >Variable(<xsl:value-of select="text()" />)</xsl:variable>
                                                    <xsl:if test="contains($paramText, $variable)" >
                                                        <xsl:value-of select="text()" />
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:variable>

                                            <xsl:if test="string-length($key) > 0" >
                                                //Text - 2
                                                <xsl:call-template name="string-replace-all" >
                                                    <xsl:with-param name="text" >
                                                        <xsl:value-of select="$paramText" />
                                                    </xsl:with-param>
                                                    <xsl:with-param name="find" >Variable(<xsl:value-of select="$key" />)</xsl:with-param>
                                                    <xsl:with-param name="replacementText" >Variable(<xsl:value-of select="$name" />.<xsl:value-of select="$key" />)</xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:if>
                                            <xsl:if test="string-length($key) = 0" >
                                                //Text - 3
                                                <xsl:value-of select="$paramText" />
                                            </xsl:if>,<xsl:text> </xsl:text>
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >
                                            //Text - 4
                                            <xsl:value-of select="text()" />);
                                        </xsl:if>
                                    </xsl:for-each>
                                    <!--
                                    <xsl:if test="string-length($length) > 0" >
                                    }
                                    </xsl:if>
                                    -->
                                
                                    <!--
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 3" >

                                            <xsl:if test="contains(text(), 'Variable(')" >
                                                <xsl:variable name="end" >
                                                    <xsl:call-template name="string-replace-all" >
                                                        <xsl:with-param name="text" >
                                                            <xsl:value-of select="text()" />
                                                        </xsl:with-param>
                                                        <xsl:with-param name="find" >Variable(</xsl:with-param>
                                                        <xsl:with-param name="replacementText" >
                                                        </xsl:with-param>
                                                    </xsl:call-template>
                                                </xsl:variable>
                                            
                                                <xsl:call-template name="string-replace-all" >
                                                    <xsl:with-param name="text" >
                                                        //<xsl:value-of select="$end" /> = 0;
                                                    </xsl:with-param>
                                                    <xsl:with-param name="find" >)</xsl:with-param>
                                                    <xsl:with-param name="replacementText" ></xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:if>

                                        </xsl:if>
                                    </xsl:for-each>
                                    -->
                                    
                                    <xsl:text>&#10;</xsl:text>
                                    //updateGDObject - 4
                                    <xsl:value-of select="$name" />GDGameLayer.updateGDObject(globals.timeDelta);
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                            //13
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                        }

                                </xsl:if>

                                <xsl:if test="$typeValue = 'Rotate'" >

                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                            
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

        <xsl:if test="../conditions" >
            //Sibling Conditions
            boolean siblingConditions = true;
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'Timer'" >
                    //Condition - //Timer - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    //Condition - //NbObjet - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    //Condition - //VarScene - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
        </xsl:if>

                        //if(globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            GDGameLayer gameLayer;
                            final int size = globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                gameLayer = (GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);

        <xsl:if test="../conditions" >
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'PosX'" >
                    //PosX
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(gameLayer.gdObject, globals.graphics)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    //PosY
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(gameLayer.gdObject, globals.graphics)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    //VarObjet
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(gameLayer.gdObject, globals.graphics)) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
                if(siblingConditions) {
                    this.processGD(((GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index)), globals.graphics);
                }
        </xsl:if>

        <xsl:if test="not(../conditions)" >
                                this.processGD(((GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index)), globals.graphics);
        </xsl:if>
                                //updateGDObject - 5
                                gameLayer.updateGDObject(globals.timeDelta);
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$gdObjectName" />GDGameLayerList was null", this, commonStrings.PROCESS));
                            }
                                
                            return true;
                        }

                        @Override
                        public void processReleased() throws Exception { //Rotate
                            super.processReleasedStats();
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, globals.PROCESS_RELEASE));

        <xsl:if test="../conditions" >
            //Sibling Conditions
            boolean siblingConditions = true;
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'Timer'" >
                    //Condition - //Timer - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    //Condition - //NbObjet - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    //Condition - //VarScene - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
        </xsl:if>

                        //if(globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList != null) {
                        if(globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            GDGameLayer gameLayer;
                            final int size = globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                gameLayer = (GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);

        <xsl:if test="../conditions" >
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'PosX'" >
                    //Condition - //PosX - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(gameLayer.gdObject, globals.graphics)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    //Condition - //PosY - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(gameLayer.gdObject, globals.graphics)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    //Condition - //VarObjet - call
                    if(!globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(gameLayer.gdObject, globals.graphics)) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
                if(siblingConditions) {
                    this.processReleased(((GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index)).gdObject);
                }
        </xsl:if>

        <xsl:if test="not(../conditions)" >
                                this.processReleased(((GDGameLayer) globals.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index)).gdObject);
        </xsl:if>
                                //updateGDObject - 6
                                gameLayer.updateGDObject(globals.timeDelta);
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> <xsl:value-of select="$gdObjectName" />GDGameLayerList was null", this, commonStrings.PROCESS));
                            }
                        }

                        //Rotate
                        @Override
                        public boolean processG(final GDObject <xsl:value-of select="$name" />, final Graphics graphics) {
                            super.processGStats(<xsl:value-of select="$name" />, graphics);
                        <xsl:if test="$name = 'player'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                        </xsl:if>
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            //Parameters - 3
                            <xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.rotation = <xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                            //<xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.angle += <xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                            return true;
                        }

                        @Override
                        public boolean processReleased(final GDObject <xsl:value-of select="$name" />) {
                        <xsl:if test="$name = 'player'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, globals.PROCESS_RELEASE));
                        </xsl:if>
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.rotation = 0;</xsl:if></xsl:for-each>
                            return true;
                        }
                                </xsl:if>

                            <xsl:for-each select="../conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";
                                </xsl:if>
                            </xsl:for-each>

                            <xsl:for-each select="../events" >
                        //private final String EVENTS_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Events nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>";
                            </xsl:for-each>

                        <!--
                        ../events
                        -->
                        <xsl:variable name="childEventWithUsedEvent" ><xsl:for-each select="../events" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="motionGestureEvent" >true</xsl:with-param></xsl:call-template></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($childEventWithUsedEvent, 'found')" >
                        //SourisSurObjet - motionGestureEvent
                        @Override
                        public void process(final MotionGestureEvent motionGestureEvent) throws Exception {
                            super.processStats(motionGestureEvent);
                            
                            //Conditions - START
                            <xsl:for-each select="../conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                            //Condition - //SourisSurObjet - call - motionGestureEvent
                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                                </xsl:if>
                            </xsl:for-each>
                            //Conditions - END
                        
                        }
                        </xsl:if>

                    };
            </xsl:for-each>
            <!-- actions - END -->

            <xsl:call-template name="eventsCreateAssignGDObjectGDNodesAction" >
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="thisNodeIndex" >
                    <xsl:value-of select="$thisNodeIndex" />
                </xsl:with-param>
                <xsl:with-param name="totalRecursions" >
                    <xsl:value-of select="number($totalRecursions) + 1" />
                </xsl:with-param>
                <xsl:with-param name="instancesAsString" >
                    <xsl:value-of select="$instancesAsString" />
                </xsl:with-param>
                <xsl:with-param name="objectsAsString" >
                    <xsl:value-of select="$objectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="createdObjectsAsString" >
                    <xsl:value-of select="$createdObjectsAsString" />
                </xsl:with-param>
                <xsl:with-param name="conditionEventPosition" >
                    <xsl:value-of select="$eventPosition" />
                </xsl:with-param>

            </xsl:call-template>

        </xsl:for-each>

    </xsl:template>

</xsl:stylesheet>
