<?xml version="1.0" encoding="UTF-8" ?>

<!--
AllBinary Open License Version 1
Copyright (c) 2011 AllBinary

By agreeing to this license you and any business entity you represent are
legally bound to the AllBinary Open License Version 1 legal agreement.

You may obtain the AllBinary Open License Version 1 legal agreement from
AllBinary or the root directory of AllBinary's AllBinary Platform repository.

Created By: Travis Berthelot
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:output method="html" indent="yes" />

    <xsl:template name="varObjetConditionGDNode" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        <xsl:param name="objectsGroupsAsString" />

        <xsl:variable name="quote" >"</xsl:variable>
        
                    //varObjetConditionGDNode - //Condition - //VarObjet - GDNode
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {
                    
                        <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

                        <xsl:variable name="gdObjectName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="paramOneNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:variable name="paramTwoNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                        //objectsGroupsAsString=<xsl:value-of select="$objectsGroupsAsString" />
                        //paramOneNameObjectsGroups=<xsl:value-of select="$paramOneNameObjectsGroups" />
                        //paramTwoNameObjectsGroups=<xsl:value-of select="$paramTwoNameObjectsGroups" />
                        //VarObjet - condition
                        @Override
                        public boolean process() throws Exception {
                            super.processStats();
                        
                            boolean result = true;

                            <xsl:if test="$paramOneNameObjectsGroups = '' and $paramTwoNameObjectsGroups = ''" >
                            
                            //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                            //LogUtil.put(LogFactory.getInstance(commonStrings.START, this, "<xsl:for-each select="parameters" ><xsl:if test="position() != 1" ><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:if><xsl:if test="position() = 1" >groupLayerManagerListener.getGroupSize(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GroupInterface)</xsl:if><xsl:if test="text() = '='" >=</xsl:if><xsl:if test="position() != last()" ><xsl:text> </xsl:text></xsl:if></xsl:for-each>"));

                            final int size = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gdObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gdObjectName" />GDGameLayerList.size();
                            for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            
                                final GDGameLayer gdGameLayer = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gdObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gdObjectName" />GDGameLayerList.get(index));
                                if(this.processG(gdGameLayer.gdObject, <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gdObjectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gdObjectName" />GDGameLayerList, index, globals.graphics)) {

                                <xsl:variable name="hasCondition" ><xsl:for-each select="conditions" >found</xsl:for-each></xsl:variable>

                                <xsl:variable name="hasSiblingWithDuplicateProcessing" >
                                    <xsl:for-each select=".." >
                                        <xsl:for-each select="whileConditions" >
                                        <!--
                                        <xsl:if test="type/value = 'BuiltinCommonInstructions::And'" >found</xsl:if>
                                        <xsl:if test="type/value = 'BuiltinCommonInstructions::Or'" >found</xsl:if>
                                        -->
                                        </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:variable>
                                
                                <xsl:if test="contains($hasSiblingWithDuplicateProcessing, 'found')" >
                                    //Skipping duplicate processing
                                </xsl:if>
                                <xsl:if test="not(contains($hasSiblingWithDuplicateProcessing, 'found'))" >
                                    //If condition is true then process the following

                                <xsl:for-each select=".." >
                                    <xsl:for-each select="events" >                             
                                        <xsl:if test="not(type = 'BuiltinCommonInstructions::Standard')" >
                                        //Was not including - <xsl:value-of select="type" /> before
                                        </xsl:if>
                                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type" /> 
                                        //Event - <xsl:value-of select="type" /> - call
                                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].process();
                                    </xsl:for-each>
                                   
                                    <xsl:if test="not(contains($hasCondition, 'found'))" >
                                    <xsl:call-template name="actionIdsGDObject" >
                                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                        <xsl:with-param name="gdObjectName" ><xsl:value-of select="$gdObjectName" /></xsl:with-param>
                                        <xsl:with-param name="gdGameLayer" >gdGameLayer</xsl:with-param>
                                    </xsl:call-template>
                                    </xsl:if>

                                </xsl:for-each>
                                </xsl:if>

                                } else {
                                    result = false;
                                }
                            }
                           
                            /*
                                    <xsl:for-each select=".." >
                                        <xsl:call-template name="delete" >
                                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                                            <xsl:with-param name="gdGameLayer" >gdGameLayer</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:for-each>
                            */
                            
                            </xsl:if>
                        
                            <xsl:if test="$paramOneNameObjectsGroups != '' or $paramTwoNameObjectsGroups != ''" >
                                if(true) throw new RuntimeException();
                            </xsl:if>

                              
                            super.processStatsE();
                            
                            return result;
                        }

                        //VarObjet
                        @Override
                        public boolean processG(final GDObject <xsl:value-of select="$gdObjectName" />, final BasicArrayList gdGameLayerList, final int gdObjectIndex, final Graphics graphics) {

                            try {
                                super.processGStats(<xsl:value-of select="$gdObjectName" />, graphics);
                        
                                return this.processGPaint(<xsl:value-of select="$gdObjectName" />, graphics);
                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }

                            return false;
                        }

                        <xsl:variable name="param" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 4" >
                                    <xsl:if test="not(contains(text(), 'SceneInstancesCount('))" >
                                        <xsl:value-of select="text()" />
                                    </xsl:if>
                                    <xsl:if test="contains(text(), 'SceneInstancesCount(')" >
                                        <xsl:variable name="objectName" >
                                            <xsl:value-of select="substring-before(substring-after(text(), 'SceneInstancesCount('), ')')" />
                                        </xsl:variable>
                                        <xsl:call-template name="string-replace-all" >
                                            <xsl:with-param name="text" >
                                                <xsl:value-of select="text()" />
                                            </xsl:with-param>
                                            <xsl:with-param name="find" >SceneInstancesCount(<xsl:value-of select="$objectName" /></xsl:with-param>
                                            <xsl:with-param name="replacementText" >SceneInstancesCount(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$objectName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$objectName" />GDGameLayerList.size()</xsl:with-param>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                                                
                        <xsl:variable name="beforeFourthParam" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>

                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $beforeFourthParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $beforeFourthParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                        //beforeFourthParam=<xsl:value-of select="$beforeFourthParam" />
                        </xsl:if>

                        <xsl:variable name="firstOrBeforeFourthParam" >
                            <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                                <xsl:value-of select="$beforeFourthParam" />
                            </xsl:if>
                            <xsl:if test="not(contains($hasObject, 'found') or contains($hasObjectGroup, 'found'))" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:variable>

                    <xsl:variable name="hasCollisionProcessGD" >
                        <xsl:call-template name="hasCollisionProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:variable name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:call-template name="hasLinkedObjectsPickObjectsLinkedToProcessGD" >
                            <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:if test="$paramOneNameObjectsGroups != '' or $paramTwoNameObjectsGroups != ''" >
                    <xsl:call-template name="collisionProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGD" >
                        <xsl:with-param name="totalRecursions" >0</xsl:with-param>
                    </xsl:call-template>
                    <xsl:if test="contains($hasCollisionProcessGD, 'found')" >
                        super.processGDStats(<xsl:call-template name="collisionProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template>GDGameLayer);
                    </xsl:if>
                    <xsl:if test="contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >
                        super.processGDStats(<xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template>GDGameLayer);
                    </xsl:if>
                    <xsl:if test="not(contains($hasCollisionProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                    //Not from parent collision
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {
                    
                        super.processGDStats(<xsl:value-of select="$firstOrBeforeFourthParam" />GDGameLayer);
                    </xsl:if>
                    </xsl:if>
                    <xsl:if test="$paramOneNameObjectsGroups = '' and $paramTwoNameObjectsGroups = ''" >
                    public boolean processGD(final GDGameLayer <xsl:value-of select="$gdObjectName" />GDGameLayer, final GDGameLayer gameLayer2, final Graphics graphics) throws Exception {

                        super.processGDStats(<xsl:value-of select="$gdObjectName" />GDGameLayer);
                    </xsl:if>

                                //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                                <xsl:text>&#10;</xsl:text>
                                <xsl:if test="contains($hasCollisionProcessGD, 'found')" >
                                    <xsl:variable name="collisionProcessGDParamOne" ><xsl:call-template name="collisionProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>
                                    <xsl:variable name="collisionProcessGDParamTwo" ><xsl:call-template name="collisionProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>
                                    <xsl:if test="$gdObjectName = $collisionProcessGDParamOne" >
                                //Child of CollisionNP - param 1
                                    </xsl:if>
                                    <xsl:if test="$gdObjectName = $collisionProcessGDParamTwo" >
                                //Child of CollisionNP - param 2
                                    </xsl:if>
                                </xsl:if>
                                
                                <xsl:if test="contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found')" >
                                    <xsl:variable name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamOne" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>
                                    <xsl:variable name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:call-template name="linkedObjectsPickObjectsLinkedToProcessGDParamTwo" ><xsl:with-param name="totalRecursions" >0</xsl:with-param></xsl:call-template></xsl:variable>
                                    <xsl:if test="$gdObjectName = $linkedObjectsPickObjectsLinkedToProcessGDParamOne" >
                                //Child of LinkedObjects::PickObjectsLinkedTo - param 1
                                    </xsl:if>
                                    <xsl:if test="$gdObjectName = $linkedObjectsPickObjectsLinkedToProcessGDParamTwo" >
                                //Child of LinkedObjects::PickObjectsLinkedTo - param 2
                                    </xsl:if>
                                </xsl:if>

                                <xsl:if test="not(contains($hasCollisionProcessGD, 'found') or contains($hasLinkedObjectsPickObjectsLinkedToProcessGD, 'found'))" >
                                //Defaulting to first param since no known association with prior sibling Create action or parent Condition
                                </xsl:if>

                                return this.processGPaint(<xsl:value-of select="$gdObjectName" />GDGameLayer.gdObject, graphics);
                        }
                                
                        @Override
                        public boolean processGPaint(final GDObject gdObject, final Graphics graphics) {

                            try {

                        
                        //TWB - Hack
<!--                        <xsl:variable name="hasGameLayer" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), 'LastEndedTouchId') or contains(text(), 'Map')" >found</xsl:if></xsl:for-each></xsl:variable>-->

                    <xsl:variable name="hasGameLayer2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:if test="contains(text(), '.')" >found</xsl:if></xsl:if></xsl:for-each></xsl:variable>

                    <xsl:variable name="gameLayerName2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="gameLayerName3" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName3=<xsl:value-of select="$gameLayerName3" />
                    <xsl:variable name="gameLayerName4" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3 and contains(text(), '-')" ><xsl:value-of select="substring-after($gameLayerName3, '-')" /></xsl:if><xsl:if test="position() = 3 and not(contains($gameLayerName3, '-'))" ><xsl:value-of select="$gameLayerName3" /></xsl:if></xsl:for-each></xsl:variable>
                    //gameLayerName4=<xsl:value-of select="$gameLayerName4" />
                    <xsl:variable name="gameLayerName" ><xsl:call-template name="substring-after-last" ><xsl:with-param name="string" ><xsl:value-of select="$gameLayerName4" /></xsl:with-param><xsl:with-param name="char" select="' '" /></xsl:call-template></xsl:variable>
                    //gameLayerName=<xsl:value-of select="$gameLayerName" />

                    final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gdObjectName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gdObjectName" /><xsl:text> </xsl:text><xsl:value-of select="$gdObjectName" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gdObjectName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gdObjectName" />) gdObject;

                    <xsl:if test="contains($hasGameLayer2, 'found')" >
                    <xsl:if test="not($gameLayerName = $gameLayerName2 or substring($gameLayerName, 2, string-length($gameLayerName)) = $gameLayerName2)" >
                    final GDGameLayer <xsl:value-of select="$gameLayerName" />GDGameLayer = (GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$gameLayerName" />GDGameLayerList.get(0);
                    //final GDObject <xsl:value-of select="$gameLayerName" /> = <xsl:value-of select="$gameLayerName" />GDGameLayer.gdObject;
                    final GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gameLayerName" /><xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="$gameLayerName" /> = (GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$gameLayerName" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$gameLayerName" />)<xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="$gameLayerName" />GDGameLayer.gdObject;
                    </xsl:if>
                    </xsl:if>

<!--                        <xsl:if test="not(contains($hasGameLayer, 'found'))" >
                                //No GameLayer
                                if(<xsl:for-each select="parameters" ><xsl:if test="text() = 'rotation'" >.</xsl:if><xsl:if test="position() != 1 and  text() != 'rotation'" ><xsl:text> </xsl:text></xsl:if><xsl:text><xsl:value-of select="text()" disable-output-escaping="yes" /></xsl:text><xsl:if test="text() = '='" >=</xsl:if></xsl:for-each>) {
                        </xsl:if>-->

<!--                        <xsl:if test="contains($hasGameLayer, 'found')" >-->
                                //Has GameLayer
                                if(<xsl:for-each select="parameters" >
                                    <xsl:if test="position() = 1" ><xsl:value-of select="text()" />.</xsl:if>
                                    <xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if>
                                    <xsl:if test="position() = 3" >
                                        <xsl:if test="text() != '>' and text() != '&lt;' and text() != '&lt;=' and text() != '&gt;' and text() != '&gt;='" >
                                            <xsl:value-of select="text()" />
                                        </xsl:if>
                                        <xsl:if test="text() = '&lt;'" >
                                            <xsl:text disable-output-escaping="yes" > &lt; </xsl:text>
                                        </xsl:if>
                                        <xsl:if test="text() = '&lt;='" >
                                            <xsl:text disable-output-escaping="yes" > &lt;= </xsl:text>
                                        </xsl:if>
                                        <xsl:if test="text() = '>' or text() = '&gt;'" >
                                            <xsl:text disable-output-escaping="yes" > &gt; </xsl:text>
                                        </xsl:if>
                                        <xsl:if test="text() = '&gt;='" >
                                            <xsl:text disable-output-escaping="yes" > &gt;= </xsl:text>
                                        </xsl:if>
                                        <xsl:if test="text() = '='" >=</xsl:if>
                                        <xsl:if test="text() = '+'" >=</xsl:if>
                                        <xsl:if test="text() = '-'" >=</xsl:if>
                                    </xsl:if>
                                    <xsl:if test="position() = 4" >
                                        <xsl:variable name="before" >
                                            <xsl:value-of select="substring-before(text(), '.')" />
                                        </xsl:variable>
                                        <xsl:variable name="hasObject" >
                                            <xsl:for-each select="//objects" >
                                                <xsl:if test="name = $before" >found</xsl:if>
                                            </xsl:for-each>
                                        </xsl:variable>

                                        <xsl:if test="$before != ''" >
                                            //<xsl:value-of select="$before" /> - <xsl:value-of select="$hasObject" />
                                            <xsl:text>&#10;</xsl:text>
                                            <xsl:if test="contains($hasObject, 'found')" >
                                                ((GD<xsl:call-template name="objectFactory" >
                                                    <xsl:with-param name="name" >
                                                        <xsl:value-of select="$before" />
                                                    </xsl:with-param>
                                                    <xsl:with-param name="layoutIndex" >
                                                        <xsl:value-of select="$layoutIndex" />
                                                    </xsl:with-param>
                                                </xsl:call-template>GDObjectsFactory.<xsl:value-of select="$before" />) <xsl:value-of select="$before" />).<xsl:call-template name="string-replace-all" ><xsl:with-param name="text" ><xsl:value-of select="substring-after(text(), '.')" /></xsl:with-param><xsl:with-param name="find" >VariableChildCount(</xsl:with-param><xsl:with-param name="replacementText" >VariableChildCount(<xsl:value-of select="$before" />.</xsl:with-param></xsl:call-template>
                                            </xsl:if>
                                        </xsl:if>
                                        <xsl:if test="not(contains($hasObject, 'found'))" >
                                            <xsl:value-of select="text()" />
                                        </xsl:if>
 
                                    </xsl:if>
                                </xsl:for-each>) {
<!--                        </xsl:if>-->
                                    //LogUtil.put(LogFactory.getInstance(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "VarObjet processing", this, commonStrings.PROCESS));
                                    return true;
                                }

                            } catch(Exception e) {
                                LogUtil.put(LogFactory.getInstance(commonStrings.EXCEPTION_LABEL + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e));
                            }
                            return false;
                        }

                    };

    </xsl:template>

</xsl:stylesheet>
