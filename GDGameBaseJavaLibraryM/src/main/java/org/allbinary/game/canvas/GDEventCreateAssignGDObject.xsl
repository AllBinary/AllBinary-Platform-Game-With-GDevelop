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

    <xsl:template name="createGDObject" >
        <xsl:param name="objectsAsString" />
        <xsl:param name="nodeAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        final GDObject <xsl:value-of select="$name" />2 = gdObjectsFactory.get<xsl:value-of select="$name" />(
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() != 2" >
                            <xsl:if test="position() != last()" >
                                <xsl:if test="string-length(text()) = 0" >
                                    null
                                </xsl:if>
                                <xsl:if test="string-length(text()) > 0" >
                                    <xsl:call-template name="string-replace-all" >
                                        <xsl:with-param name="text" >
                                            <xsl:value-of select="text()" />
                                        </xsl:with-param>
                                        <xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param>
                                        <xsl:with-param name="replacementText" ></xsl:with-param>
                                    </xsl:call-template>
                                </xsl:if>,
                            </xsl:if>
                            <xsl:if test="position() = last()" >
                                <xsl:if test="string-length(text()) = 0" >
                                    globals.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>
                                </xsl:if>
                                <xsl:if test="string-length(text()) > 0" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:for-each>);

                    <xsl:if test="$name = 'player_bullet'" >
                    //stringBuilder.delete(0, stringBuilder.length());
                    //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="$nodeAsString" />").append(' ').append(<xsl:value-of select="$name" />2.name)<xsl:for-each select="parameters" ><xsl:if test="position() != 2" ><xsl:if test="position() != last()" ><xsl:if test="string-length(text()) > 0" >.append("<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" >'</xsl:with-param></xsl:call-template>: ").append(<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>)</xsl:if></xsl:if><xsl:if test="position() = last()" ><xsl:if test="string-length(text()) = 0" >.toString()</xsl:if><xsl:if test="string-length(text()) > 0" >.append("<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" >'</xsl:with-param></xsl:call-template>: ").append(<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param><xsl:with-param name="find" ><xsl:value-of select="$quote" /></xsl:with-param><xsl:with-param name="replacementText" ></xsl:with-param></xsl:call-template>).toString()</xsl:if></xsl:if></xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                    //final int size2 = globals.player_bulletGDGameLayerList.size();
                    //for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                        //stringBuilder.delete(0, stringBuilder.length());
                        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="$nodeAsString" />").append(' ').append(<xsl:value-of select="$name" />2.name).append(' ').append(index2).append('\"').append(globals.player_bulletGDGameLayerList.get(index2)).toString(), this, commonStrings.PROCESS));
                    //}
                    </xsl:if>
                    
                    <xsl:variable name="spriteName" >,Sprite:<xsl:value-of select="$name" />,</xsl:variable>
                    <xsl:if test="contains($objectsAsString, $spriteName)" >
                    //We may need to set a dimension for each image/animation.
                    <xsl:value-of select="$name" />2.canvasWidth = imageResources.<xsl:value-of select="$name" />ImageArray[0].getWidth();
                    <xsl:value-of select="$name" />2.canvasHeight = imageResources.<xsl:value-of select="$name" />ImageArray[0].getHeight();
                    <xsl:value-of select="$name" />2.width = (int) (imageResources.<xsl:value-of select="$name" />ImageArray[0].getWidth() / 1.44f);
                    <xsl:value-of select="$name" />2.height = (int) (imageResources.<xsl:value-of select="$name" />ImageArray[0].getHeight() / 1.44f);
                    <xsl:value-of select="$name" />2.halfWidth = (<xsl:value-of select="$name" />2.width / 2);
                    <xsl:value-of select="$name" />2.halfHeight = (<xsl:value-of select="$name" />2.height / 2);
                    //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="$name" />2.toString(), this, commonStrings.PROCESS));
                    </xsl:if>
                    <xsl:if test="not(contains($objectsAsString, $spriteName))" >
                        //objectsAsString=<xsl:value-of select="$objectsAsString" />
                        //LogUtil.put(LogFactory.getInstance("GDObject:<xsl:value-of select="$name" /> != <xsl:value-of select="$spriteName" />", this, commonStrings.PROCESS));
                    </xsl:if>

    </xsl:template>

    <xsl:template name="actionsWithIndexesProcess" >
        <xsl:param name="caller" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="thisNodeIndex" />
                    
        <!--
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                final GDGameLayerFactory <xsl:value-of select="text()" />GDGameLayerFactory = resources.<xsl:value-of select="text()" />GDGameLayerFactory;
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
        -->

            <xsl:variable name="logString" >EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>

                    //actionsWithIndexesProcess
                    public boolean process() throws Exception {
                        super.processStats();
                        //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'VarObjet'" >
                        //RemovedNow2
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                </xsl:if>
            </xsl:for-each>
                        
            <xsl:if test="actions" >
                
                <xsl:variable name="thisNodeArray" >this</xsl:variable>

                //actionsWithIndexesProcess - actionsWithIndexes - START
                <xsl:call-template name="actionsWithIndexes" >
                    <xsl:with-param name="caller" ><xsl:value-of select="$caller" /> - //actionsWithIndexesProcess</xsl:with-param>
                    <xsl:with-param name="thisNodeIndex" >
                        <xsl:value-of select="$thisNodeIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="thisNodeArray" >
                        <xsl:value-of select="$thisNodeArray" />
                    </xsl:with-param>                    
                    <xsl:with-param name="layoutIndex" >
                        <xsl:value-of select="$layoutIndex" />
                    </xsl:with-param>
                    <xsl:with-param name="parametersAsString" >
                        <xsl:value-of select="$parametersAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="objectsAsString" >
                        <xsl:value-of select="$objectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="createdObjectsAsString" >
                        <xsl:value-of select="$createdObjectsAsString" />
                    </xsl:with-param>
                    <xsl:with-param name="logString" >
                        <xsl:value-of select="$logString" />
                    </xsl:with-param>
                </xsl:call-template>
                //actionsWithIndexesProcess - actionsWithIndexes - END

            </xsl:if>
                        return true;
                    }
            
    </xsl:template>

    <xsl:template name="addGameLayerToList" >

                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        actionWithUpdate = true;

                        if(globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            if(!gameLayerList.contains(gameLayer)) {
                                gameLayerList.add(gameLayer);
                            }
                        }
                        </xsl:if>
                    </xsl:for-each>

    </xsl:template>

    <xsl:template name="actionsWithIndexes" >
        <xsl:param name="caller" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="thisNodeArray" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="conditionPosition" />
        <xsl:param name="logString" />
        
                    //objectGDObjectAtIndex2 - START - <xsl:value-of select="$caller" />
                    <xsl:call-template name="objectGDObjectAtIndex2" >
                        <xsl:with-param name="caller" >
                            <xsl:value-of select="$caller" />
                        </xsl:with-param>
                        <xsl:with-param name="thisNodeArray" >
                            <xsl:value-of select="$thisNodeArray" />
                        </xsl:with-param>
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="parametersAsString" >
                            <xsl:value-of select="$parametersAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="logString" >
                            <xsl:value-of select="$logString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    <!--
                <xsl:for-each select="actions" >
                    <xsl:variable name="typeValue" select="type/value" />
                    <xsl:if test="not(preceding-sibling::actions[type/value/text() = 'Create'])">
                    </xsl:if>
                </xsl:for-each>
                    -->
                    //objectGDObjectAtIndex2 - END - <xsl:value-of select="$caller" />
                    
                    try {

            <xsl:variable name="alreadyUsedParentCondition" ><xsl:for-each select="../conditions" ><xsl:if test="type/value = 'SourisSurObjet'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hadCondition" ><xsl:for-each select="conditions" >found</xsl:for-each></xsl:variable>
            <xsl:variable name="hadConditionOtherThanThis" ><xsl:for-each select="conditions" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >found</xsl:if></xsl:for-each></xsl:variable>
            <!-- position() = 1 and -->
            <xsl:variable name="alreadyUsedCondition" ><xsl:for-each select="conditions" ><xsl:if test="(type/value = 'SourisSurObjet' or type/value = 'CollisionNP' or type/value = 'MouseButtonReleased' or type/value = 'SourisBouton' or type/value = 'KeyFromTextPressed' or type/value = 'KeyFromTextReleased')" >found</xsl:if></xsl:for-each></xsl:variable>

            <xsl:variable name="hasOnceCondition" ><xsl:for-each select="conditions" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasUsedOnceCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >found</xsl:if></xsl:if></xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasUsedSoundPlayingCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'SoundPlaying'" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >found</xsl:if></xsl:if></xsl:if></xsl:for-each></xsl:variable>

            <xsl:variable name="hasNoConditionsButDoesHaveUsedAction" ><xsl:if test="not(contains($hadCondition, 'found'))" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'SetAngle' or type/value = 'ChangePlan' or type/value = 'AddForceAL' or type/value = 'ChangeAnimation' or type/value = 'ModVarObjet'" >found</xsl:if></xsl:for-each></xsl:if></xsl:variable>
            <xsl:variable name="hasCreate" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasCollisionCondition" ><xsl:for-each select="../conditions" ><xsl:if test="type/value = 'CollisionNP'" >found</xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="not(contains($alreadyUsedCondition, 'found'))" >

            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            <xsl:for-each select="conditions" >
                <xsl:if test="type/value = 'SoundPlaying'" >
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - //SoundPlaying - call - <xsl:value-of select="$thisNodeIndex" />
                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
            </xsl:for-each>
            </xsl:if>

            <xsl:if test="not(contains($alreadyUsedParentCondition, 'found'))" >

            <xsl:for-each select="conditions" >
                <!-- A sibling of BuiltinCommonInstructions::Once may not call it -->
                <xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - //BuiltinCommonInstructions::Once - call - <xsl:value-of select="$thisNodeIndex" />
                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <!--
                <xsl:if test="number($thisNodeIndex) = number(substring(generate-id(), 2) - 65536)" >
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                //Condition - call - actionsWithIndexes - this
                </xsl:if>
                -->
                <xsl:if test="($conditionPosition = '' and position() = 1) or position() = $conditionPosition + 1" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="type/value != 'DepartScene' and type/value != 'SoundPlaying' and (not(contains($caller, 'eventsCreateAssignGDObject') and type/value = 'NbObjet'))" >
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - //<xsl:value-of select="type/value" /> - call - <xsl:value-of select="$thisNodeIndex" />
                if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                </xsl:if>
                </xsl:if>
                </xsl:if>
                <xsl:if test="($conditionPosition = '' and position() = 2) or position() = $conditionPosition + 2" >
                //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - call - more ifs
                </xsl:if>
            </xsl:for-each>
            </xsl:if>

            </xsl:if>
            </xsl:if>

            <xsl:if test="contains($hasOnceCondition, 'found') and not(contains($hasUsedOnceCondition, 'found'))" >
            //hasUsedOnceCondition and not hasUsedOnceCondition
            <xsl:for-each select="actions" >
            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
            <xsl:text>&#10;</xsl:text>
            //Action - //<xsl:value-of select="type/value" /> - call
            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:for-each>        
            </xsl:if>

            <xsl:if test="contains($hadCondition, 'found') and not(contains($hadConditionOtherThanThis, 'found'))" >
                //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //hadConditionOtherThanThis <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />= <xsl:value-of select="$thisNodeIndex" />
            </xsl:if>

            //hadConditionOtherThanThis=<xsl:value-of select="$hadConditionOtherThanThis" />
            <xsl:if test="not(contains($hadConditionOtherThanThis, 'found')) or ($caller = 'conditionLayout - //eventsCreateAssignGDObject' and contains($hasCreate, 'found'))" >
            <xsl:if test="actions" >
                        
                <xsl:if test="contains($hadConditionOtherThanThis, 'found') and ($caller = 'conditionLayout - //eventsCreateAssignGDObject' and contains($hasCreate, 'found'))" >
                //Hackish - //<xsl:value-of select="$thisNodeArray" />
                </xsl:if>

                        <!--
                        //hasCreate=<xsl:value-of select="$hasCreate" /> //hasCollisionCondition=<xsl:value-of select="$hasCollisionCondition" />
                        <xsl:for-each select="conditions" >
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="actions" >
                        //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                        </xsl:for-each>
                        -->
                        
                        <xsl:if test="contains($hasCreate, 'found')" >
                            <xsl:if test="contains($hasCollisionCondition, 'found') and $caller != 'conditionLayout - //VarScene'" >
                            //Skipping actions with create since they are associated with a CollisionNP condition - <xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each>
                            </xsl:if>
                        </xsl:if>

                        //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //repeatExpression <xsl:value-of select="repeatExpression" /> //<xsl:value-of select="../../events/type" />
                        <xsl:if test="not(contains($hasCreate, 'found')) or not(contains($hasCollisionCondition, 'found')) or $caller = 'conditionLayout - //VarScene'" >

                        final int size = <xsl:if test="not(repeatExpression or ../../events/type = 'BuiltinCommonInstructions::ForEach')" >1</xsl:if><xsl:if test="../../events/type = 'BuiltinCommonInstructions::ForEach'" >globals.<xsl:value-of select="substring-before(substring-after($parametersAsString, ':'), ',')" />GDGameLayerList.size()</xsl:if><xsl:if test="repeatExpression" ><xsl:value-of select="repeatExpression" /></xsl:if>;
            
            <xsl:if test="contains($hadConditionOtherThanThis, 'found') and ($caller = 'conditionLayout - //eventsCreateAssignGDObject' and contains($hasCreate, 'found'))" >
            //Skip size limit logic
            </xsl:if>
            <xsl:if test="not(contains($hadConditionOtherThanThis, 'found'))" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            //LogUtil.put(LogFactory.getInstance("globals.<xsl:value-of select="text()" />GDGameLayerList.size() " + globals.<xsl:value-of select="text()" />GDGameLayerList.size() +  " size " + size, this, commonStrings.PROCESS));
                            if(globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> size) {
                                //LogUtil.put(LogFactory.getInstance("A: Keep from creating again before last time: <xsl:value-of select="text()" />", this, commonStrings.PROCESS));
                                //<xsl:value-of select="$caller" />
                                return <xsl:if test="contains($caller, 'actionsWithIndexesProcess') or $caller = 'conditionLayout - //VarScene'" > true</xsl:if>;
                            }
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
            </xsl:if>
            
            <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
            <xsl:if test="not(contains($hasCreate, 'found'))" >
                        final BasicArrayList gameLayerList = new BasicArrayList();
            </xsl:if>
            </xsl:if>
                        //final StringBuilder stringBuilder = new StringBuilder();

                       <xsl:variable name="actionWithTextObjectString" >
                           <xsl:for-each select="actions" >
                               <xsl:variable name="typeValue" select="type/value" />
                               <xsl:if test="$typeValue = 'TextObject::String'" >found:<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:if>
                           </xsl:for-each>
                        </xsl:variable>

                        <xsl:variable name="nodeId" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" ><xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:for-each select="actions" >
                            <xsl:if test="type/value = 'Create'" >
                                <xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 2" >

                        if(globals.<xsl:value-of select="text()" />GDGameLayerList.objectArray == arrayUtil.ZERO_OBJECT_ARRAY) {
                            LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$nodeId" /><xsl:value-of select="text()" />GDGameLayerList = new BasicArrayList(size);", this, commonStrings.PROCESS));
                            globals.<xsl:value-of select="text()" />GDGameLayerList.ensureCapacity(size);
                        }

                                    </xsl:if>
                                </xsl:for-each>
                            </xsl:if>
                            
                        <xsl:if test="type/value = 'Create'" >
                        <xsl:variable name="param" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        //param1=<xsl:value-of select="$param" />
                        <xsl:if test="contains($actionWithTextObjectString, $param)" >
                        //Action - //TextObject::String - call - START
                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                        //Action - //TextObject::String - call - END
                        </xsl:if>
                        </xsl:if>
                            
                        </xsl:for-each>

                        <xsl:variable name="createParamsAsString" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="timerActions" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" ><xsl:value-of select="type/value" />,</xsl:if></xsl:for-each></xsl:variable>
                        
                        <xsl:if test="string-length($createParamsAsString) > 0" >
                            <xsl:variable name="text" select="substring-before($createParamsAsString, ',')" />
                        //Create Loop - <xsl:value-of select="$caller" /><xsl:if test="contains($caller, 'eventsCreateAssignGDObject')" > - add one</xsl:if>
                        final int startIndex = globals.<xsl:value-of select="$text" />GDGameLayerList.size();
                        final int endIndex = startIndex + size;
                        
                        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />").append(" Timer - size <xsl:value-of select="$text" />List startIndex: ").append(startIndex).append(" endIndex: ").append(endIndex).toString(), this, commonStrings.PROCESS, new Exception()));
                        <xsl:if test="contains($timerActions, 'Timer,')" >
                        </xsl:if>
                        for(int index = startIndex; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> endIndex; index++) {
                        </xsl:if>

                        <xsl:if test="string-length($createParamsAsString) = 0" >
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                        </xsl:if>
            
            <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
            <xsl:if test="not(contains($hasCreate, 'found'))" >
            gameLayerList.clear();
            </xsl:if>
            //updateGDObject - -1
            boolean actionWithUpdate = false;
            </xsl:if>

            <xsl:if test="not(contains($hadCondition, 'found'))" >
            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found'))" >
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="position() = 1" >
                //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - call
                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="position() = 2" >
                //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Condition - call - more ifs
                </xsl:if>
            </xsl:for-each>
            </xsl:if>
            </xsl:if>

            <xsl:if test="contains($hasCreate, 'found')" >
            <xsl:variable name="gameObjectNames" >
                <xsl:for-each select="actions" >                                
                <xsl:if test="type/value = 'Create'" >
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
                </xsl:if>
                </xsl:for-each>
            </xsl:variable>
            
            <xsl:if test="$gameObjectNames != ''" >
                <xsl:variable name="gameObjectName" ><xsl:value-of select="substring-before($gameObjectNames, ',')" /></xsl:variable>
                //This may need to loop through more than 1 game object found: <xsl:value-of select="$gameObjectName" /> 
                //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Create - //<xsl:value-of select="$gameObjectName" />
                if(globals.<xsl:value-of select="$gameObjectName" />GDGameLayerList.size() == 0) {
                    return <xsl:if test="contains($caller, 'actionsWithIndexesProcess') or $caller = 'conditionLayout - //VarScene'" > false</xsl:if>;
                }

                GDObject <xsl:value-of select="$gameObjectName" /> = null;                
                if(globals.<xsl:value-of select="$gameObjectName" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    <xsl:value-of select="$gameObjectName" /> = ((GDGameLayer) globals.<xsl:value-of select="$gameObjectName" />GDGameLayerList.get(0)).gdObject;
                }
            </xsl:if>
            </xsl:if>

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>
                <xsl:if test="$typeValue = 'ResetTimer'" >
                    //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ResetTimer - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'PauseTimer'" >
                    //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //PauseTimer - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                    //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //UnPauseTimer - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarScene' and $caller = 'externalEventsCreateAssignGDObject - //actionsWithIndexesProcess'" >
                    //externalEventsCreateAssignGDObject - //actionsWithIndexesProcess - //actionsWithIndexes - //Action - //ModVarScene - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                                
                <xsl:if test="$typeValue = 'Create'" >

                    //createGDObject - START                    
                    <xsl:call-template name="createGDObject" >
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeAsString" >
                            <xsl:value-of select="$nodeId" />
                        </xsl:with-param>
                    </xsl:call-template>
                    //createGDObject - END
                    
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //Create - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processCreate(<xsl:value-of select="$name" />2);
                    <xsl:if test="$caller = 'externalEventsCreateAssignGDObject - //actionsWithIndexesProcess'" >
                    final int size2 = globals.<xsl:value-of select="$name" />OnceGDNodeList.size();
                    for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                        ((GDNode) globals.<xsl:value-of select="$name" />OnceGDNodeList.get(index2)).firstTime = true;
                    }
                    </xsl:if>
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreX'" >
                    //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //MettreX - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processG(((GDGameLayer) globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayerList.get(index)).gdObject</xsl:if>
                    </xsl:for-each>, globals.graphics);
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            gameLayer.updatePosition();
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreY'" >
                    //<xsl:value-of select="$caller" /> - //MettreY - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(((GDGameLayer) globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />List.get(index))</xsl:if></xsl:for-each>, globals.graphics);
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            gameLayer.updatePosition();
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <xsl:if test="$typeValue = 'MettreXY'" >
                    //<xsl:value-of select="$caller" /> - //MettreXY - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(((GDGameLayer) globals.<xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayerList.get(index))</xsl:if></xsl:for-each>, globals.graphics);
                    <xsl:text>&#10;</xsl:text>
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                        if(globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                            final GDGameLayer gameLayer = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            gameLayer.updatePosition();
                        }
                        <xsl:text>&#10;</xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>

                <xsl:if test="$typeValue = 'SetAngle'" >
                    //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //SetAngle - call
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                    //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ChangePlan - call
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeColor'" >
                    //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ChangeColor - call
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'AddForceAL'" >
                    //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //AddForceAL - call
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeAnimation'" >
                    //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ChangeAnimation - call
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarObjet'" >
                    //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ModVarObjet - call
                    if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index)) {
                        <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
                        <xsl:if test="not(contains($hasCreate, 'found'))" >
                        <xsl:call-template name="addGameLayerToList" />
                        </xsl:if>
                        </xsl:if>
                    }
                </xsl:if>

            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="$typeValue = 'Create'" >
                    //<xsl:value-of select="$caller" /> - //Create - call - end
                    //<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />GDGameLayerList</xsl:if></xsl:for-each>, 
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processEnd(index);
                </xsl:if>
            </xsl:for-each>

            <xsl:if test="contains($hasNoConditionsButDoesHaveUsedAction, 'found')" >
            <xsl:if test="not(contains($hasCreate, 'found'))" >
                                if(actionWithUpdate) {

                                    final int size2 = gameLayerList.size();
                                    if(size2 <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                                        for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size2; index2++) {
                                            //updateGDObject - 0
                                            ((GDGameLayer) gameLayerList.get(index2)).updateGDObject(globals.timeDelta);
                                        }
                                    } else {
                                        LogUtil.put(LogFactory.getInstance("updateGDObject failed: <xsl:for-each select="actions" ><xsl:if test="type/value = 'MettreX' or type/value = 'MettreY' or type/value = 'MettreXY' or type/value = 'SetAngle' or type/value = 'ChangePlan' or type/value = 'ChangeAnimation' or type/value = 'ModVarObjet'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" />GDGameLayer </xsl:if></xsl:for-each></xsl:if></xsl:for-each>was null", this, commonStrings.PROCESS, new Exception()));
                                    }

                                }
            </xsl:if>
            </xsl:if>

                        }

            <xsl:for-each select="actions" >

                <xsl:if test="type/value = 'Delete'" >
                    <xsl:if test="not(contains($caller, 'external'))" >
                    <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //Delete - call
                    final GDGameLayer <xsl:value-of select="$gameLayerName" />GDGameLayer = (GDGameLayer) globals.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(0);
                    if(<xsl:value-of select="$gameLayerName" />GDGameLayer != null) {
                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$gameLayerName" />GDGameLayer, globals.graphics);
                    } else {
                        LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "<xsl:value-of select="$gameLayerName" />GDGameLayer was null", this, commonStrings.PROCESS));
                    }
                        </xsl:if>
                </xsl:if>

                <xsl:if test="type/value = 'ModVarScene'" >
                    <xsl:if test="not(contains($caller, 'external'))" >
                    //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Action - //ModVarScene - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'TextObject::String'" >
                    //Action - //TextObject::String - call - START
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    //Action - //TextObject::String - call - END
                </xsl:if>
            </xsl:for-each>

                        </xsl:if>

            </xsl:if>
                        
            </xsl:if>
            
