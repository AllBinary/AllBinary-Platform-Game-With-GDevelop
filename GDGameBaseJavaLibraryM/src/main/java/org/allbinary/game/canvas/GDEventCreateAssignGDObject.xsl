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

    <xsl:template name="actionWithUsedTypeRecursion" >
        <xsl:for-each select="actions" >
            <xsl:variable name="typeValue" select="type/value" />
            <xsl:if test="$typeValue = 'Delete' or $typeValue = 'UnPauseTimer' or $typeValue = 'MettreX' or $typeValue = 'MettreY'  or $typeValue = 'MettreXY' or $typeValue = 'SetAngle' or $typeValue = 'ChangePlan' or $typeValue = 'ChangeAnimation' or $typeValue = 'ModVarObjet' or $typeValue = 'TextObject::ChangeColor' or $typeValue = 'ModVarGlobal' or $typeValue = 'ModVarScene' or $typeValue = 'AddForceAL'" >found</xsl:if>
        </xsl:for-each>
        
        <xsl:for-each select="events" >
            <xsl:call-template name="actionWithUsedTypeRecursion" ></xsl:call-template>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="conditionsWithUsedTypeRecursion" >
        <xsl:for-each select="conditions" ><xsl:if test="type/value = 'SourisSurObjet'" >found</xsl:if>
        </xsl:for-each>
        
        <xsl:for-each select="events" >
            <xsl:call-template name="conditionsWithUsedTypeRecursion" ></xsl:call-template>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="actionsWithIndexesProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="createdObjectsAsString" />
                
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                final GDGameLayerFactory <xsl:value-of select="text()" />GDGameLayerFactory = GD1SpecialAnimation.this.<xsl:value-of select="text()" />GDGameLayerFactory;
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>

                    public void process() {

                <xsl:variable name="thisNodeArray" >this</xsl:variable>

                <xsl:call-template name="actionsWithIndexes" >
                    <xsl:with-param name="thisNodeArray" >
                        <xsl:value-of select="$thisNodeArray" />
                    </xsl:with-param>                    
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                </xsl:call-template>

                    }
    </xsl:template>

    <xsl:template name="actionsWithIndexes" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="thisNodeArray" />
                    //objectGDObjectAtIndex2 - START
                    <xsl:call-template name="objectGDObjectAtIndex2" >
                        <xsl:with-param name="thisNodeArray" >
                            <xsl:value-of select="$thisNodeArray" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="parametersAsString" >
                            <xsl:value-of select="$parametersAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <!--
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="not(preceding-sibling::actions[type/value/text() = 'Create'])">
                    </xsl:if>
                </xsl:for-each>
                    -->
                    //objectGDObjectAtIndex2 - END

                    try {

            <xsl:if test="actions" >
                        //repeatExpression <xsl:value-of select="repeatExpression" />
                        final int size = <xsl:if test="not(repeatExpression)" >1</xsl:if><xsl:if test="repeatExpression" ><xsl:value-of select="repeatExpression" /></xsl:if>;

                        final BasicArrayList gameLayerList = new BasicArrayList();
                        //final StringBuilder stringBuilder = new StringBuilder();

                        <xsl:for-each select="actions" >
                            <xsl:if test="type/value = 'Create'" >
                                <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 2" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$nodeId" /><xsl:value-of select="text()" />GDGameLayerList = new BasicArrayList(size);"));
                        if(<xsl:value-of select="text()" />GDGameLayerList.objectArray == arrayUtil.ZERO_OBJECT_ARRAY) {
                            <xsl:value-of select="text()" />GDGameLayerList.ensureCapacity(size);
                        }
                        //<xsl:value-of select="text()" />GDGameLayerList = new BasicArrayList(size);                        
                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:if>
                        </xsl:for-each>

                        <xsl:variable name="createParamsAsString" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                        
                        <xsl:if test="string-length($createParamsAsString) > 0" >
                            <xsl:variable name="text" select="substring-before($createParamsAsString, ',')" />
                        final int startIndex = <xsl:value-of select="$text" />GDGameLayerList.size();
                        final int endIndex = <xsl:value-of select="$text" />List.size();
                        
                        //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, stringBuilder.append("startIndex: ").append(startIndex).append("endIndex: ").append(endIndex).toString()));
                        for(int index = startIndex; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> endIndex; index++) {
                        </xsl:if>

                        <xsl:if test="string-length($createParamsAsString) = 0" >
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                        </xsl:if>
                        
            gameLayerList.clear();
            boolean actionWithUpdate = false;
            </xsl:if>

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>
                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                    //UnPauseTimer
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="translate(text(), '&quot;', '')" />TimeDelayHelper.unPause();</xsl:if></xsl:for-each>
                </xsl:if>
                <xsl:if test="$typeValue = 'Create'" >
                    //Create
                    nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />GDGameLayerList</xsl:if></xsl:for-each>, index);
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreX'" >
                    //MettreX
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process((GDObject) <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />List.get(index)</xsl:if></xsl:for-each>);
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            gameLayer.updatePosition();
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreY'" >
                    //MettreY
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process((GDObject) <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />List.get(index)</xsl:if></xsl:for-each>);
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            gameLayer.updatePosition();
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreXY'" >
                    //MettreXY
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process((GDObject) <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />List.get(index)</xsl:if></xsl:for-each>);
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            gameLayer.updatePosition();
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <xsl:if test="$typeValue = 'SetAngle'" >
                    //SetAngle
                    if(nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayerList</xsl:if></xsl:for-each>, index)) {
                        actionWithUpdate = true;
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                    //ChangePlan
                    if(nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayerList</xsl:if></xsl:for-each>, index)) {
                        actionWithUpdate = true;
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeAnimation'" >
                    //ChangeAnimation
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        actionWithUpdate = true;
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) <xsl:value-of select="text()" />List.get(index)).animation</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarObjet'" >
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        actionWithUpdate = true;
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    //ModVarObjet - <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) <xsl:value-of select="text()" />List.get(index)).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >((GDObject) <xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>List.get(index)).<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'Create'" >
                    //Create End
                    nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processEnd(<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />GDGameLayerList</xsl:if></xsl:for-each>, index);
                </xsl:if>
            </xsl:for-each>

            <xsl:variable name="hasCreate" ><xsl:for-each select="actions" ><xsl:variable name="typeValue" select="type/value" /><xsl:if test="$typeValue = 'Create'" >Create</xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="not(contains($hasCreate, 'Create'))" >
                                if(actionWithUpdate) {

                                    final int size2 = gameLayerList.size();
                                    if(size2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                        for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                                            ((GDGameLayer) gameLayerList.get(index2)).updateGDObject(timeDelta);
                                        }
                                    } else {
                                        LogUtil.put(LogFactory.getInstance("updateGDObject failed: <xsl:for-each select="actions" ><xsl:if test="type/value = 'MettreX' or type/value = 'MettreY' or type/value = 'MettreXY' or type/value = 'SetAngle' or type/value = 'ChangePlan' or type/value = 'ChangeAnimation' or type/value = 'ModVarObjet'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayer </xsl:if></xsl:for-each></xsl:if></xsl:for-each>was null", this, CommonStrings.getInstance().EXCEPTION));
                                    }

                                }
            </xsl:if>

            <xsl:if test="actions" >
                        }
            </xsl:if>

                    } catch(Exception e) {
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().PROCESS, e));
                    }

    </xsl:template>

    <xsl:template name="eventsCreateProcessUsed" >
        <xsl:param name="caller" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="createdObjectsAsString" />

                    //Event - Actions - process - used
                    public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2, final GDNode gdNode, final BasicArrayList gdNodeList) {

                        try {

            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            //Hack to keep from creating again before last time
                            if(<xsl:value-of select="text()" />List.size() != <xsl:value-of select="text()" />GDGameLayerList.size()) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "TWB - Hack to keep from creating again before last time: <xsl:value-of select="text()" />"));
                                return;
                            }
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        
            <xsl:variable name="create" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="$typeValue != 'Create'" >
                        <xsl:value-of select="text()" />,
                    </xsl:if>
                </xsl:for-each>
            </xsl:variable>

                <xsl:call-template name="objectGDObjectAtIndex" >
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                </xsl:call-template>

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />

                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                    //UnPauseTimer
                    nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarScene'" >
                    //ModVarScene
                    <xsl:for-each select="parameters" >
                        <xsl:if test="contains(text(), 'angle')" >
                    //Update angle with rotation
                        </xsl:if>
                    </xsl:for-each>       
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    
                    <xsl:variable name="player" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), 'player')" >player</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="contains($player, 'player')" >
                    //Hack player player logging
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    </xsl:if>
                    
                    <xsl:for-each select="parameters" >
                        <xsl:value-of select="text()" />
                        <xsl:if test="text() = '+'" >=</xsl:if>
                        <xsl:if test="text() = '-'" >=</xsl:if>
                        <xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'TextObject::ChangeColor'" >
                    //TextObject::ChangeColor
                    nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

            </xsl:for-each>

                        //repeatExpression <xsl:value-of select="repeatExpression" />
                        final int size = <xsl:if test="not(repeatExpression)" >1</xsl:if><xsl:if test="repeatExpression" ><xsl:value-of select="repeatExpression" /></xsl:if>;

                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />

                    <xsl:if test="$typeValue = 'Create'" >
                        <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                //<xsl:value-of select="$caller" /> - eventsCreateAssignGDObject - caller
                if(<xsl:value-of select="text()" />List.objectArray == arrayUtil.ZERO_OBJECT_ARRAY) {
                    <xsl:value-of select="text()" />List.ensureCapacity(size);
                }
                            </xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>

                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="quote" >"</xsl:variable>
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>

                <xsl:if test="$typeValue = 'Create'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        //Create
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        final GDObject <xsl:value-of select="$name" />2 = new <xsl:value-of select="$name" />(
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() != 2" >
                            <xsl:if test="position() != last()" >
                                <xsl:if test="string-length(text()) = 0" >
                                    null
                                </xsl:if>
                                <xsl:if test="string-length(text()) > 0" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>,
                            </xsl:if>
                            <xsl:if test="position() = last()" >
                                <xsl:if test="string-length(text()) = 0" >
                                    <xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>
                                </xsl:if>
                                <xsl:if test="string-length(text()) > 0" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>);
                    
                    <xsl:if test="$name = 'player_bullet'" >
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, new StringBuilder().append(<xsl:value-of select="$name" />2.name)<xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:if test="position() != last()" ><xsl:if test="string-length(text()) > 0" >.append("<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" >'</xsl:with-param></xsl:call-template>: ").append(<xsl:value-of select="text()" />)</xsl:if></xsl:if><xsl:if test="position() = last()" ><xsl:if test="string-length(text()) = 0" >.toString()</xsl:if><xsl:if test="string-length(text()) > 0" >.append("<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" >'</xsl:with-param></xsl:call-template>: ").append(<xsl:value-of select="text()" />).toString()</xsl:if></xsl:if></xsl:if></xsl:for-each>));
                    final int size2 = player_bulletGDGameLayerList.size();
                    for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, new StringBuilder().append(index2).append(": ").append(player_bulletGDGameLayerList.get(index2)).toString()));
                    }                    
                    </xsl:if>
                    
                    <xsl:value-of select="$name" />List.add(<xsl:value-of select="$name" />2);

                    <xsl:variable name="spriteName" >Sprite:<xsl:value-of select="$name" /></xsl:variable>
                    <xsl:if test="contains($objectsAsString, $spriteName)" >
                    //We may need to set a dimension for each image/animation.
                    <xsl:value-of select="$name" />2.width = <xsl:value-of select="$name" />ImageArray[0].getWidth();
                    <xsl:value-of select="$name" />2.height = <xsl:value-of select="$name" />ImageArray[0].getHeight();
                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$name" />2.toString()));
                    </xsl:if>

                </xsl:if>

                <xsl:if test="$typeValue = 'SetAngle'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    //SetAngle
                    <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                    GDGameLayer gameLayerAtIndex = null;
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                    if(<xsl:value-of select="text()" />GDGameLayerList != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> <xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                        gameLayerAtIndex = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                    }
                        </xsl:if>
                    </xsl:for-each>

                    //Hack method 1st param or list
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) <xsl:value-of select="text()" />List.get(index)).setAngle(</xsl:if><xsl:if test="position() = 2" > (short)</xsl:if><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >((GDGameLayer) <xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>GDGameLayerList.get(0)).<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >, gameLayerAtIndex);</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    //ChangePlan
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) <xsl:value-of select="text()" />List.get(index)).zOrder</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeAnimation'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    //ChangeAnimation
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) <xsl:value-of select="text()" />List.get(index)).animation</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarGlobal'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    //ModVarGlobal not implemented
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarObjet'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:text>&#10;</xsl:text>
                    //ModVarObjet - <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) <xsl:value-of select="text()" />List.get(index)).</xsl:if><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = 3" ><xsl:value-of select="text()" /><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if></xsl:if><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >((GDObject) <xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>List.get(index)).<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'Delete'" >
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    //Delete
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$name" />GDGameLayer, <xsl:value-of select="$name" />);
                </xsl:if>

                <xsl:if test="$typeValue = 'AddForceAL'" >
                        //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    //AddForceAL
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$name" />GDGameLayer, <xsl:value-of select="$name" />);
                </xsl:if>

            </xsl:for-each>

            <xsl:variable name="firstAction" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="$typeValue = 'SetAngle' or $typeValue = 'ChangePlan' or $typeValue = 'ChangeAnimation' or $typeValue = 'ModVarObjet'" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                <xsl:value-of select="text()" />,</xsl:if>
                        </xsl:for-each>
                    </xsl:if>
                </xsl:for-each>
            </xsl:variable>

            <xsl:if test="string-length($firstAction) and string-length($create) = 0" >
                <xsl:value-of select="substring-before($firstAction, ',')" />GDGameLayer.updateGDObject(timeDelta);
                <xsl:text>&#10;</xsl:text>
            </xsl:if>

                    }

                    } catch(Exception e) {
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().START, e));
                    }

                }

    </xsl:template>

    <xsl:template name="eventsCreateAssignGDObject" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />

        //<xsl:value-of select="$caller" /> - eventsCreateAssignGDObject - START
        <xsl:for-each select="events" >
            <xsl:variable name="eventPosition" select="position()" />
            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
            <xsl:for-each select="comment" >
                //Comment: <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="comment2" >
                <xsl:if test="string-length(text()) > 0" >
                    //Comment 2: <xsl:value-of select="text()" />
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="infiniteLoopWarning" >
                //infiniteLoopWarning <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="iterableVariableName" >
                //iterableVariableName: <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="valueIteratorVariableName" >
                //valueIteratorVariableName: <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="name" >
                //name <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="source" >
                <xsl:if test="string-length(text()) > 0" >
                    //source <xsl:value-of select="text()" />
                </xsl:if>
            </xsl:for-each>
            <xsl:for-each select="colorR" >
                //colorR <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="colorG" >
                //colorG <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="colorB" >
                //colorB <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:for-each select="target" >
                //target <xsl:value-of select="text()" />
            </xsl:for-each>
            <xsl:variable name="actionWithUsedType" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="$typeValue = 'Delete' or $typeValue = 'UnPauseTimer' or $typeValue = 'MettreX' or $typeValue = 'MettreY'  or $typeValue = 'MettreXY' or $typeValue = 'SetAngle' or $typeValue = 'ChangePlan' or $typeValue = 'ChangeAnimation' or $typeValue = 'ModVarObjet' or $typeValue = 'TextObject::ChangeColor' or $typeValue = 'ModVarGlobal' or $typeValue = 'ModVarScene' or $typeValue = 'AddForceAL'" >found</xsl:if>
                </xsl:for-each>
            </xsl:variable>
            <xsl:variable name="actionWithUsedTypeRecursion" >
                <xsl:call-template name="actionWithUsedTypeRecursion" ></xsl:call-template>
            </xsl:variable>
            <xsl:variable name="conditionsWithUsedTypeRecursion" >
                <xsl:call-template name="conditionsWithUsedTypeRecursion" ></xsl:call-template>
            </xsl:variable>

            <xsl:variable name="hasAssociatedSiblingCondition" select="conditions/type/value = 'MouseButtonReleased' or conditions/type/value = 'VarScene' or conditions/type/value = 'Timer'" />
            <xsl:variable name="parametersAsString" ><xsl:for-each select="actions" ><xsl:for-each select="parameters" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />:<xsl:value-of select="text()" />,</xsl:for-each></xsl:for-each></xsl:variable>

            <xsl:variable name="actionAsStringsStrings" >
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="quote" >"</xsl:variable>
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Used - <xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
            </xsl:variable>

            <xsl:variable name="thisNodeArray" >
                <xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" >nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />]</xsl:if></xsl:for-each>
            </xsl:variable>

            <xsl:variable name="actionsWithIndexes" >                
                <xsl:call-template name="actionsWithIndexes" >
                    <xsl:with-param name="thisNodeArray" >
                        <xsl:value-of select="$thisNodeArray" />
                    </xsl:with-param>                    
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="eventsCreateProcessUsed" >
                <xsl:call-template name="eventsCreateProcessUsed" >
                    <xsl:with-param name="caller" >
                        <xsl:value-of select="$caller" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                </xsl:call-template>
            </xsl:variable>

            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'Timer'" >
                    if(this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                    <xsl:variable name="quote" >"</xsl:variable>
                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        <xsl:value-of select="$actionAsStringsStrings" disable-output-escaping="yes" />

                            <!--
                        public void process() {
                            if(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().getStartTime())) {
                            <xsl:for-each select="../actions" >
                                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                            <xsl:text>&#10;</xsl:text>
                                nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:for-each>
                            -->
                            
                <xsl:for-each select="../../events" >

                <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                        final GDGameLayerFactory <xsl:value-of select="text()" />GDGameLayerFactory = GD1SpecialAnimation.this.<xsl:value-of select="text()" />GDGameLayerFactory;
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
                </xsl:for-each>
                
                </xsl:for-each>

                        //Timer
                        private final Runnable runnable = new Runnable() {
                        
                            public void run() {
                                try {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    if(<xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:if></xsl:for-each>TimeDelayHelper.isTime(GameTickTimeDelayHelperFactory.getInstance().getStartTime())) {
                                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                        <xsl:value-of select="$actionsWithIndexes" disable-output-escaping="yes" />
                                    }
                
                                } catch(Exception e) {
                                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().EXCEPTION, e));
                                }
                            }
                        };
                        
                        public void process() {
                            //if(!gdRunnableList.contains(this.runnable)) {
                                gdRunnableList.add(this.runnable);
                            //} else {
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "", new Exception()));
                            //}
                        }

                        public void processReleased() {
                            //if(gdRunnableList.contains(this.runnable)) {
                                gdRunnableList.remove(this.runnable);
                            //} else {
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, "", new Exception()));
                            //}
                        }

                        <xsl:value-of select="$eventsCreateProcessUsed" disable-output-escaping="yes" />

                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'PosX'" >
                    if(this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>";
                        private final String ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Else: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        public void process() {
                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final int size = <xsl:value-of select="$gdObjectName" />List.size();
                            //GDObject <xsl:value-of select="$gdObjectName" />;
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                GDObject <xsl:value-of select="$gdObjectName" /><xsl:text> = (GDObject) </xsl:text><xsl:value-of select="$gdObjectName" />List.get(index);
                                //PosX
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:for-each select="parameters" ><xsl:if test="position() = 3" > + </xsl:if><xsl:if test="position() != 2" >"<xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >.x</xsl:if><xsl:if test="position() != 2" >" + </xsl:if><xsl:if test="position() != 2" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >.x</xsl:if></xsl:for-each>));
                                if(<xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="position() = 1" >.x</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="actionIdsGDObjectPos" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" />List</xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" ><xsl:value-of select="$gdObjectName" />GDGameLayerList</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                } //else {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                //}
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index).toString()));
                            }

                        }

                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    if(this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>";
                        private final String ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Else: " + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                        public void process() {

                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final int size = <xsl:value-of select="$gdObjectName" />List.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                                GDObject <xsl:value-of select="$gdObjectName" /><xsl:text> = (GDObject) </xsl:text><xsl:value-of select="$gdObjectName" />List.get(index);
                                //PosY
                                if(<xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="position() = 1" >.y</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="actionIdsGDObjectPos" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" />List</xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" ><xsl:value-of select="$gdObjectName" />GDGameLayerList</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                } //else {
                                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ELSE_CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                //}
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index).toString()));
                            }

                        }

                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    if(this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                        public void process() {

                            if(<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(gdGroupHelper.get(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:with-param></xsl:call-template>))</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {

                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, "<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(gdGroupHelper.get(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:with-param></xsl:call-template>))</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>"));
                                //NbObjet
                                <xsl:for-each select=".." >
                                    <xsl:call-template name="actionIds" >
                                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                        <xsl:with-param name="caller" >NbObjet</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            } else {
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, "Else: <xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(gdGroupHelper.get(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:with-param></xsl:call-template>))</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>"));
                            }

                        }

                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    if(this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                        public void process() {

                            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, "<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(gdGroupHelper.get(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:with-param></xsl:call-template>))</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>"));

                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final int size = <xsl:value-of select="$gdObjectName" />List.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            
                                //VarObjet
                                if(this.process((GDObject) <xsl:value-of select="$gdObjectName" />List.get(index))) {
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="actionIdsGDObject" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" />List</xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" ><xsl:value-of select="$gdObjectName" />GDGameLayerList</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                }
                            }
                        }

                        public boolean process(final GDObject <xsl:value-of select="$gdObjectName" />) {
                            //VarObjet
                            if(<xsl:for-each select="parameters" ><xsl:if test="text() = 'rotation'" >.</xsl:if><xsl:if test="position() != 1 and  text() != 'rotation'" ><xsl:text> </xsl:text></xsl:if><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="text() = '='" >=</xsl:if></xsl:for-each>) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().START, this, "VarObjet processing"));
                                return true;
                            }
                            return false;
                        }
                    };
                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    if(this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                        public void process() {

                            //VarScene
                            if(<xsl:for-each select="parameters" ><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>) {
                                <xsl:for-each select=".." >
                                    <xsl:call-template name="actionIds" >
                                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                        <xsl:with-param name="caller" >VarScene</xsl:with-param>
                                    </xsl:call-template>
                                </xsl:for-each>
                            }

                        }

                    };
                </xsl:if>                
                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                    if(this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {
                                    
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>";

                        //SourisSurObjet
                        public void process(final MotionGestureEvent motionGestureEvent) {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 1" >
                            if(<xsl:value-of select="text()" />Rectangle != null) {
                            
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="text()" />Rectangle - Not Null"));
                                final GPoint point = motionGestureEvent.getCurrentPoint();
                                final GPoint rectangePoint = <xsl:value-of select="text()" />Rectangle.getPoint();
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="text()" />Rectangle - motionGestureEvent: " + motionGestureEvent.toString()));
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="text()" />Rectangle: " + <xsl:value-of select="text()" />Rectangle.toString()));
                                if (RectangleCollisionUtil.isInside(rectangePoint.getX(), rectangePoint.getY(), <xsl:value-of select="text()" />Rectangle.getMaxX(), <xsl:value-of select="text()" />Rectangle.getMaxY(),
                                    point.getX(), point.getY()))
                                {
                                    LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "Inside"));
                                    final MotionGestureInput motionGestureInput = motionGestureEvent.getMotionGesture();
                                    if (motionGestureInput == TouchMotionGestureFactory.getInstance().PRESSED) {
                                        <xsl:for-each select="../../actions" >
                                        nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                        </xsl:for-each> 
                                        <xsl:for-each select="../../events" >
                                        nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                        </xsl:for-each> 
                                    } else {
                                        <xsl:for-each select="../../actions" >
                                        nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                                        </xsl:for-each>    
                                        <xsl:for-each select="../../events" >
                                        nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                                        </xsl:for-each> 
                                    }
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="text()" />Rectangle - Null"));
                            }
                                    </xsl:if>
                                </xsl:for-each>
                        }                                
                    };
                </xsl:if>
                
            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                <xsl:variable name="typeValue" select="type/value" />

                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>

                    //Action - process - for Condition totalRecursions=<xsl:value-of select="$totalRecursions" /> eventPosition=<xsl:value-of select="$eventPosition" /> conditionEventPosition=<xsl:value-of select="$conditionEventPosition" /> hasAssociatedSiblingCondition=<xsl:value-of select="$hasAssociatedSiblingCondition" />
                    if(this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                    <xsl:variable name="quote" >"</xsl:variable>
                    <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                    <xsl:text>&#10;</xsl:text>
                    
                <xsl:if test="contains($actionWithUsedType, 'found')" >
                <xsl:if test="$typeValue = 'Create'" >
                    //Create
                    public boolean process(final BasicArrayList gameLayerList, final int index) throws Exception {

                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            final StringBuilder stringBuilder = new StringBuilder();
                            final GDObject <xsl:value-of select="text()" /> = (GDObject) <xsl:value-of select="text()" />List.get(index);
                            stringBuilder.delete(0, stringBuilder.length());
                            final GDGameLayer <xsl:value-of select="text()" />GDGameLayer = <xsl:value-of select="text()" />GDGameLayerFactory.create(stringBuilder.append(<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>).append(CommonSeps.getInstance().UNDERSCORE).append(index).toString(), <xsl:value-of select="text()" />, <xsl:value-of select="text()" />GDConditionCollidableBehavior);
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$nodeId" /> for <xsl:value-of select="text()" />GDGameLayerList.add(<xsl:value-of select="text()" />GDGameLayer); at: " + index));
                            <xsl:value-of select="text()" />GDGameLayerList.add(<xsl:value-of select="text()" />GDGameLayer);
                        </xsl:if>
                    </xsl:for-each>
                        return false;
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'SetAngle'" >
                    //SetAngle
                    public boolean process(final BasicArrayList gameLayerList, final int index) throws Exception {

                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>

                    <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                    //Hack method 1st param or list
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) <xsl:value-of select="text()" />List.get(index)).setAngle(</xsl:if><xsl:if test="position() = 2" > (short)</xsl:if><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >((GDGameLayer) <xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>GDGameLayerList.get(0)).<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >, (GDGameLayer) <xsl:value-of select="$gameLayerName" />GDGameLayerList.get(index));</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                         return true;
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                    //ChangePlan
                    public boolean process(final BasicArrayList gameLayerList, final int index) throws Exception {
                        
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) <xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >((GDObject) <xsl:value-of select="text()" />List.get(index)).zOrder</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>
                    <xsl:text>&#10;</xsl:text>
                        return true;
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'Create'" >
                    //Create End
                    public void processEnd(final BasicArrayList gameLayerList, final int index) throws Exception {

                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().INSERT));
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:variable name="layerName" ><xsl:value-of select="text()" /></xsl:variable>
                            <xsl:variable name="gameLayer" ><xsl:value-of select="text()" />GDGameLayer</xsl:variable>

                            final GDGameLayer <xsl:value-of select="$gameLayer" /> = (GDGameLayer) <xsl:value-of select="$gameLayer" />List.get(index);
                            
                            if(<xsl:value-of select="$gameLayer" /> != null) {
                                <xsl:value-of select="$gameLayer" />.updateGDObject(timeDelta);
                                
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
                                                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$nodeId" /> for <xsl:value-of select="$groupName" />GDGameLayerList.add(<xsl:value-of select="$gameLayer" />); at: " + index));
                                                        <xsl:value-of select="$groupName" />GDGameLayerList.add(<xsl:value-of select="$gameLayer" />);
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:for-each>

                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                                //objectsGroupsGDGameLayer - END

                            }
                        </xsl:if>
                    </xsl:for-each>
                    }
                </xsl:if>
                </xsl:if>

                                <xsl:if test="$typeValue = 'Scene'" >

                        //Scene
                        public void process() {
                            <xsl:if test="$typeValue = 'Scene'" >
                            <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 2" >
                            //<xsl:value-of select="translate(text(), '\&quot;', '')" />
                            final String TEXT = <xsl:value-of select="text()" />;
                            </xsl:if>
                            </xsl:for-each>
                            </xsl:if>

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                ((GDGameMIDlet) MIDletBridge.getCurrentMIDlet()).setGDLayout(TEXT);

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }

                                </xsl:if>

                                <xsl:if test="$typeValue != 'Scene' and $typeValue != 'MettreX' and $typeValue != 'MettreY' and $typeValue != 'SceneBackground' and $typeValue != 'Rotate'" >

                                </xsl:if>

                                <xsl:if test="$typeValue = 'MettreX'" >

                        //MettreX
                        /*
                        public void process() {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                            <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                            GDGameLayer gameLayer;
                            final int size = <xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                gameLayer = (GDGameLayer) <xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);
                                this.process((GDObject) <xsl:value-of select="$gdObjectName" />List.get(index));
                                gameLayer.updateGDObject(timeDelta);
                            }
                        }
                        */

                        public boolean process(final GDObject gdObject) {
                            this.processG(gdObject, graphics);
                            return true;
                        }

                        public void processG(final GDObject gdObject, final Graphics graphics) {

                            try {

                                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$name" />.toString()));

                                <xsl:for-each select="parameters" >
                                <xsl:value-of select="text()" /><xsl:if test="position() = 1" >.x</xsl:if>
                                </xsl:for-each>;

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                <xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    PointFactory.getInstance().getInstance(<xsl:value-of select="$name" />.x, <xsl:value-of select="$name" />.y),
                                    <xsl:value-of select="$name" />.Width(graphics), <xsl:value-of select="$name" />.Height(graphics));
                                </xsl:if>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>
                                <xsl:if test="$typeValue = 'MettreY'" >

                        //MettreY
                        public boolean process(final GDObject gdObject) {
                            this.processG(gdObject, graphics);
                            return true;
                        }

                        public void processG(final GDObject gdObject, final Graphics graphics) {


                            try {

                                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$name" />.toString()));

                                <xsl:for-each select="parameters" >
                                <xsl:value-of select="text()" /><xsl:if test="position() = 1" >.y</xsl:if>
                                </xsl:for-each>;

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                <xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    PointFactory.getInstance().getInstance(<xsl:value-of select="$name" />2.x, <xsl:value-of select="$name" />2.y),
                                    <xsl:value-of select="$name" />2.Width(graphics), <xsl:value-of select="$name" />2.Height(graphics));
                                </xsl:if>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>
                                <xsl:if test="$typeValue = 'MettreXY'" >

                        //MettreXY
                        public boolean process(final GDObject gdObject) {
                            this.processG(gdObject, graphics);
                            return true;
                        }

                        public void processG(final GDObject gdObject, final Graphics graphics) {


                            try {

                                <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                final GDObject <xsl:value-of select="$name" /> = gdObject;
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, <xsl:value-of select="$name" />.toString()));

                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.x</xsl:if><xsl:if test="position() = 2 or position() = 3" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;<xsl:text>&#10;</xsl:text></xsl:if>
                                </xsl:for-each>
                                <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.y</xsl:if><xsl:if test="position() > 3" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                                </xsl:for-each>

                                <xsl:variable name="name2" >touch:<xsl:value-of select="$name" />,</xsl:variable>
                                <xsl:if test="contains($instancesAsString, $name2)" >
                                //name2=<xsl:value-of select="$name2" /><xsl:text>&#10;</xsl:text>
                                <xsl:value-of select="$name" />Rectangle = new Rectangle(
                                    PointFactory.getInstance().getInstance(<xsl:value-of select="$name" />2.x, <xsl:value-of select="$name" />2.y),
                                    <xsl:value-of select="$name" />2.Width(graphics), <xsl:value-of select="$name" />2.Height(graphics));
                                </xsl:if>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'UnPauseTimer'" >

                        //UnPauseTimer
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 2" ><xsl:value-of select="translate(text(), '&quot;', '')" />TimeDelayHelper.unPause();</xsl:if>
                                    </xsl:for-each>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'SetAngle'" >
                        //SetAngle
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                    <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                final int size = <xsl:value-of select="$gameLayerName" />List.size();
                    <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //Hack method 1st param or list
                                    ((GDObject) <xsl:value-of select="text()" />List.get(index)).setAngle(</xsl:if><xsl:if test="position() = 2" > (short)</xsl:if><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') = ''" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="substring-before(text(), '.') != ''" >((GDGameLayer) <xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template>GDGameLayerList.get(0)).<xsl:value-of select="substring-after(text(), '.')" /></xsl:if></xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >, (GDGameLayer) <xsl:value-of select="$gameLayerName" />GDGameLayerList.get(index));<xsl:text>&#10;</xsl:text>
                                }
                            </xsl:if>
                    </xsl:for-each>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'ChangePlan'" >

                    //ChangePlan
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                    <xsl:for-each select="parameters" >
                        //<xsl:if test="position() = 1" >((GDObject) <xsl:value-of select="text()" />List.get(index)).zOrder</xsl:if><xsl:if test="position() != 1" ><xsl:value-of select="text()" /></xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }
                                </xsl:if>

                                <xsl:if test="$typeValue = 'ModVarScene'" >

                    //ModVarScene
                    <xsl:for-each select="parameters" >
                        <xsl:if test="contains(text(), 'angle')" >
                        //Update angle with rotation
                        </xsl:if>
                    </xsl:for-each>                    
                        public void process() {

                            try {

                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    <xsl:variable name="player" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), 'player')" >player</xsl:if></xsl:for-each></xsl:variable>
                    <xsl:if test="contains($player, 'player')" >
                    //Hack player player logging
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    </xsl:if>

                    <xsl:for-each select="parameters" >
                        <xsl:if test="contains(text(), 'player.')" >
                                //Hack FIX ME for GDevelop player
                                final GDObject player = (GDObject) playerList.get(0);
                                final GDGameLayer playerGDGameLayer = ((GDGameLayer) playerGDGameLayerList.get(0));
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="text() = 'player_life'" >
                                //Hack GDevelop - Remark out player_life<xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                    <xsl:for-each select="parameters" >
                            <xsl:if test="text() = 'player_life'" >//</xsl:if><xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" >Angle()</xsl:with-param><xsl:with-param name="replacementText" >Angle(playerGDGameLayer)</xsl:with-param></xsl:call-template><xsl:if test="text() = '+'" >=</xsl:if><xsl:if test="text() = '-'" >=</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                    </xsl:for-each>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }

                                </xsl:if>

                                <xsl:if test="$typeValue = 'TextObject::ChangeColor'" >

                        //TextObject::ChangeColor
                        public void process() {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            <xsl:value-of select="text()" />TextAnimation.setBasicColor(new BasicColor(255, </xsl:if>
                                        <xsl:if test="position() = 2" >
                                            <xsl:value-of select="translate(substring(text(), 2, string-length(text()) - 2), ';', ',')" />
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >, "<xsl:value-of select="$typeValue" />"));</xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }

                                </xsl:if>

                                <xsl:if test="$typeValue = 'Delete'" >

                                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        //Delete
                        public void processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer) {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 1" >
                                            //<xsl:value-of select="text()" /><xsl:text>&#10;</xsl:text>
                                            
                                            <xsl:value-of select="text()" />List.remove(<xsl:value-of select="text()" />GDGameLayer.gdObject);
                                            <xsl:value-of select="text()" />GDGameLayerList.remove(<xsl:value-of select="text()" />GDGameLayer);
                                            allBinaryGameLayerManager.remove(<xsl:value-of select="text()" />GDGameLayer);
                                        </xsl:if>
                                    </xsl:for-each>
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }

                                </xsl:if>

                                <xsl:if test="$typeValue = 'AddForceAL'" >

                                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //AddForceAL
                    public void process() {

                    try {
            <xsl:if test="../actions" >
                        //if(<xsl:value-of select="$name" />GDGameLayerList != null) {
                        if(<xsl:value-of select="$name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                        final int size = <xsl:value-of select="$name" />GDGameLayerList.size();

                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {

                            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().INDEX_LABEL + index));
            </xsl:if>
                <xsl:call-template name="gameLayerList" >
                    <xsl:with-param name="name" >
                        <xsl:value-of select="$name"/>
                    </xsl:with-param>
                </xsl:call-template>

                            this.processGD(<xsl:value-of select="$name" />GDGameLayer, <xsl:value-of select="$name" />);

            <xsl:if test="../actions" >
                        }
                        } else {
                            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$name" />GDGameLayerList was null"));
                        }                
            </xsl:if>

                    } catch(Exception e) {
                        LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().EXCEPTION, this, CommonStrings.getInstance().PROCESS, e));
                    }

                    }

                        public void processGD(final GDGameLayer <xsl:value-of select="$name" />GDGameLayer, final GDObject <xsl:value-of select="$name" />) {

                            try {

                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

                                    //name=<xsl:value-of select="$name" />
                                    <xsl:text>&#10;</xsl:text>
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
                                                <xsl:call-template name="string-replace-all" >
                                                    <xsl:with-param name="text" >
                                                        <xsl:value-of select="$paramText" />
                                                    </xsl:with-param>
                                                    <xsl:with-param name="find" >Variable(<xsl:value-of select="$key" />)</xsl:with-param>
                                                    <xsl:with-param name="replacementText" >Variable(<xsl:value-of select="$name" />.<xsl:value-of select="$key" />)</xsl:with-param>
                                                </xsl:call-template>
                                            </xsl:if>
                                            <xsl:if test="string-length($key) = 0" >
                                                <xsl:value-of select="$paramText" />
                                            </xsl:if>,<xsl:text> </xsl:text>
                                        </xsl:if>
                                        <xsl:if test="position() = last()" >
                                            <xsl:value-of select="text()" />);
                                        </xsl:if>
                                    </xsl:for-each>
                                    
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
                                    <xsl:value-of select="$name" />GDGameLayer.updateGDObject(timeDelta);
                                    <xsl:text>&#10;</xsl:text>

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CommonStrings.getInstance().EXCEPTION, e));
                            }

                        }

                                </xsl:if>

                                <xsl:if test="$typeValue = 'Rotate'" >

                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        public void process() {
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

        <xsl:if test="../conditions" >
            //Sibling Conditions
            boolean siblingConditions = true;
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'Timer'" >
                    //Timer
                    if(!nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    //NbObjet
                    if(!nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    //VarScene
                    if(!nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
        </xsl:if>

                        //if(<xsl:value-of select="$gdObjectName" />GDGameLayerList != null) {
                        if(<xsl:value-of select="$gdObjectName" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            GDGameLayer gameLayer;
                            final int size = <xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                gameLayer = (GDGameLayer) <xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);

        <xsl:if test="../conditions" >
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'PosX'" >
                    //PosX
                    if(!nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(gameLayer.gdObject)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    //PosY
                    if(!nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(gameLayer.gdObject)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    //VarObjet
                    if(!nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(gameLayer.gdObject)) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
                if(siblingConditions) {
                    this.process((GDObject) <xsl:value-of select="$gdObjectName" />List.get(index));
                }
        </xsl:if>

        <xsl:if test="not(../conditions)" >
                                this.process((GDObject) <xsl:value-of select="$gdObjectName" />List.get(index));
        </xsl:if>
                                gameLayer.updateGDObject(timeDelta);
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$gdObjectName" />GDGameLayerList was null"));
                            }
                        }

                        public void processReleased() {
                            LogUtil.put(LogFactory.getInstance(PROCESS_RELEASE, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));

        <xsl:if test="../conditions" >
            //Sibling Conditions
            boolean siblingConditions = true;
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'Timer'" >
                    //Timer
                    if(!nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'NbObjet'" >
                    //NbObjet
                    if(!nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarScene'" >
                    //VarScene
                    if(!nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
        </xsl:if>

                        //if(<xsl:value-of select="$gdObjectName" />GDGameLayerList != null) {
                        if(<xsl:value-of select="$gdObjectName" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            GDGameLayer gameLayer;
                            final int size = <xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                gameLayer = (GDGameLayer) <xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index);

        <xsl:if test="../conditions" >
            <xsl:for-each select="../conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'PosX'" >
                    //PosX
                    if(!nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(gameLayer.gdObject)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'PosY'" >
                    //PosY
                    if(!nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(gameLayer.gdObject)) {
                        siblingConditions = false;
                    }
                </xsl:if>
                <xsl:if test="$typeValue = 'VarObjet'" >
                    //VarObjet
                    if(!nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(gameLayer.gdObject)) {
                        siblingConditions = false;
                    }
                </xsl:if>
            </xsl:for-each>
                if(siblingConditions) {
                    this.processReleased((GDObject) <xsl:value-of select="$gdObjectName" />List.get(index));
                }
        </xsl:if>

        <xsl:if test="not(../conditions)" >
                                this.processReleased((GDObject) <xsl:value-of select="$gdObjectName" />List.get(index));
        </xsl:if>
                                gameLayer.updateGDObject(timeDelta);
                                }
                            } else {
                                //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, "<xsl:value-of select="$gdObjectName" />GDGameLayerList was null"));
                            }
                        }

                        //Rotate
                        public boolean process(final GDObject <xsl:value-of select="$name" />) {
                        <xsl:if test="$name = 'player'" >
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        </xsl:if>
                            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                            <xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.rotation = <xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                            //<xsl:for-each select="parameters" ><xsl:value-of select="text()" /><xsl:if test="position() = 1" >.angle += <xsl:text> </xsl:text></xsl:if><xsl:if test="position() = last()" >;</xsl:if></xsl:for-each>
                            return true;
                        }

                        public boolean processReleased(final GDObject <xsl:value-of select="$name" />) {
                        <xsl:if test="$name = 'player'" >
                            LogUtil.put(LogFactory.getInstance(PROCESS_RELEASE, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                        </xsl:if>
                            //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                            <xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />.rotation = 0;</xsl:if></xsl:for-each>
                            return true;
                        }
                                </xsl:if>

                            <xsl:for-each select="../conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>";
                                </xsl:if>
                            </xsl:for-each>

                            <xsl:for-each select="../events" >
                                <xsl:variable name="typeValue" select="type/value" />
                        //private final String EVENTS_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Events nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>";
                            </xsl:for-each>

                        <!--
                        ../events
                        -->
                        <xsl:variable name="childEventWithUsedEvent" ><xsl:for-each select="../events" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($childEventWithUsedEvent, 'found')" >
                        //SourisSurObjet
                        public void process(final MotionGestureEvent motionGestureEvent) {
                        
                            //Conditions - START
                            <xsl:for-each select="../conditions" >
                                <xsl:variable name="typeValue" select="type/value" />
                                <xsl:if test="$typeValue = 'SourisSurObjet'" >
                            //SourisSurObjet
                            LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                            nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                                </xsl:if>
                            </xsl:for-each>
                            //Conditions - END
                        
                        }
                        </xsl:if>

                    };
            </xsl:for-each>

            <xsl:if test="contains($actionWithUsedType, 'found')" >
            //Event - Actions - process - used
            if(this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
            }
            this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {
                        
            <xsl:variable name="foundConditions" >
                <xsl:for-each select="conditions" >
                    <xsl:if test="type/value = 'Timer'" >found</xsl:if>
                </xsl:for-each>
            </xsl:variable>

            <xsl:if test="not(contains($foundConditions, 'found'))" >
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="quote" >"</xsl:variable>
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Used - <xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                <xsl:text>&#10;</xsl:text>
            </xsl:for-each>
            </xsl:if>

                <xsl:if test="not(contains($foundConditions, 'found'))" >
                //No used conditions so calling actions from event directly.
                <xsl:call-template name="actionsWithIndexesProcess" >
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                </xsl:call-template>

                <xsl:call-template name="eventsCreateProcessUsed" >
                    <xsl:with-param name="caller" >
                        <xsl:value-of select="$caller" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                </xsl:call-template>
                </xsl:if>
                
                <xsl:if test="contains($foundConditions, 'found')" >
                //Found used conditions so calling them before actions.
                public void process() {
                    <xsl:for-each select="conditions" >
                    nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:for-each>
                }
                
                public void processReleased() {
                    <xsl:for-each select="conditions" >
                    nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processReleased();
                    </xsl:for-each>
                }
                
                </xsl:if>
            };
            </xsl:if>

            <xsl:if test="contains($actionWithUsedTypeRecursion, 'found') and contains($conditionsWithUsedTypeRecursion, 'found') and not(contains($actionWithUsedType, 'found'))" >

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
            //Event - With child Events that have actions - process - used
            if(this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
            }
            this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                public void process() {
                <xsl:for-each select="events" >
                    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" />
                    <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                        <!-- Event nodeId=N75237 - 9701 position=12 totalRecursions=1 type=BuiltinCommonInstructions::Standard disable=false -->
                        <!-- //childEventWithUsedEvent - START -->
                        <xsl:variable name="childEventWithUsedEvent" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:value-of select="$childEventWithUsedEvent" />
                        <!-- //childEventWithUsedEvent - END -->
                        <xsl:if test="contains($childEventWithUsedEvent, 'found')" >
                    //BuiltinCommonInstructions::Standard - Used condition in children - 1
                    nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        </xsl:if>                        
                    </xsl:if>
                    <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
                    //BuiltinCommonInstructions::ForEach
                    </xsl:if>
                </xsl:for-each>

                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                    //nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:for-each>

                <xsl:if test="actions" >
                <xsl:for-each select="actions" >
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, new Exception()));
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    //nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:for-each>

                <xsl:call-template name="actionIds" >
                    <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    <xsl:with-param name="caller" >eventsCreateAssignGDObject</xsl:with-param>
                </xsl:call-template>

                </xsl:if>
                }

                public void process(final MotionGestureEvent motionGestureEvent) {
                <xsl:for-each select="events" >
                    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" />
                    <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                        <xsl:variable name="childEventWithUsedEvent" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>
                        //<xsl:value-of select="$childEventWithUsedEvent" />
                        <xsl:if test="contains($childEventWithUsedEvent, 'found')" >
                    //BuiltinCommonInstructions::Standard - Used condition in children - 2
                    nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                        </xsl:if>                  
                    </xsl:if>
                    <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
                    //BuiltinCommonInstructions::ForEach
                    </xsl:if>
                </xsl:for-each>

                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                    //nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                </xsl:for-each>

                <xsl:if test="actions" >
                <xsl:for-each select="actions" >
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, new Exception()));
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                    //nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(motionGestureEvent);
                </xsl:for-each>

                <xsl:call-template name="actionIds" >
                    <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    <xsl:with-param name="caller" >eventsCreateAssignGDObject</xsl:with-param>
                </xsl:call-template>

                </xsl:if>
                }
                
            };
            </xsl:if>

            //and not(contains($actionWithUsedTypeRecursion, 'found') and contains($conditionsWithUsedTypeRecursion, 'found'))
            <xsl:if test="not(contains($actionWithUsedType, 'found'))and not(contains($actionWithUsedTypeRecursion, 'found') and contains($conditionsWithUsedTypeRecursion, 'found'))" >

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />
            //Event - Actions - process - skipped
            if(this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
            }
            this.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode() {

                <xsl:if test="actions" >
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:variable name="quote" >"</xsl:variable>
                    <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                    private final String ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Skipped - <xsl:value-of select="translate($actionAsString, $quote, ' ')" />";
                    <xsl:text>&#10;</xsl:text>
                </xsl:for-each>
                </xsl:if>

                public void process() {
                <xsl:for-each select="events" >
                    //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" />
                    <xsl:if test="type = 'BuiltinCommonInstructions::Standard'" >
                        <xsl:variable name="childEventWithUsedEvent" ><xsl:call-template name="childEventWithUsedEvent" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="string-length($childEventWithUsedEvent) > 0" >
                        //childEventWithUsedEvent=<xsl:value-of select="$childEventWithUsedEvent" />
                        </xsl:if>
                        <xsl:if test="contains($childEventWithUsedEvent, 'foundCreateAction')" >
                            //N78034 - 12498
                    //BuiltinCommonInstructions::Standard - Used condition in children - 3
                    //nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        </xsl:if>
                        <xsl:call-template name="childEventWithUsedEvent2" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template>
                    </xsl:if>
                    <xsl:if test="type = 'BuiltinCommonInstructions::ForEach'" >
                    //BuiltinCommonInstructions::ForEach
                    </xsl:if>
                </xsl:for-each>

                <xsl:for-each select="conditions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                </xsl:for-each>
                
                <xsl:if test="actions" >
                <xsl:for-each select="actions" >
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, new Exception()));
                    //LogUtil.put(LogFactory.getInstance(CommonStrings.getInstance().PROCESS, this, ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />));
                </xsl:for-each>

                <xsl:call-template name="actionIds" >
                    <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    <xsl:with-param name="caller" >eventsCreateAssignGDObject</xsl:with-param>
                </xsl:call-template>

                </xsl:if>
                }
            };
            </xsl:if>

            <xsl:call-template name="objectGDObjectGNodes" >
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
                </xsl:with-param>
                <xsl:with-param name="parametersAsString" >
                    <xsl:value-of select="$parametersAsString" />
                </xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="eventsCreateAssignGDObject" >
                <xsl:with-param name="caller" >
                    <xsl:value-of select="$caller" />
                </xsl:with-param>
                <xsl:with-param name="layoutIndex" >
                    <xsl:value-of select="$layoutIndex" />
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
        //<xsl:value-of select="$caller" /> - eventsCreateAssignGDObject - END

    </xsl:template>

    <xsl:template name="objectGDObjectGNodes" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />

        //objectGDObjectGNodes - layoutIndex=<xsl:value-of select="$layoutIndex" /> parametersAsString=<xsl:value-of select="$parametersAsString" />
        <xsl:for-each select="/game">
            <xsl:for-each select="layouts" >
                <xsl:variable name="index" select="position() - 1" />
                <xsl:if test="number($index) = $layoutIndex" >

                    <xsl:variable name="params" >
                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                        <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />,
                            </xsl:if>
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                        <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />,
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>
                    </xsl:variable>

                    <xsl:for-each select="objects" >
                        <xsl:variable name="typeValue" select="type" />
                        <xsl:variable name="name" ><xsl:value-of select="name" />.</xsl:variable>
                        <xsl:variable name="colonName" >:<xsl:value-of select="name" />,</xsl:variable>
                        <xsl:variable name="before" select="substring-before(substring-before($parametersAsString, $name), $colonName)" />
                        <xsl:variable name="actionNodeIdFromRelatedParams" ><xsl:call-template name="after-lastIndexOf" ><xsl:with-param name="string" select="$before" /><xsl:with-param name="char" select="','" /></xsl:call-template></xsl:variable>
                        //name=<xsl:value-of select="name" />
                        //parametersAsString=<xsl:value-of select="$parametersAsString" />
                        //before=<xsl:value-of select="$before" />
                        //actionNodeIdFromRelatedParams=<xsl:value-of select="$actionNodeIdFromRelatedParams" />
                        <xsl:variable name="beforeColon" select="substring-before($parametersAsString, ':')" />
                        <xsl:variable name="actionNodeId" ><xsl:if test="$actionNodeIdFromRelatedParams != ''" ><xsl:value-of select="$actionNodeIdFromRelatedParams" /></xsl:if><xsl:if test="$actionNodeIdFromRelatedParams = ''" ><xsl:value-of select="$beforeColon" /></xsl:if></xsl:variable>
                        //actionNodeId=<xsl:value-of select="$actionNodeId" />

                        <xsl:if test="contains($parametersAsString, $name) = text()" >
                            <xsl:if test="$typeValue = 'Sprite'" >
                        //objectGDObjectAtIndex2 - collide - Sprite - <xsl:value-of select="$name" />
                        if(this.nodeArray[<xsl:value-of select="$actionNodeId" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$actionNodeId" />");
                        }
                        this.nodeArray[<xsl:value-of select="$actionNodeId" />] = new GDNode() {

                            public void process() {
                                this.process(null, null, null, null);
                            }

                            public void processN(final GDNode gdNode, final BasicArrayList gdNodeList) {
                                this.process(null, null, gdNode, gdNodeList);
                            }

                            //objectGDObjectAtIndex2 - collide - Sprite - <xsl:value-of select="$name" />
                            public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2, final GDNode gdNode, final BasicArrayList gdNodeList) {

                        //if(<xsl:value-of select="name" />GDGameLayerList != null) {
                        if(<xsl:value-of select="name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            if(<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                final int size = <xsl:value-of select="name" />GDGameLayerList.size();
                                GDGameLayer gdGameLayer;
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //<xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />
                                    gdGameLayer = ((GDGameLayer) <xsl:value-of select="name" />GDGameLayerList.get(index));
                                    <xsl:if test="string-length($params) > 0" >
                                    /*<xsl:value-of select="$params" />*/
                                    final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                                    if(indexOfGDNode == 1) {
                                        ((GDNode) gdNodeList.get(indexOfGDNode)).process(gdGameLayer, null, gdNode, gdNodeList);
                                    } else if(indexOfGDNode == 2) {
                                        ((GDNode) gdNodeList.get(indexOfGDNode)).process(gameLayer, gdGameLayer, gdNode, gdNodeList);
                                    }
                                    </xsl:if>
                                }
                            } else {
                                final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: list size was 0";
                                LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            }
                        } else {
                            final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: was null";
                            LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                            if(indexOfGDNode == 1) {
                                ((GDNode) gdNodeList.get(indexOfGDNode)).process(null, null, gdNode, gdNodeList);
                            } else if(indexOfGDNode == 2) {
                                ((GDNode) gdNodeList.get(indexOfGDNode)).process(gameLayer, null, gdNode, gdNodeList);
                            }
                        }
                        //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />.gdObject;
                            }
                        };

                            </xsl:if>
                            <xsl:if test="$typeValue = 'TextObject::Text'" >
                        //objectGDObjectAtIndex2 - collide - TextObject::Text - <xsl:value-of select="$name" />
                        if(this.nodeArray[<xsl:value-of select="$actionNodeId" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$actionNodeId" />");
                        }
                        this.nodeArray[<xsl:value-of select="$actionNodeId" />] = new GDNode() {

                            public void process() {
                                this.process(null, null, null, null);
                            }

                            public void processN(final GDNode gdNode, final BasicArrayList gdNodeList) {
                                this.process(null, null, gdNode, gdNodeList);
                            }

                            //objectGDObjectAtIndex2 - collide - TextObject::Text - <xsl:value-of select="$name" />
                            public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2, final GDNode gdNode, final BasicArrayList gdNodeList) {

                        //if(<xsl:value-of select="name" />GDGameLayerList != null) {
                        if(<xsl:value-of select="name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                            if(<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                final int size = <xsl:value-of select="name" />GDGameLayerList.size();
                                GDGameLayer gdGameLayer;
                                for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                                    //<xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />
                                    gdGameLayer = ((GDGameLayer) <xsl:value-of select="name" />GDGameLayerList.get(index));
                                    <xsl:if test="string-length($params) > 0" >
                                    /*<xsl:value-of select="$params" />*/
                                    final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                                    if(indexOfGDNode == 1) {
                                        ((GDNode) gdNodeList.get(indexOfGDNode)).process(gdGameLayer, null, gdNode, gdNodeList);
                                    } else if(indexOfGDNode == 2) {
                                        ((GDNode) gdNodeList.get(indexOfGDNode)).process(gameLayer, gdGameLayer, gdNode, gdNodeList);
                                    }
                                    </xsl:if>
                                }
                            } else {
                                final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: list size was 0";
                                LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            }
                        } else {
                            final String <xsl:value-of select="name" /> = "<xsl:value-of select="name" /> warning: was null";
                            LogUtil.put(LogFactory.getInstance(<xsl:value-of select="name" />, this, <xsl:value-of select="name" />));
                            final int indexOfGDNode = gdNodeList.indexOf(this) + 1;
                            if(indexOfGDNode == 1) {
                                ((GDNode) gdNodeList.get(indexOfGDNode)).process(null, null, gdNode, gdNodeList);
                            } else if(indexOfGDNode == 2) {
                                ((GDNode) gdNodeList.get(indexOfGDNode + 1)).process(gameLayer, null, gdNode, gdNodeList);
                            }
                        }
                        //final GDObject <xsl:value-of select="name" /> = <xsl:value-of select="name" />GDGameLayer<xsl:value-of select="position()" />.gdObject;
                            }
                        };

                            </xsl:if>
                        </xsl:if>
                        <xsl:variable name="name2" ><xsl:value-of select="name" />,</xsl:variable>
                        <xsl:if test="contains($parametersAsString, $name2)" >
                            <xsl:if test="not(contains($parametersAsString, $name) = text()) and name = 'player'" >
                        //Hack FIX ME for GDevelop player with GDNode - <xsl:value-of select="$name" />
                        if(this.nodeArray[<xsl:value-of select="$actionNodeId" />] != null) {
                            throw new RuntimeException("<xsl:value-of select="$actionNodeId" />");
                        }
                        this.nodeArray[<xsl:value-of select="$actionNodeId" />] = new GDNode() {

                            public void process() {
                                //if(<xsl:value-of select="name" />GDGameLayerList != null) {
                                if(<xsl:value-of select="name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                                    if(<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                        this.process((CollidableCompositeLayer) <xsl:value-of select="name" />GDGameLayerList.get(0), null, null, null);
                                    }
                                }
                            }

                            public void processN(final GDNode gdNode, final BasicArrayList gdNodeList) {
                                //if(<xsl:value-of select="name" />GDGameLayerList != null) {
                                if(<xsl:value-of select="name" />GDGameLayerList.objectArray != arrayUtil.ZERO_OBJECT_ARRAY) {
                                    if(<xsl:value-of select="name" />GDGameLayerList.size() != 0) {
                                        this.process((CollidableCompositeLayer) <xsl:value-of select="name" />GDGameLayerList.get(0), null, gdNode, gdNodeList);
                                    }
                                }
                            }

                            //Hack FIX ME for GDevelop player with GDNode - <xsl:value-of select="$name" />
                            public void process(final CollidableCompositeLayer gameLayer, final CollidableCompositeLayer gameLayer2, final GDNode gdNode, final BasicArrayList gdNodeList) {
                                gdNode.process(gameLayer, gameLayer2, (CollidableCompositeLayer) null, gdNode, gdNodeList);
                            }
                        };

                            </xsl:if>
                        </xsl:if>

                    </xsl:for-each>

                </xsl:if>
            </xsl:for-each>
        </xsl:for-each>

    </xsl:template>

    <xsl:template name="paramIndexedArray" >
        <xsl:param name="createdObjectsAsString" />
        <xsl:variable name="name2" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:variable><xsl:variable name="key" >,<xsl:value-of select="$name2" />,</xsl:variable><xsl:if test="contains($createdObjectsAsString, $key)" ><xsl:value-of select="$name2" /></xsl:if>
    </xsl:template>

</xsl:stylesheet>
