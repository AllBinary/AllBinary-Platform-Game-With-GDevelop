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

    <xsl:template name="linkedObjectsLinkObjectsActionProcess" >
        <xsl:param name="forExtension" />
        <xsl:param name="layoutIndex" />
        <xsl:param name="objectsGroupsAsString" />
        <xsl:param name="createdObjectsAsString" />
        <xsl:param name="instancesAsString" />

        <xsl:variable name="nodeId" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:variable>
                
                        <xsl:variable name="name" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>

                        <xsl:variable name="parentConditionObject" >
                                <xsl:for-each select="../conditions" >
                                    <xsl:for-each select="parameters" >
                                        <xsl:if test="position() = 2" >
                                            <xsl:variable name="paramOne" ><xsl:value-of select="text()" /></xsl:variable>

                                            <xsl:for-each select="/game" >
                                                <xsl:for-each select="objects" >
                                                    <xsl:if test="$paramOne = name" >
                                                        <xsl:value-of select="name" />
                                                    </xsl:if>
                                                </xsl:for-each>

                                                <xsl:for-each select="layouts" >
                                                    <xsl:if test="$layoutIndex = position() -1" >
                                                        <xsl:for-each select="objects" >
                                                            <xsl:if test="$paramOne = name" >
                                                                <xsl:value-of select="name" />
                                                            </xsl:if>
                                                        </xsl:for-each>
                                                    </xsl:if>
                                                </xsl:for-each>
                                            </xsl:for-each>

                                        </xsl:if>
                                    </xsl:for-each>
                                </xsl:for-each>
                        </xsl:variable>

                        <xsl:variable name="parentConditionWithoutObjects" >
                            <xsl:if test="string-length($parentConditionObject) = 0" >found</xsl:if>
                        </xsl:variable>

                            <xsl:variable name="parentObjectHasObjectGroup" >
                                <xsl:for-each select="/game">
                                    <xsl:for-each select="layouts" >
                                            <xsl:for-each select="objectsGroups" >
                                                <xsl:if test="name = $parentConditionObject" >
                                                    found
                                                </xsl:if>
                                            </xsl:for-each>
                                    </xsl:for-each>
                                </xsl:for-each>
                            </xsl:variable>

                        <xsl:variable name="actionAndParentConditionUseSameObject" >
                            <xsl:for-each select="../conditions" >
                                <xsl:variable name="name2" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                                <xsl:if test="$name = $name2" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        
                        <xsl:variable name="parametersAsString" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="not(contains($actionAndParentConditionUseSameObject, 'found')) and position() = 2" >
                                    <xsl:value-of select="text()" />.,
                                </xsl:if>                                    
                                <xsl:if test="position() > 2" >
                                    <xsl:value-of select="text()" />,
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                            <xsl:variable name="hasObjectGroup" >
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

                        //LinkedObjects::LinkObjects - //forExtension=<xsl:value-of select="$forExtension" />
                        <xsl:if test="not(contains($forExtension, 'found'))" >
                        public boolean process() {

                            //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);

                    //LinkedObjects::LinkObjects - Add
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" >
                            <xsl:variable name="text" ><xsl:value-of select="text()" /></xsl:variable>
                            <xsl:variable name="id" ><xsl:for-each select="/game/layouts" ><xsl:if test="$layoutIndex = position() - 1" ><xsl:for-each select="objects" ><xsl:if test="$text = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$text = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each><xsl:for-each select="/game" ><xsl:for-each select="objects" ><xsl:if test="$text = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$text = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
                            //LinkedObjects::LinkObjects - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                            //gameGlobals.tempGameLayerArray[<xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />].linkedGDGameLayerList.add(
                            gameGlobals.tempGameLayerArray[1].linkedGDGameLayerList.add(</xsl:if>
                        <xsl:if test="position() = 3" >
                            <xsl:variable name="text" ><xsl:value-of select="text()" /></xsl:variable>
                            <xsl:variable name="id" ><xsl:for-each select="/game/layouts" ><xsl:if test="$layoutIndex = position() - 1" ><xsl:for-each select="objects" ><xsl:if test="$text = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$text = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:if></xsl:for-each><xsl:for-each select="/game" ><xsl:for-each select="objects" ><xsl:if test="$text = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each><xsl:for-each select="objectsGroups" ><xsl:if test="$text = name" ><xsl:value-of select="number(substring(generate-id(), 2) - 65536)" /></xsl:if></xsl:for-each></xsl:for-each></xsl:variable>
                            //LinkedObjects::LinkObjects - <xsl:value-of select="$text" />=<xsl:value-of select="$id" /> - parent or sibling usage <xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id])" /> + <xsl:value-of select="count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />
                            //LinkedObjects::LinkObjects - //Using param that is not from the first 2 GameLayers - get for add
                            gameGlobals.tempGameLayerArray[<xsl:value-of select="count(//objectsGroups[number(substring(generate-id(), 2) - 65536) &lt; $id]) + count(//objects[number(substring(generate-id(), 2) - 65536) &lt; $id])" />]
                        </xsl:if>
                        <xsl:if test="position() = last()" >);</xsl:if>
                    </xsl:for-each>

<!--
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" ><xsl:value-of select="text()" />.linkedGDGameLayerList.add(</xsl:if>
                        <xsl:if test="position() = 3" >
                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.
                            <xsl:value-of select="text()" />GDGameLayerList.get(
                            <xsl:call-template name="globals" ><xsl:with-param name="name" ><xsl:value-of select="text()" /></xsl:with-param></xsl:call-template>.
                            <xsl:value-of select="text()" />GDGameLayerList.size() - 1)
                        </xsl:if>
                        <xsl:if test="position() = last()" >);</xsl:if>
                    </xsl:for-each>
