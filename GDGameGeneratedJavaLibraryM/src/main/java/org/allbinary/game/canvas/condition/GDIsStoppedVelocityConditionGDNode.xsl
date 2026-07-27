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
    
    <xsl:template name="isStoppedVelocityConditionGDNode" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="parametersAsString" />
        
        <xsl:variable name="quote" >"</xsl:variable>

                    //isStoppedVelocityConditionGDNode - //Condition - //Arret - //HasNoForces? - GDNode
                    <xsl:if test="contains($forExtension, 'found')" >public </xsl:if>final GDNode NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = new GDNode(<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />) {

                    <xsl:variable name="conditionAsString" >Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> parameters=<xsl:value-of select="$parametersAsString" /></xsl:variable>
                        private final String CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "<xsl:value-of select="translate($conditionAsString, $quote, ' ')" />";

        
        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
        <xsl:variable name="hasObjectVariable" ><xsl:for-each select="parameters" ><xsl:if test="contains(text(), '.Variable')" >found</xsl:if></xsl:for-each></xsl:variable>
        
        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 1" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

        <xsl:variable name="hasObjectGroup2" >
            <xsl:for-each select="/game">
                <xsl:for-each select="layouts" >
                    <xsl:for-each select="objectsGroups" >
                        <xsl:if test="name = $name" >
                            found
                        </xsl:if>
                    </xsl:for-each>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:variable>
        
        <xsl:variable name="gdObjectFactory" >GD<xsl:call-template name="objectFactory" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param></xsl:call-template>GDObjectsFactory.<xsl:value-of select="$name" /></xsl:variable>
        
                    //Arret - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();

                        //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                        
                        <xsl:if test="contains($hasObjectGroup2, 'found')" >
    
                        final int size3 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.size();
                        for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                        
                            //final BasicArrayList gdObjectList2 = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(index3));
                            final BasicArrayList <xsl:value-of select="$name" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index3));
                            final int size = <xsl:value-of select="$name" />GDGameLayerList.size();
                            GDGameLayer gameLayer;
                            <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$name" />;<xsl:text>&#10;</xsl:text>

                        for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                            
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            //.ObjectName()
                            //fourthParam=<xsl:value-of select="$fourthParam" />
                            
                            <xsl:variable name="fourthParam2" >gameLayer.gdObject.<xsl:value-of select="substring-after($fourthParam, '.')" /></xsl:variable>
                            
                            gameLayer = (GDGameLayer) <xsl:value-of select="$name" />GDGameLayerList.get(index);
                            <xsl:value-of select="$name" /> = (<xsl:value-of select="$gdObjectFactory" />) gameLayer.gdObject;

                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //1
                        final VelocityProperties velocityProperties = gameLayer.getVelocityProperties();
                        if(velocityProperties.getVelocityXBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityYBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityZBasicDecimalP().getUnscaled() == 0L) {

                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        
                            }
                        }
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasObjectGroup2, 'found'))" >

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
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasObjectVariable, 'found') or contains($hasObjectGroup2, 'found'))" >
                            
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($fourthParam, 'Variable')" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                //1
                        final VelocityProperties velocityProperties = gameLayer.getVelocityProperties();
                        if(velocityProperties.getVelocityXBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityYBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityZBasicDecimalP().getUnscaled() == 0L) {
                            
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="not(contains($fourthParam, 'Variable'))" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                                //2
                        final VelocityProperties velocityProperties = gameLayer.getVelocityProperties();
                        if(velocityProperties.getVelocityXBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityYBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityZBasicDecimalP().getUnscaled() == 0L) {
                            
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        }
                        </xsl:if>
                        
                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                        //3
                        final VelocityProperties velocityProperties = gameLayer.getVelocityProperties();
                        if(velocityProperties.getVelocityXBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityYBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityZBasicDecimalP().getUnscaled() == 0L) {
                            
                            return true;
                        }
                        </xsl:if>

                        return false;
                    }

                        
                        @Override
                        public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                            super.processStats(motionGestureEvent);
                            
                            //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "motion", this, commonStrings.PROCESS);
                            
                            return this.process();
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
                                                
                        <xsl:variable name="beforeSecondParam" ><xsl:value-of select="substring-before($param, '.')" /></xsl:variable>

                        <xsl:variable name="hasObject" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                        //beforeSecondParam=<xsl:value-of select="$beforeSecondParam" />
                        </xsl:if>

                        <xsl:variable name="firstOrBeforeFourthParam" >
                            <xsl:if test="contains($hasObject, 'found') or contains($hasObjectGroup, 'found')" >
                                <xsl:value-of select="$beforeSecondParam" />
                            </xsl:if>
                            <xsl:if test="not(contains($hasObject, 'found') or contains($hasObjectGroup, 'found'))" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 1" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:variable>
                        //firstOrBeforeFourthParam=<xsl:value-of select="$firstOrBeforeFourthParam" />
                        //firstParam=<xsl:value-of select="$name" />

                    @Override
                    public boolean process(final int index) throws Exception {
                        super.processStats(index);

                        //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.PROCESS);
                        
                        <xsl:if test="contains($hasObjectGroup2, 'found')" >
                            
                            //final BasicArrayList gdObjectList2 = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(index));
                            final BasicArrayList <xsl:value-of select="$name" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(index));
                            final int size = <xsl:value-of select="$name" />GDGameLayerList.size();
                            GDGameLayer gameLayer;
                            <xsl:value-of select="$gdObjectFactory" /><xsl:text> </xsl:text><xsl:value-of select="$name" />;<xsl:text>&#10;</xsl:text>

                        for(int index2 = 0; index2 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index2++) {
                                                        
                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            //.ObjectName()
                            //fourthParam=<xsl:value-of select="$fourthParam" />
                            
                            <xsl:variable name="fourthParam2" >gameLayer.gdObject.<xsl:value-of select="substring-after($fourthParam, '.')" /></xsl:variable>
                            
                            gameLayer = (GDGameLayer) <xsl:value-of select="$name" />GDGameLayerList.get(index2);
                            <xsl:value-of select="$name" /> = (<xsl:value-of select="$gdObjectFactory" />) gameLayer.gdObject;

                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //1
                        final VelocityProperties velocityProperties = gameLayer.getVelocityProperties();
                        if(velocityProperties.getVelocityXBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityYBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityZBasicDecimalP().getUnscaled() == 0L) {
                            
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        }
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasObjectGroup2, 'found'))" >
                            
                        <xsl:for-each select="parameters" >
                            <xsl:variable name="animationName" ><xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="translate(text(), '&quot;', '')" /></xsl:with-param></xsl:call-template></xsl:variable>
                        <xsl:if test="position() = 1" >if(index <xsl:text disable-output-escaping="yes" >&gt;=</xsl:text> <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size()) return false;<xsl:text>&#10;</xsl:text></xsl:if>
                        <xsl:if test="position() = 1" >final GDGameLayer gameLayer = (((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.get(index)))</xsl:if><xsl:if test="position() = last()" >;</xsl:if>
                        </xsl:for-each>
                        
                        <xsl:text>&#10;</xsl:text>
                            
                        </xsl:if>
                        <xsl:if test="not(contains($hasObjectVariable, 'found') or contains($hasObjectGroup2, 'found'))" >

                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($fourthParam, 'Variable')" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //2
                        final VelocityProperties velocityProperties = gameLayer.getVelocityProperties();
                        if(velocityProperties.getVelocityXBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityYBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityZBasicDecimalP().getUnscaled() == 0L) {
                            
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="not(contains($fourthParam, 'Variable'))" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //3
                        final VelocityProperties velocityProperties = gameLayer.getVelocityProperties();
                        if(velocityProperties.getVelocityXBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityYBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityZBasicDecimalP().getUnscaled() == 0L) {
                            
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>

                        </xsl:if>
                        
                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                        //4
                        final VelocityProperties velocityProperties = gameLayer.getVelocityProperties();
                        if(velocityProperties.getVelocityXBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityYBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityZBasicDecimalP().getUnscaled() == 0L) {

                            return true;
                        }

                        </xsl:if>

                        return false;
                    }
                    
                    @Override
                    public boolean processGD(final GDGameLayer[] gameLayerArray) throws Exception {
                        try {
                     
                        //logUtil.putF(CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "GD", this, commonStrings.PROCESS);
                     
                        <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                        <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                        <xsl:if test="contains($hasObjectGroup2, 'found')" >

                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //1
                        final VelocityProperties velocityProperties = <xsl:value-of select="$name" />GDGameLayer.getVelocityProperties();
                        if(velocityProperties.getVelocityXBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityYBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityZBasicDecimalP().getUnscaled() == 0L) {
                            
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        }
                        </xsl:if>
                        
                        <xsl:if test="not(contains($hasObjectGroup2, 'found'))" >
                        
                        <xsl:text>&#10;</xsl:text>
                            
                        </xsl:if>
                        <xsl:if test="not(contains($hasObjectVariable, 'found') or contains($hasObjectGroup2, 'found'))" >

                        <xsl:variable name="fourthParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        <xsl:if test="contains($fourthParam, 'Variable')" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //2
                        final VelocityProperties velocityProperties = <xsl:value-of select="$name" />GDGameLayer.getVelocityProperties();
                        if(velocityProperties.getVelocityXBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityYBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityZBasicDecimalP().getUnscaled() == 0L) {
                            
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>
                        <xsl:if test="not(contains($fourthParam, 'Variable'))" >
                        <xsl:for-each select="parameters" >
                            <xsl:if test="position() = 1" >
                        //3
                        final VelocityProperties velocityProperties = <xsl:value-of select="$name" />GDGameLayer.getVelocityProperties();
                        if(velocityProperties.getVelocityXBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityYBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityZBasicDecimalP().getUnscaled() == 0L) {
                            
                            return true;
                        }
                            </xsl:if>
                        </xsl:for-each>
                        </xsl:if>

                        </xsl:if>
                        
                        <xsl:if test="contains($hasObjectVariable, 'found')" >

                        //4
                        final VelocityProperties velocityProperties = <xsl:value-of select="$name" />GDGameLayer.getVelocityProperties();
                        if(velocityProperties.getVelocityXBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityYBasicDecimalP().getUnscaled() == 0L <xsl:text disable-output-escaping="yes" >&amp;&amp;</xsl:text>
                            velocityProperties.getVelocityZBasicDecimalP().getUnscaled() == 0L) {

                            return true;
                        }

                        </xsl:if>
                        
                        <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>
              
                        } catch(Exception e) {
                            logUtil.put(commonStrings.EXCEPTION_LABEL + CONDITION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                        }

                        return false;
                    }

                        </xsl:if>

                        <xsl:if test="contains($forExtension, 'found')" >
                        @Override
                        public boolean process(final Object[] objectArray, final int[] intArray, final long[] longArray, final float[] floatArray) {
                            
                            //Map from object array with action params
                            final GDGameLayer gameLayer = (GDGameLayer) objectArray[1];
                            this.process(gameLayer, intArray[3], intArray[5]);

                            return true;
                        }
                        </xsl:if>

                        public void process(final GDGameLayer gameLayer, final int x, final int y) {
                            final GDObject gdObject = gameLayer.gdObject;
                            this.process(gdObject, x, y);
                        }

                        public void process(final GDObject gdObject, final int x, final int y) {
                            throw new RuntimeException();
                        }
                    
                    };

                    <xsl:if test="not(contains($forExtension, 'found'))" >
                    if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] != null) {
                        throw new RuntimeException("<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />");
                    }
                    gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />] = NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />;
                    </xsl:if>

    </xsl:template>

</xsl:stylesheet>
