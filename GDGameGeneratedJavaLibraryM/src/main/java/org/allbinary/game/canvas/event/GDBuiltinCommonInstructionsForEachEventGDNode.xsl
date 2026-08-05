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
    <xsl:template name="builtinCommonInstructionsForEachEventGDNode" >
        <xsl:param name="caller" />
        <xsl:param name="totalRecursions" />
        <xsl:param name="selectedNodeIds" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="layoutName" />
        <xsl:param name="instancesAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="conditionEventPosition" />

        <xsl:variable name="quote" >"</xsl:variable>
        <xsl:variable name="inverted" ><xsl:value-of select="type/inverted" /></xsl:variable>
        
        //BuiltinCommonInstructions::ForEach - //object=<xsl:value-of select="object" /> - //orderBy=<xsl:value-of select="orderBy" /> - //order=<xsl:value-of select="order" />
                <xsl:variable name="object" ><xsl:value-of select="object" /></xsl:variable>
                <xsl:variable name="id" ><xsl:for-each select="/game/layouts" ><xsl:if test="$layoutIndex = position() - 1" ><xsl:for-each select="objects" ><xsl:if test="$object = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$object = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each><xsl:for-each select="/game" ><xsl:for-each select="objects" ><xsl:if test="$object = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$object = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>

            //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> object=<xsl:value-of select="object" />

                private final String EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> = "Event - nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> totalRecursions=<xsl:value-of select="$totalRecursions" /> type=<xsl:value-of select="type" /> disable=<xsl:value-of select="disabled" />";
                <xsl:text>&#10;</xsl:text>

                <xsl:variable name="hasObjectGroup" >
                    <xsl:for-each select="//objectsGroups" >
                        <xsl:if test="name = $object" >found</xsl:if>
                    </xsl:for-each>
                </xsl:variable>


                <xsl:if test="contains(disabled, 'true')" >
                //Disabled so not call anything.
                /*
                </xsl:if>
                
                //BuiltinCommonInstructions::ForEach - //object=<xsl:value-of select="object" /> - //orderBy=<xsl:value-of select="orderBy" /> - //order=<xsl:value-of select="order" />
                @Override
                public boolean process() throws Exception {
                    super.processStats();

                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                    <xsl:if test="string-length(orderBy) > 0" >

                    final BasicArrayList list = new BasicArrayListD();
                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                    final int size3 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerListOfList.size();
                    for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                    final BasicArrayList gdGameLayerList = (BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerListOfList.get(index3);
                    </xsl:if>
                    <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                    final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerList;
                    </xsl:if>
                    
                    GDGameLayer <xsl:value-of select="$object" />GDGameLayer;
                    //for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> gdGameLayerList.size(); index++) {
                        list.add(gdGameLayerList.get(index));
                    }

                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                    }
                    </xsl:if>

                    this.sort(list);
                    this.processList(list);

                    </xsl:if>
                    <xsl:if test="string-length(orderBy) = 0" >

                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                    final int size3 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerListOfList.size();
                    for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                    final BasicArrayList gdGameLayerList = (BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerListOfList.get(index3);
                    </xsl:if>
                    <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                    final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerList;
                    </xsl:if>
                    
                    this.processList(gdGameLayerList);

                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                    }
                    </xsl:if>
                    
                    </xsl:if>

                    return true;

                }
                
                @Override
                public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                    super.processStats(motionGestureEvent);
                    
                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + "motion", this, commonStrings.PROCESS);
                            
                    return this.process();
                }

                @Override
                public boolean processGD(final GDGameLayer[] gameLayerArray) throws Exception {
                    super.processGDStats(gameLayerArray);
                        
                    //logUtil.putF(EVENT_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                    <xsl:if test="string-length(orderBy) > 0" >

                    final BasicArrayList list = new BasicArrayListD();
                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                    final int size3 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerListOfList.size();
                    for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                    final BasicArrayList gdGameLayerList = (BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerListOfList.get(index3);
                    </xsl:if>
                    <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                    final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerList;
                    </xsl:if>
                    
                    GDGameLayer <xsl:value-of select="$object" />GDGameLayer;
                    //for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> gdGameLayerList.size(); index++) {
                        list.add(gdGameLayerList.get(index));
                    }

                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                    }
                    </xsl:if>

                    this.sort(list);
                    this.processList(list);

                    </xsl:if>
                    <xsl:if test="string-length(orderBy) = 0" >

                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                    final int size3 = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerListOfList.size();
                    for(int index3 = 0; index3 <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size3; index3++) {
                    final BasicArrayList gdGameLayerList = (BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerListOfList.get(index3);
                    </xsl:if>
                    <xsl:if test="not(contains($hasObjectGroup, 'found'))" >
                    final BasicArrayList gdGameLayerList = <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="object" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$object" />GDGameLayerList;
                    </xsl:if>
                    
                    this.processList(gdGameLayerList);

                    <xsl:if test="contains($hasObjectGroup, 'found')" >
                    }
                    </xsl:if>
                                            
                    </xsl:if>

                    return true;
                }

                public void processList(final BasicArrayList gdGameLayerList) throws Exception {

                    GDGameLayer <xsl:value-of select="$object" />GDGameLayer;
                    //for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> size; index++) {
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> gdGameLayerList.size(); index++) {

                        final int initialSize = gdGameLayerList.size();
                        <xsl:value-of select="$object" />GDGameLayer = (GDGameLayer) gdGameLayerList.get(index);
                        //id=<xsl:value-of select="$id" />
                        gameGlobals.tempGameLayerArray[<xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />] = <xsl:value-of select="$object" />GDGameLayer;
                        
                    <xsl:for-each select="conditions" >
                        <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                        <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                        //Condition nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> type=<xsl:value-of select="type/value" /> inverted=<xsl:value-of select="type/inverted" /> parameters=<xsl:value-of select="$parametersAsString" />
                        if(gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameGlobals.tempGameLayerArray)) {
                    </xsl:for-each>

                        <xsl:call-template name="actionsProcessing" >
                            <xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param>
                            <xsl:with-param name="methodCall" >processGD(gameGlobals.tempGameLayerArray)</xsl:with-param>
                            <xsl:with-param name="parentParam" >gameGlobals.tempGameLayerArray</xsl:with-param>
                        </xsl:call-template>                                        

                        <xsl:for-each select="events" >
                            <xsl:variable name="parametersAsString0" ><xsl:for-each select="parameters" ><xsl:value-of select="text()" />,</xsl:for-each></xsl:variable>
                            <xsl:variable name="parametersAsString" ><xsl:value-of select="translate(translate($parametersAsString0, '&#10;', ''), '\&#34;', '')" /></xsl:variable>
                            <xsl:if test="type = 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> 
                                <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" />
                        //Event - //BuiltinCommonInstructions::Link - call - //eventsProcess
                        <xsl:if test="contains(disabled, 'true')" >//disabled - </xsl:if>globals.<xsl:value-of select="target" />GDNode.process();
                            </xsl:if>
                            <xsl:if test="type != 'BuiltinCommonInstructions::Comment' and type != 'BuiltinCommonInstructions::Link'" >
                        //Event nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> position=<xsl:value-of select="position()" /> type=<xsl:value-of select="type" /> <xsl:if test="object" > object=<xsl:value-of select="object" /></xsl:if> <xsl:if test="target" > target=<xsl:value-of select="target" /></xsl:if> disable=<xsl:value-of select="disabled" /> totalRecursions=<xsl:value-of select="$totalRecursions" />
                        gameGlobals.nodeArray[gameGlobals.NODE_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />].processGD(gameGlobals.tempGameLayerArray);
                            </xsl:if>
                        </xsl:for-each>
                    
                    <xsl:for-each select="conditions" >
                        }
                    </xsl:for-each>
                    
                        if(initialSize <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> gdGameLayerList.size()) {
                            index--;
                        }
                    }
                }

                <xsl:if test="string-length(orderBy) > 0" >
                public void sort(final BasicArrayList gdGameLayerList) {

<!--                
                    final StringMaker stringBuilder = new StringMaker();
                    GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$object" /><xsl:text disable-output-escaping="yes" > </xsl:text><xsl:value-of select="$object" />;
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> gdGameLayerList.size(); index++) {

                        <xsl:value-of select="$object" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$object" />) ((GDGameLayer) gdGameLayerList.get(index)).gdObject;
                        stringBuilder.appendint(<xsl:value-of select="orderBy" />).append(",");
                        
                    }
                    logUtil.put(stringBuilder.toString(), this, commonStrings.PROCESS, new Exception());
-->

                    final int sortSize = gdGameLayerList.size();
                    GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$object" /> min<xsl:value-of select="$object" />;
                    for(int leftIndex = 0; leftIndex <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> sortSize - 1; leftIndex++) {
                        int minIndex = leftIndex;
                        min<xsl:value-of select="$object" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$object" />) ((GDGameLayer) gdGameLayerList.get(minIndex)).gdObject;

                        GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$object" /> right<xsl:value-of select="$object" />;
                        for(int rightIndex = leftIndex + 1; rightIndex <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> sortSize; rightIndex++) {
                            right<xsl:value-of select="$object" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$object" />) ((GDGameLayer) gdGameLayerList.get(rightIndex)).gdObject;
                            if(right<xsl:value-of select="orderBy" /> <xsl:if test="order = 'asc'" ><xsl:text disable-output-escaping="yes" > &lt; </xsl:text></xsl:if><xsl:if test="order = 'dsc'" ><xsl:text disable-output-escaping="yes" > &gt; </xsl:text></xsl:if> min<xsl:value-of select="orderBy" />) {
                                minIndex = rightIndex;
                                min<xsl:value-of select="$object" /> = right<xsl:value-of select="$object" />;
                            }
                        }

                        if(minIndex != leftIndex) {
                            final Object leftGameLayer = gdGameLayerList.get(leftIndex);
                            gdGameLayerList.set(leftIndex, gdGameLayerList.get(minIndex));
                            gdGameLayerList.set(minIndex, leftGameLayer);
                        }
                    }
                
<!--
                    stringBuilder.delete(0, stringBuilder.length());
                    stringBuilder.append("after");
                    for(int index = 0; index <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> gdGameLayerList.size(); index++) {

                        <xsl:value-of select="$object" /> = (GD<xsl:value-of select="$layoutIndex" />GDObjectsFactory.<xsl:value-of select="$object" />) ((GDGameLayer) gdGameLayerList.get(index)).gdObject;
                        stringBuilder.appendint(<xsl:value-of select="orderBy" />).append(",");
                        
                    }
                    logUtil.put(stringBuilder.toString(), this, commonStrings.PROCESS, new Exception());
-->

                }
                </xsl:if>

                <xsl:if test="contains(disabled, 'true')" >
                */
                </xsl:if>

    </xsl:template>

</xsl:stylesheet>