-->

                            //return result;
                            return true;
                        }

                    @Override
                    public boolean process(final MotionGestureEvent motionGestureEvent, final MotionGestureInput lastMotionGestureInput) throws Exception {
                        super.processStats(motionGestureEvent);
                        
                        //logUtil.putF(ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS);
                        
                        return this.process();
                    }

                        <xsl:variable name="param" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 3" >
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

                        <xsl:variable name="hasObject3" >
                            <xsl:for-each select="//objects" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <xsl:variable name="hasObjectGroup3" >
                            <xsl:for-each select="//objectsGroups" >
                                <xsl:if test="name = $beforeSecondParam" >found</xsl:if>
                            </xsl:for-each>
                        </xsl:variable>

                        <xsl:if test="contains($hasObject3, 'found') or contains($hasObjectGroup3, 'found')" >
                        //beforeSecondParam=<xsl:value-of select="$beforeSecondParam" />
                        </xsl:if>

                        <xsl:variable name="firstOrBeforeFourthParam" >
                            <xsl:if test="contains($hasObject3, 'found') or contains($hasObjectGroup3, 'found')" >
                                <xsl:value-of select="$beforeSecondParam" />
                            </xsl:if>
                            <xsl:if test="not(contains($hasObject3, 'found') or contains($hasObjectGroup3, 'found'))" >
                            <xsl:for-each select="parameters" >
                                <xsl:if test="position() = 2" >
                                    <xsl:value-of select="text()" />
                                </xsl:if>
                            </xsl:for-each>
                            </xsl:if>
                        </xsl:variable>
                
                    <xsl:variable name="paramOneNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 2" ><xsl:call-template name="paramIndexedArray2" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="secondParam" ><xsl:for-each select="parameters" ><xsl:if test="position() = 3" ><xsl:value-of select="text()" /></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="paramTwoName" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$createdObjectsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                    <xsl:variable name="paramTwoNameObjectsGroups" ><xsl:for-each select="parameters" ><xsl:if test="position() = 4" ><xsl:if test="substring-before(text(), '.') != ''" ><xsl:call-template name="paramIndexedArray" ><xsl:with-param name="createdObjectsAsString" ><xsl:value-of select="$objectsGroupsAsString" /></xsl:with-param></xsl:call-template></xsl:if></xsl:if></xsl:for-each></xsl:variable>
                    //paramOneNameObjectsGroups=<xsl:value-of select="$paramOneNameObjectsGroups" />
                    //paramTwoName=<xsl:value-of select="$paramTwoName" />
                    //paramTwoNameObjectsGroups=<xsl:value-of select="$paramTwoNameObjectsGroups" />

                        @Override      
                        public boolean processGD(final GDGameLayer[] gameLayerArray) throws Exception {
                            try {
                     
                            <xsl:variable name="params" ><xsl:for-each select="parameters" >//<xsl:value-of select="translate(translate(text(), '&#10;', ''), '\&#34;', '')" />,</xsl:for-each></xsl:variable>
                            <xsl:call-template name="siblingOrParentOrList" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                    //LinkedObjects::LinkObjects - Add
                    <xsl:for-each select="parameters" >
                        <xsl:if test="position() = 2" ><xsl:value-of select="text()" />GDGameLayer.linkedGDGameLayerList.add(</xsl:if>
                        <xsl:if test="position() = 3" ><xsl:value-of select="text()" />GDGameLayer</xsl:if>
                        <xsl:if test="position() = last()" >);</xsl:if>
                    </xsl:for-each>
              
                            <xsl:call-template name="listEndings" ><xsl:with-param name="totalRecursions" >0</xsl:with-param><xsl:with-param name="layoutIndex" ><xsl:value-of select="$layoutIndex" /></xsl:with-param><xsl:with-param name="params" ><xsl:value-of select="$params" /></xsl:with-param><xsl:with-param name="nodeId" ><xsl:value-of select="$nodeId" /></xsl:with-param></xsl:call-template>

                            } catch(Exception e) {
                                logUtil.put(commonStrings.EXCEPTION_LABEL + ACTION_AS_STRING_<xsl:value-of select="number(substring(generate-id(), 2) - 65536)" />, this, commonStrings.PROCESS, e);
                            }

                            return true;
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
    </xsl:template>

</xsl:stylesheet>