<!--
//alreadyUsedParentCondition=<xsl:value-of select="$alreadyUsedParentCondition" />
//<xsl:value-of select="$hadCondition" />
//<xsl:value-of select="$hadConditionOtherThanThis" />
//<xsl:value-of select="$alreadyUsedCondition" />
//<xsl:value-of select="$hasOnceCondition" />
//<xsl:value-of select="$hasUsedOnceCondition" />
//<xsl:value-of select="$hasNoConditionsButDoesHaveUsedAction" />
//<xsl:value-of select="$hasCreate" />
//<xsl:value-of select="$hasCollisionCondition" />
            <xsl:if test="not(contains($alreadyUsedParentCondition, 'found')) and contains($hadCondition, 'found') and contains($hadConditionOtherThanThis, 'found')" >
            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($hasOnceCondition, 'found')) and not(contains($hasUsedOnceCondition, 'found'))" >
            <xsl:if test="not(contains($hasNoConditionsButDoesHaveUsedAction, 'found')) and not(contains($hasCreate, 'found')) and not(contains($hasCollisionCondition, 'found'))" >
            </xsl:if>
            </xsl:if>
            </xsl:if>
-->

            <xsl:variable name="hasPauseTimer" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'PauseTimer'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasResetTimer" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'ResetTimer'" >found</xsl:if></xsl:for-each></xsl:variable>

            <xsl:variable name="lastCondition" ><xsl:for-each select="conditions" ><xsl:if test="position() = last()" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >found</xsl:if></xsl:if></xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="contains($lastCondition, 'found') and contains($caller, 'conditionLayout')" >
            //<xsl:value-of select="$caller" /> - //lastCondition2
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
            //<xsl:value-of select="$caller" /> - //lastCondition2 - //Action - //<xsl:value-of select="$typeValue" /> - call
            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:for-each>
            </xsl:if>

            <xsl:if test="contains($hadCondition, 'found') and contains($hadConditionOtherThanThis, 'found') and not(contains($hasUsedSoundPlayingCondition, 'found'))" >

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                //<xsl:value-of select="$caller" />
                <xsl:if test="contains($hasPauseTimer, 'found') or contains($hasResetTimer, 'found') or (contains($caller, 'eventsCreateAssignGDObject') and $typeValue = 'ModVarScene')" >
                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Timer - //<xsl:value-of select="type/value" />
                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
            </xsl:for-each>
            
            </xsl:if>

            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' or contains($caller, 'eventsCreateAssignGDObject')" >
                        <xsl:for-each select="events" >
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //<xsl:value-of select="$caller" /> - //actionsWithIndexes - //Event - //<xsl:value-of select="type" /> - call
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                        </xsl:for-each>
            </xsl:if>

            <xsl:if test="not(contains($alreadyUsedCondition, 'found'))" >
            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            <xsl:if test="not(contains($alreadyUsedParentCondition, 'found'))" >

            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
                
            <xsl:variable name="hasActions" ><xsl:for-each select="actions" >found</xsl:for-each></xsl:variable>

            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="($conditionPosition = '' and position() = 1) or position() = $conditionPosition + 1" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="type/value != 'DepartScene' and type/value != 'SoundPlaying' and (not(contains($caller, 'eventsCreateAssignGDObject') and type/value = 'NbObjet'))" >
                    
                <xsl:if test="contains($hasActions, 'found')" >
                //Condition - END
                </xsl:if>   
                }
                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            </xsl:if>
            
            </xsl:if>
            </xsl:if>
            </xsl:if>

                    } catch(Exception e) {
                    //1
                        LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />", this, commonStrings.PROCESS, e));
                    }

    </xsl:template>

    <xsl:template name="eventsCreateProcessUsed" >
        <xsl:param name="caller" />
        <xsl:param name="thisNodeIndex" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="createdObjectsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>

                    private final String EVENT_AS_STRING_COLLISION_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "PossibleCollision: " + EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;

                    //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed
                    @Override
                    public void processM(final CollidableCompositeLayer[] gameLayerArray, final GDNode gdNode, final BasicArrayList gdNodeList) {
                        super.processMStats(gameLayerArray, gdNode, gdNodeList);

                        try {

                            //LogUtil.put(LogFactory.getInstance(EVENT_AS_STRING_COLLISION_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                            //if(gameLayerArray[0] != null) {
                                //if(gameLayerArray[1] != null) {
                                    //LogUtil.put(LogFactory.getInstance(new StringBuilder().append(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />).append(" Collision: between gameLayer: ").append(gameLayerArray[0].getName()).append(" and gameLayer2: ").append(gameLayerArray[1].getName()).toString(), this, commonStrings.PROCESS));
                                //}
                            //}
        
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

            <xsl:variable name="alreadyUsedParentCondition" ><xsl:for-each select="../conditions" ><xsl:if test="type/value = 'SourisSurObjet'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hadCondition" ><xsl:for-each select="conditions" >found</xsl:for-each></xsl:variable>
            <xsl:variable name="hadConditionOtherThanThis" ><xsl:for-each select="conditions" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >found</xsl:if></xsl:for-each></xsl:variable>
            <!-- position() = 1 and -->
            <xsl:variable name="alreadyUsedCondition" ><xsl:for-each select="conditions" ><xsl:if test="(type/value = 'SourisSurObjet' or type/value = 'CollisionNP' or type/value = 'MouseButtonReleased' or type/value = 'SourisBouton' or type/value = 'KeyFromTextPressed' or type/value = 'KeyFromTextReleased')" >found</xsl:if></xsl:for-each></xsl:variable>

            <xsl:variable name="hasOnceCondition" ><xsl:for-each select="conditions" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="hasUsedOnceCondition" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >found</xsl:if></xsl:if></xsl:if></xsl:for-each></xsl:variable>
            
            <xsl:variable name="lastCondition" ><xsl:for-each select="conditions" ><xsl:if test="position() = last()" ><xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" ><xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >found</xsl:if></xsl:if></xsl:if></xsl:for-each></xsl:variable>

            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found'))" >

            <xsl:for-each select="conditions" >
                <!-- A sibling of BuiltinCommonInstructions::Once may not call it -->
                <xsl:if test="type/value = 'BuiltinCommonInstructions::Once'" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="preceding-sibling::conditions[number(substring(generate-id(), 2) - 65536) != $thisNodeIndex]" >
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Condition - //BuiltinCommonInstructions::Once - call - <xsl:value-of select="$thisNodeIndex" />
                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="position() = 1" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="type/value != 'DepartScene' and type/value != 'Timer' and (not($caller = 'conditionLayout' and type/value = 'NbObjet'))" >
                //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Condition - //<xsl:value-of select="type/value" /> - call - <xsl:value-of select="$thisNodeIndex" />
                if(globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process()) {
                </xsl:if>
                </xsl:if>
                </xsl:if>
                <xsl:if test="position() = 2" >
                //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Condition - call - more ifs
                </xsl:if>
            </xsl:for-each>
            </xsl:if>

            </xsl:if>

            <xsl:if test="contains($hasOnceCondition, 'found') and not(contains($hasUsedOnceCondition, 'found'))" >
            //<xsl:value-of select="$caller" /> - //hasUsedOnceCondition
            <xsl:for-each select="actions" >
            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:text>&#10;</xsl:text>
            //Action - //<xsl:value-of select="type/value" /> - call
            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:for-each>        
            </xsl:if>

            <xsl:if test="contains($hadCondition, 'found') and not(contains($hadConditionOtherThanThis, 'found'))" >
                //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //hadConditionOtherThanThis <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />= <xsl:value-of select="$thisNodeIndex" />
            </xsl:if>

            <xsl:if test="contains($lastCondition, 'found') and $caller = 'conditionLayout'" >
            //<xsl:value-of select="$caller" /> - //lastCondition
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
            //<xsl:value-of select="$caller" /> - //lastCondition - //Action - //<xsl:value-of select="$typeValue" /> - call
            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
            </xsl:for-each>
            </xsl:if>
            
            <xsl:if test="not(contains($hadCondition, 'found'))" >
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                <xsl:if test="$typeValue = 'PlaySound'" >
                    //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //PlaySound - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                
                <xsl:if test="$typeValue = 'ResetTimer'" >
                    //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //ResetTimer - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'PauseTimer'" >
                    //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //PauseTimer - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'UnPauseTimer'" >
                    //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //UnPauseTimer - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>
                <xsl:if test="$typeValue = 'ModVarScene'" >
                    <xsl:if test="not(contains($caller, 'external'))" >
                    //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //ModVarScene - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                    </xsl:if>
                </xsl:if>

                <xsl:if test="$typeValue = 'TextObject::ChangeColor'" >
                    //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //TextObject::ChangeColor - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

                <xsl:if test="$typeValue = 'TextObject::String'" >
                    //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //TextObject::String - call
                    globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                </xsl:if>

                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                <xsl:if test="$typeValue = 'Delete'" >
                    <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Delete - call
                    if(<xsl:value-of select="$gameLayerName" />GDGameLayer != null) {
                        globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$gameLayerName" />GDGameLayer, globals.graphics);
                    } else {
                        LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + "<xsl:value-of select="$gameLayerName" />GDGameLayer was null", this, commonStrings.PROCESS));
                    }
                </xsl:if>

            </xsl:for-each>
            </xsl:if>

                <xsl:variable name="nodeId" ><xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                <xsl:variable name="hasDelete" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Delete'" >found</xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="hasCreate" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" >found</xsl:if></xsl:for-each></xsl:variable>
                <xsl:variable name="listSize" ><xsl:for-each select="actions" ><xsl:variable name="typeValue" select="type/value" /><xsl:if test="$typeValue = 'SetAngle' or $typeValue = 'Delete' or $typeValue = 'AddForceAL'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" >globals.<xsl:value-of select="text()" />GDGameLayerList.size();</xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:variable>
                        //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //repeatExpression <xsl:value-of select="repeatExpression" /> //listSize <xsl:value-of select="$listSize" />

                <xsl:variable name="hasAddForceAL" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'AddForceAL'" >found</xsl:if></xsl:for-each></xsl:variable>
                <xsl:if test="contains($hasAddForceAL, 'foundfound')" >
                
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>

                <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                <xsl:if test="$typeValue = 'AddForceAL'" >
                    
                        final int <xsl:value-of select="$gameLayerName" />Size = globals.<xsl:value-of select="$gameLayerName" />GDGameLayerList.size();
            
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt; </xsl:text> <xsl:value-of select="$gameLayerName" />Size; index++) {
                    
                            <!--
                            GDGameLayer <xsl:value-of select="$gameLayerName" /><xsl:value-of select="$typeValue" />GameLayerAtIndex = null;
                            if(globals.<xsl:value-of select="$gameLayerName" />GDGameLayerList != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> globals.<xsl:value-of select="$gameLayerName" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                                <xsl:value-of select="$gameLayerName" /><xsl:value-of select="$typeValue" />GameLayerAtIndex = (GDGameLayer) globals.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(index);
                            }
                    
                            //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - <xsl:value-of select="$caller" /> - //AddForceAL - call
                            if(<xsl:value-of select="$gameLayerName" />GDGameLayer != null) {
                                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$gameLayerName" /><xsl:value-of select="$typeValue" />GameLayerAtIndex, globals.graphics);
                            }
                        
                            <xsl:value-of select="$gameLayerName" /><xsl:value-of select="$typeValue" />GameLayerAtIndex.updateGDObject(globals.timeDelta);
                            -->

                            final GDGameLayer gameLayer = (GDGameLayer) globals.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(index);
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameLayer, globals.graphics);
                            gameLayer.updateGDObject(globals.timeDelta);
                        }
                </xsl:if>
            </xsl:for-each>
                        
                </xsl:if>

            <xsl:variable name="hasCollisionCondition" ><xsl:for-each select="../conditions" ><xsl:if test="type/value = 'CollisionNP'" >found</xsl:if></xsl:for-each></xsl:variable>
            <xsl:variable name="timerActions" ><xsl:for-each select="conditions" ><xsl:if test="type/value = 'Timer'" ><xsl:value-of select="type/value" />,</xsl:if></xsl:for-each></xsl:variable>

                <xsl:if test="not(contains($hasDelete, 'found')) and not(contains($hasAddForceAL, 'foundfound'))" >

                        <!--
                        //hasCreate=<xsl:value-of select="$hasCreate" /> //hasCollisionCondition=<xsl:value-of select="$hasCollisionCondition" />
                        <xsl:for-each select="conditions" >
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                        </xsl:for-each>
                        <xsl:for-each select="actions" >
                        //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>
                        </xsl:for-each>
                        -->

                        <xsl:if test="contains($hasCreate, 'found')" >
                            <xsl:if test="not(contains($hasCollisionCondition, 'found'))" >
                            //Skipping actions with create since they are not associated with a CollisionNP condition - <xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each>
                            </xsl:if>
                        </xsl:if>

                        <xsl:if test="(contains($hasCreate, 'found') and contains($timerActions, 'Timer,')) or not(contains($hadCondition, 'found'))" >
                        final int size = <xsl:if test="not(repeatExpression)" ><xsl:if test="$listSize = '' or contains($hasCreate, 'found')" >1;</xsl:if><xsl:if test="$listSize and not(contains($hasCreate, 'found'))" ><xsl:value-of select="$listSize" /></xsl:if></xsl:if><xsl:if test="repeatExpression" ><xsl:value-of select="repeatExpression" />;</xsl:if>

            <xsl:if test="not(contains($timerActions, 'Timer,')) and not(contains($hasCollisionCondition, 'found'))" >
            <xsl:for-each select="actions" >
                <xsl:if test="type/value = 'Create'" >
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            //LogUtil.put(LogFactory.getInstance("TWB - globals.<xsl:value-of select="text()" />GDGameLayerList.size() " + globals.<xsl:value-of select="text()" />GDGameLayerList.size() +  " size " + size, this, commonStrings.PROCESS));
                            if(globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> size) {
                                //LogUtil.put(LogFactory.getInstance("B: Keep from creating again before last time: <xsl:value-of select="text()" />", this, commonStrings.PROCESS));
                                //<xsl:value-of select="$caller" />
                                return <xsl:if test="$caller = 'actionsWithIndexesProcess'" > true</xsl:if>;
                            }
                        </xsl:if>
                    </xsl:for-each>
                </xsl:if>
            </xsl:for-each>
            </xsl:if>
            
                <xsl:variable name="createParamsAsString" ><xsl:for-each select="actions" ><xsl:if test="type/value = 'Create'" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" />,</xsl:if></xsl:for-each></xsl:if></xsl:for-each></xsl:variable>

                    <xsl:if test="string-length($createParamsAsString) > 0" >
                        //createParamsAsString=<xsl:value-of select="$createParamsAsString" />
                        //timerActions=<xsl:value-of select="$timerActions" />
                    </xsl:if>
                    <xsl:if test="contains($hasCreate, 'found')" >
                        <xsl:variable name="text" select="substring-before($createParamsAsString, ',')" />
                        //Create Loop - eventsCreateProcessUsed - Create
                        //final StringBuilder stringBuilder = new StringBuilder();
                        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="$nodeId" />").append(" size: ").append(size).append(" globals.<xsl:value-of select="$text" />List.size(): ").append(globals.<xsl:value-of select="$text" />List.size()).append(" globals.<xsl:value-of select="$text" />GDGameLayerList.size(): ").append(globals.<xsl:value-of select="$text" />GDGameLayerList.size()).toString(), this, commonStrings.PROCESS));
                        final int startIndex = globals.<xsl:value-of select="$text" />GDGameLayerList.size();
                        final int endIndex = startIndex + size;
                        //stringBuilder.delete(0, stringBuilder.length());
                        //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="$nodeId" />").append(" layer <xsl:value-of select="$text" />List startIndex: ").append(startIndex).append(" endIndex: ").append(endIndex).toString(), this, commonStrings.PROCESS, new Exception()));


                        for(int index = startIndex; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> endIndex; index++) {
                    </xsl:if>
            
                    <xsl:if test="not(contains($hasCreate, 'found')) and not(contains($timerActions, 'Timer,'))" >
                        //Create Loop - eventsCreateProcessUsed
                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    </xsl:if>
                
            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:variable name="actionAsString" >Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>

                <xsl:if test="$typeValue = 'Create'" >

                                //createGDObject - START
                    <xsl:call-template name="createGDObject" >
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeAsString" >
                            <xsl:value-of select="$nodeId" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                    <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                //createGDObject - END                                                                                
                                //createGDObject - //Create - call
                                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processCreate(<xsl:value-of select="$name" />2);
                </xsl:if>

                <xsl:variable name="gameLayerName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                <xsl:if test="$typeValue = 'SetAngle'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                            //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Action - //SetAngle - call
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangePlan'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                            //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //ChangePlan - call
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                            <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeColor'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                            //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //ChangeColor - call
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                            <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ChangeAnimation'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                            //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //ChangeAnimation - call
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                            <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarGlobal'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                            //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //ModVarGlobal - call - NOT_IMPLEMENTED
                            //globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarObjet'" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS));
                    <xsl:text>&#10;</xsl:text>
                            //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //ModVarObjet - call - //<xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process(index);
                            <xsl:text>&#10;</xsl:text>
                </xsl:if>

                <xsl:if test="$typeValue = 'ModVarScene'" >
                    <xsl:if test="not(contains($caller, 'external'))" >
                            //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));                    
                            //Action nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="$typeValue" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each>                                                
                            //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Actions - //ModVarScene - call
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            <xsl:text>&#10;</xsl:text>
                    </xsl:if>
                </xsl:if>

                <xsl:if test="$typeValue = 'AddForceAL'" >
                    <!--
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 1" >
                            GDGameLayer <xsl:value-of select="text()" /><xsl:value-of select="$typeValue" />GameLayerAtIndex = null;
                            if(globals.<xsl:value-of select="text()" />GDGameLayerList != null <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text> globals.<xsl:value-of select="text()" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> index) {
                                <xsl:value-of select="text()" /><xsl:value-of select="$typeValue" />GameLayerAtIndex = (GDGameLayer) globals.<xsl:value-of select="text()" />GDGameLayerList.get(index);
                            }
                        </xsl:if>
                    </xsl:for-each>
                    
                            //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - <xsl:value-of select="$caller" /> - //AddForceAL - call
                            if(<xsl:value-of select="$gameLayerName" />GDGameLayer != null) {
                                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(<xsl:value-of select="$gameLayerName" /><xsl:value-of select="$typeValue" />GameLayerAtIndex, globals.graphics);
                            }
                    -->

                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD((GDGameLayer) globals.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(index), globals.graphics);
                </xsl:if>

            </xsl:for-each>

            <xsl:for-each select="actions" >
                <xsl:variable name="typeValue" select="type/value" />

                <xsl:if test="$typeValue = 'Create'" >           
                                //Create - GDObject at - call
                                globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processEnd(index);
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
            //firstAction=<xsl:value-of select="$firstAction" />

            <xsl:if test="string-length($firstAction) and string-length($create) = 0" >
                                //updateGDObject - unused
                                <xsl:value-of select="substring-before($firstAction, ',')" />GDGameLayer.updateGDObject(globals.timeDelta);
                                <xsl:text>&#10;</xsl:text>
            </xsl:if>
                        }            
            </xsl:if>
            </xsl:if>

            <!--
            <xsl:if test="contains($timerActions, 'Timer,')" >
                            //Hackish stop repeat action
                            gdNodeList.clear();
            </xsl:if>
            -->

            <xsl:if test="$listSize != '' and contains($caller, 'otherEventLayout')" >
            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found')) and $caller != 'conditionLayout - //VarScene' or contains($caller, 'eventsCreateAssignGDObject')" >
                        <xsl:for-each select="events" >
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                            //<xsl:value-of select="$caller" /> - //eventsCreateProcessUsed - //Event - //<xsl:value-of select="type" /> - call
                            globals.nodeArray[<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                            </xsl:if>
                        </xsl:for-each>
            </xsl:if>
            </xsl:if>

            <xsl:if test="not(contains($alreadyUsedCondition, 'found')) and not(contains($alreadyUsedParentCondition, 'found'))" >
                
            <xsl:if test="not(contains($hasOnceCondition, 'found'))" >
            <xsl:for-each select="conditions" >
                <xsl:variable name="typeValue" select="type/value" />
                <xsl:if test="position() = 1" >
                <xsl:if test="number($thisNodeIndex) != number(substring(generate-id(), 2) - 65536)" >
                <xsl:if test="type/value != 'DepartScene' and type/value != 'Timer' and (not($caller = 'conditionLayout' and type/value = 'NbObjet'))" >
                //Condition - END
                }
                </xsl:if>
                </xsl:if>
                </xsl:if>
            </xsl:for-each>
            </xsl:if>

            </xsl:if>

                            super.processMStatsE(gameLayerArray, gdNode, gdNodeList);
                        } catch(Exception e) {
                        //2
                            LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + EVENT_AS_STRING_COLLISION_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                        }

                }

    </xsl:template>

    <xsl:template name="paramIndexedArray" >
        <xsl:param name="createdObjectsAsString" />
        <xsl:variable name="name2" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:variable><xsl:variable name="key" >,<xsl:value-of select="$name2" />,</xsl:variable><xsl:if test="contains($createdObjectsAsString, $key)" ><xsl:value-of select="$name2" /></xsl:if>
    </xsl:template>

</xsl:stylesheet>
