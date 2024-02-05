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

    <xsl:template name="createByNameActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="param" />
        <xsl:param name="actionWithTextObjectString" />
        <xsl:param name="nodeAsString" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="objectsAsString" />
        <xsl:param name="createdObjectsAsString" />

                    //param1=<xsl:value-of select="$param" />
                        <xsl:if test="contains($actionWithTextObjectString, $param)" >
                    //CreateByName - GDObject with TextObject::String - START
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();
                                                        
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));
                    <xsl:call-template name="createByNameGDObject" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeAsString" >
                            <xsl:value-of select="$nodeAsString" />
                        </xsl:with-param>
                    </xsl:call-template>
                    
                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                        //<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectList.add(<xsl:value-of select="$name" />GDobject2);
                        
                        return true;
                    }
                    //CreateByName - GDObject with TextObject::String - END
                        </xsl:if>

                        <!-- Temp solution until I can remove duplicates -->
                        <xsl:variable name="hasObjectInParams" >
                        <xsl:for-each select="parameters" >
                            <xsl:variable name="name" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:variable>
                            <xsl:variable name="name2" ><xsl:value-of select="$name" />,</xsl:variable>
                            <xsl:if test="string-length($name) > 0 and contains($createdObjectsAsString, $name2)" >found</xsl:if>
                        </xsl:for-each>
                        </xsl:variable>

                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:if test="not(contains($hasObjectInParams, 'found')) and not(contains($actionWithTextObjectString, $param))" >
                    //CreateByName - GDObject other than TextObject::String - START
                    @Override
                    public boolean process() throws Exception {
                        super.processStats();
                            
                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS));

                        <!--
                        <xsl:for-each select="parameters" >
                            <xsl:variable name="name" ><xsl:value-of select="substring-before(text(), '.')" /></xsl:variable>
                            <xsl:variable name="name2" ><xsl:value-of select="$name" />,</xsl:variable>
                            <xsl:if test="string-length($name) > 0 and contains($createdObjectsAsString, $name2)" >
                                //Get global for factory params.
                GDObject <xsl:value-of select="$name" /> = null;
                if(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&gt;</xsl:text> 0) {
                    <xsl:value-of select="$name" /> = ((GDGameLayer) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.get(0)).gdObject;
                }
                            </xsl:if>
                        </xsl:for-each>
                        -->
                        
                        //createGDObject - process - START
                    
                        final String createString = <xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each>;
                        final int createIndex = gdObjectsFactory.get<xsl:value-of select="$name" />Index(createString);
                        
                    <xsl:call-template name="createByNameGDObject" >
                        <xsl:with-param name="layoutIndex" >
                            <xsl:value-of select="$layoutIndex" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsGroupsAsString" >
                            <xsl:value-of select="$objectsGroupsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="objectsAsString" >
                            <xsl:value-of select="$objectsAsString" />
                        </xsl:with-param>
                        <xsl:with-param name="nodeAsString" >
                            <xsl:value-of select="$nodeAsString" />
                        </xsl:with-param>
                    </xsl:call-template>

                        //createGDObject - process - END
                        //createGDObject - //CreateByName - call
                        this.processCreate(<xsl:value-of select="$name" />GDobject2, createString, createIndex);
                        
                        this.processEnd(((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(createIndex)).size() - 1, createIndex);
                        //this.processEnd(<xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerList.size() - 1);

                        return true;
                    }
                    //CreateByName - GDObject other than TextObject::String - END
                        </xsl:if>
                                                
                        <xsl:if test="not(contains($actionWithTextObjectString, $param))" >
                    //CreateByName
                    @Override
                    public boolean processCreate(final GDObject gdObject, final String createString, final int createIndex) throws Exception {
                        super.processCreateStats(gdObject);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + <xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="text()" />GDGameLayerList.size()</xsl:if></xsl:for-each>, this, commonStrings.PROCESS));
                        
                    <xsl:variable name="nodeId" >nodeId=<xsl:value-of select="generate-id()" /> - <xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> </xsl:variable>
                    
                    //final BasicArrayList <xsl:value-of select="$name" />GDObjectList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDObjectListOfList.get(createIndex));
                    final BasicArrayList <xsl:value-of select="$name" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(createIndex));
                    final BasicArrayList <xsl:value-of select="$name" />CacheGDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />CacheGDGameLayerListOfList.get(createIndex));
                    //final GDConditionWithGroupActions <xsl:value-of select="$name" />GDConditionWithGroupActions = ((GDConditionWithGroupActions) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDConditionWithGroupActionsList.get(createIndex));
                    final GDGameLayerFactory <xsl:value-of select="$name" />GDGameLayerFactory = ((GDGameLayerFactory) resources.<xsl:value-of select="$name" />GDGameLayerFactoryList.get(createIndex));

                    //<xsl:value-of select="$name" />GDObjectList.add(gdObject);

                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            final StringMaker stringBuilder = new StringMaker();
                            //stringBuilder.delete(0, stringBuilder.length());
                            final int index = <xsl:value-of select="text()" />GDGameLayerList.size();

                            GDGameLayer <xsl:value-of select="text()" />GDGameLayer = null;
                            
                            <xsl:variable name="text" ><xsl:value-of select="text()" /></xsl:variable>
                            <xsl:variable name="id" ><xsl:for-each select="//objectsGroups" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="//objects" ><xsl:if test="name = $text" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:variable>
                            
                            if(<xsl:value-of select="text()" />CacheGDGameLayerList.size() <xsl:text disable-output-escaping="yes" >&lt;</xsl:text> 1) {
                                //globals.<xsl:call-template name="upper-case" ><xsl:with-param name="text" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>
                                <xsl:text>&#10;</xsl:text>
                                //CreateByName - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                                gameGlobals.tempGameLayerArray[0] = <xsl:value-of select="text()" />GDGameLayer = <xsl:value-of select="text()" />GDGameLayerFactory.create(stringBuilder.append(createString).append(CommonSeps.getInstance().UNDERSCORE).append(index).toString(), gdObject, null); //<xsl:value-of select="text()" />GDConditionWithGroupActions);
                                <xsl:text>&#10;</xsl:text>
                            } else {
                                <xsl:value-of select="text()" />GDGameLayer = (GDGameLayer) <xsl:value-of select="text()" />CacheGDGameLayerList.remove(0);
                                
                                //if(!<xsl:value-of select="text()" />GDGameLayer.getName().startsWith(gdObject.name)) {
                                    //LogUtil.put(LogFactory.getInstance(new StringMaker().append(<xsl:value-of select="text()" />GDGameLayer.getName()).append(" GDObject name: ").append(gdObject.name).toString(), this, "create", new Exception()));
                                //}
                                <xsl:value-of select="text()" />GDGameLayer.setGDObject(gdObject);
                            }

                            <xsl:value-of select="text()" />GDGameLayer.setAllBinaryGameLayerManager(allBinaryGameLayerManager);

                            //stringBuilder.delete(0, stringBuilder.length());
                            //LogUtil.put(LogFactory.getInstance(stringBuilder.append("<xsl:value-of select="$nodeId" /> for <xsl:value-of select="text()" />GDGameLayerList.add(<xsl:value-of select="text()" />GDGameLayer); at: ").append(index).toString(), this, commonStrings.PROCESS));
                            //LogUtil.put(LogFactory.getInstance(<xsl:value-of select="text()" />GDGameLayer.toString(), this, commonStrings.PROCESS));

                            //CreateByName - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                            gameGlobals.tempGameLayerArray[0] = <xsl:value-of select="text()" />GDGameLayer;
                            <xsl:value-of select="text()" />GDGameLayerList.add(<xsl:value-of select="text()" />GDGameLayer);
                        </xsl:if>
                    </xsl:for-each>
                        return false;
                    }
                        </xsl:if>
        
    </xsl:template>

    <xsl:template name="createByNameEndActionProcess" >
        <xsl:param name="layoutIndex" />
        <xsl:param name="nodeId" />

                    //CreateByName End
                    @Override
                    public void processEnd(final int index, final int createIndex) throws Exception {
                        super.processEndStats(createIndex);

                        //LogUtil.put(LogFactory.getInstance(ACTION_AS_STRING_AT_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /> + index, this, commonStrings.END));
                        
                            <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                            final BasicArrayList <xsl:value-of select="$name" />GDGameLayerList = ((BasicArrayList) <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="$name" /></xsl:with-param></xsl:call-template>.<xsl:value-of select="$name" />GDGameLayerListOfList.get(createIndex));
                        
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:variable name="layerName" ><xsl:value-of select="text()" /></xsl:variable>
                            <xsl:variable name="gameLayer" ><xsl:value-of select="text()" />GDGameLayer</xsl:variable>

                            final GDGameLayer <xsl:value-of select="$gameLayer" /> = (GDGameLayer) <xsl:value-of select="$gameLayer" />List.get(index);
                            
                            if(<xsl:value-of select="$gameLayer" /> != null) {
                                //updateGDObject - 3
                                <xsl:value-of select="$gameLayer" />.updateGDObject(globals.timeDelta);
                                
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$gameLayer" />.gdObject.zOrder" + <xsl:value-of select="$gameLayer" />.gdObject.zOrder, this, commonStrings.PROCESS));
                                //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$gameLayer" />.getZ()" + <xsl:value-of select="$gameLayer" />.getZ(), this, commonStrings.PROCESS));
                                allBinaryGameLayerManager.insert(<xsl:value-of select="$gameLayer" />);

                                //objectsGroupsGDGameLayer - START
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                        <xsl:variable name="layoutIndex2" select="position() - 1" />
                                        <xsl:if test="number($layoutIndex2) = $layoutIndex" >

                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:variable name="groupName"><xsl:value-of select="name" /></xsl:variable>
                                                <xsl:for-each select="objects" >
                                                    <xsl:if test="name = $layerName" >
                                                        //LogUtil.put(LogFactory.getInstance("<xsl:value-of select="$nodeId" /> for globals.<xsl:value-of select="$groupName" />GDGameLayerList.add(<xsl:value-of select="$gameLayer" />); at: " + index, this, commonStrings.PROCESS));
                                                        <xsl:value-of select="$groupName" />GDGameLayerList.add(<xsl:value-of select="$gameLayer" />);
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

    </xsl:template>

</xsl:stylesheet>
